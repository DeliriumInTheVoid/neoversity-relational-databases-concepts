INSERT INTO authors (author_name) 
VALUES ('Джордж Орвелл'), ('Джоан Роулінг');

INSERT INTO genres (genre_name) 
VALUES ('Антиутопія'), ('Фентезі');

INSERT INTO books (title, publication_year, author_id, genre_id) 
VALUES ('1984', 1949, 1, 1), 
       ('Гаррі Поттер і філософський камінь', 1997, 2, 2);

INSERT INTO users (username, email) 
VALUES ('ivan_petrenko', 'ivan.p@example.com'), 
       ('olena_masalenko', 'olena.m@example.com');

INSERT INTO borrowed_books (book_id, user_id, borrow_date, return_date) 
VALUES (1, 1, '2023-10-01', '2023-10-15'), 
       (2, 2, '2023-10-10', NULL);