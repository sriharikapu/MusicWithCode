
# Coded by Sam Aaron

use_debug false

live_loop :synths, delay: 6 do
  puts "how does it feel?"
  use_synth :mod_saw
  use_synth_defaults amp: 0.5, attack: 0, sustain: 1, release: 0.25, mod_range: 12, mod_phase: 0.5, mod_invert_wave: 1
  notes = (ring :F, :C, :D, :D, :G, :C, :D, :D)
  notes.each do |n|
    tick
    play note(n, octave: 1), cutoff: (line 90, 130, steps: 16).look
    play note(n, octave: 2), cutoff: (line 90, 130, steps: 32).look
    sleep 1
  end
end

live_loop :snare, delay: 12.5 do
  sample :drum_snare_soft
  sleep 1
end


# Bach Minuet in G
#
# Coded by Robin Newman

use_bpm 60
use_synth_defaults release: 0.5, amp: 0.7, cutoff: 90
use_synth :beep

## Each section of the minuet is repeated
2.times do
  
  ## First start a thread for the first 8 bars of the bass left hand part
  in_thread do
    play_chord [55,59]#b1
    sleep 1
    play_pattern_timed [57],[0.5]
    play_pattern_timed [59],[1.5] #b2
    play_pattern_timed [60],[1.5] #b3
    play_pattern_timed [59],[1.5] #b4
    play_pattern_timed [57],[1.5] #b5
    play_pattern_timed [55],[1.5] #b6
    play_pattern_timed [62,59,55],[0.5] #b7
    play_pattern_timed [62],[0.5] #b8
    play_pattern_timed [50,60,59,57],[0.25]
  end
  
  ## Play concurrently the first 8 bars of the right hand part
  play_pattern_timed [74],[0.5]#b1
  play_pattern_timed [67,69,71,72],[0.25]
  play_pattern_timed [74,67,67],[0.5]#b2
  play_pattern_timed [76],[0.5]#b3
  play_pattern_timed [72,74,76,78],[0.25]
  play_pattern_timed [79,67,67],[0.5]#b4
  play_pattern_timed [72],[0.5] #b5
  play_pattern_timed [74,72,71,69],[0.25]
  play_pattern_timed [71],[0.5] #b6
  play_pattern_timed [72,71,69,67],[0.25]
  play_pattern_timed [66],[0.5] #b7
  play_pattern_timed [67,69,71,67],[0.25]
  play_pattern_timed [71,69],[0.5,1] #b8
  
  ## Start a new thread for bars 9-16 of the left hand part
  in_thread do
    play_chord [55,59]#b9=b1
    sleep 1
    play 57
    sleep 0.5
    play_pattern_timed [55,59,55],[0.5] #b10
    play_pattern_timed [60],[1.5] #b11=b3
    play_pattern_timed [59,60,59,57,5],[0.5,0.25,0.25,0.25,0.25] #b12=b4]
    play_pattern_timed [57,54],[1,0.5] #b13
    play_pattern_timed [55,59],[1,0.5] #b14
    play_pattern_timed [60,62,50],[0.5] #b15
    play_pattern_timed [55,43],[1,0.5] #b16
  end
  
  ## Play concurrently bars 9-16 of the right hand part the first six
  ## bars repeat bars 1-6
  play_pattern_timed [74],[0.5]#b9 = b1
  play_pattern_timed [67,69,71,72],[0.25]
  play_pattern_timed [74,67,67],[0.5]#b10=b2
  play_pattern_timed [76],[0.5]#b11=b3
  play_pattern_timed [72,74,76,78],[0.25]
  play_pattern_timed [79,67,67],[0.5]#b12=b4
  play_pattern_timed [72],[0.5] #b13=b5
  play_pattern_timed [74,72,71,69],[0.25]
  play_pattern_timed [71],[0.5] #b14=b6
  play_pattern_timed [72,71,69,67],[0.25]
  play_pattern_timed [69],[0.5] #b15
  play_pattern_timed [71,69,67,66],[0.25]
  play_pattern_timed [67],[1.5] #b16
end


## ==========second section starts here======
## The second section is also repeated
2.times do
  
  ## Start a thread for bars 17-24 of the left hand part
  in_thread do
    play_pattern_timed [55],[1.5] #b17
    play_pattern_timed [54],[1.5] #b18
    play_pattern_timed [52,54,52],[0.5] #b19
    play_pattern_timed [57,45],[1,0.5] #b20
    play_pattern_timed [57],[1.5] #b21
    play_pattern_timed [59,62,61],[0.5] #b22
    play_pattern_timed [62,54,57],[0.5] #b23
    play_pattern_timed [62,50,60],[0.5] #b24
  end
  
  ## Play bars 17 to 24 of the right hand concurrently with the left
  ## hand thread
  play_pattern_timed [83],[0.5] #b17
  play_pattern_timed [79,81,83,79],[0.25]
  play_pattern_timed [81],[0.5] #b18
  play_pattern_timed [74,76,78,74],[0.25]
  play_pattern_timed [79],[0.5] #b19
  play_pattern_timed [76,78,79,74],[0.25]
  play_pattern_timed [73,71,73,69],[0.5,0.25,0.25,0.5] #b20
  play_pattern_timed [69,71,73,74,76,78],[0.25] #b21
  play_pattern_timed [79,78,76],[0.5] #b22
  play_pattern_timed [78,69,73],[0.5] #b23
  play 74 #b24
  sleep 1.5
  
  ## Start a new thread for bars 25-32 of the left hand part
  in_thread do
    play_pattern_timed [59,62,59],[0.5] #b25
    play_pattern_timed [60,64,60],[0.5] #b26
    play_pattern_timed [59,57,55],[0.5] #b27
    play 62 #b28
    sleep 1.5 #includes a rest
    play_pattern_timed [50,54],[1,0.5] #b29
    play_pattern_timed [52,55,54],[0.5] #b30
    play_pattern_timed [55,47,50],[0.5] #b31
    play_pattern_timed [55,50,43],[0.5] #b32
  end
  
  ## Play bars 25-32 of the right hand part concurrently with the left
  ## hand thread
  play_pattern_timed [74,67,66,67],[0.5,0.25,0.25,0.5] #b25
  play_pattern_timed [76,67,66,67],[0.5,0.25,0.25,0.5] #b26
  play_pattern_timed [74,72,71],[0.5] #b27
  play_pattern_timed [69,67,66,67,69],[0.25,0.25,0.25,0.25,0.5] #b28
  play_pattern_timed [62,64,66,67,69,71],[0.25] #b29
  play_pattern_timed [72,71,69],[0.5] #b30
  play_pattern_timed [71,74,67,66],[0.25,0.25,0.5,0.5] #b31
  play_chord [67,59] #b32
  sleep 1.5
end

use_debug false

with_fx :reverb do
  live_loop :choral do
    r = (ring 0.5, 1.0/3, 3.0/5).choose
    cue :choir, rate: r
    8.times do
      sample :ambi_choir, rate: r, pan: rrand(-1, 1)
      sleep 0.5
    end
  end
end


live_loop :wub_wub do
  with_fx :wobble, phase: 2, reps: 16 do |w|
    with_fx :echo, mix: 0.6 do
      sample :drum_heavy_kick
      sample :bass_hit_c, rate: 0.8, amp: 0.4
      sleep 1
      ## try changing the wobble's phase duration:
      # control w, phase: (ring 0.5, 1, 2).choose
    end
  end
end

with_fx :reverb, mix: 0.5 do
  loop do
    s = synth [:bnoise, :cnoise, :gnoise].choose, amp: rrand(0.5, 1.5), attack: rrand(0, 4), sustain: rrand(0, 2), release: rrand(1, 3), cutoff_slide: rrand(0, 3), cutoff: rrand(60, 80), pan: rrand(-1, 1), pan_slide: 1, amp: rrand(0.5, 1)
    control s, pan: rrand(-1, 1), cutoff: rrand(60, 115)
    sleep rrand(2, 3)
  end
end

loop do
  with_synth :dsaw do
    with_fx(:slicer, phase: [0.25,0.125].choose) do
      with_fx(:reverb, room: 0.5, mix: 0.3) do
        start_note = chord([:b1, :b2, :e1, :e2, :b3, :e3].choose, :minor).choose
        final_note = chord([:b1, :b2, :e1, :e2, :b3, :e3].choose, :minor).choose
        
        p = play start_note, release: 8, note_slide: 4, cutoff: 30, cutoff_slide: 4, detune: rrand(0, 0.2), pan: rrand(-1, 0), pan_slide: rrand(4, 8)
        control p, note: final_note, cutoff: rrand(80, 120), pan: rrand(0, 1)
      end
    end
  end
  sleep 8
end
