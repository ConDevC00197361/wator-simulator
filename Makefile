LIBS=-lsfml-graphics -lsfml-window -lsfml-system
DOXYGEN = doxygen

all: run

run:wator-simulation
	$(DOXYGEN) Doxyfile
	./wator-simulation
	gprof wator-simulation

main.o: main.cpp
	g++ -c "main.cpp" -o main.o #-fopenmp

wator.o: wator.cpp
	g++ -c "wator.cpp" -o wator.o #-fopenmp

swimmer.o: swimmer.cpp
	g++ -c "swimmer.cpp" -o swimmer.o

wator-simulation: main.o wator.o swimmer.o
	@echo "** Building the game Wator Simulation"
	g++ -g -Wall -o wator-simulation main.o wator.o swimmer.o $(LIBS) #-fopenmp

clean:
	@echo "** Removing object files and executable..."
	rm -f *.o



.PHONY: all clean
