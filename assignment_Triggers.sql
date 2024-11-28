use entri_d42;

CREATE TABLE teachers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    subject VARCHAR(50) NOT NULL,
    experience INT NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);

INSERT INTO teachers (name, subject, experience, salary) VALUES
('Alice Johnson', 'Mathematics', 5, 50000),
('Bob Smith', 'Science', 8, 55000),
('Carol Taylor', 'English', 3, 45000),
('David Brown', 'History', 12, 60000),
('Eve Wilson', 'Physics', 10, 58000),
('Frank Thomas', 'Biology', 2, 40000),
('Grace Lee', 'Chemistry', 7, 52000),
('Henry Martin', 'Computer Science', 9, 57000);

select * from teachers;

CREATE TABLE teacher_log (
    id INT PRIMARY KEY AUTO_INCREMENT,
    teacher_id INT NOT NULL,
    action VARCHAR(50) NOT NULL,
    timestamp DATETIME NOT NULL
);

-- before_insert_teacher
DELIMITER $$

CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END $$

DELIMITER ;

-- after_insert_teacher
DELIMITER $$

CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (NEW.id, 'INSERT', NOW());
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Cannot delete a teacher with more than 10 years of experience';
    END IF;
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (OLD.id, 'DELETE', NOW());
END $$

DELIMITER ;


