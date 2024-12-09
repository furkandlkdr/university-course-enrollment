USE [Course_Enrollment]
GO

/****** Object:  Table [dbo].[Enrollment]    Script Date: 10.12.2024 01:46:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Enrollment](
	[Enroll_ID] [int] IDENTITY(1,1) NOT NULL,
	[Student_ID] [int] NULL,
	[Course_ID] [int] NULL,
	[Term] [int] NOT NULL,
	[Grade] [float] NULL,
 CONSTRAINT [PK_Enrollment] PRIMARY KEY CLUSTERED 
(
	[Enroll_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Course] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([Course_ID])
GO

ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Course]
GO

ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Student] FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Student] ([Student_ID])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Student]
GO
