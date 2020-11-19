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
    test_cases = {}

    if len(sys.argv) == 1:
        test_cases[0] = (1, 0)
        test_cases[1] = (1, 2)
        test_cases[2] = (0, 1)
        test_cases[3] = (1, 1)
        test_cases[4] = (-1, 0)
        test_cases[5] = (-1, 2)
    else:
        test_cases[0] = (int(sys.argv[1]), int(sys.argv[2]))

for k, v in test_cases.items():
        print('Test Case:')
        print('\t{}, {}'.format(v[0], v[1]))
        solution = get_sum(v[0], v[1])
        print('Solution:')
        print('\t{}\n'.format(solution))

