#!/bin/bash
# Author : ShadowRoot18
# Crack Caesar Cipher
# We use 'printf' because it works in all systems!
# $1 = fisrt argument of the script e.g. --> ./caesar_brute.sh 10
max=$1
# the alphabet
alpha=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
# valid format for integer number
valid='^[0-9]+$'
# check if you have ONLY one argument and valid format
if [ $# -eq 1 ] && [[ $max =~ $valid ]] && [[ $max -le 25 ]] && [[ $max -gt 0 ]]
then
    # Execute the code with exit 0
    if [ $? -eq 0 ]
    then
        # SR18 --> Intro!
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~          
*             _____   ____     ____     ____                  #
*            /       |    \     /|     /    \                 #
*           |        |     |   / |     \    /                 #
*             \      |    /      |      \__/                  #
*               |    |  /        |     /    \                 #   
*                /   |  \        |     \    /                 #
*          _____/    |    \    __|__    \__/                  #
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        printf "\n"
        # Insert the ciphertext
        read -p "Insert the Ciphertext: " ciphertext
        printf "\n"
        # 1..max number = The number of shifts ( user's choice) 
        # 0+1 because we want shift 1 not 0
        for i in $(seq 1 $max)
        do
            # Execute all the shifts!
            # tr for strings, print a nice result with the key shift value!
            attack=$(echo $ciphertext | tr "[A-Z]" "[a-z]" | tr "${alpha:0:26}" "${alpha:${i}:26}")
            echo "[+] Key value : $i ******************"
            echo
            # Results!
            echo ${attack}
            echo
        done
    # Tip read all the results and pick the right one!
    echo "[+] Choose the Result that makes sense."
    fi
    # 0
    exit 0
else
    # Error handling action! 
    printf "*** CaesaR 'Veni, vidi, vici' ***\nUsage: ./caesar _craker [number in range 1-25]"
    # exit output 1
    exit 1
fi

