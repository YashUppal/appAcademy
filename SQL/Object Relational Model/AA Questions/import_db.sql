PRAGMA foreign_keys = ON;

-- DROP TABLE question_likes;
-- DROP TABLE replies;
-- DROP TABLE question;
-- DROP TABLE question_follows;
-- DROP TABLE users;


CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    user_id INTEGER,

    FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    body TEXT NOT NULL,
    user_id INTEGER NOT NULL,
    parent_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(parent_id) REFERENCES replies(id),
    FOREIGN KEY(question_id) REFERENCES questions(id)
);

CREATE TABLE question_likes (
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO 
    users(fname,lname)
VALUES
    ("John","Doe"),
    ("Jackie","Chan"),
    ("Jane","Doe");


INSERT INTO
    questions(title,body,user_id)
VALUES
    ("How to?","Do that",1),
    ("How?","Can?",2),
    ("Where?","To Find?",3);

INSERT INTO
    question_follows(user_id,question_id)
VALUES
    (1,2),
    (2,3),
    (3,1);

INSERT INTO
    replies(body,user_id,parent_id,question_id)
VALUES
    ("Some",2,1,1),
    ("Thing",3,1,1);

INSERT INTO
    question_likes
VALUES
    (1,2),
    (2,2);