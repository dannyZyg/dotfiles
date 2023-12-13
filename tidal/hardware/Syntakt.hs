:{
let syntakt1 = s "syntakt" # midichan 0
    syntakt2 = s "syntakt" # midichan 1
    syntakt3 = s "syntakt" # midichan 2
    syntakt4 = s "syntakt" # midichan 3
    syntakt5 = s "syntakt" # midichan 4
    syntakt6 = s "syntakt" # midichan 5
    syntakt7 = s "syntakt" # midichan 6
    syntakt8 = s "syntakt" # midichan 7
    syntakt9 = s "syntakt" # midichan 8
    syntakt10 = s "syntakt" # midichan 9
    syntakt11 = s "syntakt" # midichan 10
    syntakt12 = s "syntakt" # midichan 11
:}

:{
let synP paramName paramValue = ccn (inhabit [
                                -- track parameters
                                ("mute", 94), ("trLev", 95),
                                -- trig parameters
                                ("note", 3), ("velocity", 4),
                                ("length", 5), ("fTrig", 13),
                                ("lfoTrig", 14), ("porto", 65),
                                ("portoTime", 9),
                                -- amp parameters
                                ("attack", 79), ("hold", 80), ("decay", 81), ("sustain", 82), ("release", 83),
                                ("delSend", 84), ("revSend", 85),
                                ("pan", 10), ("vol", 7),
                                -- syn parameters
                                ("A", 17), ("B", 18), ("C", 19), ("D", 20),
                                ("E", 21), ("F", 22), ("G", 23), ("H", 24),
                                -- filter parameters
                                ("cutoff", 74), ("res", 75), ("fType", 76),
                                ("fAttack", 70), ("fDecay", 71), ("fSustain", 72), ("fRelease", 73),
                                ("envDepth", 77), ("envDelay", 78),
                                ("fBase", 26), ("fWidth", 27),
                                -- delay parameters
                                ("dTime", 21), ("dPing", 22),
                                ("dWidth", 23), ("dFeedback", 24),
                                ("dHpf", 25), ("dLpf", 26),
                                ("dRevSend", 27), ("dMix", 28),
                                -- reverb parameters
                                ("rPredelay", 29), ("rDecay", 30),
                                ("rShelfFreq", 31), ("rShelfGain", 89),
                                ("rHpf", 90), ("rLpf", 91),
                                ("rMix", 92),
                                -- fx track parameters (g for Global)
                                ("gDrive", 15) ] paramName) # ccv paramValue
:}
