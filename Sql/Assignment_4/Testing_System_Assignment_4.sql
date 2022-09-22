-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ:
select * from `Account`as ac
inner join Department as dt
on ac.DepartmentID = dt.DepartmentID;

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010:
select * from `Account` where CreateDate > '2010-12-20';

-- Question 3: Viết lệnh để lấy ra tất cả các developer:
select * from `Account`as ac
inner join `Position` as ps
on ac.PositionID = ps.PositionID
where PositionName = 'Dev' ;

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên:
select DepartmentName from Department as dt
inner join `Account`as ac
on dt.DepartmentID = ac.DepartmentID
GROUP BY DepartmentName
HAVING count(ac.DepartmentID) > 3;

-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất:
SELECT 
    qs.questionid,
    qs.content,
    COUNT(ex.examid) AS total_exam_use
FROM
    `Question` AS qs
        INNER JOIN
    `Examquestion` AS ex ON qs.QuestionID = ex.QuestionID
GROUP BY ex.QuestionID
HAVING total_exam_use = (SELECT 
        COUNT(examid) AS total_exam_use
    FROM
        `Examquestion`
    GROUP BY QuestionID
    ORDER BY total_exam_use DESC
    LIMIT 1);
    
-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question:
SELECT cq.CategoryID, count(qs.CategoryID) AS `Số câu hỏi sử dụng` FROM `CategoryQuestion` AS cq
LEFT JOIN `Question` AS qs
ON cq.CategoryID = qs.CategoryID
GROUP BY cq.CategoryID
ORDER BY cq.CategoryID;

-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam:
SELECT qs.QuestionID, count(ex.QuestionID) AS `Số Exam sử dụng` FROM `Question` AS qs
LEFT JOIN  `Examquestion` AS ex
ON qs.QuestionID = ex.QuestionID
GROUP BY qs.QuestionID
ORDER BY qs.QuestionID;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất:
select qs.QuestionID, qs.Content as Content_question, aw.Content as content_answer, COUNT(AnswerID) AS total_answer_use from `Question` as qs
inner join `Answer`as aw
on qs.QuestionID = aw.QuestionID
GROUP BY aw.QuestionID
HAVING total_answer_use = (SELECT 
        COUNT(AnswerID) AS total_answer_use
    FROM
        `Answer`
    GROUP BY QuestionID
    ORDER BY total_answer_use DESC
    LIMIT 1);
    
-- Question 9: Thống kê số lượng account trong mỗi group:
    SELECT gr.*, count(ga.AccountID) as total_account FROM `Group` AS gr
    LEFT JOIN `GroupAccount` AS ga
    ON gr.GroupID = ga.GroupID
    GROUP BY gr.GroupID
    ORDER BY gr.GroupID;
    
-- Question 10: Tìm chức vụ có ít người nhất:
    SELECT DISTINCT PositionName, count(ac.PositionID) AS `Số người` FROM `Position` AS ps
    LEFT JOIN `Account` AS ac
    ON ps.PositionID = ac.PositionID
    GROUP BY ps.PositionName 
    ORDER BY `Số người` ASC LIMIT 1;
    
-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM： 
SELECT dp.DepartmentID, dp.DepartmentName, ac.PositionID, ps.PositionName, count(PositionName) AS `Số lượng`
FROM Department AS dp
   LEFT JOIN `Account` AS ac ON dp.DepartmentID = ac.DepartmentID
   INNER JOIN `Position` AS ps ON ps.PositionID = ac.PositionID
   GROUP BY dp.DepartmentID, ps.PositionID;
-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, 
-- loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì,

SELECT qs.QuestionID, qs.Content as 'Câu hỏi', tq.TypeName as 'Loại câu hỏi', ac.FullName as 'Tên người tạo ra câu hỏi' , aw.Content as 'Câu trả lời'
FROM `question` AS qs
   LEFT JOIN `categoryquestion` AS cq ON qs.CategoryID = cq.CategoryID
   INNER JOIN `answer` AS aw ON qs.QuestionID = aw.QuestionID
   INNER JOIN `account` AS ac ON qs.CreatorID = ac.AccountID
   INNER JOIN `typequestion` AS tq ON qs.TypeID = tq.TypeID
   ORDER BY qs.QuestionID asc;
   
-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm:
   SELECT tq.TypeID, tq.TypeName, count(tq.TypeID) as 'Số lượng câu hỏi'
   FROM `typequestion` AS tq 
   INNER JOIN `question` AS qs ON tq.TypeID = qs.TypeID
   group by tq.TypeID;
   
-- Question 14: Lấy ra group không có account nào:
   SELECT gr.GroupID, gr.GroupName, ga.AccountID
   FROM `group` AS gr 
   LEFT JOIN `groupaccount` AS ga ON gr.GroupID = ga.GroupID
   where ga.AccountID is NULL;
   
-- Question 15:Lấy ra group không có account nào:
   with cte_abb as (select GroupID from `groupaccount`) 
   select GroupID, GroupName from `group`
   where GroupID not in (select * from cte_abb);

-- Question 16: Lấy ra question không có answer nào:
   SELECT qs.QuestionID, qs.Content as 'Câu hỏi', aw.Content as 'Câu trả lời'
   FROM `question` AS qs 
   LEFT JOIN `answer` AS aw ON qs.QuestionID = aw.QuestionID
   where aw.QuestionID is NULL;
   
-- Exercise 2: Union
-- Question 17: 
-- a) Lấy các account thuộc nhóm thứ 1
-- b) Lấy các account thuộc nhóm thứ 2
-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
   SELECT ac.AccountID, ac.Email, ac.Username, ac.FullName, ga.GroupID FROM `GroupAccount` AS ga
   INNER JOIN `Account` AS ac
   ON ga.AccountID = ac.AccountID
   WHERE ga.GroupID = 1
   UNION
   SELECT ac.AccountID, ac.Email, ac.Username, ac.FullName, ga.GroupID FROM `GroupAccount` AS ga
   INNER JOIN `Account` AS ac
   ON ga.AccountID = ac.AccountID
   WHERE ga.GroupID = 2;
   
-- Question 18: 
-- a) Lấy các group có lớn hơn 5 thành viên
-- b) Lấy các group có nhỏ hơn 7 thành viên
-- c) Ghép 2 kết quả từ câu a) và câu b)
   SELECT gr.GroupID, gr.GroupName FROM `Group` AS gr
   INNER JOIN `GroupAccount` AS ga
   ON gr.GroupID = ga.GroupID
   GROUP BY gr.GroupID
   HAVING count(ga.AccountID) >5
   UNION ALL
  SELECT gr.GroupID, gr.GroupName FROM `Group` AS gr
   INNER JOIN `GroupAccount` AS ga
   ON gr.GroupID = ga.GroupID
   GROUP BY gr.GroupID
   HAVING count(ga.AccountID) < 7;