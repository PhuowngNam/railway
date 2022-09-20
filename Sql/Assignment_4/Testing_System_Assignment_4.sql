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