Server.default.options.safetyClipThreshold = 1;

// scnvim
if (\SCNvim.asClass.notNil) {
	Server.default.doWhenBooted {
		\SCNvim.asClass.updateStatusLine(1, \SCNvim.asClass.port);
	}
};

~getOutput = {
  var outputPreferences = [
    "dzk AirPods Pro",
    "WH-1000XM2",
    "ULN-8mkIV",
    "MHLink [48646]",
    "SPL Crimson",
    "External Headphones",
    "MacBook Pro Speakers",
  ];

  // Select the first output device connected, in order of preference above
  Routine({
    outputPreferences.do({ |output|
      ServerOptions.outDevices.do({  |device|
        if( output == device ) {
          var msg = "Found preferred device:" + device;
          msg.postln;
          device.yield;
        };
      });
    });
    0.yield;  // yield is required here
  }).next
};

s.reboot { // server options are only updated on reboot
	// configure the sound server: here you could add hardware specific options
	// see http://doc.sccode.org/Classes/ServerOptions.html
	s.options.outDevice = ~getOutput.value;
	s.options.sampleRate = nil;
	s.options.numBuffers = 1024 * 256; // increase this if you need to load more samples
	s.options.memSize = 8192 * 32; // increase this if you get "alloc failed" messages
	s.options.numWireBufs = 128; // increase this if you get "exceeded number of interconnect buffers" messages
	s.options.maxNodes = 1024 * 32; // increase this if you are getting drop outs and the message "too many nodes"
	s.options.numOutputBusChannels = 2; // set this to your hardware output channel size, if necessary
	s.options.numInputBusChannels = 0; // set this to your hardware output channel size, if necessary
	s.latency = 0.6; // increase this if you get "late" messages

	s.waitForBoot {
    if (\SuperDirt.asClass.notNil) {
      ~dirt.stop; // stop any old ones, avoid duplicate dirt (if it is nil, this won't do anything)
      ~dirt = SuperDirt(2, s); // two output channels, increase if you want to pan across more channels
      ~dirt.loadSoundFiles;   // load samples (path containing a wildcard can be passed in)
      ~dirt.loadSoundFiles("~/Music/samples/*");
      // s.sync; // optionally: wait for samples to be read
      ~dirt.start(57120, 0 ! 12);   // start listening on port 57120, create two busses each sending audio to channel 0

      // optional, needed for convenient access from sclang:
      (
        ~d1 = ~dirt.orbits[0]; ~d2 = ~dirt.orbits[1]; ~d3 = ~dirt.orbits[2];
        ~d4 = ~dirt.orbits[3]; ~d5 = ~dirt.orbits[4]; ~d6 = ~dirt.orbits[5];
        ~d7 = ~dirt.orbits[6]; ~d8 = ~dirt.orbits[7]; ~d9 = ~dirt.orbits[8];
        ~d10 = ~dirt.orbits[9]; ~d11 = ~dirt.orbits[10]; ~d12 = ~dirt.orbits[11];
      );

      // directly below here, in your own copy of this file, you could add further code that you want to call on startup
      // this makes sure the server and ~dirt are running
      // you can keep this separate and make it easier to switch between setups
      // by using "path/to/my/file.scd".load and if necessary commenting out different load statements

      MIDIClient.init;

      if (MIDIClient.sources.detect({arg item, i; item.name == "Prophet 6"}) != nil,
        {
          ~prophetMidi = MIDIOut.newByName("Prophet 6", "Prophet 6");
          ~prophetMidi.latency = 0;
          ~dirt.soundLibrary.addMIDI(\prophet6, ~prophetMidi);
          "✅ Prophet 6 connected, adding dirt device".postln;
        },
        { "🚫 Prophet 6 not connected, not adding dirt device".postln }
      );

      if (MIDIClient.sources.detect({arg item, i; item.name == "Elektron Syntakt"}) != nil,
        {
          ~syntaktMidi = MIDIOut.newByName("Elektron Syntakt", "Elektron Syntakt");
          ~syntaktMidi.latency = 0;
          ~dirt.soundLibrary.addMIDI(\syntakt, ~syntaktMidi);
          "✅ Elektron Syntakt connected, adding dirt device".postln;
        },
        { "🚫 Syntakt not connected, not adding dirt device".postln }
      );

      if (MIDIClient.sources.detect({arg item, i; item.name == "Operator"}) != nil,
        {
          ~operatorMidi = MIDIOut.newByName("IAC Driver", "Operator");
          ~operatorMidi.latency = 0;
          ~dirt.soundLibrary.addMIDI(\operator, ~operatorMIDI);
          "✅ Adding operator dirt device".postln;

        },
        { "🚫 Ignoring operator dirt device".postln }
      );
    };
	};
};
