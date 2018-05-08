live_loop :drums do
  use_random_seed 2001
  16.times do
    r = rrand(0.5, 10)
    sample :drum_bass_hard, rate: r, amp: rand
    sleep 0.125
  end
end
with_fx :reverb, mix: 0.5 do
  loop do
    s = synth [:bnoise, :cnoise, :gnoise].choose, amp: rrand(0.5, 1.5), attack: rrand(0, 4), sustain: rrand(0, 2), release: rrand(1, 3), cutoff_slide: rrand(0, 3), cutoff: rrand(60, 80), pan: rrand(-1, 1), pan_slide: 1, amp: rrand(0.5, 1)
    control s, pan: rrand(-1, 1), cutoff: rrand(60, 115)
    sleep rrand(2, 3)
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
