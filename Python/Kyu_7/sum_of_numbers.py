#!/usr/bin/python

import sys


def get_sum(a, b):
    """
    Find the sum of all the integers between two numbers (inclusive).

    Given two integers a and b, which can be positive or negative, find the 
    sum of all the integers between including them too and return it. 
    If the two numbers are equal return a or b. a and b are not ordered.
    EX. get_sum(1, 0)  == 1   // 1 + 0 = 1
        get_sum(1, 2)  == 3   // 1 + 2 = 3
        get_sum(0, 1)  == 1   // 0 + 1 = 1
        get_sum(1, 1)  == 1   // 1 Since both are same
        get_sum(-1, 0) == -1  // -1 + 0 = -1
        get_sum(-1, 2) == 2   // -1 + 0 + 1 + 2 = 2
    """

    return sum(range(min(a,b), max(a,b)+1)) 


if __name__ == '__main__':
    user_input = sys.argv[1] 

    if len(sys.argv) == 2:
        if user_input == '1':
            a = 1
            b = 0
        elif user_input == '2':
            a = 1
            b = 2
        elif user_input == '3':
            a = 0
            b = 1
        elif user_input == '4':
            a = 1
            b = 1
        elif user_input == '5':
            a = -1
            b = 0
        elif user_input == '6':
            a = -1
            b = 2
        else:
            print('Invalid sentence selection.') 
            print('Possible choices are: 1, 2, 3, 4, 5, 6.\n')
            sys.exit()
    else:
        a = int(sys.argv[1])
        b = int(sys.argv[2])

    print('Input Values: ' + str(a) + ', ' + str(b))
    count = get_sum(a, b)
    print('Sum: ' + str(count))
