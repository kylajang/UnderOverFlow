
CC := g++
LINK_FLAGS := -Wall -pedantic --std=c++17

# Declaring my variables
    PART1_EXE_NAME := lab4-my-program
    PART1_EXE_PATH := ./$(PART1_EXE_NAME)

# Declaring my targets
lol-haxx:	my-program

hello:
	@echo "Hello from your makefile :)"
# Making my-program dependent on PART1_EXE_PATH
my-program:	$(PART1_EXE_PATH)
	$(PART1_EXE_PATH)

$(PART1_EXE_PATH):
	@echo Building $@
# Linking main.cpp
	$(CC) $(LINK_FLAGS) main.cpp -o $@ \
		&& chmod +x $@
