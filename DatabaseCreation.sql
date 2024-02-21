use GeoSnowDB_
GO

CREATE TABLE [dbo].[RESORT](
	[ResortID] int NOT NULL identity primary key, -- identity auto increments the number, primary key specficies 
	[Address] [nvarchar](max) NOT NULL, -- nvarchar(max) will allow up to 2^31-1 characters
	[Zipcode] [nvarchar](20) Not NULL, -- Sql is not case sensitive
	[City] [nvarchar](max) not NULL,
	[State] [nvarchar](max) not NULL,
	[Country] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Phone] [varchar](20) NULL,
	[ResortType] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	latitude DECIMAL(9,6) null, -- decimal(p,s): p = total number of digits, s = digits to the right of the decimal point. This would be ###.######
	longitude decimal(9,6)) -- default is null
GO

CREATE TABLE [dbo].[ROOM](
	[RoomID] [int] identity primary key, -- pk implies not null
	[ResortID] int NOT NULL FOREIGN KEY REFERENCES RESORT(ResortID), -- fks can be done in line or after the fact
	[NumBeds] [int] NOT NULL,
	[RoomType] [nchar](10) NULL,
	[numberNum] [int] NULL,
	[floor] [int] NULL)
GO

CREATE TABLE [dbo].[RoomAvailability](
	RoomAvailabilityID int identity primary key,
	[RoomID] [int] NOT NULL,
	[AvDate] [date] NOT NULL,
	[Price] [money] NOT NULL,
    FOREIGN KEY (RoomID) REFERENCES ROOM(RoomID))
GO

Alter table RoomAvailability
add constraint RoomDateUnique unique(RoomID,AvDate); -- uniqueness constraints usefull for alternate keys
GO

Create table ResortRatings(
	ResortRatingsID int  identity primary key,
	ResortID int foreign key references RESORT(ResortID) not null,
	rating int not null,
	userID char(36) null,
	comments nvarchar(max) null)
GO

Create table Cart(
	CartID uniqueidentifier NOT NULL primary key -- uniqueidentifier is a 36 long char that is unique to the database
		DEFAULT newid(), -- autogenerates unique identifier
	userID char(36) null,
	guestID char(36) null)
GO

Create table CartLines(
	CartID uniqueidentifier references cart(cartid) not null,
	RoomAvailabilityID int references RoomAvailability(RoomAvailiabilityID) not null,
	price money not null,
	adults int,
	children int)
GO

Create table RESERVATION(
	ReservationID uniqueidentifier NOT NULL primary key 
		DEFAULT newid(),
	userID char(36) null,
	guestID char(36) null,
	notes nvarchar(max),
	subtotal money,
	tax money,
	fees money,
	total money)
GO

create table ReservationLines(
	ReservationID uniqueidentifier NOT NULL references RESERVATION(ReservationID),
	RoomID int references Room(RoomID) not null,
	[AvDate] [date] NOT NULL,
	[Price] [money] NOT NULL,
	adults int,
	children int,
	notes nvarchar(max),
	ReservationStatus nvarchar(100)
GO

CREATE TABLE [dbo].[User](
    [UserID] [char](36) NOT NULL primary key, -- Assuming UUID for user identification
    [FirstName] [nvarchar](50) NULL, -- Nullable for guest accounts
    [LastName] [nvarchar](50) NULL, -- Nullable for guest accounts
    [Email] [nvarchar](100) NULL, -- Nullable for guest accounts
    [Password] [nvarchar](255) NULL, -- Nullable for guest accounts, assuming hashed passwords
    [PhoneNumber] [varchar](20) NULL,
    [CreateDate] [datetime] NOT NULL DEFAULT GETDATE(), -- Automatically set the date when the user is created
    [LastLoginDate] [datetime] NULL,
    [IsGuest] [bit] NOT NULL DEFAULT 0 -- 0 for registered users, 1 for guest accounts
)
GO

ALTER TABLE Reservation
ADD CONSTRAINT FK_Reservation_User
FOREIGN KEY (userID)
REFERENCES [User](UserID);
GO

ALTER TABLE ResortRatings
ADD CONSTRAINT FK_ResortRatings_User
FOREIGN KEY (userID)
REFERENCES [User](UserID);
GO

ALTER TABLE Cart
ADD CONSTRAINT FK_Cart_User
FOREIGN KEY (userID)
REFERENCES [User](UserID);
GO