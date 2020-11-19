#!/usr/bin/python

import sys


def duplicate_count(sentence):
    """
    Count distinct letters and digits that occur more than once in sentence 

    Return the count of distinct case-insensitive alphabetic characters and 
    numeric digits that occur more than once in the input string. The input 
    string can be assumed to contain only alphabets (both uppercase and 
    lowercase) and numeric digits.
    EX. "abcde"            -> 0 # no characters repeats more than once
        "aabbcde"          -> 2 # 'a' and 'b'
        "aabBcde"          -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
        "indivisibility"   -> 1 # 'i' occurs six times
        "Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
        "aA11"             -> 2 # 'a' and '1'
        "ABBA"             -> 2 # 'A' and 'B' each occur twice

    """

    return len([c for c in set(sentence.lower()) 
                  if sentence.lower().count(c) > 1]) 


if __name__ == '__main__':
    test_cases = {}

    if len(sys.argv) == 1:
        test_cases[0] = 'abcde'
        test_cases[1] = 'aabbcde'
        test_cases[2] = 'aabBcde'
        test_cases[3] = 'indivisibility'
        test_cases[4] = 'Indivisibilities'
        test_cases[5] = 'aA11'
        test_cases[6] = 'ABBA'
    else:
        test_cases[0] = sys.argv[1]

    for k, v in test_cases.items():
        print('Test Case:')
        print('\t{}'.format(v))
        solution = duplicate_count(v)
        print('Solution:')
        print('\t{}\n'.format(solution))
