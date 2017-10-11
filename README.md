# MenosC-Compiler
A compiler for LPyPL

We are using Flex and Bison to make a compiler for the MenosC language. 
A subset of the C language.

## Usage

`bison -d -o asin.c asin.y`

`flex -o alex.c alex.l`

`gcc -o analizer alex.c asin.c -lfl`
