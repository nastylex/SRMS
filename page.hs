module Main where

import Data.List

data Student = Student
    { studentId :: Int
    , studentName :: String
    , studentGrade :: Double
    } deriving (Show)

main :: IO ()
main = do
    putStrLn "================================"
    putStrLn " HASKELL STUDENT MANAGEMENT APP "
    putStrLn "================================"
    menu []

menu :: [Student] -> IO ()
menu students = do
    putStrLn ""
    putStrLn "1. Add Student"
    putStrLn "2. View Students"
    putStrLn "3. Search Student"
    putStrLn "4. Average Grade"
    putStrLn "5. Exit"
    putStrLn ""
    putStr "Choice: "

    choice <- getLine

    case choice of
        "1" -> do
            updated <- addStudent students
            menu updated

        "2" -> do
            viewStudents students
            menu students

        "3" -> do
            searchStudent students
            menu students

        "4" -> do
            averageGrade students
            menu students

        "5" -> putStrLn "Goodbye!"

        _ -> do
            putStrLn "Invalid option."
            menu students

addStudent :: [Student] -> IO [Student]
addStudent students = do
    putStr "Student ID: "
    sid <- getLine

    putStr "Student Name: "
    sname <- getLine

    putStr "Student Grade: "
    sgrade <- getLine

    let student =
            Student
                (read sid)
                sname
                (read sgrade)

    putStrLn "Student added."

    return (students ++ [student])

viewStudents :: [Student] -> IO ()
viewStudents [] =
    putStrLn "No students found."

viewStudents students =
    mapM_ printStudent students

printStudent :: Student -> IO ()
printStudent student = do
    putStrLn "----------------------"
    putStrLn ("ID: " ++ show (studentId student))
    putStrLn ("Name: " ++ studentName student)
    putStrLn ("Grade: " ++ show (studentGrade student))

searchStudent :: [Student] -> IO ()
searchStudent students = do
    putStr "Enter student ID: "
    sid <- getLine

    let result =
            find
                (\s -> studentId s == read sid)
                students

    case result of
        Just s -> do
            putStrLn "Student found:"
            printStudent s

        Nothing ->
            putStrLn "Student not found."

averageGrade :: [Student] -> IO ()
averageGrade [] =
    putStrLn "No grades available."

averageGrade students = do
    let total =
            sum
                (map studentGrade students)

    let avg =
            total /
            fromIntegral (length students)

    putStrLn
        ("Average Grade: "
        ++ show avg)
