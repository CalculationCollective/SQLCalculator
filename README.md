# SQLCalculator

- [SQLCalculator](#aqlcalculator)
    - [Introduction](#introduction)
    - [Installing SQLite](#installing-sqlite)
    - [Execute the calculator](#execute-the-calculator)
    - [Use the calculator](#use-the-calculator)

## Introduction
This SQL calculator was created for the SQLite dialect and works by utilising triggers.

## Installing SQLite
You can download precompiled versions of sqlite from the [official website](https://www.sqlite.org/download.html).

## Execute the calculator
To set-up the calculator you will need to run the sql script (`SQLCalculator.sql`) on an `.sqlite` file.
```bash
sqlite3 database_file.sqlite # open your sqlite database
.read SQLCalculator.sql # inside the sqlite terminal you can run the sql script
```

## Use the calculator
The calculator is used via the INSERT command. First open your `.sqlite` file in sqlite. Then enter the INSERT command. After that you can user a SELECT statement to view the result of the calculation.
```bash
sqlite3 database_file.sqlite # open your sqlite database.
INSERT INTO Calculations(Num1, CalculationType, Num2) VALUES (1, '+', 1); # insert your calculation
SELECT Result FROM Calculations WHERE Id = (SELECT MAX(Id) FROM Calculations); # view the result of your calculation (result will be 2.0 for this calculation)
```
