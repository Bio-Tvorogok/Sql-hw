SELECT 'ФИО: Кирдяшкин Игорь Вячеславович';

CREATE TABLE IF NOT EXISTS films(
  id INT PRIMARY KEY AUTO_INCREMENT,
  title TEXT NOT NULL,
  country TEXT NOT NULL,
  box_office INT,
  release_date DATE);

CREATE TABLE IF NOT EXISTS persons(
  id INT PRIMARY KEY AUTO_INCREMENT,
  fio TEXT NOT NULL);

CREATE TABLE IF NOT EXISTS persons2content(
  person_id INT NOT NULL,
  film_id INT NOT NULL,
  person_type TEXT NOT NULL,
  FOREIGN KEY (person_id) REFERENCES persons(id),
  FOREIGN KEY (film_id) REFERENCES films(id));

INSERT INTO films (title, country, box_office, release_date) VALUES
('Gachimuchi', 'USA', NULL, '1990-02-11'),
('Oblivion', 'USA', '286168572', '2013-03-26'),
('Vase de noces', 'Belgium', NULL, '1975-04-11'),
('Green Elephant', 'Russia', NULL, '1999-01-21'),
('Bitterly!', 'Russia', '27369902', '2013-10-24');

INSERT INTO persons (fio) VALUES
('Billy Herrington'),
('Tom Cruise'),
('Thierry Zeno'),
('Pahomov Sergey Igorevich'),
('Svetlakov Sergey Yurevich');

INSERT INTO persons2content VALUES
(1, 1, 'actor'),
(2, 2, 'actor'),
(3, 3, 'actor'),
(4, 4, 'actor'),
(5, 5, 'actor');