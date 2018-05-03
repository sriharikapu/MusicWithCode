live_loop :beats do
 sample :bd_tek
 with_fx :echo, phase: 0.125, mix: 0.4 do
 sample :drum_cymbal_soft, sustain: 0, release: 0.1
 sleep 0.5
 end
end
live_loop :bass do
 use_synth :tb303
synth :tb303, note: :e1, release: 4, cutoff: 120,
 cutoff_attack: 1
 sleep 4
end
