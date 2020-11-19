#!/usr/bin/python

import sys


def spin_words(sentence):
    """
    Reverse words of five or more letters in a given sentence.

    Write a function that takes in a string of one or more words, and returns 
    the same string, but with all five or more letter words reversed. 
    Strings passed in will consist of only letters and spaces. Spaces will be 
    included only when more than one word is present.
    EX. spin_words( "Hey fellow warriors" )  => returns "Hey wollef sroirraw" 
        spin_words( "This is a test")        => returns "This is a test" 
        spin_words( "This is another test" ) => returns "This is rehtona test"
    """

    return ' '.join([w[::-1] if len(w)>=5 else w for w in sentence.split()])


if __name__ == '__main__':
    test_cases = {}

    if len(sys.argv) == 1:
        test_cases[0] = 'Hey fellow warriors' 
        test_cases[1] = 'This is a test' 
        test_cases[2] = 'This is another test'
    else:
        test_cases[0] = sys.argv[1]

    for k, v in test_cases.items():
        print('Test Case:')
        print('\t{}'.format(v))
        solution = spin_words(v)
        print('Solution:')
        print('\t{}\n'.format(solution))
