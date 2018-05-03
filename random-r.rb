live_loop :random_riff do
 use_random_seed 10300
 use_synth :prophet
 s = [0.125, 0.25, 0.5].choose
 8.times do
 r = [0.125, 0.25, 1, 2].choose
 n = (scale :e3, :minor).choose
 co = rrand(30, 100)
 play n, release: r, cutoff: co
 sleep s
 end
end
live_loop :drums do
 use_random_seed 2001
 16.times do
 r = rrand(0.5, 10)
 sample :drum_bass_hard, rate: r, amp: rand
 sleep 0.125
 end
end
