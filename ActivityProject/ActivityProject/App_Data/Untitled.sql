CREATE TABLE [user] (
  [id] int(5) PRIMARY KEY IDENTITY(1, 1),
  [name] varchar(100),
  [email] varchar(100),
  [password] varchar(100),
  [registration_date] date,
  [role] bool
)
GO

CREATE TABLE [book_master] (
  [id] int(5) PRIMARY KEY IDENTITY(1, 1),
  [title] varchar(50),
  [author] varchar(50),
  [isbn] int(100),
  [genre] varchar(50)
)
GO

CREATE TABLE [borrow_books] (
  [id] int(5) PRIMARY KEY IDENTITY(1, 1),
  [book_id] int(5),
  [user_id] int(5),
  [borrowed_date] date,
  [due_date] date,
  [return_date] date DEFAULT (null)
)
GO

ALTER TABLE [borrow_books] ADD FOREIGN KEY ([user_id]) REFERENCES [user] ([id])
GO

CREATE TABLE [book_master_borrow_books] (
  [book_master_id] int(5),
  [borrow_books_book_id] int(5),
  PRIMARY KEY ([book_master_id], [borrow_books_book_id])
);
GO

ALTER TABLE [book_master_borrow_books] ADD FOREIGN KEY ([book_master_id]) REFERENCES [book_master] ([id]);
GO

ALTER TABLE [book_master_borrow_books] ADD FOREIGN KEY ([borrow_books_book_id]) REFERENCES [borrow_books] ([book_id]);
GO

