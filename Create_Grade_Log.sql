USE [Course_Enrollment]
GO

/****** Object:  Table [dbo].[Grade_Log]    Script Date: 10.12.2024 01:47:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Grade_Log](
	[Log_ID] [int] IDENTITY(1,1) NOT NULL,
	[Enroll_ID] [int] NOT NULL,
	[Old_Grade] [float] NULL,
	[New_Grade] [float] NOT NULL,
	[Update_Time] [datetime] NOT NULL,
 CONSTRAINT [PK_Grade_Log] PRIMARY KEY CLUSTERED 
(
	[Log_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
