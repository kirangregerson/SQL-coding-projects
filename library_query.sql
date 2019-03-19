USE db_library;

CREATE PROCEDURE dbo.uspGetLostTribeNo 
AS
	SELECT SUM(number_of_copies)
	FROM tbl.BookCopies
	WHERE book_ID = 1 AND branch_ID = 1000
;

CREATE PROCEDURE dbo.uspGetLostTribeBranch
AS
	SELECT
		t1.branch_name,  t3.title, t2.number_of_copies
	FROM
		tbl.LibraryBranch t1
		INNER JOIN tbl.BookCopies t2 ON t2.branch_id = t1.branch_id
		INNER JOIN tbl.Books t3 ON t3.book_id = t2.book_id
	WHERE
		t3.book_ID = 1
;

CREATE PROCEDURE dbo.uspGetUnloanedBorrowers
AS
	SELECT DISTINCT
		t1.name
	FROM
		tbl.Borrower t1
	WHERE NOT EXISTS
		(SELECT card_ID FROM tbl.BookLoans WHERE t1.card_ID = tbl.BookLoans.card_ID)
;

CREATE PROCEDURE dbo.uspGetBorrowerBookNameAddress AS
	SELECT 
		t3.title, t1.name, t1.address
	FROM 
		tbl.Borrower t1
		INNER JOIN tbl.BookLoans t2 ON t2.card_ID = t1.card_ID
		INNER JOIN tbl.Books t3 ON t3.book_ID = t2.book_ID
	WHERE 
		t2.branch_ID = 2000
;

CREATE PROCEDURE dbo.uspGetBranchNameLoans
AS
SELECT 
	t1.branch_name AS 'Branch Name', COUNT(*) AS 'Number of Loans'
FROM 
	tbl.LibraryBranch t1
	INNER JOIN tbl.BookLoans t2 ON t1.branch_ID = t2.branch_ID
GROUP BY t1.branch_name
;

CREATE PROCEDURE dbo.uspGetBorrowersLoansMoreThan5
AS
	SELECT
		t1.name, COUNT(*) AS 'Number of Loans'
	FROM
		tbl.Borrower t1 
		INNER JOIN tbl.BookLoans t2 ON t1.card_ID = t2.card_ID
	GROUP BY t1.name 
	HAVING  COUNT(*) >= 5
;

CREATE PROCEDURE dbo.uspGetCentralStephenKingCopies
AS
	SELECT
		t3.title, t2.number_of_copies AS 'number of copies'
	FROM 
		tbl.LibraryBranch t1 
		INNER JOIN tbl.BookCopies t2 ON t1.branch_ID = t2.branch_ID
		INNER JOIN tbl.Books t3 ON t2.book_ID = t3.book_ID
		INNER JOIN tbl.BookAuthors t4 ON t3.book_ID = t4.book_ID
	WHERE t4.author_name = 'Stephen King' AND t1.branch_name = 'Central'
;
