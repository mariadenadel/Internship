CREATE TABLE users (
  ID SERIAL PRIMARY KEY NOT NULL,
  username VARCHAR NOT NULL,
  password VARCHAR NOT NULL,
  email VARCHAR NOT NULL
);

CREATE TABLE articles (
  ID SERIAL PRIMARY KEY NOT NULL,
  title VARCHAR NOT NULL,
  content TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  user_id SERIAL NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE comments (
  ID SERIAL PRIMARY KEY NOT NULL,
  content TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  user_id SERIAL NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (id),
  article_id SERIAL NOT NULL,
  FOREIGN KEY (article_id) REFERENCES articles (id)
);

INSERT INTO users(username, password, email)
VALUES ('maria', 'password', 'maria@password.com');
INSERT INTO users(username, password, email)
VALUES ('nadia', 'wordpass', 'nadia@wordpass.com');
INSERT INTO users(username, password, email)
VALUES ('hello', 'hellopass', 'hello@hellopass.com');

INSERT INTO articles(title, content, user_id)
VALUES ('Hello World', 'How run the world', 1);
INSERT INTO articles(title, content, user_id)
VALUES ('Goodbye World', 'Lorem ipsum dolor sit', 2);
INSERT INTO articles(title, content, user_id)
VALUES ('World', 'Quis facere similique', 1);

INSERT INTO comments(content, user_id, article_id)
VALUES ('hello my name is maria', 1, 1);
INSERT INTO comments(content, user_id, article_id)
VALUES ('how are you?', 1, 2);
INSERT INTO comments(content, user_id, article_id)
VALUES ('comment for article', 2, 3);
INSERT INTO comments(content, user_id, article_id)
VALUES ('more more comments', 1, 2);
INSERT INTO comments(content, user_id, article_id)
VALUES ('test comments', 1, 2);

UPDATE users
SET username = 'other name',
    password = 'otherpassword',
    email = 'other@email.com'
WHERE id = 1;

UPDATE articles
SET title = 'other title',
    content = 'other content'
WHERE id = 2;

UPDATE comments
SET content = 'other content for article'
WHERE content = 'comment for article';

ALTER TABLE articles
ADD COLUMN updated_at TIMESTAMP DEFAULT NOW();

SELECT * FROM users;
SELECT * FROM articles;
SELECT * FROM comments;

SELECT count(title) FROM articles
WHERE user_id = 1;

SELECT email, comments.content as comment_content, title as article_title FROM comments
LEFT JOIN articles ON article_id = articles.id
LEFT JOIN users ON comments.user_id = users.id;