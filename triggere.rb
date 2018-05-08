use_synth :tb303
use_debug false
with_fx :reverb, room: 0.8 do
  live_loop :space_scanner do
    with_fx :slicer, phase: 0.25, amp: 0.5 do
      play :e1, release: 7, attack: 1,
        cutoff_attack: 40, cutoff_release: 4
      sleep 8
    end
  end
end
