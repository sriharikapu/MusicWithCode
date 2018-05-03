live_loop :random_riff do
 use_synth :dsaw
 use_random_seed 30
 notes = (scale :e3, :minor_pentatonic).shuffe
 16.times do
 play notes.tick, release: 0.2, cutoff: 90 if one_in(2)
 sleep 0.125
 end
end
