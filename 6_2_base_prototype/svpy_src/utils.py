#> utils.py
#   - Just useful stuff

from svpy import svwrite

def write_list(iterator, func):
    for i in iterator:
        svwrite(func(i))