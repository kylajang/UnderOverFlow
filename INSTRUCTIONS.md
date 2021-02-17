
# CPSC 120-10 - Lab 4 - Instructions

This week we're going to work on input, conversion, math, constants, and a bit more GNU Make.

Reminder: I expect meaningful comments on all significant parts of your code, from now on.

## Part 0 - Git Ignore

Knowing that we're not supposed to track compiled+linked executable files in git, you may find it annoying that git keeps asking you to track them.

1. Create a file named *.gitignore* inside your repo.

2. The period at the beginning of this file name may hide it from your view.

    * In terminal, use the *-a* flag with the *ls* command to show all hidden files, like so:

        * ```ls -a```
        * ```ls -la```

    * In your graphical file manager, look for a menu option labeled *Show Hidden Files*, or try pressing *CONTROL+H*.

3. Inside the file, you will place directives to help *git* ignore things you don't wish to track. Place each of the following strings on their own line:

    * lab4-caster
    * lab4-my-program
    * lab4-over-under
    * lab4-pauser

As you'll soon see, these are the names of the executables of four programs we'll be writing today. Placing these names inside a *gitignore* file tells git to, well ... ignore them.

It's important to do this ***before*** anything else. If git begins to track a file before you create your *.gitignore* file, it won't work; You'll have to go through extra steps to purge the file from your repository.

You don't need to take a screenshot or anything for this part: I will grade you on the contents of your *.gitignore* file, and whether git ended up tracking any of your executables.

Reference: [Git Ignore](https://git-scm.com/docs/gitignore)

## Part 1 - Your Own Makefile!

Last week you studied a Makefile and the things it does. This week, you'll make your own basic Makefile to compile your program.

***Hint***: You probably want to look at last week's Lab's Makefile when you get stuck.

### Create Your Program

1. Using a source file named *main.cpp*, create a simple C++ program that does nothing but print the following to the terminal: *Yay it worked!*

### Start Your Makefile

1. Create an empty file called *Makefile* at the root of your local repo.

2. Still inside your Makefile, create a target named *hello*. This target should have no dependencies and contain a single command in the recipe area:

    * ```@echo Hello from your Makefile :)```

3. Run your Makefile with no arguments:

    * ```make```

4. Take a screenshot of what you see and add it to your repository with the name *1_hello.png*.

### Create a my-program Recipe

1. Above any targets, create a variable in your Makefile called *PART1_EXE_NAME*, and assign it to the string *lab4-my-program* (no quotes).

2. Create another variable in your Makefile called *PART1_EXE_PATH*, and assign to it the concatenation of the string *./* and the contents of the *PART1_EXE_NAME* variable.

3. Still inside your Makefile, create a target named *my-program* just below the *hello* target.

4. Give the *my-program* target one dependency: The contents of the *PART1_EXE_PATH* variable. This will cause the *my-program* target to make sure the target named after the contents of the variable *PART1_EXE_PATH* is built/satisfied before continuing.

5. Add one line to the *my-program* target's recipe: A command to execute this lab's executable file. (*Hint*: Yes, the path to this lab's executable file is indeed contained in the *PART1_EXE_PATH* variable).

### Create a Recipe For Your Executable

1. Still inside your Makefile, create a target named after the contents of the *PART1_EXE_PATH* variable. This will be a target that ensures your lab executable is built whenever your main.cpp file changes. We'll refer to this target as "the executable target".

2. Give the executable target one dependency: The *main.cpp* file you created earlier.

3. We'd like this target to announce what it is doing. Add the following command to this target's recipe:

    * ```@echo Building $@```

4. We'd like our recipe to next compile our program. Add another line to the recipe. It will be a one-line command to compile and link your program into an executable:

    1. Use the program *g++* to compile and link your executable.
    2. Give *g++* the argument *-Wall* to enable all warnings.
    3. Also use the argument *-pedantic* to enable pedantic complaints.
    4. Do ***not*** use the *-c* argument, as we will be compiling and linking in one step, without intermediary object files.
    5. Use the following argument to compile+link with the C++ 17 standard: *-std=c++17*
    6. Give the file *main.cpp* as input to the command.
    7. Specify the name of the generated executable file with the *-o* argument. The name of the generated executable file should be the contents of the *$@* variable, which GNU Make exposes for you. This variable expands to whatever the current target name is.

### Execute Your Makefile

1. Execute your Makefile with the simple command ```make``` (no arguments). Take a screenshot of what you see and save it in your repo using the file name *2_first_default_run.png*

2. Did your executable build? Make a new section in your README.md file titled *Default Target Shenanigans*, and explain what you think happened.

3. Execute your Makefile again but with one argument: The *my-program* target. Use the following command:
    * ```make my-program```

4. Take a screenshot of what you see and save it in your repo using the file name *3_specified_the_target.png*

5. Did your program compile and run this time? Explain what you think happened in another section of your README.md file, titled *Specifying the Make Target*. ***Hint***: This step requires your main.cpp program compile+run correctly, so you may wish to repeat this step multiple times if your program needs adjusting.

### Fix Your Makefile

Let's ensure our *my-program* target runs by default in our Makefile.

1. Above the *hello* target, create another target named *lol-haxx*.

2. Give the *lol-haxx* target one dependency: The *my-program* target.

3. Run your Makefile again with no arguments:
    * ```make```

4. Take a screenshot of what you see and save it in your repo using the file name *4_fixed_default.png*

5. Did your program run this time? Explain what you think is going on in a new README.md section titled *Default Target - My Explanation*

6. This time try ```make hello``` just so you can see the original "hello" target still works. It's merely no longer the default.

***Note***: In real life you'd probably want to name your default target something like *default*; Not actually *lol-haxx*.

## Part 2 - Pausing a Program

Next, we're going to learn how to pause a C++ program. There are many use cases for pauses, such as dramatic effect in a console game.

### Setup

We're still getting comfortable with GNU Make, so let's create a brand new program and corresponding GNU Make target for this part.

1. Create a new file called *pauser.cpp* and put the basic structure of a C++ program inside it. Have it print the message *Welcome to the Pauser Program*. This will be the source file for our new program.

2. Make a new variable in your Makefile named *PART2_EXE_NAME* and set it to the value *lab4-pauser*.

3. Make another variable in your Makefile named *PART2_EXE_PATH* and set it to the concatenation of the string *./* and the contents of the *PART2_EXE_NAME* variable.

4. Make a new target named *my-pauser* and have it depend on the contents of the *PART2_EXE_PATH* variable.

5. Does this seem familiar? Look back at Part 1 and you'll realize we're simply creating new entries in your Makefile that help you compile a new program.

6. Create a new target named after the contents of the *PART2_EXE_PATH* variable. Repeat the same basic steps we used to make our executable for part 1. Don't skip any parts from the original.

    1. It should depend on the appropriate source code file(s).
    2. It should output a message to announce what it is doing.
    3. It should use g++ to compile, and use all the same arguments we used last time.
    4. The generated executable should be named after the contents of the PART2_EXE_PATH variable.

7. Test our your new setup by executing the *my-pauser* target with make:

    * ```make my-pauser```

If you're successful, you'll see that the new program compiled. But we still have more to do.

### The Actual Program

Now that we've setup a basic C++ program in *pauser.cpp*, and new targets in our Makefile, we can finish the rest.

Begin editing *pauser.cpp* again, and have it do the following things:

1. Have it print the message: *How many seconds to pause?*

2. Have it grab the user's input to an integer variable.

3. Print the message: *Begin pausing for X seconds*, where *X* is the number of seconds the user originally inputted.

4. Use the following line to make your program pause. It relies on two new libraries that you must include in your program using the #include pre-processor directives: *chrono* and *thread*. 

    * ```std::this_thread::sleep_for(std::chrono::seconds(X))```

5. Note the following for the previous step:

    * X is the number of seconds the user originally inputted
    * Did you notice we're using an object called "seconds", inside a namespace at std::chrono?
    * Did you notice we're using a function called "sleep_for" inside a namespace called "std::this_thread"?
    * These namespaces (std::chrono and std::this_thread) are actually *namespaces inside the std namespace*. We tend to call these *nested namespaces*. The more-fun variant is *namespace-ception!* Or something. *Disclaimer: Immediately forget the term *namespace-ception**.

6. Print the message: *Finished pausing for X seconds*, where *X* is the number of seconds the user originally inputted.

7. Check that your program works.

### Running and Timing Your Program.

The *time* program will time how long another program takes to run. We'll use it to see if your program paused for the correct amount of seconds. You can use the *time* program pretty easily just by pre-pending it to another command. For example:

* ```time make my-pauser```

To get an accurate result, let's not wait for human input this time. We can instead send keystrokes into your program automatically, using the *echo* command, a pipe symbol that your terminal shell will recognize, and a special input stream called *stdin*.

1. Use the following command to run your pauser program with an input of 5 seconds:

* ```echo "5" | time make my-pauser```

2. Check that the *time* program outputs a message that indicates your program did indeed pause for 5 seconds.

3. Take a screenshot of the result and save it as pauser.png in your repo.


## Part 3 - Type Casting

Sometimes you may need to force your program to quickly interpret a variable as a different type. For example, you may have a function that takes a variable of type *double*, but a variable you'd like to send it is just an integer. For this lab, we will use *static casting* to accomplish this.

### Setup

Create a new program and accompanying Makefile rules for this part.

    * Name your source file *caster.cpp*
    * Name the Makefile target that executes this program: *my-caster*
    * Name the executable file *lab4-caster*

### The Program

Have your program do the following:

1. Create four variables: Three of type *int*, and one of type *double*.

2. Ask the user for an integer, and store the user's answer in one of your integer variables.

3. Ask the user for a second integer, and store the user's answer in one of your other integer variables.

4. Divide the first integer by the second integer. ***However***, apply *static casting* to each variable so they appear to be of type *double* with the division expression. Assign the result of the division expression to the third variable you made (the one that is a *double*).

5. Print a nice message to the user that explains then shows the result of your division expression.

6. Assign the number 65 to the third integer variable you made.

7. Print the following message: *Result of coercion of 65 to a char:*

8. Print the static casting of your third integer variable as a char type, to the user.

9. Take a screenshot of the result, name it *type_casting.png*, and save it in your repo.

10. Think about the result you saw with the division part. Add a new section to your README.md file titled *Division With Static Casting* and write your answers to the following questions:

    * Does this result make sense?
    * How would it be different without *casting*?
    * How did *casting* affect the results?

11. Think about the result you saw when you coerced the integer 65 to a character. Add a new section to your README.md file titled *Int to Char Coercion* and write your answers to the following questions:

    * What did the program output?
    * Why didn't the program output the number 65?
    * What did static casting do here?

## Part 4 - Overflow and Underflow

Here we'll look at overflow and underflow for just a second. To make things easy, we'll examine overflow and underflow using unsigned integers Keep in mind all numeric data types behave similarly.

### Setup

Create a new program and accompanying Makefile rules for this part.

    * Name your source file *over_under_flow.cpp*
    * Name the Makefile target that executes this program: *my-over-under*
    * Name the executable file *lab4-over-under*

### The Program

Have your program do the following:

1. Create a variable of type *unsigned int*, with an initial value of 0.

2. Print the message: *Initial value: X*, where *X* is the value of your *unsigned int* variable.

3. Subtract 1 from the variable.

4. Print the message: *After underflow: X* (per usual: your variable is *X*)

5. Add 1 to the variable

6. Print the message: *After overflow: X*

7. Take a screenshot of the results, and save it as *over_under.png* in your repo.

8. Make a new section in your README.md file titled *Overflow and Underflow*, and explain what you think is happening, and why.

## Part 5 - Named Constants

Here we'll look a bit at named constants.

### Setup

Create a new program and accompanying Makefile rules for this part.

    * Name your source file *constants.cpp*
    * Name the Makefile target that executes this program: *my-constants*
    * Name the executable file *lab4-constants*

### The Program

Have your program do the following:

1. Declare a named constant integer with 0 as an initial value.
2. Assign the constant to a different value.

Spoiler! This program will not compile. Take a screenshot of the aftermath and save it as *constants.png* in your repo. Then add a new section to your README.md file titled *Named Constants*. In that new section, answer the following questions:

* Why did your program not compile?

* What is the meaning of the compiler's error message?

* What line and column number does the compiler say the error happens at?


## Part 6 - Multiple GNU Make Targets

Did you know you can tell GNU Make to execute multiple targets at once? Try the following command:

* ```make my-program my-pauser my-caster my-over-under```

(do ***not*** use the *my-constants* target in the above line)

You should see four of your programs execute, one by one. Go ahead and enter input as your programs request. When you're finished, take a screenshot of the results and save it as a file named *multi_make.png* in your repo. You might need to maximize the terminal to see all the output.

### An 'all' Target

Sometimes its convenient to setup a Make target that calls on multiple other targets. In this case, we'd like to make a target that calls your four functioning programs (not the constants program, which doesn't compile). We can name this new target anything we want, but let's name it *all*.

The target name *all* isn't a standard, but is commonly used. It generally means "Do everything that is needed for a complete build".

1. In your Makefile, create a new target named *all*

2. Make the *all* target depend on the following other targets:

    * my-program
    * my-pauser
    * my-caster
    * my-over-under

3. Run the all target with ```make all```, and follow all your program prompts normally.

4. Take a screenshot of the results, and save it as a file named *all.png* in your repo.

Here's something to think about for next time:

* You've created five programs, each with the same g++ command to compile+link.

* What if you had many more programs? What if each program used many many compilation arguments?

* Would it be a huge hassle to write such a command over and over and over again?

* What if you suddenly decided to change the compilation arguments? Would you really want to change all those entries?

* What if we put all of our common arguments inside a GNU Make variable? Would that help?

* Go back to the previous lab and examine the Makefile once again. See if you can spot the usage of Makefile variables within the g++ compilation commands.






