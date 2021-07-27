/************************************************************
Name: Answers and scripts to CU Questions

Created By: Scott Wilson

Created on: 7/26/2021-7/27/2021

Additional Notes: I started by looking at a few
python examples online(I did not save these resources)
and got started in python. However, after trying to run the python script in 
the python environment and using a few online resources to help 
run the script eventually from the command line which created a db 
student_major.db file added to git
I decided given my experience to perform everything in a SQL environment.

I started by creating a schema in an existing mysql 
environment I had on my personal computer. Once the 
schema was created I pulled the sql statements in the python 
script out and ran them in my new schema. Once this was complete
I inserted the new student record using:

insert into student values('7','Scott','Wilson','1989-07-15');

I have also added the logic to the original python file 
with comments to show I knew where to put it. I had to lookup
how to do comments in python I used 
https://www.digitalocean.com/community/tutorials/how-to-write-comments-in-python-3
 as a resource to do so.
 
I will add all of the outputs to the scripts to the git repository in addition
to the code below

*************************************************************/


/*Question One:

 What students by first name, last name, and major name 
 sorted alphabetically by last name 
 have majors from the Engineering or Language Arts departments?

*/
select s.first_name
	,s.last_name
    ,m.major_name
from student s
left join student_major sm on sm.student_id=s.id
left join major m on m.id=sm.major_id
left join department d on d.id=m.department_id
where d.department_name in ('Language Arts','Engineering')
order by s.last_name asc;



/*Question Two:
How many students are there per major and major department?

*/
select   m.major_name,  d.department_name, count(distinct s.id) as student_count
from student s
left join student_major sm on sm.student_id=s.id
left join major m on m.id=sm.major_id
left join department d on d.id=m.department_id
where sm.major_id is not null
group by m.major_name, d.department_name;



/*Question Three:

 How might you export a single
 dataset which includes students 
 and their majors to a CSV file (named `question_three.csv`)?
 
 If I wanted all the students and their majors and 
 I did not mind duplicate names and names with no majors I would use 
 the below script. Once the script was run I would use mysqls export tool
 to export the dataset to a csv file which can be found in the git repository 
 name question_three.csv
 */
 
 select   s.first_name
,s.last_name
, m.major_name
from student s
left join student_major sm on sm.student_id=s.id
left join major m on m.id=sm.major_id;


/*
Question four:
How might you import students found 
in the dataset from `question_three.csv` 
into `student_major.db` (committing your changes to the database)?

Normally in my current role I would create a 
table(Student_import) using a create table statement
 which can hold the target data for the import.
 I would then import the data into the table using a wizard 
 common in most sql environments. 
 However, mysql has a nice import create table feature
 that I used to import the data and have it automatically
 create a table. I would then run a commit statement to be sure
 it was commited.
 
 In either of the scenarios the student_import table would most likely
 just be a staging table but it allows for further analysis of the
 data to resolve any data issues.

*/