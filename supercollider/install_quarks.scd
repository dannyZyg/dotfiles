(
var configPath, configContent, quarkNames, installedQuarks, installedNames;
var toInstall, succeeded, failed, skipped;

succeeded = List.new;
failed = List.new;
skipped = List.new;

"".postln;
"=== SuperCollider Quark Bootstrap ===".postln;

configPath = thisProcess.nowExecutingPath.dirname +/+ "quarks.txt";

if(File.exists(configPath).not) {
	"ERROR: Could not find quarks.txt at:".postln;
	configPath.postln;
	"Please run this script from the dotfiles/supercollider directory.".postln;
	1.exit;
};

"Config: %".format(configPath).postln;

try {
	configContent = File.readAllString(configPath);

	quarkNames = configContent.split($\n).collect({ |line|
		line.stripWhiteSpace
	}).select({ |line|
		// Keep only non-empty lines that don't start with #
		(line.size > 0) && (line[0] != $#)
	});

	"Found % Quarks to install".format(quarkNames.size).postln;
	"".postln;

} { |error|
	"ERROR: Failed to parse quarks.txt:".postln;
	error.errorString.postln;
	1.exit;
};

"Checking installation status...".postln;

installedQuarks = Quarks.installed;
installedNames = installedQuarks.collect({ |q| q.name });

toInstall = quarkNames.select({ |name|
	installedNames.includes(name).not
});

if(installedNames.size > 0) {
	skipped = quarkNames.select({ |name| installedNames.includes(name) });
	"✓ Already installed: % (%)".format(
		skipped.join(", "),
		skipped.size
	).postln;
};

if(toInstall.size > 0) {
	"○ Need to install: % (%)".format(
		toInstall.join(", "),
		toInstall.size
	).postln;
} {
	"✓ All Quarks are already installed!".postln;
	"".postln;
	"=== Bootstrap Complete ===".postln;
	"✓ % Quarks already present".format(quarkNames.size).postln;
	"".postln;
	"Exiting...".postln;
	0.exit;
};

"".postln;

"Installing missing Quarks...".postln;

toInstall.do({ |quarkName, i|
	var progress = "[%/%]".format(i + 1, toInstall.size);

	try {
		"%  %...".format(progress, quarkName).post;

		Quarks.install(quarkName);

		succeeded.add(quarkName);
		" ✓".postln;

	} { |error|
		failed.add(quarkName);
		" ✗".postln;
		"   Error: %".format(error.errorString).postln;
	};
});

"".postln;
"=== Bootstrap Complete ===".postln;

if(succeeded.size > 0) {
	"✓ % Quarks installed".format(succeeded.size).postln;
};

if(skipped.size > 0) {
	"✓ % Quarks already present".format(skipped.size).postln;
};

if(failed.size > 0) {
	"✗ % Quarks failed".format(failed.size).postln;
	"  Failed: %".format(failed.asArray.join(", ")).postln;
};

"".postln;
"Please restart SuperCollider or recompile the class library to use the new Quarks.".postln;
"Exiting...".postln;

if(failed.size > 0) {
	1.exit;  // Exit with error code if any installations failed
} {
	0.exit;  // Exit successfully
};
)
