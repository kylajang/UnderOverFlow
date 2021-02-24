#include <iostream>

using std::cout;
using std::endl;
using std::cin;

int main ()
{
// Declaring my variables
	int answer1;
	int answer2;
	int third = 65;
	double result;

// Printing questions
	cout << "Please insert the first number. " << endl;
	cin >> answer1;
	cout << "Please insert the second number. " << endl;
	cin >> answer2;

// Dividing the first integer by the second
	result = static_cast<double>(answer1) / static_cast<double>(answer2);
	cout << "Casting both integers to doubles. Result of division = " << result << endl;

// Casting an integer to a character
	cout << "Result of coercion 65 to a char: " << static_cast<char>(third) << endl;

	return 0;

}
