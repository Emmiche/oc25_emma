# Imports go at the top
from microbit import *
import music
import speech


# Code in a 'while True:' loop repeats forever
while True:
    display.scroll('Hi')    
    speech.say('Hi')
    
    display.show(Image.SILLY)
    sleep(1000)
    display.scroll('Ah.', 80)

    if button_a.was_pressed():
        display.scroll('B', 80)


    set_volume(55)
    audio.play(Sound.SLIDE)
