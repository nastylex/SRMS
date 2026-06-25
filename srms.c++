#include <iostream>
#include <vector>
#include <string>

using namespace std;

class Student {
public:
    int id;
    string name;
    int age;
    string course;
    float grade;

    Student(int i, string n, int a, string c, float g) {
        id = i;
        name = n;
        age = a;
        course = c;
        grade = g;
    }
};

vector<Student> students;

void addStudent() {
    int id, age;
    string name, course;
    float grade;

    cout << "\nStudent ID: ";
    cin >> id;

    cin.ignore();

    cout << "Name: ";
    getline(cin, name);

    cout << "Age: ";
    cin >> age;

    cin.ignore();

    cout << "Course: ";
    getline(cin, course);

    cout << "Grade: ";
    cin >> grade;

    students.push_back(Student(id, name, age, course, grade));

    cout << "Student added successfully!\n";
}

void viewStudents() {
    cout << "\n--- Student Records ---\n";

    for (const auto& s : students) {
        cout << "ID: " << s.id
             << "\nName: " << s.name
             << "\nAge: " << s.age
             << "\nCourse: " << s.course
             << "\nGrade: " << s.grade
             << "\n----------------------\n";
    }
}

void searchStudent() {
    int id;
    cout << "\nEnter Student ID: ";
    cin >> id;

    for (const auto& s : students) {
        if (s.id == id) {
            cout << "\nFound Student:\n";
            cout << s.name << " - " << s.course << endl;
            return;
        }
    }

    cout << "Student not found.\n";
}

void calculateAverage() {
    if (students.empty()) {
        cout << "No students available.\n";
        return;
    }

    float total = 0;

    for (const auto& s : students) {
        total += s.grade;
    }

    cout << "Average Grade: "
         << total / students.size() << endl;
}

int main() {
    int choice;

    do {
        cout << "\n===== STUDENT MANAGEMENT SYSTEM =====\n";
        cout << "1. Add Student\n";
        cout << "2. View Students\n";
        cout << "3. Search Student\n";
        cout << "4. Calculate Average Grade\n";
        cout << "5. Exit\n";
        cout << "Choice: ";
        cin >> choice;

        switch(choice) {
            case 1:
                addStudent();
                break;
            case 2:
                viewStudents();
                break;
            case 3:
                searchStudent();
                break;
            case 4:
                calculateAverage();
                break;
            case 5:
                cout << "Goodbye!\n";
                break;
            default:
                cout << "Invalid choice.\n";
        }

    } while(choice != 5);

    return 0;
}
