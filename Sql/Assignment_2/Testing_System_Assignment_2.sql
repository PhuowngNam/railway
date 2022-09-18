-- Nhap csdl cho bang Department:
INSERT INTO Department (DepartmentID, DepartmentName) VALUES (1, "CNTT");
INSERT INTO Department (DepartmentID, DepartmentName) VALUES (2, "TDH");
INSERT INTO Department (DepartmentID, DepartmentName) VALUES (3, "GDTX");
INSERT INTO Department (DepartmentID, DepartmentName) VALUES (4, "TDTT");
INSERT INTO Department (DepartmentID, DepartmentName) VALUES (5, "GDMN");
-- 
UPDATE Department SET DepartmentName = 'Marketing' WHERE DepartmentID = 1;
UPDATE Department SET DepartmentName = 'Sale' WHERE DepartmentID = 2;
UPDATE Department SET DepartmentName = 'Bảo vệ' WHERE DepartmentID = 3;
UPDATE Department SET DepartmentName = 'Nhân sự' WHERE DepartmentID = 4;
UPDATE Department SET DepartmentName = 'Kế toán' WHERE DepartmentID = 5;
select * from department;
-- Nhap csdl cho bang Position:
INSERT INTO Position (PositionID, PositionName) VALUES (1, 'Dev');
INSERT INTO Position (PositionID, PositionName) VALUES (2, 'Test');
INSERT INTO Position (PositionID, PositionName) VALUES (3, 'Scrum Master');
INSERT INTO Position (PositionID, PositionName) VALUES (4, 'PM');
INSERT INTO Position (PositionID) VALUES (5);
UPDATE Position SET PositionName = 'Test' WHERE PositionID = 5;
select * from Position;
-- Nhap csdl cho bang Account:
INSERT INTO `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate)
			VALUES (10,'lvq123@gmail.com','tranphong','Le Ba Nam', 2, 5,'2012-02-01');
INSERT INTO `Account` (Email, Username, FullName, DepartmentID, PositionID, CreateDate)
			VALUES ('tranthaonhi@gmail.com','thaonhi','Tran Thao Nhi', 1, 2,'2015-05-08'),
                   ('haonam80@gmail.com','haonam','Tran Hao Nam', 2, 4,'2016-03-02'),
                   ('nguyenhuucanh@gmail.com','nguyencanh93','Nguyen Huu Canh', 3, 1,'2015-02-07'),
                   ('khoinguyen90@gmail.com','caonguyen90','Cao Khoi Nguyen', 4, 5,'2017-10-30'),
                   ('caobang63@gmail.com','caobang63','Cao Thi Bang', 1, 5, '2012-12-28');
select * from `account`;               
select Email, Username from `Account` where CreateDate > '2015-02-01';
DELETE FROM `Account` WHERE AccountID = 1;
-- Nhap csdl cho bang Group:
INSERT INTO `Group` (GroupID, GroupName, CreatorID, CreateDate)
			VALUES (130,'Quản lý', 10,'2012-05-18');
INSERT INTO `Group` (GroupName, CreatorID, CreateDate)
			VALUES ('Đào tạo', 12,'2012-05-18'),
                   ('Xử lý', 11,'2018-01-11'),
                   ('Đánh giá', 14,'2015-10-27'),
                   ('Chia sẻ', 15,'2016-02-21'),
                   ('Hỗ trợ', 13,'2017-11-30');
select * from `Group`;
delete from `Group` where `GroupID` >= 100; 
-- Nhap csdl cho bang GroupAccount:
delete from `GroupAccount` where `GroupID` = 100;
INSERT INTO `GroupAccount` (GroupID, AccountID, JoinDate)
			VALUES (130, 11,'2015-05-12');
INSERT INTO `GroupAccount` (GroupID, AccountID, JoinDate)
			VALUES (135, 12,'2015-05-12'),
                   (131, 10,'2012-09-09'),
                   (132, 14,'2018-12-12'),
                   (133, 15,'2010-02-28'),
                   (134, 13,'2011-01-12');
select * from `GroupAccount`;
-- Nhap csdl cho bang TypeQuestion:
INSERT INTO `TypeQuestion` (TypeID, TypeName)
			VALUES (1111, 'Essay');
INSERT INTO `TypeQuestion` (TypeName)
			VALUES ('Multiple-Choice'),
                   ('Essay'),
                   ('Essay'),
                   ('Multiple-Choice'),
                   ('Multiple-Choice');
select * from `TypeQuestion`;
-- Nhap csdl cho bang CategoryQuestion:
INSERT INTO `CategoryQuestion` (CategoryID, CategoryName)
			VALUES (1, 'Hồi ký');
INSERT INTO `CategoryQuestion` (CategoryName)
			VALUES ('Toán tính'),
                   ('Tích phân'),
                   ('Đạo hàm'),
                   ('Điện ly'),
                   ('Phản ứng');
select * from `CategoryQuestion`;   
-- Nhap csdl cho bang Question:
INSERT INTO `Question` (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES (1,'làm sạch chất bẩn bằng axit', 5, 1111, 10,'2011-09-16');
INSERT INTO `Question` (Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES ('giải phương trình bậc 2 bằng vòng lặp', 2, 1112, 12,'2016-02-10'),
                   ('viết ra các loại vòng lặp và cho ví dụ', 3, 1114, 11,'2017-01-22'),
                   ('giải bài toán này bằng hai cách', 4, 1115, 13,'2018-05-14'),
                   ('vẽ biểu đồ hình cột thể hiện thay đổi tiền tệ từ năm 2010 trở đi', 6, 1113, 14,'2014-11-11'),
                   ('đưa ra lời nhận xét cho bài văn số 28', 1, 1116, 15,'2018-12-02');
select * from `Question`;
-- Nhap csdl cho bang Answer:
INSERT INTO `Answer` (AnswerID, Content, QuestionID, isCorrect)
			VALUES (20,'đây là một câu hỏi khó trả lời', 2, 1);
INSERT INTO `Answer` (Content, QuestionID, isCorrect)
			VALUES ('kết quả bài toán là bằng 2', 3, 0),
                   ('hai người sẽ đi tiếp về phía cây cầu', 4, 1),
                   ('vận tốc của hai xe là bằng nhau', 5, 0),
                   ('nếu dùng một chất mới sẽ có thể tẩy đi nó', 6, 1),
                   ('đây là bài hát khúc quân hành', 1, 1);
select * from `Answer`;      
-- Nhap csdl cho bang Exam:
INSERT INTO `Exam` (ExamID, `Code`, Title, CategoryID, Duration, CreatorID, CreateDate)
			VALUES (10000, 125, 'Thuyết minh tính chất', 1,'2012-10-10', 10,'2012-09-09');
INSERT INTO `Exam` (`Code`, Title, CategoryID, Duration, CreatorID, CreateDate)
			VALUES (126, 'giải phương trình', 2,'2016-03-10', 11,'2016-02-10'),
                   (127, 'tính gia tốc', 4,'2018-11-10', 12,'2018-10-10'),
                   (128, 'đánh giá thực trạng', 5,'2017-08-20', 13,'2017-10-11'),
                   (129, 'thực hành và lý giải', 6,'2018-03-03', 14,'2018-01-03'),
                   (130, 'tính thiết yếu', 3,'2011-12-11', 15,'2012-01-11');
select * from `Exam`;
UPDATE `Exam` SET Duration = '2017-11-20' WHERE ExamID = 10003;         
-- Nhap csdl cho bang ExamQuestion:
INSERT INTO `ExamQuestion` (ExamID, QuestionID)
			VALUES (10002, 2);
INSERT INTO `ExamQuestion` (ExamID, QuestionID)
			VALUES (10003, 4),
                   (10001, 1),
                   (10005, 2),
                   (10004, 5),
                   (10001, 3);
select * from `ExamQuestion`;                  