#include <iostream>
using std::cout;
using std::endl;
using std::cin;

int main ()
{
// Assigning my variables
  unsigned int a = 0;


// Printing the inital message
  cout << "Initial Value: " << a << endl;

// Subtracting 1 from variable a
  a = a - 1;
  cout << "After underflow: " << a << endl;

// Adding 1 to variable a
  a = a + 1;
  cout << "After overflow: " << a << endl;
  return 0;
}
