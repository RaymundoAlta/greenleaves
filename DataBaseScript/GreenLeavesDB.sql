USE [master]
GO

/****** Object:  Database [GreenLeaves]    Script Date: 02/02/2021 06:10:23 p. m. ******/
CREATE DATABASE [GreenLeaves]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GreenLeaves', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\GreenLeaves.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'GreenLeaves_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\GreenLeaves_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [GreenLeaves] SET COMPATIBILITY_LEVEL = 110
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GreenLeaves].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [GreenLeaves] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [GreenLeaves] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [GreenLeaves] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [GreenLeaves] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [GreenLeaves] SET ARITHABORT OFF 
GO

ALTER DATABASE [GreenLeaves] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [GreenLeaves] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [GreenLeaves] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [GreenLeaves] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [GreenLeaves] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [GreenLeaves] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [GreenLeaves] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [GreenLeaves] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [GreenLeaves] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [GreenLeaves] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [GreenLeaves] SET  ENABLE_BROKER 
GO

ALTER DATABASE [GreenLeaves] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [GreenLeaves] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [GreenLeaves] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [GreenLeaves] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [GreenLeaves] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [GreenLeaves] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [GreenLeaves] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [GreenLeaves] SET RECOVERY FULL 
GO

ALTER DATABASE [GreenLeaves] SET  MULTI_USER 
GO

ALTER DATABASE [GreenLeaves] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [GreenLeaves] SET DB_CHAINING OFF 
GO

ALTER DATABASE [GreenLeaves] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [GreenLeaves] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [GreenLeaves] SET  READ_WRITE 
GO

USE [GreenLeaves]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Insert_Usuario]    Script Date: 02/02/2021 06:11:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Sp_Insert_Usuario]
@Nombre nvarchar(250),
@Telefono nvarchar(50),
@Email nvarchar (250),
@CiudadEstado nvarchar(max),
@Fecha Date
as
begin
Insert into Usuarios(
[Nombre],
[Telefono],
[Email],
[CiudadEstado],
[Creacion],
[CreadoPor]
)
Values (@Nombre, @Telefono, @Email, @CiudadEstado, @Fecha, 'SISTEMA')
end


GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 02/02/2021 06:11:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](250) NOT NULL,
	[Telefono] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
	[CiudadEstado] [nvarchar](max) NOT NULL,
	[Creacion] [datetime] NOT NULL,
	[CreadoPor] [nvarchar](100) NOT NULL,
	[Actulizado] [datetime] NULL,
	[ActualizadoPor] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
