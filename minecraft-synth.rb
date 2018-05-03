live_loop :sand_storm do
 x, y, z = mc_location
 xd = rrand(-10, 10)
 zd = rrand(-10, 10)
 co = rrand(70, 130)
 synth :cnoise, attack: 0, release: 0.125, cutoff: co
 mc_set_block :sand, x + xd, y+20, z+zd
 sleep 0.125
end
