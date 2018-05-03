live_loop :note_blocks do
 mc_message “This is Sonic Minecraft”
 with_fx :reverb do
 with_fx :echo, phase: 0.125, reps: 32 do
 tick
 x = (range 30, 90, step: 0.1).look
 y = 20
 z = -10
 mc_teleport x, y, z
 ns = (scale :e3, :minor_pentatonic)
 n = ns.shuffe.choose
 bs = (knit :glass, 3, :sand, 1)
 b = bs.look
 synth :beep, note: n, release: 0.1
 mc_set_block b, x+20, n-60+y, z+10
 mc_set_block b, x+20, n-60+y, z-10
 sleep 0.25
 end
 end
end

live_loop :beats do
 sample :bd_haus, cutoff: 100
 sleep 0.5
end
