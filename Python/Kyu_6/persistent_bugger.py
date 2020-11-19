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
    test_cases = {}

    if len(sys.argv) == 1:
        test_cases[0] = 39 
        test_cases[1] = 999 
        test_cases[2] = 4 
    else:
        test_cases[0] = int(sys.argv[1])

    for k, v in test_cases.items():
        print('Test Case:')
        print('\t{}'.format(v))
        solution = persistence(v)
        print('Solution:')
        print('\t{}\n'.format(solution))
