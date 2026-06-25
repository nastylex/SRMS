data class Student(
    val id: Int,
    val name: String,
    val age: Int,
    val marks: Double
) {

    fun display() {
        println("---------------------")
        println("ID: $id")
        println("Name: $name")
        println("Age: $age")
        println("Marks: $marks")
    }
}


val students = mutableListOf<Student>()



fun addStudent() {

    print("Enter Student ID: ")
    val id = readLine()!!.toInt()


    print("Enter Student Name: ")
    val name = readLine()!!


    print("Enter Student Age: ")
    val age = readLine()!!.toInt()


    print("Enter Student Marks: ")
    val marks = readLine()!!.toDouble()



    val student = Student(
        id,
        name,
        age,
        marks
    )


    students.add(student)


    println("Student added successfully")
}





fun displayStudents() {

    println("Student Records")


    if (students.isEmpty()) {

        println("No students available")
        return

    }


    for (student in students) {

        student.display()

    }

}





fun searchStudent() {

    print("Enter Student ID: ")
    val id = readLine()!!.toInt()



    val student = students.find {
        it.id == id
    }



    if (student != null) {

        println("Student Found")
        student.display()

    }
    else {

        println("Student not found")

    }

}





fun deleteStudent() {

    print("Enter Student ID: ")
    val id = readLine()!!.toInt()



    val removed = students.removeIf {
        it.id == id
    }



    if (removed) {

        println("Student deleted")

    }
    else {

        println("Student not found")

    }

}





fun calculateAverage() {

    if (students.isEmpty()) {

        println("No data available")
        return

    }


    val average =
        students.map {
            it.marks
        }.average()



    println(
        "Average Marks: $average"
    )

}





fun main() {


    var choice: Int



    do {


        println()
        println("===== Student Management System =====")
        println("1. Add Student")
        println("2. Display Students")
        println("3. Search Student")
        println("4. Delete Student")
        println("5. Calculate Average")
        println("6. Exit")



        print("Enter choice: ")

        choice = readLine()!!.toInt()



        when(choice) {


            1 -> addStudent()


            2 -> displayStudents()


            3 -> searchStudent()


            4 -> deleteStudent()


            5 -> calculateAverage()


            6 -> println("Program ended")


            else -> println("Invalid choice")

        }



    } while(choice != 6)

}
