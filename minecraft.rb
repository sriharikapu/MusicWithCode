live_loop :bass_trail do
 tick
 x, y, z = mc_location
 b = (ring :melon, :brick, :glass).look
 mc_set_block b, x, y -1, z
 note = (ring :e1, :e2, :e3).look
 use_synth :tb303
 play note, release: 0.1, cutoff: 70
 sleep 0.125
end
