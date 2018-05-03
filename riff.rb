live_loop :riff do
 use_synth :prophet
 riff = (ring :e3, :e3, :r, :g3, :r, :r, :r, :a3)
 play riff.tick, release: 0.5, cutoff: 80
 sleep 0.25
end
