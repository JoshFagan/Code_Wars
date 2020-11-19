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
    user_input = sys.argv[1] 

    if user_input.isdigit(): 
        if user_input == '1':
            sentence = 'Hey fellow warriors'
        elif user_input == '2':
            sentence = 'This is a test'
        elif user_input == '3':
            sentence = 'This is another test'
        else:
            print('Invalid sentence selection.') 
            print('Possible choices are: 1, 2, 3.\n')
            sys.exit()
    else:
        sentence = user_input

    print('Input Sentence:')
    print('\t' + sentence)
    spinned_sentence = spin_words(sentence)
    print('Spinned Sentence:')
    print('\t' + spinned_sentence + '\n')
