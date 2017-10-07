# MenosC-Compiler
A compiler for LPyPL

We are using Flex and Bison to make a lexical and sytactic 
analyzer

The instruction to run Baison is:

`bison -d -o asin.c asin.y`

The instruction to run Flex is:

`flex -o alex.c alex.l`

The instruction to compile using gcc is:

`gcc -o mianalizador alex.c asin.c -lfl`
