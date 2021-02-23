
CC := g++
LINK_FLAGS := -Wall -pedantic --std=c++17

# Declaring my variables
    PART1_EXE_NAME := lab4-my-program
    PART1_EXE_PATH := ./$(PART1_EXE_NAME)

# Declaring my targets
hello:
	@echo "Hello from your makefile :)"
my-program:	$(PART1_EXE_PATH)
	$(PART1_EXE_PATH)

$(PART1_EXE_PATH):
	@echo Building $@

	$(CC) $(LINK_FLAGS) main.cpp -o $@ \
		&& chmod +x $@
