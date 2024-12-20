USE [Course_Enrollment]
GO

/****** Object:  Table [dbo].[Course]    Script Date: 10.12.2024 01:45:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Course](
	[Course_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Credits] [int] NOT NULL,
	[Faculty_ID] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Course_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Faculty] FOREIGN KEY([Faculty_ID])
REFERENCES [dbo].[Faculty] ([Faculty_ID])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Faculty]
GO
