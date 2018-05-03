live_loop :timbre do
 use_synth (ring :tb303, :blade,
 :prophet, :saw, :beep, :tri).tick
 play :e2, attack: 0, release: 0.5, cutoff: 100
 sleep 0.5
end
