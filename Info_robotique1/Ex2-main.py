"""
Emma Favre
21 août 2025
Introduction au microbit

Code démonstrateur avec 10 programmes
bouton a : incrémenter le programme
bouton b : executer

0 - afficher image 'HAPPY'
1 - défiler un 'Hi'
2 - prononcer 'Hi'
3 - bruit 'giggle'
4 - afficher image étoile
5 - prononcer une référence
6 - musique 'Power Up'
7 - afficher text (référence)
8 - proncer 'The End'
9 - musique 'Funeral'

"""

# Imports go at the top
from microbit import *
import speech
import music

# On commence avec le programme
p = 0

# Code in a 'while True:' loop repeats forever
while True:
    # Choix du programme avec bouton a
    display.show(p)
    if button_a.was_pressed():
        p = p + 1   # Appuyer sur a, plus 1 => 10 programmes
        if p == 10: # Egal 10, revient sur 0
            p = 0

    #le bouton b execute le programme actuel (0..9)
    if button_b.is_pressed():
        if p == 0: # Appuyer b quand 0 = image
            display.show(Image.HAPPY)
            sleep(1000)
        elif p == 1: # Appuyer b quand 1 = text
            display.scroll('Hi')
        elif p == 2: # Appuyer b quand 2 = parole
            speech.say('Hi')
        elif p == 3:
            audio.play(Sound.GIGGLE)
        elif p == 4:
            display.show(Image('00300:'
                               '03630:'
                               '36963:'
                               '03630:'
                               '00300'))
            sleep(1000)
        elif p == 5:
            speech.say('Praise the Sun!')
        elif p == 6:
            music.play(music.POWER_UP)
        elif p == 7:
            display.scroll('Despite everything, it is still you.')
        elif p == 8:
            speech.say('The End')
        elif p == 9:
            music.play(music.FUNERAL)
            
            
            
        



        
    


    