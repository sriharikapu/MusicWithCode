live_loop :melon_trail do
 x, y, z = mc_location
 mc_set_block :melon, x, y-1, z
 sleep 0.125
end
