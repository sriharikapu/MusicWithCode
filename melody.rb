live_loop :random_riff do
 use_synth :dsaw
 use_random_seed 3
 notes = (scale :e3, :minor_pentatonic).shuffe
 play notes.tick, release: 0.25, cutoff: 80
 sleep 0.25
end
