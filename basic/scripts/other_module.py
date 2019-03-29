#!/usr/bin/python3
# code made by [You](https://github.com/@you), YYYY.

print('Running other_module.py ...')

# Import config
import os
import sys
sys.path.insert(0, '../')
from config import RAW_PATH, TREAT_PATH, OUTPUT_PATH

def get_me():
    print('hi!')
    
if __name__ == '__main__':
    
    # This is executed you run via terminal

    print('I\'m in terminal! - other_module.py')

print('Done!')
