SET FOREIGN_KEY_CHECKS=1;

SELECT 
    a.id AS appointment_id,
    a.appointment_date,
    c.name AS customer_name,
    p.name AS pet_name,
    s.name AS service_name,
    v.name AS clinic_name,
    a.status
FROM appointments a
INNER JOIN customers c ON a.customer_id = c.id
INNER JOIN pets p ON a.pet_id = p.id
INNER JOIN services s ON a.service_id = s.id
INNER JOIN veterinary_clinic v ON a.veterinary_clinic_id = v.id;

SELECT name, address, phone
FROM veterinary_clinic
WHERE id IN (
    SELECT id_veterinary_clinic 
    FROM service_clinic 
    WHERE id_service = 1
);

SELECT 
    s.name AS specie_name,
    COUNT(p.id) AS pet_count
FROM specie s
LEFT JOIN race r ON s.id = r.id_specie
LEFT JOIN pets p ON r.id = p.id_race
GROUP BY s.name;

DELETE FROM veterinary_clinic 
WHERE name LIKE '%Petitos%' 
AND name <> 'Petitoss';


SELECT username, password FROM users;