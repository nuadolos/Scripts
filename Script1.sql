USE [master]

CREATE DATABASE [Primer2]
GO
USE [Primer2]

CREATE TABLE [dbo].[Admin](
	[AdId] [int] NOT NULL,
	[AdPasswd] [nvarchar](100) NOT NULL,
	[AdName] [nvarchar](50) NOT NULL,
	[AdContact] [nvarchar](50) NOT NULL,
	[AdEmail] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[AdId] ASC
)
) ON [PRIMARY]




CREATE TABLE [dbo].[Customer](
	[CId] [int] NOT NULL,
	[CPasswd] [nvarchar](50) NOT NULL,
	[CTitle] [nvarchar](50) NOT NULL,
	[CFname] [nvarchar](50) NOT NULL,
	[CLname] [nvarchar](50) NOT NULL,
	[CIC] [nvarchar](50) NOT NULL,
	[CNationality] [nvarchar](50) NOT NULL,
	[CContact] [nvarchar](50) NOT NULL,
	[CEmail] [nvarchar](50) NOT NULL,
	[CBankAcc] [nvarchar](50) NOT NULL,
	[CBank] [nvarchar](50) NOT NULL,
	[TypeNum] [int] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CId] ASC
)
) ON [PRIMARY]




CREATE TABLE [dbo].[Invoice](
	[INum] [int] NOT NULL,
	[TotalFee] [money] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Date] [date] NOT NULL,
	[RxNum] [int] NOT NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[INum] ASC
)
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]




CREATE TABLE [dbo].[Rating](
	[RatingId] [int] NOT NULL,
	[Rating] [int] NOT NULL,
	[RmId] [int] NOT NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[RatingId] ASC
)
) ON [PRIMARY]



CREATE TABLE [dbo].[Reservation](
	[RxNum] [int] NOT NULL,
	[CIN] [nvarchar](50) NOT NULL,
	[COUT] [nvarchar](50) NOT NULL,
	[NON] [nvarchar](50) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[CId] [int] NOT NULL,
	[AdId] [int] NOT NULL,
	[RmId] [int] NOT NULL,
 CONSTRAINT [PK_Reservation] PRIMARY KEY CLUSTERED 
(
	[RxNum] ASC
)
) ON [PRIMARY]




CREATE TABLE [dbo].[Room](
	[RmId] [int] NOT NULL,
	[RmType] [nvarchar](50) NOT NULL,
	[RmBedding] [int] NOT NULL,
	[RmPrice] [money] NOT NULL,
	[RmStatus] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[RmId] ASC
)
) ON [PRIMARY]



 
CREATE TABLE [dbo].[Type](
	[TypeNum] [int] NOT NULL,
	[CType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[TypeNum] ASC
)
) ON [PRIMARY]


GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Type] FOREIGN KEY([TypeNum])
REFERENCES [dbo].[Type] ([TypeNum])
ON UPDATE CASCADE
ON DELETE CASCADE

ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Reservation] FOREIGN KEY([RxNum])
REFERENCES [dbo].[Reservation] ([RxNum])
ON UPDATE CASCADE
ON DELETE CASCADE

ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_Room] FOREIGN KEY([RmId])
REFERENCES [dbo].[Room] ([RmId])
ON UPDATE CASCADE
ON DELETE CASCADE

ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Admin] FOREIGN KEY([AdId])
REFERENCES [dbo].[Admin] ([AdId])
ON UPDATE CASCADE
ON DELETE CASCADE

ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Customer] FOREIGN KEY([CId])
REFERENCES [dbo].[Customer] ([CId])
ON UPDATE CASCADE
ON DELETE CASCADE

ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Room] FOREIGN KEY([RmId])
REFERENCES [dbo].[Room] ([RmId])
ON UPDATE CASCADE
ON DELETE CASCADE
