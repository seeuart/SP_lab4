CXX           := clang++
CXXFLAGS      := -Wall -Wextra -pedantic -std=c++17 -g -c -o
EXECUTABLE    := calculator

BUILDDIR      := build
SOURCES       := $(wildcard *.cpp)
OBJECTS       := $(patsubst %,$(BUILDDIR)/%,${SOURCES:.cpp=.o})

.DEFAULT_GOAL := default
.PHONY: prepare clean bin all run

prepare:
	mkdir -p $(BUILDDIR)

$(BUILDDIR)/%.o: %.cpp
	$(CXX) $(CXXFLAGS) $@ $< -MMD -MF ./$@.d

$(EXECUTABLE) : $(OBJECTS)
	$(CXX) -o $@ $^

clean:						## cleans up project folder
	rm -f $(EXECUTABLE)
	rm -rf ./$(BUILDDIR)

bin: prepare $(EXECUTABLE)	## compiles project to executable binary
	chmod +x $(EXECUTABLE)

all: clean bin				## all of the above

run: all					## runs the project with default config
	./$(EXECUTABLE)

-include $(wildcard *.d)