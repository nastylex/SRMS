package main

import "fmt"

type Student struct {
	ID     int
	Name   string
	Age    int
	Marks  float64
}

var students []Student

func addStudent() {
	var s Student

	fmt.Print("Enter ID: ")
	fmt.Scan(&s.ID)

	fmt.Print("Enter Name: ")
	fmt.Scan(&s.Name)

	fmt.Print("Enter Age: ")
	fmt.Scan(&s.Age)

	fmt.Print("Enter Marks: ")
	fmt.Scan(&s.Marks)

	students = append(students, s)

	fmt.Println("Student added")
}

func displayStudents() {

	fmt.Println("Student Records")

	for _, s := range students {
		fmt.Println("----------------")
		fmt.Println("ID:", s.ID)
		fmt.Println("Name:", s.Name)
		fmt.Println("Age:", s.Age)
		fmt.Println("Marks:", s.Marks)
	}
}

func searchStudent() {

	var id int

	fmt.Print("Enter ID: ")
	fmt.Scan(&id)

	for _, s := range students {

		if s.ID == id {
			fmt.Println("Student Found")
			fmt.Println(s.Name)
			return
		}
	}

	fmt.Println("Student not found")
}

func main() {

	var choice int

	for {

		fmt.Println("\nStudent Management")
		fmt.Println("1. Add")
		fmt.Println("2. Display")
		fmt.Println("3. Search")
		fmt.Println("4. Exit")

		fmt.Print("Choice: ")
		fmt.Scan(&choice)

		switch choice {

		case 1:
			addStudent()

		case 2:
			displayStudents()

		case 3:
			searchStudent()

		case 4:
			fmt.Println("Goodbye")
			return

		default:
			fmt.Println("Invalid choice")
		}
	}
}
