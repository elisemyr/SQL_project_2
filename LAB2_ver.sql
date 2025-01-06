CREATE TABLE Trip (
  idTrip INT PRIMARY KEY ,
  nameTrip VARCHAR(80),
  minCapacity INT,
  maxCapacity INT,
  pension VARCHAR(1),
  CHECK (pension IN ('F', 'H'))
  );

CREATE TABLE Country (
idCountry INT PRIMARY KEY,
nameCountryEN VARCHAR(100),
nameCountryFR VARCHAR(100),
shortCode VARCHAR(5),
document VARCHAR(5)
) ;


CREATE TABLE City (
idCity INT PRIMARY KEY,
nameCity VARCHAR(100),
country INT,
FOREIGN KEY (country) REFERENCES Country(idCountry)
);


CREATE TABLE Pricing (
trip INT,
dateTrip DATE,
price FLOAT,
PRIMARY KEY (trip, dateTrip),
FOREIGN KEY (trip) REFERENCES Trip (idTrip)
);


CREATE TABLE Stage (
trip INT,
orderStage INT,
city INT,
duration INT,
PRIMARY KEY (trip, orderStage),
FOREIGN KEY (trip) REFERENCES Trip (idTrip),
FOREIGN KEY (city) REFERENCES City(idCity)
);

CREATE TABLE Movie (
idMovie INT PRIMARY KEY,
titleMovie VARCHAR(100),
yearRelease YEAR,
budget FLOAT,
revenue FLOAT,
scoreIMDB INT,
countryFunder INT,
CHECK (scoreIMDB BETWEEN 0 AND 10),
FOREIGN KEY (countryFunder) REFERENCES Country(idCountry)
);

CREATE TABLE Location (
idLocation INT PRIMARY KEY,
nameLocation VARCHAR(100),
city INT,
country INT,
FOREIGN KEY (city) REFERENCES City(idCity),
FOREIGN KEY (country) REFERENCES Country(idCountry)
) ;

CREATE TABLE Filming (
idMovie INT,
idLocation INT,
descriptionScene VARCHAR(300),
PRIMARY KEY (idMovie, idLocation),
FOREIGN KEY (idMovie) REFERENCES Movie(idMovie),
FOREIGN KEY (idLocation) REFERENCES Location(idLocation)
) ;