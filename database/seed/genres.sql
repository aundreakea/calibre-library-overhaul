-- =============================================================
-- Genres Seed Data
-- Modeled on Goodreads genre hierarchy.
-- User-controlled via is_active flag.
-- =============================================================

-- TOP LEVEL CATEGORIES
INSERT INTO genres (name, genre_code, parent_id, is_active) VALUES
('Fiction',             'FIC', null, true),
('Nonfiction',          'NON', null, true),
('Art',                 'ART', null, true),
('Crafts & Hobbies',    'CRF', null, true),
('LGBTQ+',              'LGB', null, true);


-- FICTION SUBGENRES
INSERT INTO genres (name, genre_code, parent_id, is_active) VALUES
('Fantasy',             'FAN', (SELECT genre_id FROM genres WHERE name = 'Fiction'), true),
('Science Fiction',     'SCI', (SELECT genre_id FROM genres WHERE name = 'Fiction'), true),
('Romance',             'ROM', (SELECT genre_id FROM genres WHERE name = 'Fiction'), true),
('Mystery',             'MYS', (SELECT genre_id FROM genres WHERE name = 'Fiction'), true),
('Thriller & Suspense', 'THR', (SELECT genre_id FROM genres WHERE name = 'Fiction'), true),
('Horror',              'HOR', (SELECT genre_id FROM genres WHERE name = 'Fiction'), true),
('Historical Fiction',  'HIF', (SELECT genre_id FROM genres WHERE name = 'Fiction'), true),
('Literary Fiction',    'LIT', (SELECT genre_id FROM genres WHERE name = 'Fiction'), true),
('Contemporary Fiction','COF', (SELECT genre_id FROM genres WHERE name = 'Fiction'), true),
('Classics',            'CLS', (SELECT genre_id FROM genres WHERE name = 'Fiction'), true),
('Children''s',         'CHI', (SELECT genre_id FROM genres WHERE name = 'Fiction'), true),
('Comics & Graphic Novels', 'COM', (SELECT genre_id FROM genres WHERE name = 'Fiction'), true),
('Young Adult',         'YAF', (SELECT genre_id FROM genres WHERE name = 'Fiction'), true);


-- FANTASY SUBGENRES
INSERT INTO genres (name, genre_code, parent_id, is_active) VALUES
('Epic Fantasy',        'EPF', (SELECT genre_id FROM genres WHERE name = 'Fantasy'), true),
('Urban Fantasy',       'URF', (SELECT genre_id FROM genres WHERE name = 'Fantasy'), true),
('Dark Fantasy',        'DKF', (SELECT genre_id FROM genres WHERE name = 'Fantasy'), true),
('Romantasy',           'RMF', (SELECT genre_id FROM genres WHERE name = 'Fantasy'), true),
('Paranormal Fantasy',  'PAF', (SELECT genre_id FROM genres WHERE name = 'Fantasy'), true),
('Fairy Tales',         'FAI', (SELECT genre_id FROM genres WHERE name = 'Fantasy'), true),
('Mythology & Folklore','MYF', (SELECT genre_id FROM genres WHERE name = 'Fantasy'), true),
('Magical Realism',     'MAR', (SELECT genre_id FROM genres WHERE name = 'Fantasy'), true);


-- SCIENCE FICTION SUBGENRES
INSERT INTO genres (name, genre_code, parent_id, is_active) VALUES
('Space Opera',         'SPO', (SELECT genre_id FROM genres WHERE name = 'Science Fiction'), true),
('Cyberpunk',           'CYB', (SELECT genre_id FROM genres WHERE name = 'Science Fiction'), true),
('Dystopian',           'DYS', (SELECT genre_id FROM genres WHERE name = 'Science Fiction'), true),
('Post-Apocalyptic',    'POA', (SELECT genre_id FROM genres WHERE name = 'Science Fiction'), true),
('Hard Science Fiction','HSF', (SELECT genre_id FROM genres WHERE name = 'Science Fiction'), true),
('Military Science Fiction', 'MSF', (SELECT genre_id FROM genres WHERE name = 'Science Fiction'), true),
('Time Travel',         'TTR', (SELECT genre_id FROM genres WHERE name = 'Science Fiction'), true);


-- ROMANCE SUBGENRES
INSERT INTO genres (name, genre_code, parent_id, is_active) VALUES
('Contemporary Romance','COR', (SELECT genre_id FROM genres WHERE name = 'Romance'), true),
('Historical Romance',  'HIR', (SELECT genre_id FROM genres WHERE name = 'Romance'), true),
('Paranormal Romance',  'PAR', (SELECT genre_id FROM genres WHERE name = 'Romance'), true),
('Romantic Suspense',   'ROS', (SELECT genre_id FROM genres WHERE name = 'Romance'), true),
('Erotic Romance',      'ERO', (SELECT genre_id FROM genres WHERE name = 'Romance'), true);


-- MYSTERY SUBGENRES
INSERT INTO genres (name, genre_code, parent_id, is_active) VALUES
('Cozy Mystery',        'COZ', (SELECT genre_id FROM genres WHERE name = 'Mystery'), true),
('Detective Fiction',   'DET', (SELECT genre_id FROM genres WHERE name = 'Mystery'), true),
('Police Procedural',   'POL', (SELECT genre_id FROM genres WHERE name = 'Mystery'), true),
('Hard-Boiled',         'HDB', (SELECT genre_id FROM genres WHERE name = 'Mystery'), true),
('Amateur Sleuth',      'AMS', (SELECT genre_id FROM genres WHERE name = 'Mystery'), true);


-- THRILLER & SUSPENSE SUBGENRES
INSERT INTO genres (name, genre_code, parent_id, is_active) VALUES
('Psychological Thriller', 'PST', (SELECT genre_id FROM genres WHERE name = 'Thriller & Suspense'), true),
('Crime Thriller',      'CRT', (SELECT genre_id FROM genres WHERE name = 'Thriller & Suspense'), true),
('Legal Thriller',      'LGT', (SELECT genre_id FROM genres WHERE name = 'Thriller & Suspense'), true),
('Medical Thriller',    'MDT', (SELECT genre_id FROM genres WHERE name = 'Thriller & Suspense'), true),
('Political Thriller',  'PLT', (SELECT genre_id FROM genres WHERE name = 'Thriller & Suspense'), true),
('Spy Thriller',        'SPT', (SELECT genre_id FROM genres WHERE name = 'Thriller & Suspense'), true);


-- HORROR SUBGENRES
INSERT INTO genres (name, genre_code, parent_id, is_active) VALUES
('Supernatural Horror', 'SUH', (SELECT genre_id FROM genres WHERE name = 'Horror'), true),
('Psychological Horror','PSH', (SELECT genre_id FROM genres WHERE name = 'Horror'), true),
('Gothic Horror',       'GTH', (SELECT genre_id FROM genres WHERE name = 'Horror'), true),
('Dark Fiction',        'DKN', (SELECT genre_id FROM genres WHERE name = 'Horror'), true);


-- HISTORICAL FICTION SUBGENRES
INSERT INTO genres (name, genre_code, parent_id, is_active) VALUES
('Ancient World',       'ANW', (SELECT genre_id FROM genres WHERE name = 'Historical Fiction'), true),
('Medieval',            'MDV', (SELECT genre_id FROM genres WHERE name = 'Historical Fiction'), true),
('Victorian',           'VIC', (SELECT genre_id FROM genres WHERE name = 'Historical Fiction'), true),
('World War Fiction',   'WWF', (SELECT genre_id FROM genres WHERE name = 'Historical Fiction'), true);


-- COMICS & GRAPHIC NOVELS SUBGENRES
INSERT INTO genres (name, genre_code, parent_id, is_active) VALUES
('Graphic Novels',      'GRN', (SELECT genre_id FROM genres WHERE name = 'Comics & Graphic Novels'), true);


-- YOUNG ADULT SUBGENRES
INSERT INTO genres (name, genre_code, parent_id, is_active) VALUES
('YA Fantasy',          'YFF', (SELECT genre_id FROM genres WHERE name = 'Young Adult'), true),
('YA Romance',          'YRF', (SELECT genre_id FROM genres WHERE name = 'Young Adult'), true),
('YA Science Fiction',  'YSF', (SELECT genre_id FROM genres WHERE name = 'Young Adult'), true),
('YA Contemporary',     'YCF', (SELECT genre_id FROM genres WHERE name = 'Young Adult'), true);


-- NONFICTION SUBGENRES
INSERT INTO genres (name, genre_code, parent_id, is_active) VALUES
('Biography & Memoir',  'BIO', (SELECT genre_id FROM genres WHERE name = 'Nonfiction'), true),
('History',             'HIS', (SELECT genre_id FROM genres WHERE name = 'Nonfiction'), true),
('Science & Nature',    'SCN', (SELECT genre_id FROM genres WHERE name = 'Nonfiction'), true),
('Technology & Computing', 'TEC', (SELECT genre_id FROM genres WHERE name = 'Nonfiction'), true),
('Self Help & Personal Development', 'SHP', (SELECT genre_id FROM genres WHERE name = 'Nonfiction'), true),
('Business & Economics','BUS', (SELECT genre_id FROM genres WHERE name = 'Nonfiction'), true),
('Psychology',          'PSY', (SELECT genre_id FROM genres WHERE name = 'Nonfiction'), true),
('Philosophy',          'PHI', (SELECT genre_id FROM genres WHERE name = 'Nonfiction'), true),
('Political Science',   'PLS', (SELECT genre_id FROM genres WHERE name = 'Nonfiction'), true),
('Law & Legal Studies', 'LAW', (SELECT genre_id FROM genres WHERE name = 'Nonfiction'), true),
('Medical & Health',    'MED', (SELECT genre_id FROM genres WHERE name = 'Nonfiction'), true),
('Religion & Spirituality', 'REL', (SELECT genre_id FROM genres WHERE name = 'Nonfiction'), true),
('Cultural Studies',    'CUL', (SELECT genre_id FROM genres WHERE name = 'Nonfiction'), true),
('Language Learning',   'LAN', (SELECT genre_id FROM genres WHERE name = 'Nonfiction'), true),
('Education & Academia','EDU', (SELECT genre_id FROM genres WHERE name = 'Nonfiction'), true),
('True Crime',          'TRC', (SELECT genre_id FROM genres WHERE name = 'Nonfiction'), true),
('Travel',              'TRV', (SELECT genre_id FROM genres WHERE name = 'Nonfiction'), true),
('Sports & Fitness',    'SPF', (SELECT genre_id FROM genres WHERE name = 'Nonfiction'), true),
('Gaming',              'GAM', (SELECT genre_id FROM genres WHERE name = 'Nonfiction'), true),
('Music',               'MUS', (SELECT genre_id FROM genres WHERE name = 'Nonfiction'), true),
('Film & Television',   'FTV', (SELECT genre_id FROM genres WHERE name = 'Nonfiction'), true),
('Architecture & Design','ARH', (SELECT genre_id FROM genres WHERE name = 'Nonfiction'), true),
('Poetry',              'POE', (SELECT genre_id FROM genres WHERE name = 'Nonfiction'), true);


-- BIOGRAPHY & MEMOIR SUBGENRES
INSERT INTO genres (name, genre_code, parent_id, is_active) VALUES
('Autobiography',       'AUT', (SELECT genre_id FROM genres WHERE name = 'Biography & Memoir'), true),
('Memoir',              'MEM', (SELECT genre_id FROM genres WHERE name = 'Biography & Memoir'), true),
('Biography',           'BGR', (SELECT genre_id FROM genres WHERE name = 'Biography & Memoir'), true);


-- HISTORY SUBGENRES
INSERT INTO genres (name, genre_code, parent_id, is_active) VALUES
('Ancient History',     'ANH', (SELECT genre_id FROM genres WHERE name = 'History'), true),
('Military History',    'MLH', (SELECT genre_id FROM genres WHERE name = 'History'), true),
('American History',    'AMH', (SELECT genre_id FROM genres WHERE name = 'History'), true),
('World History',       'WRH', (SELECT genre_id FROM genres WHERE name = 'History'), true);


-- SCIENCE & NATURE SUBGENRES
INSERT INTO genres (name, genre_code, parent_id, is_active) VALUES
('Popular Science',     'PPS', (SELECT genre_id FROM genres WHERE name = 'Science & Nature'), true),
('Physics',             'PHY', (SELECT genre_id FROM genres WHERE name = 'Science & Nature'), true),
('Biology',             'BLG', (SELECT genre_id FROM genres WHERE name = 'Science & Nature'), true),
('Chemistry',           'CHM', (SELECT genre_id FROM genres WHERE name = 'Science & Nature'), true),
('Nature & Environment','NAE', (SELECT genre_id FROM genres WHERE name = 'Science & Nature'), true);


-- TECHNOLOGY & COMPUTING SUBGENRES
INSERT INTO genres (name, genre_code, parent_id, is_active) VALUES
('Programming & Software', 'PRG', (SELECT genre_id FROM genres WHERE name = 'Technology & Computing'), true),
('Artificial Intelligence', 'AIN', (SELECT genre_id FROM genres WHERE name = 'Technology & Computing'), true),
('Networking & Security', 'NET', (SELECT genre_id FROM genres WHERE name = 'Technology & Computing'), true),
('Web Development',     'WEB', (SELECT genre_id FROM genres WHERE name = 'Technology & Computing'), true),
('Hardware',            'HWR', (SELECT genre_id FROM genres WHERE name = 'Technology & Computing'), true),
('Tech Business',       'TCB', (SELECT genre_id FROM genres WHERE name = 'Technology & Computing'), true);


-- SELF HELP SUBGENRES
INSERT INTO genres (name, genre_code, parent_id, is_active) VALUES
('Productivity',        'PRD', (SELECT genre_id FROM genres WHERE name = 'Self Help & Personal Development'), true),
('Mindfulness',         'MDF', (SELECT genre_id FROM genres WHERE name = 'Self Help & Personal Development'), true),
('Motivation',          'MOT', (SELECT genre_id FROM genres WHERE name = 'Self Help & Personal Development'), true),
('Relationships',       'RLS', (SELECT genre_id FROM genres WHERE name = 'Self Help & Personal Development'), true);


-- BUSINESS & ECONOMICS SUBGENRES
INSERT INTO genres (name, genre_code, parent_id, is_active) VALUES
('Entrepreneurship',    'ENT', (SELECT genre_id FROM genres WHERE name = 'Business & Economics'), true),
('Leadership',          'LED', (SELECT genre_id FROM genres WHERE name = 'Business & Economics'), true),
('Personal Finance',    'PFN', (SELECT genre_id FROM genres WHERE name = 'Business & Economics'), true),
('Marketing',           'MKT', (SELECT genre_id FROM genres WHERE name = 'Business & Economics'), true),
('Economics',           'ECO', (SELECT genre_id FROM genres WHERE name = 'Business & Economics'), true);


-- PSYCHOLOGY SUBGENRES
INSERT INTO genres (name, genre_code, parent_id, is_active) VALUES
('Behavioral Psychology', 'BHP', (SELECT genre_id FROM genres WHERE name = 'Psychology'), true),
('Cognitive Science',   'COG', (SELECT genre_id FROM genres WHERE name = 'Psychology'), true),
('Mental Health',       'MNH', (SELECT genre_id FROM genres WHERE name = 'Psychology'), true);


-- PHILOSOPHY SUBGENRES
INSERT INTO genres (name, genre_code, parent_id, is_active) VALUES
('Ethics',              'ETH', (SELECT genre_id FROM genres WHERE name = 'Philosophy'), true),
('Political Philosophy','PPH', (SELECT genre_id FROM genres WHERE name = 'Philosophy'), true);


-- POLITICAL SCIENCE SUBGENRES
INSERT INTO genres (name, genre_code, parent_id, is_active) VALUES
('Government & Policy', 'GVP', (SELECT genre_id FROM genres WHERE name = 'Political Science'), true),
('Political Theory',    'PLY', (SELECT genre_id FROM genres WHERE name = 'Political Science'), true),
('International Relations', 'INR', (SELECT genre_id FROM genres WHERE name = 'Political Science'), true);


-- LAW & LEGAL STUDIES SUBGENRES
INSERT INTO genres (name, genre_code, parent_id, is_active) VALUES
('Criminal Law',        'CRL', (SELECT genre_id FROM genres WHERE name = 'Law & Legal Studies'), true),
('Constitutional Law',  'CNL', (SELECT genre_id FROM genres WHERE name = 'Law & Legal Studies'), true),
('Legal Theory',        'LGY', (SELECT genre_id FROM genres WHERE name = 'Law & Legal Studies'), true);


-- MEDICAL & HEALTH SUBGENRES
INSERT INTO genres (name, genre_code, parent_id, is_active) VALUES
('Clinical Medicine',   'CLM', (SELECT genre_id FROM genres WHERE name = 'Medical & Health'), true),
('Anatomy & Physiology','ANP', (SELECT genre_id FROM genres WHERE name = 'Medical & Health'), true),
('Nutrition & Diet',    'NTD', (SELECT genre_id FROM genres WHERE name = 'Medical & Health'), true),
('Mental Health & Therapy', 'MHT', (SELECT genre_id FROM genres WHERE name = 'Medical & Health'), true);


-- RELIGION & SPIRITUALITY SUBGENRES
INSERT INTO genres (name, genre_code, parent_id, is_active) VALUES
('Christianity',        'CHR', (SELECT genre_id FROM genres WHERE name = 'Religion & Spirituality'), true),
('Islam',               'ISL', (SELECT genre_id FROM genres WHERE name = 'Religion & Spirituality'), true),
('Judaism',             'JUD', (SELECT genre_id FROM genres WHERE name = 'Religion & Spirituality'), true),
('Buddhism',            'BUD', (SELECT genre_id FROM genres WHERE name = 'Religion & Spirituality'), true),
('Hinduism',            'HIN', (SELECT genre_id FROM genres WHERE name = 'Religion & Spirituality'), true),
('Occult & Esoteric',   'OCC', (SELECT genre_id FROM genres WHERE name = 'Religion & Spirituality'), true),
('Paganism & Wicca',    'PAG', (SELECT genre_id FROM genres WHERE name = 'Religion & Spirituality'), true),
('Astrology & Divination', 'AST', (SELECT genre_id FROM genres WHERE name = 'Religion & Spirituality'), true),
('New Age',             'NAG', (SELECT genre_id FROM genres WHERE name = 'Religion & Spirituality'), true);


-- CULTURAL STUDIES SUBGENRES
INSERT INTO genres (name, genre_code, parent_id, is_active) VALUES
('African American Studies', 'AAS', (SELECT genre_id FROM genres WHERE name = 'Cultural Studies'), true),
('African Studies',     'AFS', (SELECT genre_id FROM genres WHERE name = 'Cultural Studies'), true),
('Latin American Studies', 'LAS', (SELECT genre_id FROM genres WHERE name = 'Cultural Studies'), true),
('Asian Studies',       'ASS', (SELECT genre_id FROM genres WHERE name = 'Cultural Studies'), true),
('Caribbean Studies',   'CBS', (SELECT genre_id FROM genres WHERE name = 'Cultural Studies'), true),
('Indigenous Studies',  'IND', (SELECT genre_id FROM genres WHERE name = 'Cultural Studies'), true),
('Middle Eastern Studies', 'MES', (SELECT genre_id FROM genres WHERE name = 'Cultural Studies'), true),
('European Studies',    'EUS', (SELECT genre_id FROM genres WHERE name = 'Cultural Studies'), true);


-- LANGUAGE LEARNING SUBGENRES
INSERT INTO genres (name, genre_code, parent_id, is_active) VALUES
('Spanish',             'SPN', (SELECT genre_id FROM genres WHERE name = 'Language Learning'), true),
('French',              'FRN', (SELECT genre_id FROM genres WHERE name = 'Language Learning'), true),
('German',              'GRM', (SELECT genre_id FROM genres WHERE name = 'Language Learning'), true),
('Italian',             'ITL', (SELECT genre_id FROM genres WHERE name = 'Language Learning'), true),
('Portuguese',          'PRT', (SELECT genre_id FROM genres WHERE name = 'Language Learning'), true),
('Japanese',            'JPN', (SELECT genre_id FROM genres WHERE name = 'Language Learning'), true),
('Chinese (Mandarin)',  'CHN', (SELECT genre_id FROM genres WHERE name = 'Language Learning'), true),
('Korean',              'KOR', (SELECT genre_id FROM genres WHERE name = 'Language Learning'), true),
('Arabic',              'ARB', (SELECT genre_id FROM genres WHERE name = 'Language Learning'), true),
('Russian',             'RUS', (SELECT genre_id FROM genres WHERE name = 'Language Learning'), true),
('Hindi',               'HND', (SELECT genre_id FROM genres WHERE name = 'Language Learning'), true),
('Swahili',             'SWH', (SELECT genre_id FROM genres WHERE name = 'Language Learning'), true),
('Greek',               'GRK', (SELECT genre_id FROM genres WHERE name = 'Language Learning'), true),
('Latin',               'LAT', (SELECT genre_id FROM genres WHERE name = 'Language Learning'), true),
('Hebrew',              'HBR', (SELECT genre_id FROM genres WHERE name = 'Language Learning'), true);


-- EDUCATION & ACADEMIA SUBGENRES
INSERT INTO genres (name, genre_code, parent_id, is_active) VALUES
('Linguistics',         'LNG', (SELECT genre_id FROM genres WHERE name = 'Education & Academia'), true),
('Research Methods',    'RSM', (SELECT genre_id FROM genres WHERE name = 'Education & Academia'), true),
('Academic Writing',    'ACW', (SELECT genre_id FROM genres WHERE name = 'Education & Academia'), true);


-- SPORTS & FITNESS SUBGENRES
INSERT INTO genres (name, genre_code, parent_id, is_active) VALUES
('Fitness & Training',  'FIT', (SELECT genre_id FROM genres WHERE name = 'Sports & Fitness'), true),
('Martial Arts',        'MAT', (SELECT genre_id FROM genres WHERE name = 'Sports & Fitness'), true),
('Team Sports',         'TMS', (SELECT genre_id FROM genres WHERE name = 'Sports & Fitness'), true),
('Outdoor Sports',      'ODS', (SELECT genre_id FROM genres WHERE name = 'Sports & Fitness'), true);


-- MUSIC SUBGENRES
INSERT INTO genres (name, genre_code, parent_id, is_active) VALUES
('Music Theory',        'MUT', (SELECT genre_id FROM genres WHERE name = 'Music'), true),
('Music History',       'MUH', (SELECT genre_id FROM genres WHERE name = 'Music'), true),
('Musicianship',        'MSP', (SELECT genre_id FROM genres WHERE name = 'Music'), true);


-- FILM & TELEVISION SUBGENRES
INSERT INTO genres (name, genre_code, parent_id, is_active) VALUES
('Film Criticism & History', 'FCH', (SELECT genre_id FROM genres WHERE name = 'Film & Television'), true),
('Screenwriting',       'SCW', (SELECT genre_id FROM genres WHERE name = 'Film & Television'), true);


-- ARCHITECTURE & DESIGN SUBGENRES
INSERT INTO genres (name, genre_code, parent_id, is_active) VALUES
('Architecture',        'ARC', (SELECT genre_id FROM genres WHERE name = 'Architecture & Design'), true),
('Interior Design',     'ITD', (SELECT genre_id FROM genres WHERE name = 'Architecture & Design'), true),
('Graphic Design',      'GRD', (SELECT genre_id FROM genres WHERE name = 'Architecture & Design'), true);


-- ART SUBGENRES
INSERT INTO genres (name, genre_code, parent_id, is_active) VALUES
('Art History',         'ATH', (SELECT genre_id FROM genres WHERE name = 'Art'), true),
('Drawing & Illustration', 'DRW', (SELECT genre_id FROM genres WHERE name = 'Art'), true),
('Painting',            'PNT', (SELECT genre_id FROM genres WHERE name = 'Art'), true),
('Photography',         'PHO', (SELECT genre_id FROM genres WHERE name = 'Art'), true),
('Sculpture',           'SCL', (SELECT genre_id FROM genres WHERE name = 'Art'), true),
('Digital Art',         'DGA', (SELECT genre_id FROM genres WHERE name = 'Art'), true),
('Art Criticism & Theory', 'ACT', (SELECT genre_id FROM genres WHERE name = 'Art'), true);


-- CRAFTS & HOBBIES SUBGENRES
INSERT INTO genres (name, genre_code, parent_id, is_active) VALUES
('Crocheting & Knitting', 'CRK', (SELECT genre_id FROM genres WHERE name = 'Crafts & Hobbies'), true),
('Woodworking',         'WDW', (SELECT genre_id FROM genres WHERE name = 'Crafts & Hobbies'), true),
('Fishing',             'FSH', (SELECT genre_id FROM genres WHERE name = 'Crafts & Hobbies'), true),
('Gardening & Horticulture', 'GRH', (SELECT genre_id FROM genres WHERE name = 'Crafts & Hobbies'), true),
('Hunting & Outdoor Skills', 'HNT', (SELECT genre_id FROM genres WHERE name = 'Crafts & Hobbies'), true),
('Sewing & Textiles',   'SWT', (SELECT genre_id FROM genres WHERE name = 'Crafts & Hobbies'), true),
('Cooking & Baking',    'CKB', (SELECT genre_id FROM genres WHERE name = 'Crafts & Hobbies'), true),
('Home Improvement',    'HMI', (SELECT genre_id FROM genres WHERE name = 'Crafts & Hobbies'), true),
('Model Making & Collecting', 'MDC', (SELECT genre_id FROM genres WHERE name = 'Crafts & Hobbies'), true);


-- LGBTQ+ SUBGENRES
INSERT INTO genres (name, genre_code, parent_id, is_active) VALUES
('LGBTQ+ Fiction',      'LGF', (SELECT genre_id FROM genres WHERE name = 'LGBTQ+'), true),
('LGBTQ+ Nonfiction',   'LGN', (SELECT genre_id FROM genres WHERE name = 'LGBTQ+'), true),
('LGBTQ+ Romance',      'LGR', (SELECT genre_id FROM genres WHERE name = 'LGBTQ+'), true),
('LGBTQ+ Biography & Memoir', 'LGM', (SELECT genre_id FROM genres WHERE name = 'LGBTQ+'), true),
('LGBTQ+ History & Culture', 'LGH', (SELECT genre_id FROM genres WHERE name = 'LGBTQ+'), true);