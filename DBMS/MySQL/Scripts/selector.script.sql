use startersql;
-- SELECT * FROM users;
-- SELECT email, gender FROM users;
-- RENAME TABLE users to programmers;

-- SELECT * FROM programmers;
-- RENAME TABLE programmers to users;

-- SELECT gender, name FROM users WHERE gender="Male";
-- SELECT gender, name FROM users WHERE date_of_birth<'1995-01-01'
-- SELECT gender, name FROM users WHERE id<=10;
-- SELECT gender, name FROM users WHERE date_of_birth is NULL;
-- SELECT gender, name FROM users WHERE date_of_birth BETWEEN '1990-09-09' AND '1999-09-09';
-- SELECT * FROM users WHERE gender in ('Male', 'Female');

-- SELECT * FROM users WHERE gender='Female' AND salary>'70000'
-- SELECT * FROM users WHERE gender='Female' OR salary>'60000' ORDER BY date_of_birth DESC LIMIT 5;

UPDATE users SET salary=45000, email='aarav@gmail.com' WHERE id=1;
SELECT * FROM users;
