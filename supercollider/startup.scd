~cleanup = {
  s.freeAll;
  ServerBoot.removeAll;
  ServerTree.removeAll;
  ServerQuit.removeAll;
};

 ~cleanup.();
 ServerQuit.add(~cleanup);

// Mac volume safety!
Server.default.options.safetyClipThreshold = 1;

// scnvim
if (\SCNvim.asClass.notNil) {
	Server.default.doWhenBooted {
		\SCNvim.asClass.updateStatusLine(1, \SCNvim.asClass.port);
	}
};

~getAudioDevice = {
  var priorityDevices = [
    "MHLink [48646]",
    "headphones",
    "podsPlusMacMic",
    "WH-1000XM2",
    "internal",
    "ULN-8mkIV",
    "External Headphones",
    "外部ヘッドフォン",
    "MacBook Airのスピーカー",
    "BlackHole 16ch",
  ];

  var devicePreferences = Dictionary.newFrom([

    'BlackHole 16ch', Dictionary.newFrom(
      [
        \sampleRate, 48000,
        \numOutputs, 2,
        \numInputs, 0,
      ]
    ),
    'MacBook Airのスピーカー', Dictionary.newFrom(
      [
        \sampleRate, 48000,
        \numOutputs, 2,
        \numInputs, 0,
      ]),
    'podsPlusMacMic', Dictionary.newFrom(
      [
        \sampleRate, 48000,
        \numOutputs, 2,
        \numInputs, 1,
      ]),
    'internal', Dictionary.newFrom(
      [
        \sampleRate, 48000,
        \numOutputs, 2,
        \numInputs, 1,
      ]),
    'headphones', Dictionary.newFrom(
      [
        \sampleRate, 48000,
        \numOutputs, 2,
        \numInputs, 1,
      ]),
    'MHLink [48646]', Dictionary.newFrom(
      [
        \sampleRate, 48000,
        \numOutputs, 16,
        \numInputs, 16,
      ]),
    'External Headphones', Dictionary.newFrom(
      [
        \sampleRate, 48000,
        \numOutputs, 2,
        \numInputs, 0,
      ]),
    'MacBook Air Speakers', Dictionary.newFrom(
      [
        \sampleRate, 48000,
        \numOutputs, 2,
        \numInputs, 0,
      ]),
  ]);

  // Select the first output device connected, in order of preference above
  Routine({
    priorityDevices.do({ |priorityDevice|

      ServerOptions.outDevices.do({  |device|
        if( priorityDevice.asString() == device ) {
          var msg = "✅ Found preferred device:" + device;
          msg.postln;
          Array.newFrom([priorityDevice, devicePreferences[priorityDevice.asSymbol()]]).yield;
        };
      });

    });
    0.yield;  // yield is required here
  }).next
};

s.reboot { // server options are only updated on reboot
	// configure the sound server: here you could add hardware specific options
	// see http://doc.sccode.org/Classes/ServerOptions.html
  var preferredDevice = ~getAudioDevice.();
  var deviceName = preferredDevice.at(0);
  var devicePrefs = preferredDevice.at(1);
  var sampleRate = devicePrefs[\sampleRate];
  var numOutputs = devicePrefs[\numOutputs];
  var numInputs = devicePrefs[\numInputs];

  ("🔉 Setting out device as: " ++ deviceName ++ " with " ++ numOutputs ++ " outputs").postln;
  ("🎙️ Setting in device as: " ++ deviceName ++ " with " ++ numInputs ++ " inputs").postln;

	s.options.outDevice = deviceName;
	s.options.inDevice = deviceName;
	s.options.sampleRate = sampleRate;
	s.options.numBuffers = 1024 * 256; // increase this if you need to load more samples
	s.options.memSize = 8192 * 32; // increase this if you get "alloc failed" messages
	s.options.numWireBufs = 128; // increase this if you get "exceeded number of interconnect buffers" messages
	s.options.maxNodes = 1024 * 32; // increase this if you are getting drop outs and the message "too many nodes"
	s.options.numOutputBusChannels = numOutputs; // set this to your hardware output channel size, if necessary
	s.options.numInputBusChannels = numInputs; // set this to your hardware output channel size, if necessary
	s.latency = 0.6; // increase this if you get "late" messages

  s.newBusAllocators;
  ~main = Bus.audio(s, 2);

  s.waitForBoot({

    var createLimiter = {
      // Stereo Limiter
      SynthDef(\stereoLimiter, {
          var sig;
          sig = In.ar(\input.ir(~main), 2);
          sig = Limiter.ar(sig, level: \level.ir(0.99), dur: \dur.ir(0.01));
          Out.ar(\out.ir(0), sig);
      }).add;

      s.sync;

      ~stereoLimiter = Synth(\stereoLimiter, [\in, ~main, addAction: \addToTail]);
    };

    ServerTree.add(createLimiter);
    ServerTree.run;

	});
};
