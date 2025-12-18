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


