#!/bin/bash

students_file="students.txt"

create_file()
{
    if [ ! -f $students_file ]
    then
        touch $students_file
    fi
}

add_student()
{
    echo "Enter Student ID:"
    read id

    echo "Enter Student Name:"
    read name

    echo "Enter Age:"
    read age

    echo "Enter Marks:"
    read marks

    echo "$id,$name,$age,$marks" >> $students_file

    echo "Student added successfully"
}

display_students()
{
    echo "Student Records"
    echo "---------------"

    while IFS=',' read id name age marks
    do
        echo "ID: $id"
        echo "Name: $name"
        echo "Age: $age"
        echo "Marks: $marks"
        echo "-------------"
    done < $students_file
}

search_student()
{
    echo "Enter Student ID:"
    read sid

    result=$(grep "^$sid," $students_file)

    if [ -z "$result" ]
    then
        echo "Student not found"
    else
        echo "Student Found"
        echo $result
    fi
}

delete_students()
{
    > $students_file
    echo "All records deleted"
}


create_file

while true
do

echo ""
echo "Student Management System"
echo "1. Add Student"
echo "2. Display Students"
echo "3. Search Student"
echo "4. Delete Records"
echo "5. Exit"

echo "Enter choice:"
read choice

case $choice in

1)
add_student
;;

2)
display_students
;;

3)
search_student
;;

4)
delete_students
;;

5)
echo "Program terminated"
exit
;;

*)
echo "Invalid option"
;;

esac

done
