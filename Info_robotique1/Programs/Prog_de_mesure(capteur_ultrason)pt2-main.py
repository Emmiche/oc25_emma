# Imports go at the top
from microbit import *
from machine import time_pulse_us
import KitronikMOVEMotor 
import music
import radio
#import neopixel
#import random

trigger = pin13
echo = pin14

trigger.write_digital(0)
echo.read_digital()

robot = KitronikMOVEMotor.MOVEMotor()
robot.move(0, 0)
robot.goToPosition(1, 90)

# le group doit correspondre au kit (1..15)
g = 9
display.scroll(g)
radio.on()
radio.config(group=g)

prog = 0 # programme actuel (0..9)
display.show(prog)


while True:

    trigger.write_digital(1)
    trigger.write_digital(0)
    distance = time_pulse_us(echo, 1)/2e6*340*100 # *100 pour avoir en cm
    #print(distance)
    display.scroll(str(round(distance)))

    robot.goToPosition(1, 160) # pince ouverte (pour la refermer après pour attraper objet)
    
    # le bouton A incrémente les programmes (0..9)
    if button_a.was_pressed():
        robot.move(0, 0)
        prog = (prog + 1) % 10
        display.show(prog)
        music.pitch(440, 20)

    # faire bouger le robot avec les 4 touches de direction
    # L/R pour pivoter, U/D pour avancer et reculer
    # F1: ouvrir la pince, F2: fermer la pince
    if prog == 0:
        msg = radio.receive()
        if msg:
            display.show(msg)
            if msg == '0':
                robot.move(0, 0)
            elif msg == 'u':
                robot.move(-80, -80)
            elif msg == 'r':
                robot.move(80, -80)
            elif msg == 'l':
                robot.move(-80, 80)
            elif msg == 'd':
                robot.move(80, 80)
            elif msg == '2':
                robot.goToPosition(1, 20)
            elif msg == '1':
                robot.goToPosition(1, 160)

    # 1) Commencer parcours à une position A
    if prog == 1:
        ...
    
    # 2) suivre une ligne
    if prog == 2:
        left = pin1.read_analog()
        right = pin2.read_analog()
        d = (left - right)
        d = d // 10
        robot.move(10 - d, 10 + d)
        
    # prog 3, 4 et 5
    if prog == 4:     
        msg = radio.receive()
        if msg:
            if msg == 'u':        
                if distance < 10: # 3) détecte objet
                    robot.move(0, 70, 2000) # 4) à vérifier si fait bien 180!
                    robot.goToPosition(1, 20) # 5) ferme pince/attrape objet
                        
    # 6) Ramener objet à l'origine
    if prog == 6:
        ...
        
    # 7) libre    
    if prog == 7:
        for i in range(2): # petite dance
            robot.move(120, 0, 1000) # tourne
            robot.goToPosition(1, 160) # ouvre pince 
            robot.goToPosition(1, 20) # ferme pince
            robot.move(0, 120, 1000) # tourne autre sens
        
        


