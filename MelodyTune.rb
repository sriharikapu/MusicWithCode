live_loop :random_riff do
  use_synth :dsaw
  use_random_seed 3
  notes = (scale :e3, :minor_pentatonic).shuffle
  play notes.tick, release: 0.25, cutoff: 80
  sleep 0.25
end
live_loop :habanera do
  use_synth :fm
  use_transpose -12
  play (ring :d, :r, :r, :a, :f5, :r, :a, :r).tick
  sleep 0.25
end
with_fx :reverb do
  live_loop :space_light do
    with_fx :slicer, phase: 0.25 do
      synth :blade, note: :d, release: 8, cutoff: 100, amp: 2
    end
    sleep 8
  end
end
use_debug false
live_loop :random_riff do
  # uncomment and hit Run to bring in:
  # synth :blade, note: :e4, release: 4, cutoff: 100, amp: 1.5
  use_synth :dsaw
  use_random_seed 30030
  notes = (scale :e3, :minor_pentatonic, num_octaves: 2).shuffle.take(8)
  8.times do
    play notes.tick, release: rand(0.5),
      cutoff: rrand(60, 130) if one_in(2)
    sleep 0.125
  end
end
live_loop :drums do
  use_random_seed 500
  16.times do
    sample :bd_haus, rate: 2, cutoff: 110 if rand < 0.35
    sleep 0.125
  end
end
live_loop :bd do
  sample :bd_haus, cutoff: 100, amp: 3
  sleep 0.5
end


live_loop :beats do
  sample :guit_em9, rate: [0.25, 0.5, -1].choose, amp: 2
  sample :loop_garzul, rate: [0.5, 1].choose
  sleep 8
end

live_loop :melody do
  oct = [-1, 1, 2].choose * 12
  with_fx :reverb, amp: 2 do
    16.times do
      n = (scale 0, :minor_pentatonic).choose
      sample :bass_voxy_hit_c, rpitch: n + 4 + oct
      sleep 0.125
    end
  end
end
with_fx :reverb, mix: 0.2 do
  loop do
    play scale(:Eb2, :major_pentatonic, num_octaves: 3).choose, release: 0.1, amp: rand
    sleep 0.1
  end
end
live_loop :amen_break do
  sample :loop_amen, beat_stretch: 2
  sleep 2
end
with_fx :reverb, mix: 0.5 do
  loop do
    s = synth [:bnoise, :cnoise, :gnoise].choose, amp: rrand(0.5, 1.5), attack: rrand(0, 4), sustain: rrand(0, 2), release: rrand(1, 3), cutoff_slide: rrand(0, 3), cutoff: rrand(60, 80), pan: rrand(-1, 1), pan_slide: 1, amp: rrand(0.5, 1)
    control s, pan: rrand(-1, 1), cutoff: rrand(60, 115)
    sleep rrand(2, 3)
  end
end
