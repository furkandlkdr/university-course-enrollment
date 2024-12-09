USE [Course_Enrollment]
GO

/****** Object:  Table [dbo].[Operation_Log]    Script Date: 10.12.2024 01:47:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Operation_Log](
	[Log_ID] [int] IDENTITY(1,1) NOT NULL,
	[Table_Name] [varchar](50) NOT NULL,
	[Operation_Type] [varchar](20) NOT NULL,
	[Record_ID] [int] NOT NULL,
	[Operation_Time] [datetime] NOT NULL,
 CONSTRAINT [PK_Operation_Log] PRIMARY KEY CLUSTERED 
(
	[Log_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
