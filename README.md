# Lab Week 4 Submission

My submission for CPSC 120-10, Lab Week 4

# My Information

* Name: Kyla Jang
* CWID: 888078243
* Email: kylajang@csu.fullerton.edu

# Specifying The Make Target

The program didn't run and compile the my-program target at first because when we type "make" it will only compile the first target. However, if we specify which target to make, it will run and compile that specific target we chose.

# Default Target - My Explanation

Yes, my program ran this time because we set the lol-haxx target to be dependent upon the my-program target. Since lol-haxx is the first target declared, we can type "make" with no arguments and still have my-program execute and compile.

# Division With Static Casting
	* Yes, this result makes sense because after I input my two integers 1 & 3, 1divided by three does indeed equal 0.33333.
	* It would be different without casting because my result would be rounded down to the nearest whole number.
	* Casting affected the results because it allows the result to be more accurate.
	
# Int to Char Coercion
	* The program outputted the capital letter A.
	* It didn't output the number 65 because when we assigned our variable to 65, the character that's assigned to the number 65 is A.
	* Static casting allowed the integer variable to appear as type char.
	
# Overflow and Underflow
	* I think what is happening here is that when I subtract 1 from my intial value of 0 and get a large number as a result, this number is actually my maximum value due to underflow. Therefore when I add 1 back to my unsigned integer, it reverts back the initial value of 0 because of overflow.



