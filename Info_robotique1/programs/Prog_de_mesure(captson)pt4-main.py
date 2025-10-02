# Imports go at the top
from microbit import *
from machine import time_pulse_us
import KitronikMOVEMotor 
import music
import radio
import time
#import neopixel
#import random

trigger = pin13
echo = pin14
prog = 0

trigger.write_digital(0)
echo.read_digital()

robot = KitronikMOVEMotor.MOVEMotor()
robot.move(0, 0)
# pince ouverte (pour la refermer après pour attraper objet)
robot.goToPosition(1, 160) 

def avancer(d):
    # avancer ou reculer de d centimètres
    d0 = 10.3 # distance de calibration
    if d>0:
        robot.move(120, 120, 20)
        robot.move(60, 60, d/d0*1000)
    else:
        robot.move(-120, -120, 20)
        robot.move(-60, -60, -d/d0*1000)

def distance():
    trigger.write_digital(1)
    time.sleep_us(10)
    trigger.write_digital(0)
    d = time_pulse_us(echo, 1)/2e6*340*100 # *100 pour avoir en cm
    return round(d)

def suivre_ligne():
    left = pin1.read_analog()
    right = pin2.read_analog()
    d = (left - right)
    d = d // 10
    robot.move(5 - d, 5 + d)

def dancer():
    robot.move(120, 0, 1000) # tourne
    robot.goToPosition(1, 160) # ouvre pince 
    robot.goToPosition(1, 20) # ferme pince
    robot.move(0, 120, 1000) # tourne autre sens

# Programme autonome : aller à un objet, le ramasser, et revenir à A (sur circuit fermé)
while True:
    # le bouton A incrémente les programmes (0..9)
    if button_a.was_pressed():
        robot.move(0, 0)
        prog = (prog + 1) % 10
        display.show(prog)
        music.pitch(440, 20)
        print('prog =', prog)

    if prog == 0:
        # tester le capteur ultrason
        ...

    if prog == 1:
        # tester la fonction distance()
        # fonctionne la pluspart du temps, mais parfois ça retourne
        # 1003, 1007, 1005, etc.
        if button_b.is_pressed():
            d = distance()
            time.sleep_ms(100)
            print(d)

    if prog == 2:
        # tester suivie la ligne OK
        suivre_ligne()

    if prog == 3:
        # dester arrêt à 20 cm d'un obstacle
        if distance() > 20:
            suivre_ligne()
        else:
            robot.move(0, 0)


    if prog == 4:  
        # tester le chronomètre
        # le robot part avec bouton B, s'arrête à 10 cm d'un objet
        # affiche le temps dans la console
        if button_b.is_pressed():
            t0 = time.ticks_ms()
            robot.move(60, 60)
            while distance() > 10:
                pass
            robot.move(0, 0)
            t1 = time.ticks_ms()
            dt = t1 - t0 # durée jusqu'à l'objet
            t2 = time.ticks_ms() + dt   # instant dans le futur ou il doit s'arreter
            robot.move(-60, -60)
            print(t1 - t0)
            while time.ticks_ms() < t2:
                pass
            robot.move(0, 0)

    if prog == 5:
        # Capteur ultrason : détection objet   
        if distance() < 20: # Si à moins de 20 cm (obstacle/objet) alors...
            stop = time.ticks_ms()
            start = 0
            duration = stop - start # Temps jusqu'à l'objet pour déterminer position A
            robot.move(0, 0)
            sleep(500)
            
            # Demi-tour
            robot.move(80, -80, 2000)
            robot.move(0, 0)
            sleep(500)
            
            # Fermer la pince
            robot.goToPosition(1, 20)
            sleep(1000)
            
            # Revenir à la position A en refaisant le même temps
            #duration # Faire même temps au retour qu'à l'aller
            left = pin1.read_analog()
            right = pin2.read_analog()
            d = (left - right)
            d = d // 20
            robot.move(5 - d, 5 + d)
                    
            robot.move(0, 0)
            sleep(500)
                    
            # Déposer l'objet
            robot.goToPosition(1, 160)
            sleep(1000)
                    
    if prog == 9:
        dancer()

                    