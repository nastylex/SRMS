class Student {

    id: number;
    name: string;
    age: number;
    marks: number;


    constructor(
        id: number,
        name: string,
        age: number,
        marks: number
    ) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.marks = marks;
    }


    display(): void {

        console.log("---------------------");
        console.log("ID:", this.id);
        console.log("Name:", this.name);
        console.log("Age:", this.age);
        console.log("Marks:", this.marks);

    }
}



let students: Student[] = [];



function addStudent(
    id: number,
    name: string,
    age: number,
    marks: number
): void {

    let student = new Student(
        id,
        name,
        age,
        marks
    );


    students.push(student);


    console.log(
        "Student added successfully"
    );
}




function displayStudents(): void {

    console.log(
        "Student Records"
    );


    if (students.length === 0) {

        console.log(
            "No students found"
        );

        return;
    }


    for (let student of students) {

        student.display();

    }

}





function searchStudent(
    id: number
): void {


    let student = students.find(
        s => s.id === id
    );


    if (student) {

        console.log(
            "Student Found"
        );

        student.display();

    }
    else {

        console.log(
            "Student not found"
        );

    }

}





function deleteStudent(
    id: number
): void {


    let index = students.findIndex(
        s => s.id === id
    );


    if (index !== -1) {

        students.splice(
            index,
            1
        );


        console.log(
            "Student deleted"
        );

    }
    else {

        console.log(
            "Student not found"
        );

    }

}





function calculateAverage(): number {


    if (students.length === 0) {

        return 0;

    }


    let total: number = 0;


    students.forEach(
        student => {

            total += student.marks;

        }
    );


    return total / students.length;

}





function main(): void {


    addStudent(
        1,
        "John",
        20,
        85
    );


    addStudent(
        2,
        "Mary",
        21,
        90
    );


    addStudent(
        3,
        "David",
        19,
        75
    );



    displayStudents();



    searchStudent(2);



    deleteStudent(1);



    console.log(
        "Average Marks:",
        calculateAverage()
    );



    displayStudents();


}



main();
