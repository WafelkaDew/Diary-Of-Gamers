CREATE TABLE Games (
    game_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    release_year INT
    age_rating INT,
    metacritic_rating DECIMAL
    created_at - TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    nickname VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE Genres (
    genre_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Games_Genres (
    game_id INT NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY (game_id, genre_id),
    FOREIGN KEY (game_id) REFERENCES Games(game_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);

CREATE TABLE Developers (
    developer_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Game_Developers (
    game_id INT NOT NULL,
    developer_id INT NOT NULL,
    role_name VARCHAR(100),
    PRIMARY KEY (game_id, developer_id),
    FOREIGN KEY (game_id) REFERENCES Games(game_id),
    FOREIGN KEY (developer_id) REFERENCES Developers(developer_id)
);

CREATE TABLE Diary (
    user_id INT NOT NULL,
    game_id INT NOT NULL,
    playing_date DATE,
    PRIMARY KEY (user_id, game_id, playing_date),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (game_id) REFERENCES Games(game_id)
);

CREATE TABLE Favourite_Games (
    user_id INT NOT NULL,
    game_id INT NOT NULL,
    date_to_add TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, game_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (game_id) REFERENCES Games(game_id)
);

CREATE TABLE Game_Review (
    review_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    game_id INT NOT NULL,
    rating INT CHECK (rating >= 1 AND rating <= 10),
    review TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(user_id, game_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (game_id) REFERENCES Games(game_id)
);

-- 1. Заполнение таблицы Genres
INSERT INTO Genres (name) VALUES
('Action'),
('Adventure'),
('RPG'),
('Strategy'),
('Shooter'),
('Sports'),
('Simulation'),
('Puzzle'),
('Horror'),
('Indie'),
('Platformer'),
('Fighting'),
('Racing');

-- 2. Заполнение таблицы Games с реальными играми и оценками Metacritic
INSERT INTO Games (title, description, release_year, age_rating, metacritic_rating) VALUES
('The Witcher 3: Wild Hunt', 'Action RPG set in a fantasy world where you play as Geralt of Rivia', 2015, 18, 92),
('Red Dead Redemption 2', 'Western action-adventure game set in America''s unforgiving heartland', 2018, 18, 97),
('The Legend of Zelda: Breath of the Wild', 'Open-world adventure game in the kingdom of Hyrule', 2017, 12, 97),
('Elden Ring', 'Action RPG set in a world created by Hidetaka Miyazaki and George R. R. Martin', 2022, 16, 96),
('God of War', 'Action-adventure game following Kratos and his son Atreus', 2018, 18, 94),
('Portal 2', 'First-person puzzle-platform video game', 2011, 12, 95),
('Mass Effect 2', 'Action RPG and the second installment in the Mass Effect series', 2010, 18, 94),
('Super Mario Odyssey', 'Platform game in the Super Mario series', 2017, 3, 97),
('Half-Life 2', 'First-person shooter game and the sequel to Half-Life', 2004, 16, 96),
('The Last of Us Part II', 'Action-adventure game set in a post-apocalyptic United States', 2020, 18, 93),
('Cyberpunk 2077', 'Action RPG set in the dystopian metropolis Night City', 2020, 18, 86),
('Minecraft', 'Sandbox game that allows players to build with a variety of blocks', 2011, 7, 93),
('Baldur''s Gate 3', 'Role-playing video game developed and published by Larian Studios', 2023, 18, 96),
('Dark Souls', 'Action RPG known for its high level of difficulty', 2011, 16, 89),
('Overwatch', 'Team-based multiplayer first-person shooter', 2016, 12, 91),
('Stardew Valley', 'Farming simulation role-playing video game', 2016, 7, 89),
('Celeste', 'Platformer about a young woman''s journey to climb a mountain', 2018, 7, 92),
('Hades', 'Roguelike action dungeon crawler video game', 2020, 12, 93);

-- 3. Заполнение таблицы Users (с вымышленными пользователями)
INSERT INTO Users (email, password_hash, nickname) VALUES
('alex.gamer@example.com', 'hashed_password_1', 'AlexTheGamer'),
('sarah.j@example.com', 'hashed_password_2', 'GameMasterSarah'),
('mike.chen@example.com', 'hashed_password_3', 'MikePlays'),
('laura.w@example.com', 'hashed_password_4', 'LaurasAdventures'),
('tom.b@example.com', 'hashed_password_5', 'TomBomb'),
('jess.rpg@example.com', 'hashed_password_6', 'JessLovesRPGs'),
('dan.strategy@example.com', 'hashed_password_7', 'StrategyDan'),
('chloe.indie@example.com', 'hashed_password_8', 'IndieChloe'),
('kevin.s@example.com', 'hashed_password_9', 'KevShoots'),
('emily.puzzle@example.com', 'hashed_password_10', 'EmilyPuzzles');

-- 4. Заполнение таблицы Games_Genres (связь игр с жанрами)
INSERT INTO Games_Genres (game_id, genre_id) VALUES
(1, 1), (1, 3), -- Witcher 3: Action, RPG
(2, 1), (2, 2), -- RDR2: Action, Adventure
(3, 2), (3, 11), -- Zelda BOTW: Adventure, Platformer
(4, 1), (4, 3), -- Elden Ring: Action, RPG
(5, 1), (5, 2), -- God of War: Action, Adventure
(6, 8), (6, 5), -- Portal 2: Puzzle, Shooter
(7, 1), (7, 3), -- Mass Effect 2: Action, RPG
(8, 11), -- Super Mario Odyssey: Platformer
(9, 5), -- Half-Life 2: Shooter
(10, 1), (10, 2), -- Last of Us 2: Action, Adventure
(11, 1), (11, 3), -- Cyberpunk: Action, RPG
(12, 2), (12, 7), -- Minecraft: Adventure, Simulation
(13, 3), -- Baldur''s Gate 3: RPG
(14, 1), (14, 3), -- Dark Souls: Action, RPG
(15, 5), -- Overwatch: Shooter
(16, 3), (16, 7), -- Stardew Valley: RPG, Simulation
(17, 11), -- Celeste: Platformer
(18, 1), (18, 3); -- Hades: Action, RPG

-- 5. Заполнение таблицы Developers РЕАЛЬНЫМИ разработчиками и их ролями
INSERT INTO Developers (name) VALUES
('Конрад Томашкевич'), -- Программист Witcher 3
('Марцин Иваньский'), -- Геймдизайнер Witcher 3
('Павел Сапёха'), -- Сценарист Witcher 3
('Дэн Хаузер'), -- Сценарист RDR2
('Роб Нельсон'), -- Арт-директор RDR2
('Хидэтака Миядзаки'), -- Директор Elden Ring
('Кори Барлог'), -- Директор God of War
('Эрик Вольпоу'), -- Программист Portal 2
('Чед Мосс'), -- Продюсер Mass Effect 2
('Кодзи Кондо'), -- Композитор Zelda
('Ютака Уэмура'), -- Арт-директор Zelda
('Гейб Ньюэлл'), -- Продюсер Half-Life 2
('Нил Дракманн'), -- Сценарист The Last of Us
('Харука Мацумото'), -- Программист Stardew Valley
('Мэтт Торсон'), -- Программист Celeste
('Грег Касавин'), -- Дизайнер Hades
('Свен Винке'), -- Основатель Larian Studios
('Адам Бадовский'), -- Продюсер Cyberpunk
('Тодд Говард'), -- Директор Bethesda RPG
('Сид Мейер'), -- Геймдизайнер Civilization
('Майкл Кондри'), -- Композитор Halo
('Ким Свифт'), -- Дизайнер Portal
('Дэвид Кейдж'), -- Сценарист Detroit
('Кэн Левин'), -- Креативный директор BioShock
('Тим Шейфер'), -- Основатель Double Fine
('Хидэо Кодзима'), -- Директор Death Stranding
('Сэм Лэйк'), -- Сценарист Alan Wake
('Джефф Кейли'), -- Арт-директор Destiny
('Уоррен Спектор'), -- Дизайнер Deus Ex
('Джош Сойер'); -- Дизайнер Fallout: New Vegas


-- 6. Заполнение таблицы Game_Developers с РЕАЛЬНЫМИ разработчиками и их РОЛЯМИ
-- Witcher 3 разработчики
INSERT INTO Game_Developers (game_id, developer_id, role_name) VALUES
(1, 1, 'Ведущий программист'),
(1, 2, 'Главный геймдизайнер'),
(1, 3, 'Ведущий сценарист'),
(1, 18, 'Продюсер'),

-- Red Dead Redemption 2 разработчики
(2, 4, 'Креативный директор и сценарист'),
(2, 5, 'Арт-директор'),

-- Elden Ring разработчики
(4, 6, 'Геймдиректор'),
(4, 29, 'Сопродюсер'),

-- God of War разработчики
(5, 7, 'Геймдиректор'),
(5, 20, 'Продюсер'),

-- Portal 2 разработчики
(6, 8, 'Ведущий программист'),
(6, 22, 'Геймдизайнер'),

-- Mass Effect 2 разработчики
(7, 9, 'Продюсер'),
(7, 24, 'Креативный директор'),

-- Zelda: Breath of the Wild разработчики
(3, 10, 'Композитор'),
(3, 11, 'Арт-директор'),

-- Half-Life 2 разработчики
(9, 12, 'Продюсер'),
(9, 22, 'Геймдизайнер'),

-- The Last of Us Part II разработчики
(10, 13, 'Креативный директор и сценарист'),

-- Cyberpunk 2077 разработчики
(11, 18, 'Продюсер'),
(11, 1, 'Программист'),

-- Baldur's Gate 3 разработчики
(13, 17, 'Геймдиректор'),
(13, 30, 'Ведущий дизайнер'),

-- Dark Souls разработчики
(14, 6, 'Геймдиректор'),

-- Stardew Valley разработчики
(16, 14, 'Программист и геймдизайнер'),

-- Celeste разработчики
(17, 15, 'Программист'),
(17, 25, 'Композитор'),

-- Hades разработчики
(18, 16, 'Геймдизайнер'),
(18, 15, 'Программист'),

-- Super Mario Odyssey (дополнительно)
(8, 10, 'Композитор'),
(8, 26, 'Консультант по дизайну'),

-- Overwatch (дополнительно)
(15, 28, 'Арт-директор');


-- 7. Заполнение таблицы Diary (игры, в которые играли пользователи)
INSERT INTO Diary (user_id, game_id, playing_date) VALUES
(1, 1, '2023-01-15'),
(1, 2, '2023-02-20'),
(1, 4, '2023-03-10'),
(2, 3, '2023-04-05'),
(2, 8, '2023-05-12'),
(2, 12, '2023-06-18'),
(3, 5, '2023-07-22'),
(3, 9, '2023-08-30'),
(3, 15, '2023-09-14'),
(4, 6, '2023-10-05'),
(4, 17, '2023-11-11'),
(4, 18, '2023-12-25'),
(5, 7, '2024-01-08'),
(5, 11, '2024-02-14'),
(5, 13, '2024-03-01');

-- 8. Заполнение таблицы Favourite_Games (избранные игры пользователей)
INSERT INTO Favourite_Games (user_id, game_id) VALUES
(1, 1),  -- Alex любит Witcher 3
(1, 4),  -- Alex любит Elden Ring
(2, 3),  -- Sarah любит Zelda
(2, 8),  -- Sarah любит Mario
(3, 5),  -- Mike любит God of War
(4, 6),  -- Laura любит Portal 2
(4, 17), -- Laura любит Celeste
(5, 13), -- Tom любит Baldur's Gate 3
(6, 7),  -- Jess любит Mass Effect 2
(7, 13), -- Dan любит Baldur's Gate 3
(8, 16), -- Chloe любит Stardew Valley
(8, 17), -- Chloe любит Celeste
(9, 15), -- Kevin любит Overwatch
(10, 6); -- Emily любит Portal 2

-- 9. Заполнение таблицы Game_Review (отзывы и оценки пользователей)
INSERT INTO Game_Review (user_id, game_id, rating, review) VALUES
-- Отзывы на Witcher 3
(1, 1, 10, 'Лучшая RPG всех времен! Сюжет, персонажи, мир - все на высшем уровне.'),
(2, 1, 9, 'Отличная игра, но немного длинная для моего вкуса.'),
(6, 1, 10, 'Геральт - лучший персонаж в истории игр!'),

-- Отзывы на Red Dead Redemption 2
(1, 2, 10, 'Шедевр. История Артура Моргана тронула до глубины души.'),
(3, 2, 8, 'Красивая игра, но слишком медленный темп в начале.'),

-- Отзывы на Zelda BOTW
(2, 3, 10, 'Свобода исследования в этой игры беспрецедентна.'),
(4, 3, 9, 'Люблю открытый мир, но хотелось бы больше подземелий.'),

-- Отзывы на Elden Ring
(1, 4, 10, 'Сложно, но невероятно удовлетворяюще. Открытый мир FromSoftware - мечта.'),
(5, 4, 7, 'Слишком сложно для меня, но мир прекрасен.'),

-- Отзывы на God of War
(3, 5, 10, 'Отношения Кратоса и Атрея - сердце этой игры. Шедевр.'),
(9, 5, 9, 'Боевая система потрясающая, история эмоциональная.'),

-- Отзывы на Portal 2
(4, 6, 10, 'Гениальная головоломка с отличным юмором.'),
(10, 6, 10, 'Уитли - лучший злодей в истории игр!'),

-- Отзывы на Mass Effect 2
(6, 7, 10, 'Моя любимая игра в трилогии. Миссии вербовки - лучшие.'),
(5, 7, 9, 'Отличная RPG с незабываемыми персонажами.'),

-- Отзывы на Super Mario Odyssey
(2, 8, 10, 'Невероятно креативная и веселая игра. Лунатик - лучший спутник!'),

-- Отзывы на Baldur's Gate 3
(5, 13, 10, 'RPG года, если не десятилетия. Глубина невероятная.'),
(7, 13, 10, 'Качество проработки каждого персонажа поражает.'),

-- Отзывы на Dark Souls
(1, 14, 9, 'Трудная, но справедливая. Чувство достижения неповторимо.'),
(3, 14, 8, 'Люктерия - одно из лучших мест в истории игр.'),

-- Отзывы на Stardew Valley
(8, 16, 10, 'Идеальная игра для расслабления после тяжелого дня.'),
(4, 16, 9, 'Затягивает на сотни часов!'),

-- Отзывы на Celeste
(4, 17, 10, 'Потрясающая платформер с важным посланием о психическом здоровье.'),
(8, 17, 9, 'Сложно, но музыка и история того стоят.'),

-- Отзывы на Hades
(4, 18, 10, 'Лучшая roguelike игра. Сюжет, бои, персонажи - все идеально.'),
(1, 18, 9, 'Запредельно аддиктивный геймплей.');

-- Дополнительные отзывы для разнообразия
INSERT INTO Game_Review (user_id, game_id, rating, review) VALUES
(9, 15, 8, 'Веселая командная игра, но баланс иногда хромает.'),
(10, 12, 9, 'Майнкрафт - это вечная классика. Бесконечные возможности.'),
(7, 11, 7, 'После всех патчей игра стала намного лучше, но начало было тяжелым.'),
(6, 10, 6, 'Технически безупречно, но сюжетные решения спорные.');