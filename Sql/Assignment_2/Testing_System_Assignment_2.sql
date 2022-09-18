-- Add data Department:
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
-- Add data Position:
INSERT INTO Position (PositionID, PositionName) VALUES (1, 'Dev');
INSERT INTO Position (PositionID, PositionName) VALUES (2, 'Test');
INSERT INTO Position (PositionID, PositionName) VALUES (3, 'Scrum Master');
INSERT INTO Position (PositionID, PositionName) VALUES (4, 'PM');
INSERT INTO Position (PositionID) VALUES (5);
UPDATE Position SET PositionName = 'Test' WHERE PositionID = 5;
select * from Position;
-- Add data Account:
INSERT INTO `Account` (AccountID, Email, Username, FullName, DepartmentID, PositionID, CreateDate)
			VALUES (1,'lvq123@gmail.com','tranphong','Le Ba Nam', 2, 5,'2012-02-01');
INSERT INTO `Account` (Email, Username, FullName, DepartmentID, PositionID, CreateDate)
			VALUES ('tranthaonhi@gmail.com','thaonhi','Tran Thao Nhi', 1, 2,'2015-05-08'),
                   ('haonam80@gmail.com','haonam','Tran Hao Nam', 2, 4,'2016-03-02'),
                   ('nguyenhuucanh@gmail.com','nguyencanh93','Nguyen Huu Canh', 3, 1,'2015-02-07'),
                   ('khoinguyen90@gmail.com','caonguyen90','Cao Khoi Nguyen', 4, 5,'2017-10-30'),
                   ('caobang63@gmail.com','caobang63','Cao Thi Bang', 1, 5, '2012-12-28');
select * from `account`;               
-- Add data Group:
INSERT INTO `Group` (GroupID, GroupName, CreatorID, CreateDate)
			VALUES (1,'Quản lý', 3,'2012-05-18');
INSERT INTO `Group` (GroupName, CreatorID, CreateDate)
			VALUES ('Đào tạo', 2,'2012-05-18'),
                   ('Xử lý', 1,'2018-01-11'),
                   ('Đánh giá', 4,'2015-10-27'),
                   ('Chia sẻ', 5,'2016-02-21'),
                   ('Hỗ trợ', 6,'2017-11-30');
select * from `Group`;
-- Add data GroupAccount:
INSERT INTO `GroupAccount` (GroupID, AccountID, JoinDate)
			VALUES (1, 2,'2015-05-12');
INSERT INTO `GroupAccount` (GroupID, AccountID, JoinDate)
			VALUES (5, 2,'2015-05-12'),
                   (3, 4,'2012-09-09'),
                   (2, 6,'2018-12-12'),
                   (5, 1,'2010-02-28'),
                   (3, 2,'2011-01-12');
select * from `GroupAccount`;
-- Add data TypeQuestion:
INSERT INTO `TypeQuestion` (TypeID, TypeName)
			VALUES (1, 'Essay');
INSERT INTO `TypeQuestion` (TypeName)
			VALUES ('Multiple-Choice'),
                   ('Essay'),
                   ('Essay'),
                   ('Multiple-Choice'),
                   ('Multiple-Choice');
select * from `TypeQuestion`;
-- Add data CategoryQuestion:
INSERT INTO `CategoryQuestion` (CategoryID, CategoryName)
			VALUES (1, 'Hồi ký');
INSERT INTO `CategoryQuestion` (CategoryName)
			VALUES ('Toán tính'),
                   ('Tích phân'),
                   ('Đạo hàm'),
                   ('Điện ly'),
                   ('Phản ứng');
select * from `CategoryQuestion`;   
-- Add data Question:
INSERT INTO `Question` (QuestionID, Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES (1,'làm sạch chất bẩn bằng axit', 5, 1, 2,'2011-09-16');
INSERT INTO `Question` (Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES ('giải phương trình bậc 2 bằng vòng lặp', 2, 2, 3,'2016-02-10'),
                   ('viết ra các loại vòng lặp và cho ví dụ', 3, 4, 6,'2017-01-22'),
                   ('giải bài toán này bằng hai cách', 4, 5, 3,'2018-05-14'),
                   ('vẽ biểu đồ hình cột thể hiện thay đổi tiền tệ từ năm 2010 trở đi', 6, 3, 4,'2014-11-11'),
                   ('đưa ra lời nhận xét cho bài văn số 28', 1, 6, 5,'2018-12-02');
select * from `Question`;
-- Add data Answer:
INSERT INTO `Answer` (AnswerID, Content, QuestionID, isCorrect)
			VALUES (1,'đây là một câu hỏi khó trả lời', 2, 1);
INSERT INTO `Answer` (Content, QuestionID, isCorrect)
			VALUES ('kết quả bài toán là bằng 2', 3, 0),
                   ('hai người sẽ đi tiếp về phía cây cầu', 4, 1),
                   ('vận tốc của hai xe là bằng nhau', 5, 0),
                   ('nếu dùng một chất mới sẽ có thể tẩy đi nó', 6, 1),
                   ('đây là bài hát khúc quân hành', 1, 1);
select * from `Answer`;      
-- Add data Exam:
INSERT INTO `Exam` (ExamID, `Code`, Title, CategoryID, Duration, CreatorID, CreateDate)
			VALUES (1, 125, 'Thuyết minh tính chất', 1, 60, 1,'2012-09-09');
INSERT INTO `Exam` (`Code`, Title, CategoryID, Duration, CreatorID, CreateDate)
			VALUES (126, 'giải phương trình', 2, 45, 5,'2016-02-10'),
                   (127, 'tính gia tốc', 4, 65, 2,'2018-10-10'),
                   (128, 'đánh giá thực trạng', 5, 45, 3,'2017-10-11'),
                   (129, 'thực hành và lý giải', 6, 50, 4,'2018-01-03'),
                   (130, 'tính thiết yếu', 3, 75, 5,'2012-01-11');
select * from `Exam`;    
-- Add data ExamQuestion:
INSERT INTO `ExamQuestion` (ExamID, QuestionID)
			VALUES (2, 2);
INSERT INTO `ExamQuestion` (ExamID, QuestionID)
			VALUES (3, 4),
                   (1, 5),
                   (5, 2),
                   (4, 5),
                   (1, 3);
select * from `ExamQuestion`;                  