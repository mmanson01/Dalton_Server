USE mmanson;

/* 1) List a student by only last name with associated data (first_name, house, etc) */  
SELECT last_name, first_name, middle_name, student_id, sex_code, grade_entered, current_grade, class_yr, birth_day, birth_month, birth_year, advisor FROM dalton_t WHERE last_name= "Manson";

/* 2) All students with the same last name with same birthday (twins) */
SELECT a.first_name, a.last_name FROM dalton_t a, dalton_t b WHERE a.first_name != b.first_name AND a.last_name = b.last_name AND a.birth_month = b.birth_month AND a.birth_day = b.birth_day AND a.birth_year = b.birth_year ORDER BY a.last_name;

/* 3) All students with same birth month */
SELECT first_name, last_name, birth_month FROM dalton_t WHERE birth_month = "11";

/* 4) All student by a specific House */
SELECT first_name, last_name, advisor FROM dalton_t WHERE advisor = "Condie/Campbell";

/* 5) A sorted list of students by last name */
SELECT last_name, first_name FROM dalton_t ORDER BY last_name;

/* 6) A report by gender (totals only) */
SELECT sex_code, COUNT(*) FROM dalton_t GROUP BY sex_code;

/* 7) Total number of fourth-grade vs “12th” */
SELECT current_grade, COUNT(*) FROM dalton_t WHERE current_grade = "7" OR current_grade = "8" GROUP BY current_grade;

/* 8) All students born in 2001 */
SELECT first_name, last_name, birth_year FROM dalton_t WHERE birth_year = "2001";

/* 9) First name frequency (top 10)*/
SELECT first_name, COUNT(*) FROM dalton_t GROUP by first_name ORDER BY count(*) DESC LIMIT 10;

/* 10) Students (FIRST NAME, LAST NAME) in a particular grade. You choose. */
SELECT first_name, last_name, current_grade FROM dalton_t WHERE current_grade = "7";

/* ADDITIONAL FUNCTIONS */

/* 11) All students that entered in Kindergarden */
SELECT first_name, last_name, grade_entered FROM dalton_t WHERE grade_entered = "K";

/* 12) Last name frequency (top 5) */
SELECT last_name, COUNT(*) FROM dalton_t GROUP by last_name ORDER BY count(*) DESC LIMIT 5;

/* 13) A sorted list of students from oldest to youngest */
SELECT first_name, last_name, birth_month, birth_day, birth_year FROM dalton_t ORDER BY CAST(birth_year AS UNSIGNED) ASC, CAST(birth_month AS UNSIGNED) ASC, CAST(birth_day AS UNSIGNED) ASC;
 
