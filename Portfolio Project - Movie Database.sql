CREATE TABLE Movies (
  MovieID SERIAL PRIMARY KEY,
  Title VARCHAR(255),
  ReleaseDate DATE,
  Genre VARCHAR(255),
  BoxOfficeRevenue DECIMAL(10, 2),
  Rating DECIMAL(3, 1),
  CriticReviewScore DECIMAL(3, 1),
  ProductionBudget DECIMAL(10, 2),
  Director VARCHAR(255),
  Description TEXT
);

INSERT INTO Movies (Title, ReleaseDate, Genre, BoxOfficeRevenue, Rating, CriticReviewScore, ProductionBudget, Director, Description) VALUES
  ('The Shawshank Redemption', '1994-09-23', 'Drama', 58.5, 9.3, 9.2, 25, 'Frank Darabont', 'Two imprisoned men bond over several years, finding solace and eventual redemption through acts of common decency.'),
  ('The Godfather', '1972-03-24', 'Crime, Drama', 286.0, 9.2, 9.0, 7, 'Francis Ford Coppola', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.'),
  ('Pulp Fiction', '1994-10-14', 'Crime, Drama', 213.9, 8.9, 8.9, 8, 'Quentin Tarantino', 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.'),
  ('The Dark Knight', '2008-07-18', 'Action, Crime, Drama', 1004.9, 9.0, 8.8, 185, 'Christopher Nolan', 'When the menace known as The Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham.'),
  ('Inception', '2010-07-16', 'Action, Adventure, Sci-Fi', 828.3, 8.8, 8.7, 160, 'Christopher Nolan', 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O..');

CREATE TABLE Actors (
  ActorID SERIAL PRIMARY KEY,
  Name VARCHAR(255),
  BirthDate DATE,
  Nationality VARCHAR(255)
);

INSERT INTO Actors (Name, BirthDate, Nationality) VALUES
  ('Tim Robbins', '1958-10-16', 'American'),
  ('Morgan Freeman', '1937-06-01', 'American'),
  ('Marlon Brando', '1924-04-03', 'American'),
  ('Al Pacino', '1940-04-25', 'American'),
  ('John Travolta', '1954-02-18', 'American'),
  ('Uma Thurman', '1970-04-29', 'American'),
  ('Christian Bale', '1974-01-30', 'British'),
  ('Heath Ledger', '1979-04-04', 'Australian'),
  ('Leonardo DiCaprio', '1974-11-11', 'American'),
  ('Joseph Gordon-Levitt', '1981-02-17', 'American');

CREATE TABLE MovieActors (
  MovieID INT,
  ActorID INT,
  FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
  FOREIGN KEY (ActorID) REFERENCES Actors(ActorID)
);

INSERT INTO MovieActors (MovieID, ActorID) VALUES
  (1, 1), (1, 2),
  (2, 3), (2, 4),
  (3, 5), (3, 6),
  (4, 7), (4, 8),
  (5, 9), (5, 10);

CREATE TABLE Reviews (
  ReviewID SERIAL PRIMARY KEY,
  MovieID INT,
  ReviewerName VARCHAR(255),
  ReviewDate DATE,
  Rating DECIMAL(3, 1),
  ReviewText TEXT,
  FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);

INSERT INTO Reviews (MovieID, ReviewerName, ReviewDate, Rating, ReviewText) VALUES
  (1, 'John Smith', '2022-01-05', 9.5, 'This movie is a masterpiece!'),
  (2, 'Jane Doe', '2021-11-20', 9.0, 'Incredible performances by the actors.'),
  (3, 'Mike Johnson', '2022-02-15', 8.7, 'A must-watch for any film enthusiast.'),
  (4, 'Emily Thompson', '2022-03-02', 8.9, 'The way Heath Ledger protrayed the Joker was outstanding.'),
  (5, 'Sarah Davis', '2022-02-28', 8.5, 'Mind-bending and visually stunning.');