program StudentManagement;

uses crt;

const
  MAX = 50;

type
  Student = record
    id: integer;
    name: string[50];
    age: integer;
    marks: real;
  end;

var
  students: array[1..MAX] of Student;
  count: integer;

procedure AddStudent;
begin
  count := count + 1;
  writeln('Enter student ID:');
  readln(students[count].id);

  writeln('Enter student name:');
  readln(students[count].name);

  writeln('Enter age:');
  readln(students[count].age);

  writeln('Enter marks:');
  readln(students[count].marks);

  writeln('Student added successfully');
end;

procedure DisplayStudents;
var
  i: integer;
begin
  writeln('Student List');
  writeln('------------');

  for i := 1 to count do
  begin
    writeln('ID: ', students[i].id);
    writeln('Name: ', students[i].name);
    writeln('Age: ', students[i].age);
    writeln('Marks: ', students[i].marks:0:2);
    writeln;
  end;
end;

procedure SearchStudent;
var
  searchID, i: integer;
begin
  writeln('Enter ID to search:');
  readln(searchID);

  for i := 1 to count do
  begin
    if students[i].id = searchID then
    begin
      writeln('Student found:');
      writeln(students[i].name);
      exit;
    end;
  end;

  writeln('Student not found');
end;

var
  choice: integer;

begin
  clrscr;
  count := 0;

  repeat
    writeln('1. Add Student');
    writeln('2. Display Students');
    writeln('3. Search Student');
    writeln('4. Exit');

    readln(choice);

    case choice of
      1: AddStudent;
      2: DisplayStudents;
      3: SearchStudent;
    end;

  until choice = 78;

  writeln('Program ended');
  readln;
end.
