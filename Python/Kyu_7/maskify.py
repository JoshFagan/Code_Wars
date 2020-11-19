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
    user_input = sys.argv[1] 

    if user_input.isdigit(): 
        if user_input == '1':
            sentence = '4556364607935616'
        elif user_input == '2':
            sentence = '64607935616'
        elif user_input == '3':
            sentence = '1'
        elif user_input == '4':
            sentence = ''
        elif user_input == '5':
            sentence = 'Skippy'
        elif user_input == '6':
            sentence = 'Nananananananananananananananana Batman!'
        else:
            print('Invalid sentence selection.') 
            print('Possible choices are: 1, 2, 3.\n')
            sys.exit()
    else:
        sentence = user_input

    print('Input Sentence:')
    print('\t' + sentence)
    masked_sentence = maskify(sentence)
    print('Masked Sentence:')
    print('\t' + masked_sentence + '\n')
