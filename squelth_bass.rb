use_synth :tb303
live_loop :squelch do
 n = (ring :e1, :e2, :e3).tick
 play n, release: 0.125, cutoff: 100, res: 0.8, wave: 0
 sleep 0.125
end
