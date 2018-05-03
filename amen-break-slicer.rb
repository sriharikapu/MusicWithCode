live_loop :amen_break do
 use_bpm 50
 with_fx :slicer, phase: 0.25, wave: 0, mix: 1 do
 sample :loop_amen, beat_stretch: 2, cutoff: 100
 end
 sleep 2
end
