#!/usr/bin/python

import sys


def maskify(sentence):
    """
    Change all but the last four characters of the given string to '#'.

    Usually when you buy something, you're asked whether your credit card 
    number, phone number or answer to your most secret question is still 
    correct. However, since someone could look over your shoulder, you don't 
    want that shown on your screen. Instead, we mask it.
    EX. maskify("4556364607935616") == "############5616"
        maskify("64607935616")      == "#######5616"
        maskify("1")                == "1"
        maskify("")                 == ""
        maskify("Skippy")           == "##ippy"
        maskify("Nananananananananananananananana Batman!") == 
                "####################################man!"
    """

    return ''.join([sentence[i] if i > len(sentence)-5 
                                else '#' 
                                for i in range(len(sentence))])


if __name__ == '__main__':
    test_cases = {}

    if len(sys.argv) == 1: 
        test_cases[0] = '4556364607935616'
        test_cases[1] = '64607935616'
        test_cases[2] = '1'
        test_cases[3] = ''
        test_cases[4] = 'Skippy'
        test_cases[5] = 'Nananananananananananananananana Batman!'
    else:
        test_cases[0] = sys.argv[1]

for k, v in test_cases.items():
        print('Test Case:')
        print('\t{}'.format(v))
        solution = maskify(v)
        print('Solution:')
        print('\t{}\n'.format(solution))
