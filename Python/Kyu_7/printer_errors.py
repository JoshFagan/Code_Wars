#!/usr/bin/python

import sys


def printer_error(sentence):
    """
    Return the error rate of the printer. 

    In a factory a printer prints labels for boxes. For one kind of boxes the 
    printer has to use colors which, for the sake of simplicity, are named 
    with letters from a to m.

    The colors used by the printer are recorded in a control string. For 
    example a "good" control string would be aaabbbbhaijjjm meaning that the 
    printer used three times color a, four times color b, one time color h 
    then one time color a...
    
    Sometimes there are problems: lack of colors, technical malfunction and a 
    "bad" control string is produced e.g. aaaxbbbbyyhwawiwjjjwwm with letters 
    not from a to m.
    
    You have to write a function printer_error which given a string will 
    return the error rate of the printer as a string representing a rational 
    whose numerator is the number of errors and the denominator the length of 
    the control string. Don't reduce this fraction to a simpler expression.
    
    The string has a length greater or equal to one and contains only letters 
    from ato z.
    EX. s="aaabbbbhaijjjm"
        error_printer(s) => "0/14"
        
        s="aaaxbbbbyyhwawiwjjjwwm"
        error_printer(s) => "8/22"

    """

    return '{}/{}'.format(len([s for s in sentence if s > 'm']), len(sentence))


if __name__ == '__main__':
    test_cases = {}

    if len(sys.argv) == 1: 
        test_cases[0] = 'aaabbbbhaijjjm'
        test_cases[1] = 'aaaxbbbbyyhwawiwjjjwwm'
    else:
        test_cases[0] = sys.argv[1]

    for k, v in test_cases.items():
        print('Test Case:')
        print('\t{}'.format(v))
        solution = printer_error(v)
        print('Solution:')
        print('\t{}\n'.format(solution))
