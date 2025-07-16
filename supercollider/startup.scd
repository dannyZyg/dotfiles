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
  var outputPreferences = [
    "dzk AirPods Pro",
    "WH-1000XM2",
    "ULN-8mkIV",
    "MHLink [48646]",
    "External Headphones",
    "外部",
    "MacBook Airのス",
  ];

  // Select the first output device connected, in order of preference above
  Routine({
    outputPreferences.do({ |output|
      ServerOptions.outDevices.do({  |device|
        if( output == device ) {
          var msg = "✅ Found preferred device:" + device;
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
  var device = ~getAudioDevice.();
  var numOutputs = 16;
  var numInputs = 16;

	s.options.outDevice = device;



  ("🔉 Setting out device as: " ++ device ++ " with " ++ numOutputs ++ " outputs").postln;
  ("🎙️ Setting in device as: " ++ device ++ " with " ++ numInputs ++ " inputs").postln;

	s.options.inDevice = device;
	s.options.sampleRate = 48000;
	s.options.numBuffers = 1024 * 256; // increase this if you need to load more samples
	s.options.memSize = 8192 * 32; // increase this if you get "alloc failed" messages
	s.options.numWireBufs = 128; // increase this if you get "exceeded number of interconnect buffers" messages
	s.options.maxNodes = 1024 * 32; // increase this if you are getting drop outs and the message "too many nodes"
	s.options.numOutputBusChannels = 16; // set this to your hardware output channel size, if necessary
	s.options.numInputBusChannels = 16; // set this to your hardware output channel size, if necessary
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
