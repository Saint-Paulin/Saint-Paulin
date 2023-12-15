#!/bin/python3

import random

i = -3

list = []
listFinal = []

j1 = []
j2 = []

while i < 18:
        i += 1
        list.append(i)

while len(listFinal) <= 42:
        for f in list:
                listFinal.append(f)
        #       print(f)

random.shuffle(listFinal)

print(listFinal)
print("")
print("nbr : ", len(listFinal))

def distrib(packet, j):
        while len(j) <= 4:
                j.append(packet[0])
                del packet[0]

distrib(listFinal, j1)
distrib(listFinal, j2)

print(j1)
print("")
print(j2)
print("")
print("nbr : ", len(listFinal))

def removeFList(l, to_remove):
        try:
                del l[l.index(to_remove)]
        except ValueError:
                print("Bad choice")

def ga():
        while True:
                if len(j1) == 1 and len(j2) == 1:
                        print(j1, j2)
                        devo = input("Dévoiler j1 ?")
                        try:
                                if devo is "y":
                                        if j1 < j2:
                                                print("Gagné")
                                        else:
                                                print("Perdu")
                                elif devo is "n":
                                        print("Perdu")
                        except ValueError:
                                print("Erreur Y/N")
                        break
                else:
                        if len(j1) == len(j2):
                                choix = float(input("j1 : "))
                                removeFList(j1, choix)
                        else:
                                choix = float(input("j2 : "))
                                removeFList(j2, choix)

ga()
