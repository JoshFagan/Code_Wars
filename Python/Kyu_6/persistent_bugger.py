#!/usr/bin/python

import sys


def persistence(n):
    """
    Return the multiplicative persistence

    Take a positive number and return its multiplicative persistence, which is 
    the number of times you must multiply the digits in number until you reach 
    a single digit.
    EX. persistence(39)   => 3 # Because 3*9 = 27, 2*7 = 14, 1*4=4
                               # and 4 has only one digit.

         persistence(999) => 4 # Because 9*9*9 = 729, 7*2*9 = 126,
                               # 1*2*6 = 12, and finally 1*2 = 2.
        
         persistence(4)   => 0 # Because 4 is already a one-digit number.
    """

    mp = 0
    while n >= 10:
        mp += 1
        n = reduce(lambda x, y : x*y, [int(d) for d in str(n)])
    
    return mp 


if __name__ == '__main__':
    user_input = sys.argv[1] 

    if user_input.isdigit(): 
        if user_input == '1':
            number = 39
        elif user_input == '2':
            number = 999 
        elif user_input == '3':
            number = 4
        else:
            print('Invalid sentence selection.') 
            print('Possible choices are: 1, 2, 3.\n')
            sys.exit()
    else:
        number = int(user_input)

    print('Input Number: ' + str(number))
    p = persistence(number)
    print('Multiplicative Persistence: ' + str(p))
