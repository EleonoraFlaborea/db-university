-- SELECT:

-- 1. Selezionare tutti gli studenti nati nel 1990 (160)
SELECT `name`, `surname`, `date_of_birth` FROM `students` WHERE `date_of_birth` LIKE '1990-%';

-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT `degree_id`, `name`, `cfu` FROM `courses` WHERE `cfu` > '10';

-- 3. Selezionare tutti gli studenti che hanno più di 30 anni
SELECT `name`, `surname`, `date_of_birth` FROM `students` WHERE (DATEDIFF(CURRENT_DATE(), DATE(`date_of_birth`) /365) = 30); --vedere registrazione

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
SELECT `degree_id`, `name`, `period`,`year`  FROM `courses` WHERE `period` = 'I semestre' AND `year` = '1';

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
SELECT `course_id`, `date`, `hour` FROM `exams` WHERE `date` = '2020-06-20' AND HOUR(`hour`) >= 14;

-- 6. Selezionare tutti i corsi di laurea magistrale (38)
SELECT `name`, `level` FROM `degrees` WHERE `level` = 'magistrale';

-- 7. Da quanti dipartimenti è composta l'università? (12)
SELECT COUNT(*) AS `departments` FROM `departments`;

-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
SELECT `name`, `surname`, `phone` FROM `teachers` WHERE `phone` IS NULL;


-- GROUP BY:

-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(*) as `iscritti` FROM `students` GROUP BY `enrolment_date`;

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT COUNT(*) as `same_office` FROM `teachers` GROUP BY `office_number`;

-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT ROUND(AVG(`vote`), 2) as `media_voti` FROM `exam_student` GROUP BY `vote`;

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT COUNT(*) as `total_degrees` FROM `degrees` GROUP BY `department_id`;