#basic makefile
compile:
	gcc -c -fpic digit.c
	gcc -shared -o libcore.so digit.o
