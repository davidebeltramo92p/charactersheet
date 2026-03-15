INSERT INTO races (name_en, name_it, description_en, description_it) VALUES
('Human', 'Umano', 'Versatile and ambitious.', 'Versatile e ambizioso.'),
('Elf', 'Elfo', 'Graceful and magically attuned.', 'Agile e affine alla magia.'),
('Dwarf', 'Nano', 'Resilient and hardy.', 'Resistente e robusto.');

INSERT INTO classes (name_en, name_it) VALUES
('Fighter', 'Guerriero'),
('Wizard', 'Mago'),
('Rogue', 'Ladro');

INSERT INTO equipment (name_en, name_it, category, weight, cost_gp) VALUES
('Longsword', 'Spada Lunga', 'Weapon', 3, 15),
('Leather Armor', 'Armatura di Cuoio', 'Armor', 10, 10),
('Explorer''s Pack', 'Zaino da Esploratore', 'Gear', 59, 10);

INSERT INTO spells (name_en, name_it, level, school, description_en, description_it) VALUES
('Magic Missile', 'Dardo Incantato', 1, 'Evocation', 'Three glowing darts of magical force.', 'Tre dardi luminosi di forza magica.'),
('Shield', 'Scudo', 1, 'Abjuration', 'Invisible barrier of magical force.', 'Barriera invisibile di forza magica.'),
('Fireball', 'Palla di Fuoco', 3, 'Evocation', 'A bright streak flashes then explodes.', 'Una scia luminosa esplode in un boato.');
