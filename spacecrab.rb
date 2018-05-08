use_synth :tb303
use_debug false
with_fx :reverb, room: 0.8 do
  live_loop :space_scanner do
    with_fx :slicer, phase: 0.25, amp: 1.5 do
      co = (line 70, 130, steps: 8).tick
      play :e1, cutoff: co, release: 7, attack: 1,
        cutoff_attack: 4, cutoff_release: 4
      sleep 8
    end
  end
  
  use_synth :tb303
  with_fx :reverb do |rev|
    loop do
      control rev, mix: rrand(0, 0.3)
      with_fx :slicer, phase: 0.125 do
        sample :ambi_lunar_land, sustain: 0, release: 8, amp: 2
      end
      
      
      
      control rev, mix: rrand(0, 0.6)
      r = rrand(0.1, 0.2)
      with_synth :prophet do
        84.times do
          sleep 0.125
          play chord(:a3, :m7).choose, release: r, cutoff: rrand(40, 130), amp: 0.7
        end
      end
      
      control rev, mix: rrand(0, 0.6)
      r = rrand(0.05, 0.3)
      62.times do
        play chord(:e3, :minor).choose, release: r, cutoff: rrand(110, 130), amp: 0.4
        sleep 0.125
      end
      live_loop :squelch do
        use_random_seed 3000
        16.times do
          n = (ring :e1, :e2, :e3).tick
          play n, release: 0.125, cutoff: rrand(70, 130),
            res: 0.9, wave: 1, amp: 0.8
          sleep 0.125
        end
      end
    end
    
    control rev, mix: rrand(0, 0.6)
    with_fx :echo, phase: 0.25, decay: 8 do
      16.times do
        play chord([:e2, :e3, :e4].choose, :m7).choose, release: 0.05, cutoff: rrand(50, 129), amp: 0.5
        sleep 0.125
      end
    end
  end
end
