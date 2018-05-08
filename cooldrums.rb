live_loop :drums do
  use_random_seed 2001
  16.times do
    r = rrand(0.5, 10)
    sample :drum_bass_hard, rate: r, amp: rand
    sleep 0.125
  end
end
live_loop :bass_drum do
  sample :bd_haus, cutoff: 70, amp: 1.5
  sleep 0.5
end
live_loop :landing do
  bass_line = (knit :e1, 3, [:c1, :c2].choose, 1)
  with_fx :slicer, phase: [0.25, 0.5].choose,
  invert_wave: 1, wave: 0 do
    s = synth :square, note: bass_line.tick, sustain: 4,
      cutoff: 60
    control s, cutoff_slide: 4, cutoff: 120
  end
  sleep 4
end
