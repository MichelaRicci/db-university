-- ---------------------------------------  QUERY CON SELECT

-- 1. Selezionare tutti gli studenti nati nel 1990 (160)
SELECT `name`, `surname`, `date_of_birth` FROM `students` WHERE YEAR(`date_of_birth`) = 1990;


-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT `name` AS `courses`, `cfu` AS `cfu` FROM `courses` WHERE `cfu` > 10;


-- 3. Selezionare tutti gli studenti che hanno più di 30 anni
SELECT `name`, `surname`, `date_of_birth` FROM `students` WHERE YEAR (`date_of_birth`) <= 1992;


-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
SELECT `name`, `period`, `year` FROM `courses` WHERE `period` LIKE 'I s%' AND `year` = 1;

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
SELECT * FROM `exams` WHERE `date`= '2020/06/20' AND `hour`>= '14:00:00';

-- 6. Selezionare tutti i corsi di laurea magistrale (38)
SELECT * FROM `degrees` WHERE `level` = 'magistrale';


-- 7. Da quanti dipartimenti è composta l'università? (12)
SELECT COUNT(*) AS 'total' FROM `departments`;


-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
SELECT COUNT(*) AS 'no_number' FROM `teachers` WHERE `phone` IS NULL;


-- ------------------------------------------ QUERY CON GROUP BY


-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(*) AS 'enrolled_students', YEAR(`enrolment_date`) AS 'year' FROM `students` GROUP BY YEAR(`enrolment_date`);


-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT COUNT(*) AS 'teacher', `office_address` FROM `teachers` GROUP BY (`office_address`);


-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT AVG (`vote`) AS 'average', `exam_id` AS 'exam' FROM `exam_student` GROUP BY (`exam_id`);


-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT COUNT(*) AS 'courses', `department_id` AS 'departments' FROM `degrees` GROUP BY (`department_id`);