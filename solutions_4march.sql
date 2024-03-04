-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT `students`.name,`students`.surname , `degrees`.name as 'laurea' 
FROM `students` 
JOIN `degrees` 
ON `degrees`.id = `students`.`degree_id` 
WHERE `degrees`.name = 'Corso di Laurea in Economia';

-- 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT `degrees`.name, `departments`.name
FROM `degrees` 
JOIN `departments` 
ON `departments`.id = `degrees`.`department_id` 
WHERE `departments`.name = 'Dipartimento di Neuroscienze';

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT `course_teacher`.course_id, `teachers`.name
FROM `course_teacher` 
JOIN `teachers` 
ON `teachers`.id = `course_teacher`.`teacher_id` 
WHERE `teachers`.name = 'Fulvio Amato';

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT `students`.name,`students`.surname, `degree_id`
FROM `students` 


-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT DISTINCT `teachers`.`name`, `teachers`.`surname`, `degrees`.`name` as 'dipartimento'
FROM `teachers`
JOIN `course_teacher`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
JOIN `courses`
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `degrees`
ON `degrees`.`id` = `courses`.`degree_id`
WHERE `degrees`.`name` = 'Dipartimento di Matematica';

-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami