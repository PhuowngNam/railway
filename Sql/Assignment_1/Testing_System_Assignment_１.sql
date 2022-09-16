
create database TestingSystem;
CREATE TABLE Department (
    DepartmentID int NOT NULL AUTO_INCREMENT,
    DepartmentName varchar(255) NOT NULL,
    PRIMARY KEY (DepartmentID)
);
CREATE TABLE Position (
    PositionID int NOT NULL AUTO_INCREMENT,
    PositionName ENUM ('Dev','Test','Scrum Master','PM') NOT NULL,
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
    CreateDate date NOT NULL
);
CREATE TABLE `Group` (
    GroupID int NOT NULL AUTO_INCREMENT,
    GroupName varchar(255) NOT NULL,
    CreatorID int NOT NULL UNIQUE,
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
    FOREIGN KEY (TypeID) REFERENCES TypeQuestion(TypeID)
);
CREATE TABLE `Answer` (
    AnswerID int NOT NULL AUTO_INCREMENT,
    Content nvarchar(255) NOT NULL,
    QuestionID int NOT NULL,
	isCorrect boolean,
    PRIMARY KEY (AnswerID),
    FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);
CREATE TABLE `Exam` (
    ExamID int NOT NULL AUTO_INCREMENT,
    `Code` int NOT NULL,
    Title varchar(255) NOT NULL,
    CategoryID int NOT NULL UNIQUE,
	Duration date NOT NULL,
    CreatorID int NOT NULL ,
    CreateDate date NOT NULL,
    PRIMARY KEY (ExamID)
);
CREATE TABLE `ExamQuestion` (
    ExamID int NOT NULL,
    QuestionID int NOT NULL,
    FOREIGN KEY (ExamID) REFERENCES `Exam`(ExamID),
    FOREIGN KEY (QuestionID) REFERENCES `Question`(QuestionID)
);