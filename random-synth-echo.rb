live_loop :moon_rise do
with_fx :echo, mix: 0, mix_slide: 8 do |fx|
control fx, mix: 1
notes = (scale :e3, :minor_pentatonic,
 num_octaves: 2).shuffe
sn = synth :prophet , sustain: 8, note: :e1,
 cutoff: 70, cutoff_slide: 8
control sn, cutoff: 130
sleep 2
32.times do
 control sn, note: notes.tick, pan: rrand(-1, 1)
 sleep 0.125
end
end
end
