DROP TABLE IF EXISTS Calculations;
CREATE TABLE Calculations(Id INTEGER PRIMARY KEY, Num1 REAL, CalculationType CHAR, Num2 REAL, Result REAL);

CREATE TRIGGER IF NOT EXISTS addition AFTER INSERT ON Calculations
WHEN NEW.CalculationType == '+'
BEGIN
    UPDATE Calculations
    SET Result = NEW.Num1 + NEW.Num2
    WHERE Id = (SELECT MAX(Id) FROM Calculations);
END;

CREATE TRIGGER IF NOT EXISTS subtraction AFTER INSERT ON Calculations
WHEN NEW.CalculationType == '-'
BEGIN
    UPDATE Calculations
    SET Result = NEW.Num1 - NEW.Num2
    WHERE Id = (SELECT MAX(Id) FROM Calculations);
END;

CREATE TRIGGER IF NOT EXISTS multiplication AFTER INSERT ON Calculations
WHEN NEW.CalculationType == '*'
BEGIN
    UPDATE Calculations
    SET Result = NEW.Num1 * NEW.Num2
    WHERE Id = (SELECT MAX(Id) FROM Calculations);
END;

CREATE TRIGGER IF NOT EXISTS division AFTER INSERT ON Calculations
WHEN NEW.CalculationType == '/'
BEGIN
    UPDATE Calculations
    SET Result = NEW.Num1 / NEW.Num2
    WHERE Id = (SELECT MAX(Id) FROM Calculations);
END;
