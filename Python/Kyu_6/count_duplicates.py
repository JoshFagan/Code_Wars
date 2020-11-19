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
    user_input = sys.argv[1] 

    if user_input.isdigit(): 
        if user_input == '1':
            sentence = 'abcde'
        elif user_input == '2':
            sentence = 'aabbcde'
        elif user_input == '3':
            sentence = 'aabBcde'
        elif user_input == '4':
            sentence = 'indivisibility'
        elif user_input == '5':
            sentence = 'Indivisibilities'
        elif user_input == '6':
            sentence = 'aA11'
        elif user_input == '7':
            sentence = 'ABBA'
        else:
            print('Invalid sentence selection.') 
            print('Possible choices are: 1, 2, 3, 4, 5, 6, 7.\n')
            sys.exit()
    else:
        sentence = user_input

    print('Input Sentence:')
    print('\t' + sentence)
    num_duplicates = duplicate_count(sentence)
    print('Duplicate Count: ' + str(num_duplicates))
