USE [mealplanner]
GO
/****** Object:  Table [dbo].[meal]    Script Date: 4/13/2017 8:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[meal](
	[meal_id] [int] IDENTITY(1,1) NOT NULL,
	[meal_name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[meal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[meal_recipe]    Script Date: 4/13/2017 8:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[meal_recipe](
	[meal_recipe_id] [int] IDENTITY(1,1) NOT NULL,
	[meal_id] [int] NULL,
	[recipe_id] [int] NULL,
	[user_id] [int] NULL,
	[meal_type] [varchar](100) NULL,
 CONSTRAINT [pk_meal_recipe] PRIMARY KEY CLUSTERED 
(
	[meal_recipe_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[preparation_steps]    Script Date: 4/13/2017 8:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[preparation_steps](
	[step_id] [int] IDENTITY(1,1) NOT NULL,
	[recipe_id] [int] NOT NULL,
	[steps] [varchar](255) NOT NULL,
 CONSTRAINT [pk_preparation_steps] PRIMARY KEY CLUSTERED 
(
	[step_id] ASC,
	[recipe_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[recipe]    Script Date: 4/13/2017 8:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[recipe](
	[recipe_id] [int] IDENTITY(1,1) NOT NULL,
	[recipe_name] [varchar](255) NOT NULL,
	[recipe_type] [varchar](255) NULL,
	[image_name] [varchar](255) NULL,
	[recipe_description] [varchar](255) NULL,
	[cook_time] [int] NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[recipe_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[recipe_ingredient]    Script Date: 4/13/2017 8:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[recipe_ingredient](
	[recipe_id] [int] NOT NULL,
	[ingredient_name] [varchar](100) NOT NULL,
	[quantity] [varchar](100) NULL,
	[measurement] [varchar](100) NULL,
 CONSTRAINT [pk_recipe_ingredient] PRIMARY KEY CLUSTERED 
(
	[recipe_id] ASC,
	[ingredient_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[users]    Script Date: 4/13/2017 8:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[userName] [varchar](256) NULL,
	[email] [varchar](255) NOT NULL,
	[password] [varchar](32) NOT NULL,
	[salt] [varchar](64) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[meal_recipe]  WITH CHECK ADD  CONSTRAINT [fk_mr_meal] FOREIGN KEY([meal_id])
REFERENCES [dbo].[meal] ([meal_id])
GO
ALTER TABLE [dbo].[meal_recipe] CHECK CONSTRAINT [fk_mr_meal]
GO
ALTER TABLE [dbo].[meal_recipe]  WITH CHECK ADD  CONSTRAINT [fk_mr_recipe] FOREIGN KEY([recipe_id])
REFERENCES [dbo].[recipe] ([recipe_id])
GO
ALTER TABLE [dbo].[meal_recipe] CHECK CONSTRAINT [fk_mr_recipe]
GO
ALTER TABLE [dbo].[meal_recipe]  WITH CHECK ADD  CONSTRAINT [fk_mr_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[meal_recipe] CHECK CONSTRAINT [fk_mr_user]
GO
ALTER TABLE [dbo].[preparation_steps]  WITH CHECK ADD  CONSTRAINT [fk_preparation_steps] FOREIGN KEY([recipe_id])
REFERENCES [dbo].[recipe] ([recipe_id])
GO
ALTER TABLE [dbo].[preparation_steps] CHECK CONSTRAINT [fk_preparation_steps]
GO
ALTER TABLE [dbo].[recipe]  WITH CHECK ADD  CONSTRAINT [fk_recipe_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[recipe] CHECK CONSTRAINT [fk_recipe_user]
GO
ALTER TABLE [dbo].[recipe_ingredient]  WITH CHECK ADD  CONSTRAINT [fk_recipe_ingredient] FOREIGN KEY([recipe_id])
REFERENCES [dbo].[recipe] ([recipe_id])
GO
ALTER TABLE [dbo].[recipe_ingredient] CHECK CONSTRAINT [fk_recipe_ingredient]
GO
