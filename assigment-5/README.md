# Електронен дневник

Базата `gradebook` има три таблици: `students`, `subjects` и `grades`. Оценките са в отделна таблица, защото един ученик има много оценки по един предмет, а ако бяха в `students`, щеше да може да се запише само по една на предмет. 
Таблицата `grades` е свързана със `students` и `subjects` чрез референции (`REFERENCES`), така че базата не позволява оценка за несъществуващ ученик или предмет.
Ограничението `CHECK (grade BETWEEN 2 AND 6)` пази оценките в позволения диапазон, а `NOT NULL` и `UNIQUE` (за името на предмета) предотвратяват празни и повтарящи се данни.

# Тест с невалидна оценка

При опит да се вмъкне оценка 7:

    INSERT INTO grades (student_id, subject_id, grade, grade_date)
    VALUES (1, 1, 7, '2026-10-25');

Базата отказа реда със съобщение:

    ERROR:  new row for relation "grades" violates check constraint "grades_grade_check"
    DETAIL:  Failing row contains (26, 1, 1, 7, 2026-10-25).
