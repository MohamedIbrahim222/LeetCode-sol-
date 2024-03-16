select s.student_id, 
s.student_name,
sub.subject_name,
count(e.subject_name) as attended_exams
from Students s
cross join Subjects sub
left join Examinations e using (student_id,subject_name)
GROUP BY s.student_id, sub.subject_name
order by s.student_id , sub.subject_name
