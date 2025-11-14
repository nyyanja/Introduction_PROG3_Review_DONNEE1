--1 Employés sans équipe :
SELECT id, first_name, last_name 
FROM employee 
WHERE team_id IS NULL;

--2  Employés sans congé :
SELECT e.id, e.first_name, e.last_name
FROM employee e
LEFT JOIN conge c ON e.id = c.employee_id
WHERE c.id IS NULL;

--3 Affichage des congés avec infos équipe :
SELECT c.id, c.start_date, c.end_date, e.first_name, e.last_name, t.name
FROM conge c
JOIN employee e ON c.employee_id = e.id
LEFT JOIN team t ON e.team_id = t.id;

--4 Nombre d’employés par type de contrat :
SELECT contract_type, COUNT(*) 
FROM employee 
GROUP BY contract_type;

--5 Employés en congé aujourd’hui :
SELECT e.id, e.first_name, e.last_name, t.name
FROM employee e
JOIN conge c ON e.id = c.employee_id
LEFT JOIN team t ON e.team_id = t.id
WHERE CURRENT_DATE BETWEEN c.start_date AND c.end_date;

