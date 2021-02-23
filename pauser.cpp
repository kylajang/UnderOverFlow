#include <iostream>
#include <string>
#include <chrono>
#include <thread>

using std::cout;
using std::string;
using std::endl;
using std::cin;

int main ()
{

// Declaring my variables
    int user_input;

// Printing the welcome message
    cout << "Welcome to the Pauser Program.";
    cout << " How many seconds to pause? ";
    cin >> user_input;

// Beginning the user_input pause
    cout << "Begin pausing for " << user_input << " seconds." << endl;

// Finishing the pause
    std::this_thread::sleep_for(std::chrono::seconds(user_input));
    cout << "Finished pausing for " << user_input << " seconds." << endl;

    return 0;
}
