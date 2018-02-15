CXX=clang++
CXXFLAGS=-std=c++11 -O2 -fPIC -g -Wall -fsanitize=address
LDFLAGS="-Wl,-rpath,."
AR=ar

all: main

constants.o: constants.cpp
	${CXX} -o constants.o -c constants.cpp ${CXXFLAGS}

constants.a: constants.o
	${AR} cr constants.a constants.o

constants.so: constants.a
	${CXX} -shared -o constants.so -Wl,--no-whole-archive constants.a -Wl,--no-whole-archive ${CXXFLAGS} ${LDFLAGS}

main.o: main.cpp
	${CXX} -o main.o -c main.cpp ${CXXFLAGS}

main: main.o constants.a constants.so
	${CXX} -o main main.o -Wl,--no-whole-archive constants.a -Wl,--no-whole-archive constants.so ${CXXFLAGS} ${LDFLAGS}

clean:
	rm -f constants.o constants.a constants.so main.o main 

.PHONY: all clean
