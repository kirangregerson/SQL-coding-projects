CREATE DATABASE db_library
USE db_library;

/*

	BUILD

*/

CREATE TABLE tbl.LibraryBranch(
	branch_ID INT PRIMARY KEY NOT NULL IDENTITY (1000,1000),
	branch_name VARCHAR(50) NOT NULL,
	address VARCHAR(50) NOT NULL
);

CREATE TABLE tbl.Publisher(
	publisher_ID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	publisher_name VARCHAR(50) NOT NULL, 
	address VARCHAR(50) NOT NULL,
	phone VARCHAR(50) NOT NULL
);

CREATE TABLE tbl.Books(
	book_ID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	title VARCHAR(50) NOT NULL, 
	publisher_ID INT NOT NULL CONSTRAINT fk_Books_publisher_ID FOREIGN KEY REFERENCES tbl.Publisher(publisher_ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE tbl.BookAuthors(
	book_ID INT NOT NULL CONSTRAINT fk_BookAuthors_book_ID FOREIGN KEY REFERENCES tbl.Books(book_ID) ON UPDATE CASCADE ON DELETE CASCADE,
	author_name VARCHAR(50) NOT NULL
);

CREATE TABLE tbl.BookCopies(
	book_ID INT NOT NULL CONSTRAINT fk_BookCopies_book_ID FOREIGN KEY REFERENCES tbl.Books(book_ID) ON UPDATE CASCADE ON DELETE CASCADE,
	branch_ID INT NOT NULL CONSTRAINT fk_BookCopies_branch_ID FOREIGN KEY REFERENCES tbl.LibraryBranch(branch_ID) ON UPDATE CASCADE ON DELETE CASCADE,
	number_of_copies INT NOT NULL
);

CREATE TABLE tbl.BookLoans(
	book_ID INT NOT NULL CONSTRAINT fk_BookLoans_book_ID FOREIGN KEY REFERENCES tbl.Books(book_ID) ON UPDATE CASCADE ON DELETE CASCADE,
	branch_ID INT NOT NULL CONSTRAINT fk_BookLoans_branch_ID FOREIGN KEY REFERENCES tbl.LibraryBranch(branch_ID) ON UPDATE CASCADE ON DELETE CASCADE,
	card_ID INT NOT NULL CONSTRAINT fk_BookLoans_card_ID FOREIGN KEY REFERENCES tbl.Borrower(card_ID) ON UPDATE CASCADE ON DELETE CASCADE,
	date_out VARCHAR(20),
	date_due VARCHAR(20)
);

CREATE TABLE tbl.Borrower(
	card_ID INT PRIMARY KEY NOT NULL IDENTITY (1001,1),
	name VARCHAR(50),
	address VARCHAR(50),
	phone VARCHAR(50)
);

/*

	POPULATE

*/

INSERT INTO tbl.LibraryBranch
	(branch_name, address)
	VALUES
	('Sharpstown', '205 Dawnstar Avenue'),
	('Central', '199 Markarth Lane'),
	('Aberdeen', '18 Whiterun Street'),
	('Port Morris', '1090 Riften Road')
;

INSERT INTO tbl.Publisher
	(publisher_name, address, phone)
	VALUES
	('Random House', '12 Portsby Road', '(546) 312-9923'),
	('Penguin Publishing', '0083 Hyde Park Drive', '(798) 121-4185'),
	('Third Era Print', '9463 Komax Avenue', '(122) 952-8009')
;

INSERT INTO tbl.Books
	(title, publisher_ID)
	VALUES
	('The Lost Tribe', 2),
	('The Hobbit', 3),
	('The Fellowship of the Ring', 3),
	('The Two Towers', 3),
	('The Return of the King', 3),
	('The Silmarillion', 3),
	('The Adventures of Tom Bombadil', 3),
	('The Invisible Man', 1),
	('The Time Machine', 1),
	('The War of the Worlds', 1),
	('The Island of Doctor Moreu', 1),
	('The Call of Cthulu', 1),
	('At the Mountains of Madness', 1),
	('It', 2),
	('The Shining', 2),
	('The Green Mile', 2),
	('Mr. Mercedes', 2),
	('Pet Sematary', 2),
	('Misery', 2),
	('The Dark Tower', 2),
	('A Tale of Two Cities', 2),
	('The Adventures of Huckleberry Finn', 1),
	('The Great Gatsby', 3),
	('1984', 2),
	('Frankenstein', 1)
;

INSERT INTO tbl.BookAuthors
	(book_ID, author_name)
	VALUES
	(1, 'unknown'),
	(2, 'J.R.R Tolkien'),
	(3, 'J.R.R Tolkien'),
	(4, 'J.R.R Tolkien'),
	(5, 'J.R.R Tolkien'),
	(6, 'J.R.R Tolkien'),
	(7, 'J.R.R Tolkien'),
	(8, 'H.G. Wells'),
	(9, 'H.G. Wells'),
	(10, 'H.G. Wells'),
	(11, 'H.G. Wells'),
	(12, 'H.P. Lovecraft'),
	(13, 'H.P. Lovecraft'),
	(14, 'Stephen King'),
	(15, 'Stephen King'),
	(16, 'Stephen King'),
	(17, 'Stephen King'),
	(18, 'Stephen King'),
	(19, 'Stephen King'),
	(20, 'Stephen King'),
	(21, 'Charles Dickens'),
	(22, 'Mark Twain'),
	(23, 'F. Scott Fitzgerald'),
	(24, 'George Orwell'),
	(25, 'Mary Shelley')
;

INSERT INTO tbl.BookCopies
	(book_ID, branch_ID, number_of_copies)
	VALUES
	(1, 1000, 2),(2, 1000, 3),
	(3, 1000, 2),(4, 1000, 5),
	(5, 1000, 5),(6, 1000, 3),
	(7, 1000, 3),(8, 1000, 2),
	(9, 1000, 2),(10, 1000, 4),
	(11, 1000, 2),

	(8, 2000, 2),(9, 2000, 2),
	(10, 2000, 3),(11, 2000, 5),
	(12, 2000, 6),(13, 2000, 4),
	(14, 2000, 2),(15, 2000, 3),
	(16, 2000, 2),(17, 2000, 2),

	(12, 3000, 2),(13, 3000, 2),
	(14, 3000, 2),(15, 3000, 4),
	(16, 3000, 3),(17, 3000, 3),
	(18, 3000, 2),(19, 3000, 5),
	(20, 3000, 2),(21, 3000, 2),

	(2, 4000, 4),(3, 4000, 5),
	(4, 4000, 2),(5, 4000, 3),
	(6, 4000, 3),(7, 4000, 2),
	(21, 4000, 4),(22, 4000, 3),
	(23, 4000, 5),(24, 4000, 2),
	(25, 4000, 2)
;

INSERT INTO tbl.Borrower
	(name, address, phone)
	VALUES
	('Brett Daniels', '2010 Saskatoon Way', '(211) 411-2662'),
	('Cletus McGillicutty', '412 Manitoba Park', '(211) 411-2262'),
	('Sarah Marsters', '21 Lensler Road', '(211) 411-2132'),
	('Laura Rathburn', '45 Yukon Street', '(211) 411-1525'),
	('Samuel O Carrick', '909 Newfoundland Avenue', '(211) 414-9967'),
	('Borris Timchenko', '87 Anchorage Point', '(211) 653-2662'),
	('Anna DuMont', '39 Alberta Circle', '(211) 411-1190'),
	('Sharon Hammerfeld', '0023 Brunswick Lane', '(211) 494-0023')
;

INSERT INTO tbl.BookLoans
	(card_ID, book_ID, branch_ID, date_out, date_due)
	VALUES
	(1001, 1, 1000, '12-01-2015', '26-01-2015'), (1001, 2, 2000, '10-04-2015', '24-04-2015'), (1001, 3, 2000, '11-04-2015', '25-04-2015'),
	(1001, 5, 3000, '18-04-2015', '30-04-2015'), (1001, 4, 1000, '03-06-2015', '17-06-2015'), (1001, 6, 3000, '12-06-2015', '26-06-2015'),
    (1001, 8, 2000, '12-07-2015', '26-07-2015'), (1001, 7, 1000, '13-07-2015', '27-07-2015'), (1001, 12, 1000, '03-09-2015', '17-09-2015'), 
	(1001, 9, 1000, '12-09-2015', '26-09-2015'), (1001, 20, 4000, '02-10-2015', '16-10-2015'), (1001, 10, 1000, '12-12-2015', '26-12-2015'),

	(1003, 1, 1000, '12-01-2015', '26-01-2015'), (1003, 2, 2000, '10-04-2015', '24-04-2015'), (1003, 3, 2000, '11-04-2015', '25-04-2015'),
	(1003, 5, 3000, '18-04-2015', '30-04-2015'), (1003, 4, 1000, '03-06-2015', '17-06-2015'), (1003, 6, 3000, '12-06-2015', '26-06-2015'),
    (1003, 8, 2000, '12-07-2015', '26-07-2015'), (1003, 7, 1000, '13-07-2015', '27-07-2015'), (1003, 12, 1000, '03-09-2015', '17-09-2015'), 
	(1003, 9, 1000, '12-09-2015', '26-09-2015'), (1003, 20, 4000, '02-10-2015', '16-10-2015'), (1003, 10, 1000, '12-12-2015', '26-12-2015'),

	(1002, 1, 1000, '12-01-2016', '26-01-2016'), (1002, 2, 2000, '10-04-2016', '24-04-2016'), (1002, 3, 2000, '11-04-2016', '25-04-2016'),
	(1002, 5, 3000, '18-04-2016', '30-04-2016'), (1002, 4, 1000, '03-06-2016', '17-06-2016'), (1002, 6, 3000, '12-06-2016', '26-06-2016'),
    (1002, 8, 2000, '12-07-2016', '26-07-2016'), (1002, 7, 1000, '13-07-2016', '27-07-2016'), (1002, 12, 1000, '03-09-2015', '17-09-2016'), 
	(1002, 9, 1000, '12-09-2016', '26-09-2016'), (1002, 20, 4000, '02-10-2016', '16-10-2016'), (1002, 10, 1000, '12-12-2016', '26-12-2016'),

	(1004, 1, 1000, '12-01-2017', '26-01-2017'), (1004, 2, 2000, '10-04-2017', '24-04-2017'), (1004, 3, 2000, '11-04-2017', '25-04-2017'),
	(1004, 5, 3000, '18-04-2017', '30-04-2017'), (1004, 4, 1000, '03-06-2017', '17-06-2017'), (1004, 6, 3000, '12-06-2017', '26-06-2017'),
    (1004, 8, 2000, '12-07-2017', '26-07-2017'), (1004, 7, 1000, '13-07-2017', '27-07-2017'), (1004, 12, 1000, '03-09-2017', '17-09-2017'), 
	(1004, 9, 1000, '12-09-2017', '26-09-2017'), (1004, 20, 4000, '02-10-2017', '16-10-2017'), (1004, 10, 1000, '12-12-2017', '26-12-2017'),

	(1005, 2, 1000, '10-03-2019', '24-03-2019'), (1005, 3, 1000, '10-03-2019', '24-03-2019'), (1005, 4, 1000, '10-03-2019', '24-03-2019'), 
	(1005, 5, 1000, '10-03-2019', '24-03-2019'), (1005, 6, 1000, '10-03-2019', '24-03-2019'), (1005, 7, 1000, '10-03-2019', '24-03-2019'),

	(1006, 14, 1000, '10-03-2019', '24-03-2019'), (1006, 15, 1000, '10-03-2019', '24-03-2019'), (1006, 16, 1000, '10-03-2019', '24-03-2019'), 
	(1006, 17, 1000, '10-03-2019', '24-03-2019'), (1006, 18, 1000, '10-03-2019', '24-03-2019'), (1006, 19, 1000, '10-03-2019', '24-03-2019'),
	(1006, 20, 1000, '10-03-2019', '24-03-2019')
;
