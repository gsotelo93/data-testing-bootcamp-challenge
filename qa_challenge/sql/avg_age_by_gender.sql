SELECT genre,
    gender,
    AVG(age) AS avg_age  -- Usa AVG() en lugar de MAX() para obtener el promedio de edades
FROM viewership_data
GROUP BY genre, gender
ORDER BY genre, gender;
