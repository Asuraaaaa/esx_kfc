SET @job_name = 'kfc';
SET @society_name = 'society_kfc';
SET @job_Name_Caps = 'KFC';



INSERT INTO `addon_account` (name, label, shared) VALUES
  (@society_name, @job_Name_Caps, 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  (@society_name, @job_Name_Caps, 1),
  ('society_kfc_fridge', 'KFC Fridge', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
    (@society_name, @job_Name_Caps, 1)
;

INSERT INTO `jobs` (name, label, whitelisted) VALUES
  (@job_name, @job_Name_Caps, 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  (@job_name, 0, 'recruit', 'Recrue', 300, '{}', '{}'),
  (@job_name, 1, 'employer', 'Employé(e)', 300, '{}', '{}'),
  (@job_name, 2, 'viceboss', 'Co-gérant', 500, '{}', '{}'),
  (@job_name, 3, 'boss', 'Gérant', 600, '{}', '{}')
;

INSERT INTO `items` (`name`, `label`, `limit`) VALUES  
    ('chicken', 'Chicken', 5),
    ('patates', 'Potatos', 5),
    ('salad', 'Salad', 5),
	('cheese', 'Cheese', 5),
	('cocacola', 'Coca Cola', 5),
	('sprite', 'Sprite', 5),
	('soda', 'Soda', 5),
	('lemonada', 'Lemonada', 5)
;
