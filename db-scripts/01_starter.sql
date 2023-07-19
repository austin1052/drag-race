CREATE TABLE user (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    pic VARCHAR(255),
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE season (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    pic VARCHAR(255),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE episode (
    id SERIAL PRIMARY KEY,
    season_id BIGINT UNSIGNED NOT NULL,
    episode_number INT NOT NULL,
    UNIQUE (season_id, episode_number),
    KEY season_id_idx (season_id)
);

CREATE TABLE queen (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    display_name VARCHAR(255) NOT NULL,
    pic VARCHAR(255),
    season_id BIGINT UNSIGNED NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    KEY season_id_idx (season_id)
);

CREATE TABLE league (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    pic VARCHAR(255),
    is_public BOOLEAN NOT NULL DEFAULT FALSE,
    season_id BIGINT UNSIGNED NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    KEY season_id_idx (season_id)
);

CREATE TABLE team (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    league_id BIGINT UNSIGNED NOT NULL,
    user_id BIGINT UNSIGNED NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    KEY league_id_idx (league_id)
);

CREATE TABLE team_queen (
    id SERIAL PRIMARY KEY,
    team_id BIGINT UNSIGNED NOT NULL,
    queen_id BIGINT UNSIGNED NOT NULL,
    position VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    KEY team_id_idx (team_id),
    KEY queen_id_idx (queen_id),
    UNIQUE (team_id, queen_id)
);

CREATE TABLE question (
    id SERIAL PRIMARY KEY,
    league_id BIGINT UNSIGNED NOT NULL,
    episode_id BIGINT UNSIGNED NOT NULL,
    question VARCHAR(255) NOT NULL,
    answer VARCHAR(255),
    due_date TIMESTAMP NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE prediction (
    id SERIAL PRIMARY KEY,
    team_id BIGINT UNSIGNED NOT NULL,
    question_id BIGINT UNSIGNED NOT NULL,
    guess VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    KEY team_id_idx (team_id),
    KEY question_id_idx (question_id),
    UNIQUE (team_id, question_id)
);



