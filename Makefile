
CC := g++
LINK_FLAGS := -Wall -pedantic --std=c++17

# Declaring my variables
	PART1_EXE_NAME := lab4-my-program
	PART1_EXE_PATH := ./$(PART1_EXE_NAME)
	PART2_EXE_NAME := lab4-pauser
	PART2_EXE_PATH := ./$(PART2_EXE_NAME)
	PART3_EXE_NAME := lab4-caster
	PART3_EXE_PATH := ./$(PART3_EXE_NAME)

# Declaring my targets
lol-haxx:	my-program

hello:
	@echo "Hello from your makefile :)"
# Making my-program dependent on PART1_EXE_PATH
my-program:	$(PART1_EXE_PATH)
	$(PART1_EXE_PATH)

$(PART1_EXE_PATH):
# Creating a message to announce what it's doing
	@echo Building $@
# Linking main.cpp
	$(CC) $(LINK_FLAGS) main.cpp -o $@ \
		&& chmod +x $@

my-pauser:	$(PART2_EXE_PATH)
	$(PART2_EXE_PATH)

$(PART2_EXE_PATH):
# Creating a message to announce what it's doing
	@echo Building $@
# Linking pauser.cpp
	$(CC) $(LINK_FLAGS) pauser.cpp -o $@ \
		&& chmod +x $@

# Caster.cpp
my-caster:	$(PART3_EXE_PATH)
	$(PART3_EXE_PATH)
# Linking caster.cpp
$(PART3_EXE_PATH):
	@echo Building $@
	$(CC) $(LINK_FLAGS) caster.cpp -o $@ \
		&& chmod +x $@

