INSERT INTO device_types (device_type_name) VALUES ("testType"),("syringePump"),("6-way valve"),("thermometer"),("temperature controller"),("No device");

INSERT INTO device_type_action_links (device_type_id, action_id) VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),
(2,1),(2,3),(2,5),(2,6),(2,7),(2,8),(3,9),(4,1),(4,2),(4,3),(5,1),(5,2),(5,3),(6,4);

INSERT INTO device_value_choices (device_link_id,value) VALUES (15,1),(15,2),(15,3),(15,4),(15,5),(15,6),(23,1),(23,2),(23,3),(23,4),
(23,5),(23,6);

INSERT INTO device_value_choices (device_link_id,unit) VALUES (5,'mL/min'),(5,'mL/s'),(5,'μL/min'),(5,'μL/s'),(5,'nL/min'),(5,'nL/s'),
(11,'mL/min'),(11,'mL/s'),(11,'μL/min'),(11,'μL/s'),(11,'nL/min'),(11,'nL/s'),
(6,'mL/min'),(6,'mL/s'),(6,'μL/min'),(6,'μL/s'),(6,'nL/min'),(6,'nL/s'),
(12,'mL/min'),(12,'mL/s'),(12,'μL/min'),(12,'μL/s'),(12,'nL/min'),(12,'nL/s');



UPDATE devices SET
    device_type_id = CASE id
        WHEN 1 THEN 1
        WHEN 2 THEN 6
        WHEN 3 THEN 1
        WHEN 4 THEN 1
    END
WHERE id IN(1,2,3,4);


UPDATE actions SET
    detail_number = CASE id
        WHEN 4 THEN 1
        WHEN 5 THEN 2
        WHEN 6 THEN 2
    END
WHERE id IN(4,5,6);