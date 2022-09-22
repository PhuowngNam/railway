DROP DATABASE TestingSystem;
CREATE DATABASE TestingSystem;
USE TestingSystem;
CREATE TABLE Department (
    DepartmentID int NOT NULL AUTO_INCREMENT,
    DepartmentName varchar(255) NOT NULL,
    PRIMARY KEY (DepartmentID)
);
CREATE TABLE Position (
    PositionID int NOT NULL AUTO_INCREMENT,
    PositionName ENUM ('Dev','Test','Scrum Master','PM') unique NOT NULL,
    PRIMARY KEY (PositionID)
);
CREATE TABLE `Account` (
    AccountID int NOT NULL AUTO_INCREMENT,
    Email varchar(255) NOT NULL,
    Username varchar(255) NOT NULL,
	FullName varchar(255) NOT NULL,
    DepartmentID int NOT NULL,
    PositionID int NOT NULL,
    PRIMARY KEY (AccountID),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (PositionID) REFERENCES `Position`(PositionID),
    CreateDate datetime default now()
);
CREATE TABLE `Group` (
    GroupID int NOT NULL AUTO_INCREMENT,
    GroupName varchar(255) NOT NULL,
    CreatorID int NOT NULL,
    CreateDate date,
    PRIMARY KEY (GroupID),
    FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID)
);
CREATE TABLE `GroupAccount` (
    GroupID int NOT NULL,
    AccountID int NOT NULL,
    JoinDate date NOT NULL,
    PRIMARY KEY (GroupID, AccountID),
    FOREIGN KEY (GroupID) REFERENCES `Group`(GroupID),
    FOREIGN KEY (AccountID) REFERENCES `Account`(AccountID)
);
CREATE TABLE `TypeQuestion` (
    TypeID int NOT NULL AUTO_INCREMENT,
    TypeName ENUM ('Essay','Multiple-Choice') NOT NULL,
    PRIMARY KEY (TypeID)
);
CREATE TABLE `CategoryQuestion` (
    CategoryID int NOT NULL AUTO_INCREMENT,
    CategoryName varchar(255),
    PRIMARY KEY (CategoryID)
);
CREATE TABLE `Question` (
    QuestionID int NOT NULL AUTO_INCREMENT,
    Content nvarchar(255) NOT NULL,
    CategoryID int NOT NULL,
    TypeID int NOT NULL,
    CreatorID int NOT NULL,
	CreateDate date,
    PRIMARY KEY (QuestionID),
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY (TypeID) REFERENCES TypeQuestion(TypeID),
    FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID)
);
CREATE TABLE `Answer` (
    AnswerID int NOT NULL AUTO_INCREMENT,
    Content nvarchar(255) NOT NULL,
    QuestionID int NOT NULL,
	isCorrect boolean,
    PRIMARY KEY (AnswerID),
    FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
	ON DELETE CASCADE
    ON UPDATE CASCADE
);
CREATE TABLE `Exam` (
    ExamID int NOT NULL AUTO_INCREMENT,
    `Code` varchar(20) NOT NULL,
    Title varchar(255) NOT NULL,
    CategoryID int NOT NULL,
	Duration int NOT NULL,
    CreatorID int NOT NULL ,
    CreateDate date NOT NULL,
    PRIMARY KEY (ExamID),
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID)
);
CREATE TABLE `ExamQuestion` (
    ExamID int NOT NULL,
    QuestionID int NOT NULL,
    PRIMARY KEY (ExamID,QuestionID),
    FOREIGN KEY (ExamID) REFERENCES `Exam`(ExamID) 
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (QuestionID) REFERENCES `Question`(QuestionID)
	ON DELETE CASCADE
    ON UPDATE CASCADE
);