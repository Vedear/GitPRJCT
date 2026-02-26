#include <iostream>
#include <iomanip>
using namespace std;

struct Date
{
    int day;
    int month;
    int year;
};

int main() {
    puts("Hello");
    Date date;
    cout << setfill('0');
    date = { 31, 12, 2025 };
    cout << setw(2) << date.day << '/' << date.month << '/' << date.year << endl;
    return 0;
}
