#!/usr/bin/python3

import sys
import re
import os.path
import time
import subprocess

def one_exercise(title:str, tens_of_seconds: int):
    print(title)
    input("Press Enter to start exercise...")
    countdown = tens_of_seconds
    while(countdown > 0):
        subprocess.run(["afplay", "/Users/beth/dev/util/sounds/si_bemol_tone_2016-82338.mp3"])
        time.sleep(7.5)
        countdown -= 1
    subprocess.run(["afplay", "/Users/beth/dev/util/sounds/ping-43757.mp3"])
    print("done")

one_exercise("quads", 3)
one_exercise("quads, other side. keep back straight", 3)
one_exercise("calf muscle stretch", 3)
one_exercise("calf muscle, other side", 3)
one_exercise("get on floor - inner thigh Y shape", 4)

one_exercise("stand up, glutes 1. point knee towards desk", 5)
one_exercise("glutes 1, turn around, knee towards other desk", 5)
one_exercise("get the chair. hamstrings. keep lower back straight", 3)
one_exercise("hamstrings other side. keep lower back straight", 3)
one_exercise("tree pose", 3)
one_exercise("tree pose other side", 3)
one_exercise("clasp hands behind your back, stretch your chest. chin up", 5)

one_exercise("get on floor. Hip flexors", 4)
one_exercise("Hip flexors other side", 4)
one_exercise("adductors", 6)
one_exercise("stretch one leg out and fold your leg like #4", 3)
one_exercise("#4 stretch, other side", 3)
one_exercise("glutes: put the bent leg behind your straight knee and twist", 4)
one_exercise("glutes: turn to the other side. remember stretch your neck", 4)

input("Announce the auxillary stretches. stay seated. Press Enter to start..")
one_exercise("Cobra pose", 4)
one_exercise("childs pose", 4)
one_exercise("roll over on your back. tanya's hip stretch, one side", 4)
one_exercise("tanyas stretch other side", 4)
one_exercise("stand up. triceps one side", 3)
one_exercise("triceps, other side", 3)
one_exercise("shoulder: put your elbow out front and then pull", 30)
one_exercise("other shoulder", 30)
