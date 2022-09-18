-- Add data Department:
INSERT INTO Department (DepartmentName) 
			    VALUES ('Kỹ thuật'),
                       ('Tổng hợp'),
                       ('Điều tra'),
                       ('Xử lý'),
                       ('Tài chinh'),
                       ('Giám đốc'),
                       ('Phó giám đốc'),
                       ('Thư ký'),
                       ('Bán hàng'),
                       ('Môi trường');
select * from department;
-- Add data Position:
INSERT INTO Position (PositionName)
				VALUES ('Dev'),
						('Scrum Master'),
						('Test'),
						('Dev'),
						('Scrum Master'),
						('PM'),
						('Dev'),
						('PM'),
						('Scrum Master'),
						('Dev');
select * from Position;
-- Add data Account:
INSERT INTO `Account` (Email, Username, FullName, DepartmentID, PositionID, CreateDate)
			VALUES ('maimai82@gmail.com','maimai','Le Nhan', 5, 2,'2019-08-03'),
                   ('luhanh@gmail.com','lulu','Nguyen Thi Thanh', 2, 4,'2013-03-03'),
                   ('dhv@gmail.com','daivinh','Nguyen Tran Dai Vinh', 3, 1,'2016-01-04'),
                   ('batdiet@gmail.com','batdiet123','Kha Ai Nhu', 4, 5,'2010-12-31'),
                   ('lahantu@gmail.com','thanhvinh','Le Thanh Vinh', 1, 5, '2011-12-05'),
                   ('ainhu02@gmail.com','hanhthong','Ba Dinh Thong', 1, 9,'2018-09-07'),
                   ('tranhanhi082@gmail.com','hanhi','Tran Ha Nhi', 8, 5,'2015-04-04'),
                   ('ngodinhnam@gmail.com','dinhnam','Ngo Dinh Nam', 7, 4,'2011-11-30'),
                   ('mongmo@gmail.com','mongmo23','Ngo Thi Dao', 6, 1,'2017-06-03'),
                   ('honghanh96@gmail.com','honghanh96','Luong Hong Hanh', 1, 3, '2019-02-09');
select * from `account`;             
-- Add data Group:
INSERT INTO `Group` (GroupName, CreatorID, CreateDate)
			VALUES ('Môi trường sạch', 7,'2011-01-11'),
                   ('Điều chỉnh', 9,'2013-03-16'),
                   ('Gặt hái', 8,'2014-12-25'),
                   ('Điều động', 15,'2016-08-01'),
                   ('Ban hành', 16,'2018-11-02'),
				   ('Thể lệ', 11,'2015-01-11'),
                   ('Không gian', 12,'2016-10-21'),
                   ('Năng suất', 13,'2015-09-02'),
                   ('Phát triển', 14,'2015-05-06'),
                   ('Hành động', 10,'2012-12-04');
select * from `Group`;
-- Add data GroupAccount:
INSERT INTO `GroupAccount` (GroupID, AccountID, JoinDate)
			VALUES (16, 12,'2018-03-11'),
                   (11, 13,'2012-02-02'),
                   (15, 10,'2014-05-11'),
                   (9, 12,'2013-05-21'),
                   (7, 9,'2014-03-18'),
				   (10, 6,'2016-08-07'),
                   (8, 16,'2017-02-12'),
                   (13, 3,'2016-01-26'),
                   (12, 4,'2013-02-18'),
                   (14, 10,'2018-03-29');
select * from `GroupAccount`;
-- Add data TypeQuestion:
INSERT INTO `TypeQuestion` (TypeName)
			VALUES ('Multiple-Choice'),
                   ('Essay'),
                   ('Multiple-Choice'),
                   ('Multiple-Choice'),
                   ('Essay'),
                   ('Multiple-Choice'),
                   ('Essay'),
                   ('Multiple-Choice'),
                   ('Multiple-Choice'),
                   ('Essay');
select * from `TypeQuestion`;
-- Add data CategoryQuestion:
INSERT INTO `CategoryQuestion` (CategoryName)
			VALUES ('Đại số tuyến tính'),
                   ('Khả năng tạo thành'),
                   ('Điện ly phân cực'),
                   ('Đảo chiều hai cực'),
                   ('Đảo chiều'),
                   ('Thực tiễn ứng dụng'),
                   ('Khả thi bài toán'),
                   ('lý giải'),
                   ('Thứ tự hành động'),
                   ('Phân tích lý thuyết');
select * from `CategoryQuestion`;   
-- Add data Question:
INSERT INTO `Question` (Content, CategoryID, TypeID, CreatorID, CreateDate)
			VALUES ('liệu bài toán thứ 2 có khả thi', 16, 8, 5,'2018-01-11'),
                   ('hãy đánh giá sự tác động của hai nhân vật', 13, 11, 16,'2019-03-28'),
                   ('mô phỏng quy trình thực hiện nội dung', 14, 12, 4,'2012-02-13'),
                   ('thay đổi tư duy hành động thực tiễn và đưa ra kết quả', 13, 10, 12,'2011-10-10'),
                   ('ai đặt tên dòng sông và dòng sông tên gì', 10, 9, 2,'2017-11-06'),
                   ('đo cự ly và giải bài toán đúng sau đó đưa ra nhận xét', 15, 7, 14,'2015-01-26'),
                   ('hãy cho vào hai qua cam và sau đó tính toán', 13, 14, 1,'2018-07-07'),
                   ('đưa ra giá trị hợp lý của kết quả bài toán', 11, 1, 7,'2014-09-19'),
                   ('so sánh sự khác nhau giữa hai trường hợp', 12, 15, 11,'2018-12-11'),
                   ('nhận xét kết thúc của bài xem đó là đúng hay sai', 15, 6, 2,'2016-10-05');
select * from `Question`;
-- Add data Answer:
INSERT INTO `Answer` (Content, QuestionID, isCorrect)
			VALUES ('câu trả lời nằm trong bài toán', 13, 0),
                   ('hai người sẽ đó sẽ làm chúng', 14, 1),
                   ('sự kế thừa sẽ có sự thay đổi', 15, 0),
                   ('kết quả đưa ra là bằng chín', 16, 1),
                   ('hai giá trị không đổi', 11, 0),
                   ('một cộng một sẽ bằng hai hoặc cũng có thể bằng một', 12, 1),
                   ('gia tốc không đổi', 9, 0),
                   ('hai quả cam không còn trong giỏ', 10, 0),
                   ('bài toán đưa ra kết quả là tốc độ bằng nhau', 8, 1),
                   ('đây không phải ca khúc thiếu nhi', 7, 1);
select * from `Answer`;
-- Add data Exam:
INSERT INTO `Exam` (`Code`, Title, CategoryID, Duration, CreatorID, CreateDate)
			VALUES (131, 'so sánh giá trị', 12, 60, 9,'2012-03-12'),
                   (132, 'bôi trơn giảm xóc', 14, 50, 1,'2019-12-18'),
                   (133, 'không gian hai chiều', 15, 45, 8,'2016-11-19'),
                   (134, 'đọc giá trị hàm', 16, 30, 4,'2014-06-02'),
                   (135, 'nén thể tích', 13, 120, 10,'2016-12-30'),
                   (136, 'thực thể toán tính', 10, 15, 13,'2012-01-01'),
                   (137, 'đổi chiều dòng điện', 11, 45, 15,'2013-12-11'),
                   (138, 'không gian cực đại', 7, 60, 7,'2019-12-25'),
                   (139, 'phát triển của dòng điện', 6, 50, 16,'2018-11-05'),
                   (140, 'sự bay màu của chất', 16, 120, 1,'2015-12-27');
select * from `Exam`;
-- Add data ExamQuestion:
INSERT INTO `ExamQuestion` (ExamID, QuestionID)
			VALUES (16, 14),
                   (11, 1),
                   (15, 12),
                   (4, 15),
                   (2, 13),
                   (6, 16),
                   (13, 7),
                   (8, 9),
                   (10, 9),
                   (12, 10);
select * from `ExamQuestion`;

-- Question 2: lấy ra tất cả các phòng ban:
select DepartmentName from department;

-- Question 3: lấy ra id của phòng ban "Sale":
select DepartmentID from department where DepartmentName ='Sale';

-- Question 4: lấy ra thông tin account có full name dài nhất:
select * from `Account`;
select * from `Account` order by LENGTH(FullName) desc LIMIT 1;

-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3:
SELECT * FROM `Account`
WHERE DepartmentID = 3
ORDER BY LENGTH(FullName) DESC LIMIT 1;

-- Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019:
select * from `Group`;
select GroupName as `Name` from `group` where CreateDate < '2019-12-20';
 
-- Question 7: Lấy ra ID của question có >= 4 câu trả lời:
select * from `Question`;
select sum(QuestionID) >= 4 as ID from `Answer`;

-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày　20/12/2019:
select * from `Exam`;
select Code as `Mã đề thi`from `Exam` where Duration >= 60 and CreateDate < '2019-12-20';

-- Question 9: Lấy ra 5 group được tạo gần đây nhất:
select * from `Group`;
select * from `Group` order by CreateDate desc LIMIT 5;

-- Question 10: Đếm số nhân viên thuộc department có id = 2:
select * from `Account`;
select count(DepartmentID) as `Số nhân viên thuộc department có id = 2` from `Account` where DepartmentID = 2;

-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o":
SELECT * FROM `Account` WHERE FullName LIKE 'D%o';

-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019:
/*select * from `Exam`;
Delete from `Exam` where ExamId = 10006
ALTER TABLE ExamQuestion add check FOREIGN KEY (ExamID) REFERENCES `Exam`(ExamID) ON DELETE CASCADE;*/

-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi":
Delete from `Question` Where Content LIKE 'Câu hỏi%';

-- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn:
select * from `Account`;
Update `Account` Set FullName = 'Nguyễn Bá Lộc', Email = 'loc.nguyenba@vti.com.vn' Where AccountID = 5;

-- Question 15: update account có id = 5 sẽ thuộc group có id = 4:
select * from `Group`;
Update `Group` Set CreatorID = 5 Where GroupID = 4;