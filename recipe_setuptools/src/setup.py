import sys
from distutils.core import setup
from distutils.command.build_clib import build_clib
from distutils.extension import Extension
from Cython.Distutils import build_ext

libhello = ('hello', {'sources': ['hello.c']})

ext_modules=[
    Extension("demo", ["demo.pyx"])
]

def main():
    setup(
        name = 'demo',
        libraries = [libhello],
        cmdclass = {'build_clib': build_clib, 'build_ext': build_ext},
        ext_modules = ext_modules
    )

if __name__ == '__main__':
    main()
