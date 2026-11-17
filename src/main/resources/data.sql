INSERT INTO sample_data (name)
SELECT 'jeswanth'
WHERE NOT EXISTS (SELECT 1 FROM sample_data WHERE name = 'jeswanth');

INSERT INTO sample_data (name)
SELECT 'kotini'
WHERE NOT EXISTS (SELECT 1 FROM sample_data WHERE name = 'kotini');
