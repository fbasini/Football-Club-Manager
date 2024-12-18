USE [master]
GO
/****** Object:  Database [BDClubFutbol]    Script Date: 31/7/2024 18:25:00 ******/
CREATE DATABASE [BDClubFutbol]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDClubFutbol', FILENAME = N'C:\BDD\BDClubFutbol.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BDClubFutbol_log', FILENAME = N'C:\BDD\BDClubFutbol_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BDClubFutbol] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDClubFutbol].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDClubFutbol] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDClubFutbol] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDClubFutbol] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDClubFutbol] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDClubFutbol] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDClubFutbol] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BDClubFutbol] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDClubFutbol] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDClubFutbol] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDClubFutbol] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDClubFutbol] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDClubFutbol] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDClubFutbol] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDClubFutbol] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDClubFutbol] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BDClubFutbol] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDClubFutbol] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDClubFutbol] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDClubFutbol] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDClubFutbol] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDClubFutbol] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDClubFutbol] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDClubFutbol] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BDClubFutbol] SET  MULTI_USER 
GO
ALTER DATABASE [BDClubFutbol] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDClubFutbol] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDClubFutbol] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDClubFutbol] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BDClubFutbol] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BDClubFutbol] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BDClubFutbol] SET QUERY_STORE = ON
GO
ALTER DATABASE [BDClubFutbol] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BDClubFutbol]
GO
/****** Object:  Table [dbo].[Administradores]    Script Date: 31/7/2024 18:25:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administradores](
	[IdAdmin_A] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_A] [varchar](40) NOT NULL,
	[Apellido_A] [varchar](40) NOT NULL,
	[Dni_A] [char](8) NOT NULL,
	[Telefono_A] [varchar](20) NOT NULL,
	[Email_A] [varchar](50) NOT NULL,
	[IdUsuario_A] [int] NULL,
 CONSTRAINT [PK_Administradores] PRIMARY KEY CLUSTERED 
(
	[IdAdmin_A] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 31/7/2024 18:25:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[IdCategoria_C] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_C] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[IdCategoria_C] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grupos]    Script Date: 31/7/2024 18:25:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grupos](
	[IdGrupo_G] [int] IDENTITY(1,1) NOT NULL,
	[IdCategoria_G] [int] NOT NULL,
	[Descripcion_G] [varchar](50) NOT NULL,
	[Profesor_G] [varchar](50) NOT NULL,
	[Horario_G] [varchar](50) NOT NULL,
	[Arancel_G] [decimal](8, 2) NOT NULL,
 CONSTRAINT [PK_Grupos] PRIMARY KEY CLUSTERED 
(
	[IdGrupo_G] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GruposXSocios]    Script Date: 31/7/2024 18:25:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GruposXSocios](
	[IdGrupoXSocio_GxS] [int] IDENTITY(1,1) NOT NULL,
	[IdSocio_GxS] [int] NULL,
	[IdGrupo_GxS] [int] NULL,
 CONSTRAINT [PK_GrupoXSocio] PRIMARY KEY CLUSTERED 
(
	[IdGrupoXSocio_GxS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pagos]    Script Date: 31/7/2024 18:25:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pagos](
	[IdPago_P] [int] IDENTITY(1,1) NOT NULL,
	[IdSocio_P] [int] NOT NULL,
	[Monto_P] [decimal](8, 2) NOT NULL,
	[Fecha_P] [date] NOT NULL,
 CONSTRAINT [PK_Pagos] PRIMARY KEY CLUSTERED 
(
	[IdPago_P] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Responsables]    Script Date: 31/7/2024 18:25:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Responsables](
	[IdResponsable_R] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_R] [varchar](40) NULL,
	[Apellido_R] [varchar](40) NULL,
	[Dni_R] [char](8) NULL,
	[Genero_R] [varchar](40) NULL,
	[Telefono_R] [varchar](20) NULL,
 CONSTRAINT [PK_Responsables] PRIMARY KEY CLUSTERED 
(
	[IdResponsable_R] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Socios]    Script Date: 31/7/2024 18:25:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Socios](
	[IdSocio_S] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_S] [varchar](40) NOT NULL,
	[Apellido_S] [varchar](40) NOT NULL,
	[Dni_S] [char](8) NOT NULL,
	[Genero_S] [varchar](40) NOT NULL,
	[FechaNacimiento_S] [date] NOT NULL,
	[Ciudad_S] [varchar](40) NOT NULL,
	[Domicilio_S] [varchar](50) NOT NULL,
	[Telefono_S] [varchar](20) NULL,
	[Email_S] [varchar](50) NULL,
	[IdUsuario_S] [int] NULL,
	[IdResponsable_S] [int] NULL,
 CONSTRAINT [PK_Socios] PRIMARY KEY CLUSTERED 
(
	[IdSocio_S] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 31/7/2024 18:25:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdUsuario_U] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_U] [varchar](40) NOT NULL,
	[Contraseña_U] [varchar](40) NOT NULL,
	[Rol_U] [bit] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[IdUsuario_U] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Administradores] ON 

INSERT [dbo].[Administradores] ([IdAdmin_A], [Nombre_A], [Apellido_A], [Dni_A], [Telefono_A], [Email_A], [IdUsuario_A]) VALUES (1, N'Juan', N'Pérez', N'12345678', N'555-123-4567', N'juan.perez@email.com', 101)
INSERT [dbo].[Administradores] ([IdAdmin_A], [Nombre_A], [Apellido_A], [Dni_A], [Telefono_A], [Email_A], [IdUsuario_A]) VALUES (2, N'María', N'García', N'23456789', N'555-234-5678', N'maria.garcia@email.com', 102)
INSERT [dbo].[Administradores] ([IdAdmin_A], [Nombre_A], [Apellido_A], [Dni_A], [Telefono_A], [Email_A], [IdUsuario_A]) VALUES (3, N'Luis', N'Martínez', N'34567890', N'555-345-6789', N'luis.martinez@email.com', 103)
INSERT [dbo].[Administradores] ([IdAdmin_A], [Nombre_A], [Apellido_A], [Dni_A], [Telefono_A], [Email_A], [IdUsuario_A]) VALUES (4, N'Ana', N'López', N'45678901', N'555-456-7890', N'ana.lopez@email.com', 104)
INSERT [dbo].[Administradores] ([IdAdmin_A], [Nombre_A], [Apellido_A], [Dni_A], [Telefono_A], [Email_A], [IdUsuario_A]) VALUES (5, N'Carlos', N'Rodríguez', N'56789012', N'555-567-8901', N'carlos.rodriguez@email.com', 105)
SET IDENTITY_INSERT [dbo].[Administradores] OFF
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([IdCategoria_C], [Nombre_C]) VALUES (1, N'Infantil')
INSERT [dbo].[Categorias] ([IdCategoria_C], [Nombre_C]) VALUES (2, N'Adolescentes')
INSERT [dbo].[Categorias] ([IdCategoria_C], [Nombre_C]) VALUES (3, N'Adultos')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Grupos] ON 

INSERT [dbo].[Grupos] ([IdGrupo_G], [IdCategoria_G], [Descripcion_G], [Profesor_G], [Horario_G], [Arancel_G]) VALUES (1, 1, N'Grupo A', N'Profesor Gomez', N'10:30 - 11:30', CAST(5000.00 AS Decimal(8, 2)))
INSERT [dbo].[Grupos] ([IdGrupo_G], [IdCategoria_G], [Descripcion_G], [Profesor_G], [Horario_G], [Arancel_G]) VALUES (2, 2, N'Grupo B', N'Profesor Pacheco', N'15:30 - 17:30', CAST(7000.00 AS Decimal(8, 2)))
INSERT [dbo].[Grupos] ([IdGrupo_G], [IdCategoria_G], [Descripcion_G], [Profesor_G], [Horario_G], [Arancel_G]) VALUES (3, 3, N'Grupo C', N'Profesor Martinez', N'13:00 - 14:00', CAST(6000.00 AS Decimal(8, 2)))
INSERT [dbo].[Grupos] ([IdGrupo_G], [IdCategoria_G], [Descripcion_G], [Profesor_G], [Horario_G], [Arancel_G]) VALUES (4, 1, N'Grupo D', N'Profesor Gomez', N'11:00 - 12:00', CAST(5200.00 AS Decimal(8, 2)))
INSERT [dbo].[Grupos] ([IdGrupo_G], [IdCategoria_G], [Descripcion_G], [Profesor_G], [Horario_G], [Arancel_G]) VALUES (5, 2, N'Grupo E', N'Profesor Pacheco', N'16:30 - 18:30', CAST(7500.00 AS Decimal(8, 2)))
INSERT [dbo].[Grupos] ([IdGrupo_G], [IdCategoria_G], [Descripcion_G], [Profesor_G], [Horario_G], [Arancel_G]) VALUES (6, 3, N'Grupo F', N'Profesor Martinez', N'14:30 - 15:30', CAST(6500.00 AS Decimal(8, 2)))
INSERT [dbo].[Grupos] ([IdGrupo_G], [IdCategoria_G], [Descripcion_G], [Profesor_G], [Horario_G], [Arancel_G]) VALUES (7, 1, N'Grupo G', N'Profesor Gomez', N'09:00 - 11:00', CAST(6000.00 AS Decimal(8, 2)))
INSERT [dbo].[Grupos] ([IdGrupo_G], [IdCategoria_G], [Descripcion_G], [Profesor_G], [Horario_G], [Arancel_G]) VALUES (8, 2, N'Grupo H', N'Profesor Pacheco', N'14:00 - 16:00', CAST(7200.00 AS Decimal(8, 2)))
INSERT [dbo].[Grupos] ([IdGrupo_G], [IdCategoria_G], [Descripcion_G], [Profesor_G], [Horario_G], [Arancel_G]) VALUES (9, 3, N'Grupo I', N'Profesor Martinez', N'12:30 - 13:30', CAST(5800.00 AS Decimal(8, 2)))
INSERT [dbo].[Grupos] ([IdGrupo_G], [IdCategoria_G], [Descripcion_G], [Profesor_G], [Horario_G], [Arancel_G]) VALUES (17, 1, N'Grupo W', N'Juan Carlos', N'12:00 a 14:00', CAST(5500.00 AS Decimal(8, 2)))
INSERT [dbo].[Grupos] ([IdGrupo_G], [IdCategoria_G], [Descripcion_G], [Profesor_G], [Horario_G], [Arancel_G]) VALUES (18, 1, N'Grupo Z', N'Juan', N'12:00-14:00', CAST(5500.00 AS Decimal(8, 2)))
SET IDENTITY_INSERT [dbo].[Grupos] OFF
GO
SET IDENTITY_INSERT [dbo].[GruposXSocios] ON 

INSERT [dbo].[GruposXSocios] ([IdGrupoXSocio_GxS], [IdSocio_GxS], [IdGrupo_GxS]) VALUES (4, 6, 6)
SET IDENTITY_INSERT [dbo].[GruposXSocios] OFF
GO
SET IDENTITY_INSERT [dbo].[Pagos] ON 

INSERT [dbo].[Pagos] ([IdPago_P], [IdSocio_P], [Monto_P], [Fecha_P]) VALUES (1, 1, CAST(5000.00 AS Decimal(8, 2)), CAST(N'2023-01-15' AS Date))
INSERT [dbo].[Pagos] ([IdPago_P], [IdSocio_P], [Monto_P], [Fecha_P]) VALUES (2, 2, CAST(7000.00 AS Decimal(8, 2)), CAST(N'2023-02-10' AS Date))
INSERT [dbo].[Pagos] ([IdPago_P], [IdSocio_P], [Monto_P], [Fecha_P]) VALUES (3, 3, CAST(6000.00 AS Decimal(8, 2)), CAST(N'2023-03-05' AS Date))
INSERT [dbo].[Pagos] ([IdPago_P], [IdSocio_P], [Monto_P], [Fecha_P]) VALUES (4, 4, CAST(5200.00 AS Decimal(8, 2)), CAST(N'2023-04-20' AS Date))
INSERT [dbo].[Pagos] ([IdPago_P], [IdSocio_P], [Monto_P], [Fecha_P]) VALUES (5, 5, CAST(7500.00 AS Decimal(8, 2)), CAST(N'2023-05-12' AS Date))
INSERT [dbo].[Pagos] ([IdPago_P], [IdSocio_P], [Monto_P], [Fecha_P]) VALUES (6, 6, CAST(6500.00 AS Decimal(8, 2)), CAST(N'2023-06-08' AS Date))
INSERT [dbo].[Pagos] ([IdPago_P], [IdSocio_P], [Monto_P], [Fecha_P]) VALUES (7, 7, CAST(6000.00 AS Decimal(8, 2)), CAST(N'2023-07-25' AS Date))
INSERT [dbo].[Pagos] ([IdPago_P], [IdSocio_P], [Monto_P], [Fecha_P]) VALUES (8, 8, CAST(7200.00 AS Decimal(8, 2)), CAST(N'2023-08-30' AS Date))
INSERT [dbo].[Pagos] ([IdPago_P], [IdSocio_P], [Monto_P], [Fecha_P]) VALUES (9, 9, CAST(5800.00 AS Decimal(8, 2)), CAST(N'2023-09-05' AS Date))
INSERT [dbo].[Pagos] ([IdPago_P], [IdSocio_P], [Monto_P], [Fecha_P]) VALUES (11, 1, CAST(5000.00 AS Decimal(8, 2)), CAST(N'2023-11-22' AS Date))
INSERT [dbo].[Pagos] ([IdPago_P], [IdSocio_P], [Monto_P], [Fecha_P]) VALUES (12, 2, CAST(7000.00 AS Decimal(8, 2)), CAST(N'2023-12-01' AS Date))
INSERT [dbo].[Pagos] ([IdPago_P], [IdSocio_P], [Monto_P], [Fecha_P]) VALUES (13, 3, CAST(6000.00 AS Decimal(8, 2)), CAST(N'2023-01-14' AS Date))
INSERT [dbo].[Pagos] ([IdPago_P], [IdSocio_P], [Monto_P], [Fecha_P]) VALUES (14, 4, CAST(5200.00 AS Decimal(8, 2)), CAST(N'2023-02-28' AS Date))
INSERT [dbo].[Pagos] ([IdPago_P], [IdSocio_P], [Monto_P], [Fecha_P]) VALUES (15, 5, CAST(7500.00 AS Decimal(8, 2)), CAST(N'2023-03-07' AS Date))
INSERT [dbo].[Pagos] ([IdPago_P], [IdSocio_P], [Monto_P], [Fecha_P]) VALUES (16, 6, CAST(6500.00 AS Decimal(8, 2)), CAST(N'2023-04-15' AS Date))
INSERT [dbo].[Pagos] ([IdPago_P], [IdSocio_P], [Monto_P], [Fecha_P]) VALUES (17, 7, CAST(6000.00 AS Decimal(8, 2)), CAST(N'2023-05-19' AS Date))
INSERT [dbo].[Pagos] ([IdPago_P], [IdSocio_P], [Monto_P], [Fecha_P]) VALUES (18, 8, CAST(7200.00 AS Decimal(8, 2)), CAST(N'2023-06-03' AS Date))
INSERT [dbo].[Pagos] ([IdPago_P], [IdSocio_P], [Monto_P], [Fecha_P]) VALUES (19, 9, CAST(5800.00 AS Decimal(8, 2)), CAST(N'2023-07-29' AS Date))
INSERT [dbo].[Pagos] ([IdPago_P], [IdSocio_P], [Monto_P], [Fecha_P]) VALUES (22, 5, CAST(5000.00 AS Decimal(8, 2)), CAST(N'2020-06-12' AS Date))
INSERT [dbo].[Pagos] ([IdPago_P], [IdSocio_P], [Monto_P], [Fecha_P]) VALUES (23, 5, CAST(8000.00 AS Decimal(8, 2)), CAST(N'2023-11-22' AS Date))
SET IDENTITY_INSERT [dbo].[Pagos] OFF
GO
SET IDENTITY_INSERT [dbo].[Responsables] ON 

INSERT [dbo].[Responsables] ([IdResponsable_R], [Nombre_R], [Apellido_R], [Dni_R], [Genero_R], [Telefono_R]) VALUES (1, N'Responsable1', N'Apellido1', N'12345678', N'Femenino', N'555-111-1111')
INSERT [dbo].[Responsables] ([IdResponsable_R], [Nombre_R], [Apellido_R], [Dni_R], [Genero_R], [Telefono_R]) VALUES (2, N'Responsable2', N'Apellido2', N'23456789', N'Masculino', N'555-222-2222')
INSERT [dbo].[Responsables] ([IdResponsable_R], [Nombre_R], [Apellido_R], [Dni_R], [Genero_R], [Telefono_R]) VALUES (3, N'Responsable3', N'Apellido3', N'34567890', N'Femenino', N'555-333-3333')
INSERT [dbo].[Responsables] ([IdResponsable_R], [Nombre_R], [Apellido_R], [Dni_R], [Genero_R], [Telefono_R]) VALUES (4, N'Responsable4', N'Apellido4', N'45678901', N'Masculino', N'555-444-4444')
INSERT [dbo].[Responsables] ([IdResponsable_R], [Nombre_R], [Apellido_R], [Dni_R], [Genero_R], [Telefono_R]) VALUES (5, N'Responsable5', N'Apellido5', N'56789012', N'Femenino', N'555-555-4444')
INSERT [dbo].[Responsables] ([IdResponsable_R], [Nombre_R], [Apellido_R], [Dni_R], [Genero_R], [Telefono_R]) VALUES (6, N'Responsable6', N'Apellido6', N'67890123', N'Masculino', N'555-666-6666')
INSERT [dbo].[Responsables] ([IdResponsable_R], [Nombre_R], [Apellido_R], [Dni_R], [Genero_R], [Telefono_R]) VALUES (7, N'Responsable11', N'ApellidoResp11', N'30000000', N'Femenino', N'2222222222')
INSERT [dbo].[Responsables] ([IdResponsable_R], [Nombre_R], [Apellido_R], [Dni_R], [Genero_R], [Telefono_R]) VALUES (8, N'Responsable11', N'Apellido11', N'30000000', N'Femenino', N'555-777-7777')
INSERT [dbo].[Responsables] ([IdResponsable_R], [Nombre_R], [Apellido_R], [Dni_R], [Genero_R], [Telefono_R]) VALUES (22, N'nombre', N'apellido', N'14131213', N'Femenino', N'111-222-3333')
SET IDENTITY_INSERT [dbo].[Responsables] OFF
GO
SET IDENTITY_INSERT [dbo].[Socios] ON 

INSERT [dbo].[Socios] ([IdSocio_S], [Nombre_S], [Apellido_S], [Dni_S], [Genero_S], [FechaNacimiento_S], [Ciudad_S], [Domicilio_S], [Telefono_S], [Email_S], [IdUsuario_S], [IdResponsable_S]) VALUES (1, N'Socio1', N'Apellido1', N'12345678', N'Femenino', CAST(N'2008-01-15' AS Date), N'Ciudad1', N'Domicilio1', N'555-111-1111', N'socio1@email.com', 106, 1)
INSERT [dbo].[Socios] ([IdSocio_S], [Nombre_S], [Apellido_S], [Dni_S], [Genero_S], [FechaNacimiento_S], [Ciudad_S], [Domicilio_S], [Telefono_S], [Email_S], [IdUsuario_S], [IdResponsable_S]) VALUES (2, N'Socio2', N'Apellido2', N'23456789', N'Masculino', CAST(N'2009-03-20' AS Date), N'Ciudad2', N'Domicilio2', N'555-222-2222', N'socio2@email.com', 107, 2)
INSERT [dbo].[Socios] ([IdSocio_S], [Nombre_S], [Apellido_S], [Dni_S], [Genero_S], [FechaNacimiento_S], [Ciudad_S], [Domicilio_S], [Telefono_S], [Email_S], [IdUsuario_S], [IdResponsable_S]) VALUES (3, N'Socio3', N'Apellido3', N'34567890', N'Femenino', CAST(N'2010-05-10' AS Date), N'Ciudad3', N'Domicilio3', N'555-333-3333', N'socio3@email.com', 108, 3)
INSERT [dbo].[Socios] ([IdSocio_S], [Nombre_S], [Apellido_S], [Dni_S], [Genero_S], [FechaNacimiento_S], [Ciudad_S], [Domicilio_S], [Telefono_S], [Email_S], [IdUsuario_S], [IdResponsable_S]) VALUES (4, N'Socio4', N'Apellido4', N'45678901', N'Masculino', CAST(N'2012-07-25' AS Date), N'Ciudad4', N'Domicilio4', N'555-444-4444', N'socio4@email.com', 109, 4)
INSERT [dbo].[Socios] ([IdSocio_S], [Nombre_S], [Apellido_S], [Dni_S], [Genero_S], [FechaNacimiento_S], [Ciudad_S], [Domicilio_S], [Telefono_S], [Email_S], [IdUsuario_S], [IdResponsable_S]) VALUES (5, N'Socio5', N'Apellido5', N'56789012', N'Femenino', CAST(N'2013-10-08' AS Date), N'Ciudad555', N'Domicilio555', N'555-555-4444', N'socio5555@email.com', 110, 5)
INSERT [dbo].[Socios] ([IdSocio_S], [Nombre_S], [Apellido_S], [Dni_S], [Genero_S], [FechaNacimiento_S], [Ciudad_S], [Domicilio_S], [Telefono_S], [Email_S], [IdUsuario_S], [IdResponsable_S]) VALUES (6, N'Socio6', N'Apellido6', N'67890123', N'Masculino', CAST(N'2014-12-01' AS Date), N'Ciudad6', N'Domicilio6', N'555-666-6666', N'socio6@email.com', 111, 6)
INSERT [dbo].[Socios] ([IdSocio_S], [Nombre_S], [Apellido_S], [Dni_S], [Genero_S], [FechaNacimiento_S], [Ciudad_S], [Domicilio_S], [Telefono_S], [Email_S], [IdUsuario_S], [IdResponsable_S]) VALUES (7, N'Socio7', N'Apellido7', N'78901234', N'Femenino', CAST(N'2001-02-05' AS Date), N'Ciudad7', N'Domicilio7', N'555-777-7777', N'socio7@email.com', 112, NULL)
INSERT [dbo].[Socios] ([IdSocio_S], [Nombre_S], [Apellido_S], [Dni_S], [Genero_S], [FechaNacimiento_S], [Ciudad_S], [Domicilio_S], [Telefono_S], [Email_S], [IdUsuario_S], [IdResponsable_S]) VALUES (8, N'Socio8', N'Apellido8', N'89012345', N'Masculino', CAST(N'1998-08-12' AS Date), N'Ciudad8', N'Domicilio8', N'555-888-8888', N'socio8@email.com', 113, NULL)
INSERT [dbo].[Socios] ([IdSocio_S], [Nombre_S], [Apellido_S], [Dni_S], [Genero_S], [FechaNacimiento_S], [Ciudad_S], [Domicilio_S], [Telefono_S], [Email_S], [IdUsuario_S], [IdResponsable_S]) VALUES (9, N'Socio9', N'Apellido9', N'90123456', N'Femenino', CAST(N'2005-06-17' AS Date), N'Ciudad9', N'Domicilio9', N'555-999-9999', N'socio9@email.com', 114, NULL)
INSERT [dbo].[Socios] ([IdSocio_S], [Nombre_S], [Apellido_S], [Dni_S], [Genero_S], [FechaNacimiento_S], [Ciudad_S], [Domicilio_S], [Telefono_S], [Email_S], [IdUsuario_S], [IdResponsable_S]) VALUES (11, N'Socio11', N'Apellido11', N'12345678', N'Femenino', CAST(N'2008-01-15' AS Date), N'Ciudad1', N'Domicilio1', N'555-111-1111', N'socio11@email.com', 116, NULL)
INSERT [dbo].[Socios] ([IdSocio_S], [Nombre_S], [Apellido_S], [Dni_S], [Genero_S], [FechaNacimiento_S], [Ciudad_S], [Domicilio_S], [Telefono_S], [Email_S], [IdUsuario_S], [IdResponsable_S]) VALUES (12, N'Socio12', N'Apellido12', N'23456789', N'Masculino', CAST(N'2009-03-20' AS Date), N'Ciudad2', N'Domicilio2', N'555-222-2222', N'socio12@email.com', 117, NULL)
INSERT [dbo].[Socios] ([IdSocio_S], [Nombre_S], [Apellido_S], [Dni_S], [Genero_S], [FechaNacimiento_S], [Ciudad_S], [Domicilio_S], [Telefono_S], [Email_S], [IdUsuario_S], [IdResponsable_S]) VALUES (13, N'Socio13', N'Apellido13', N'34567890', N'Femenino', CAST(N'2010-05-10' AS Date), N'Ciudad3', N'Domicilio3', N'555-333-3333', N'socio13@email.com', 118, NULL)
INSERT [dbo].[Socios] ([IdSocio_S], [Nombre_S], [Apellido_S], [Dni_S], [Genero_S], [FechaNacimiento_S], [Ciudad_S], [Domicilio_S], [Telefono_S], [Email_S], [IdUsuario_S], [IdResponsable_S]) VALUES (14, N'Socio142', N'Apellido14', N'45678901', N'Masculino', CAST(N'2012-07-25' AS Date), N'Ciudad4', N'Domicilio4', N'555-444-4444', N'socio14@email.com', 119, NULL)
SET IDENTITY_INSERT [dbo].[Socios] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([IdUsuario_U], [Nombre_U], [Contraseña_U], [Rol_U]) VALUES (101, N'UsuarioAdmin1', N'ContraseñaAdmin1', 1)
INSERT [dbo].[Usuarios] ([IdUsuario_U], [Nombre_U], [Contraseña_U], [Rol_U]) VALUES (102, N'UsuarioAdmin2', N'ContraseñaAdmin2', 1)
INSERT [dbo].[Usuarios] ([IdUsuario_U], [Nombre_U], [Contraseña_U], [Rol_U]) VALUES (103, N'UsuarioAdmin3', N'ContraseñaAdmin3', 1)
INSERT [dbo].[Usuarios] ([IdUsuario_U], [Nombre_U], [Contraseña_U], [Rol_U]) VALUES (104, N'UsuarioAdmin4', N'ContraseñaAdmin4', 1)
INSERT [dbo].[Usuarios] ([IdUsuario_U], [Nombre_U], [Contraseña_U], [Rol_U]) VALUES (105, N'UsuarioAdmin5', N'ContraseñaAdmin5', 1)
INSERT [dbo].[Usuarios] ([IdUsuario_U], [Nombre_U], [Contraseña_U], [Rol_U]) VALUES (106, N'UsuarioSocio1', N'Contraseña1', 0)
INSERT [dbo].[Usuarios] ([IdUsuario_U], [Nombre_U], [Contraseña_U], [Rol_U]) VALUES (107, N'UsuarioSocio2', N'Contraseña2', 0)
INSERT [dbo].[Usuarios] ([IdUsuario_U], [Nombre_U], [Contraseña_U], [Rol_U]) VALUES (108, N'UsuarioSocio3', N'Contraseña3', 0)
INSERT [dbo].[Usuarios] ([IdUsuario_U], [Nombre_U], [Contraseña_U], [Rol_U]) VALUES (109, N'UsuarioSocio4', N'Contraseña4', 0)
INSERT [dbo].[Usuarios] ([IdUsuario_U], [Nombre_U], [Contraseña_U], [Rol_U]) VALUES (110, N'UsuarioSocio5', N'Contraseña555', 0)
INSERT [dbo].[Usuarios] ([IdUsuario_U], [Nombre_U], [Contraseña_U], [Rol_U]) VALUES (111, N'UsuarioSocio6', N'Contraseña6', 0)
INSERT [dbo].[Usuarios] ([IdUsuario_U], [Nombre_U], [Contraseña_U], [Rol_U]) VALUES (112, N'UsuarioSocio7', N'Contraseña7', 0)
INSERT [dbo].[Usuarios] ([IdUsuario_U], [Nombre_U], [Contraseña_U], [Rol_U]) VALUES (113, N'UsuarioSocio8', N'Contraseña8', 0)
INSERT [dbo].[Usuarios] ([IdUsuario_U], [Nombre_U], [Contraseña_U], [Rol_U]) VALUES (114, N'UsuarioSocio9', N'Contraseña9', 0)
INSERT [dbo].[Usuarios] ([IdUsuario_U], [Nombre_U], [Contraseña_U], [Rol_U]) VALUES (115, N'UsuarioSocio10', N'Contraseña10', 0)
INSERT [dbo].[Usuarios] ([IdUsuario_U], [Nombre_U], [Contraseña_U], [Rol_U]) VALUES (116, N'UsuarioSocio11', N'Contraseña11', 0)
INSERT [dbo].[Usuarios] ([IdUsuario_U], [Nombre_U], [Contraseña_U], [Rol_U]) VALUES (117, N'UsuarioSocio12', N'Contraseña12', 0)
INSERT [dbo].[Usuarios] ([IdUsuario_U], [Nombre_U], [Contraseña_U], [Rol_U]) VALUES (118, N'UsuarioSocio13', N'Contraseña13', 0)
INSERT [dbo].[Usuarios] ([IdUsuario_U], [Nombre_U], [Contraseña_U], [Rol_U]) VALUES (119, N'UsuarioSocio14', N'Contraseña14', 0)
INSERT [dbo].[Usuarios] ([IdUsuario_U], [Nombre_U], [Contraseña_U], [Rol_U]) VALUES (120, N'UsuarioSocio15', N'Contraseña15', 0)
INSERT [dbo].[Usuarios] ([IdUsuario_U], [Nombre_U], [Contraseña_U], [Rol_U]) VALUES (183, N'UsuarioSocio16', N'asd', 0)
INSERT [dbo].[Usuarios] ([IdUsuario_U], [Nombre_U], [Contraseña_U], [Rol_U]) VALUES (184, N'UsuarioSocio17', N'asd', 0)
INSERT [dbo].[Usuarios] ([IdUsuario_U], [Nombre_U], [Contraseña_U], [Rol_U]) VALUES (185, N'UsuarioSocio18', N'asd', 0)
INSERT [dbo].[Usuarios] ([IdUsuario_U], [Nombre_U], [Contraseña_U], [Rol_U]) VALUES (186, N'UsuarioSocio19', N'asd', 0)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Administradores]  WITH NOCHECK ADD  CONSTRAINT [FK_Administradores_Usuarios] FOREIGN KEY([IdUsuario_A])
REFERENCES [dbo].[Usuarios] ([IdUsuario_U])
GO
ALTER TABLE [dbo].[Administradores] CHECK CONSTRAINT [FK_Administradores_Usuarios]
GO
ALTER TABLE [dbo].[Grupos]  WITH NOCHECK ADD  CONSTRAINT [FK_Grupos_Categorias] FOREIGN KEY([IdCategoria_G])
REFERENCES [dbo].[Categorias] ([IdCategoria_C])
GO
ALTER TABLE [dbo].[Grupos] CHECK CONSTRAINT [FK_Grupos_Categorias]
GO
ALTER TABLE [dbo].[GruposXSocios]  WITH NOCHECK ADD  CONSTRAINT [FK_GruposXSocios_Grupos] FOREIGN KEY([IdGrupo_GxS])
REFERENCES [dbo].[Grupos] ([IdGrupo_G])
GO
ALTER TABLE [dbo].[GruposXSocios] CHECK CONSTRAINT [FK_GruposXSocios_Grupos]
GO
ALTER TABLE [dbo].[GruposXSocios]  WITH NOCHECK ADD  CONSTRAINT [FK_GruposXSocios_Socios] FOREIGN KEY([IdSocio_GxS])
REFERENCES [dbo].[Socios] ([IdSocio_S])
GO
ALTER TABLE [dbo].[GruposXSocios] CHECK CONSTRAINT [FK_GruposXSocios_Socios]
GO
ALTER TABLE [dbo].[Socios]  WITH NOCHECK ADD  CONSTRAINT [FK_Socios_Responsables] FOREIGN KEY([IdResponsable_S])
REFERENCES [dbo].[Responsables] ([IdResponsable_R])
GO
ALTER TABLE [dbo].[Socios] CHECK CONSTRAINT [FK_Socios_Responsables]
GO
ALTER TABLE [dbo].[Socios]  WITH NOCHECK ADD  CONSTRAINT [FK_Socios_Usuarios] FOREIGN KEY([IdUsuario_S])
REFERENCES [dbo].[Usuarios] ([IdUsuario_U])
GO
ALTER TABLE [dbo].[Socios] CHECK CONSTRAINT [FK_Socios_Usuarios]
GO
/****** Object:  StoredProcedure [dbo].[Sp_agregarAdministrador]    Script Date: 31/7/2024 18:25:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_agregarAdministrador](
	@nombre VARCHAR(40),
	@apellido VARCHAR(40),
	@dni CHAR(8),
	@telefono varchar(20),
	@email varchar(50),
	@idUsuario int
)
AS
BEGIN 
INSERT INTO Administradores(Nombre_A, Apellido_A, Dni_A, Telefono_A, Email_A, IdUsuario_A)
VALUES (@nombre, @apellido, @Dni, @telefono, @email, @idUsuario)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarGrupo]    Script Date: 31/7/2024 18:25:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_AgregarGrupo]
	(
		@idCategoria int,
		@descripcion varchar(50),
		@profresor varchar(50),
		@horario varchar(50),
		@arancel decimal(8,2)
	)
as
insert into Grupos
	(
		IdCategoria_G,
		Descripcion_G,
		Profesor_G,
		Horario_G,
		Arancel_G
	)
values
	(
		@idCategoria,
		@descripcion,
		@profresor,
		@horario,
		@arancel
	)
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarGrupoXSocio]    Script Date: 31/7/2024 18:25:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_AgregarGrupoXSocio]
	(
		@idgrupo int,
		@idsocio int
	)
as
insert into GruposXSocios
	(
		IdGrupo_GxS,
		IdSocio_GxS
	)
values
	(
		@idgrupo,
		@idsocio
	)
GO
/****** Object:  StoredProcedure [dbo].[Sp_AgregarIdResponsable]    Script Date: 31/7/2024 18:25:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_AgregarIdResponsable]
(
	@idSocio INT,
	@idResponsable INT
)
AS
UPDATE Socios
SET IdResponsable_S = @idResponsable
WHERE IdSocio_S = @idSocio
GO
/****** Object:  StoredProcedure [dbo].[Sp_AgregarPago]    Script Date: 31/7/2024 18:25:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_AgregarPago]
(
	@Id_Socio int,
	@Monto_P float,
	@Fecha_P VARCHAR(50)
)
AS
BEGIN
INSERT INTO Pagos(IdSocio_P, Monto_P, Fecha_P)
VALUES(@Id_Socio,@Monto_P,@Fecha_P)
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_AgregarResponsable]    Script Date: 31/7/2024 18:25:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_AgregarResponsable]
(
	@nombre VARCHAR(40),
	@apellido VARCHAR(40),
	@dni CHAR(8),
	@genero VARCHAR(40),
	@telefono VARCHAR(20)
)
AS
BEGIN
INSERT INTO Responsables(Nombre_R, Apellido_R, Dni_R, Genero_R, Telefono_R)
VALUES
(@nombre, @apellido, @dni, @genero, @telefono)
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_AgregarSocio]    Script Date: 31/7/2024 18:25:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_AgregarSocio]
(
	@nombre VARCHAR(40),
	@apellido VARCHAR(40),
	@dni CHAR(8),
	@genero VARCHAR(40),
	@nacimiento DATE,
	@ciudad VARCHAR(40),
	@domicilio VARCHAR(40),
	@telefono VARCHAR(20),
	@email VARCHAR(50),
	@idResponsable INT,
	@idUsuario INT
)
AS
BEGIN
INSERT INTO Socios(Nombre_S, Apellido_S, Dni_S, Genero_S, FechaNacimiento_S, Ciudad_S, Domicilio_S, Telefono_S, Email_S, IdResponsable_S, IdUsuario_S)
VALUES(@nombre, @apellido, @dni, @genero, @nacimiento, @ciudad, @domicilio, @telefono, @email, @idResponsable,@idUsuario)
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_AgregarUsuario]    Script Date: 31/7/2024 18:25:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_AgregarUsuario]
(
	@nombre VARCHAR(40),
	@contraseña VARCHAR(40),
	@rol BIT
)
AS
BEGIN
INSERT INTO Usuarios(nombre_U, Contraseña_U, Rol_U)
VALUES(@nombre, @contraseña, @rol)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarGrupo]    Script Date: 31/7/2024 18:25:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_EliminarGrupo]
(@idgrupo int)
as
delete from Grupos
where IdGrupo_G=@idgrupo
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarGrupoXSocio]    Script Date: 31/7/2024 18:25:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_EliminarGrupoXSocio]
(@idgrupo int)
as
delete from GruposXSocios
where IdGrupo_GxS=@idgrupo;
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarPago]    Script Date: 31/7/2024 18:25:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_EliminarPago]
(@IdPago_P int)
as
delete from Pagos
where IdPago_P=@IdPago_P
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarRegistroGruposPorSocios]    Script Date: 31/7/2024 18:25:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EliminarRegistroGruposPorSocios]
(
	@IdSocio INT	
)
AS
DELETE FROM GruposXSocios WHERE IdSocio_GxS = @IdSocio
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarRegistroPagos]    Script Date: 31/7/2024 18:25:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EliminarRegistroPagos]
(
	@IdSocio INT
)
AS
DELETE FROM Pagos WHERE IdSocio_P = @IdSocio
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarSocio]    Script Date: 31/7/2024 18:25:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EliminarSocio]
(
	@IdSocio INT
)
AS
DELETE FROM Socios
WHERE IdSocio_S = @IdSocio
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarContraseña]    Script Date: 31/7/2024 18:25:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ModificarContraseña]
(
	@idUsuario int,
	@contraseña varchar(50)
)
AS
UPDATE Usuarios
SET Contraseña_U = @contraseña WHERE IdUsuario_U = @idUsuario
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarGrupo]    Script Date: 31/7/2024 18:25:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_ModificarGrupo]
	(
		@idGrupo int, 
		--@idCategoria int,
		@descripcion varchar(50),
		@profresor varchar(50),
		@horario varchar(50),
		@arancel decimal(8,2)
	)
as
update Grupos
set
	--IdCategoria_G = @idCategoria,
	Descripcion_G = @descripcion,
	Profesor_G = @profresor,
	Horario_G = @horario,
	Arancel_G = @arancel

where IdGrupo_G=@idGrupo
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarPago]    Script Date: 31/7/2024 18:25:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_ModificarPago]
	(
		@IdPago_P int,
		@IdSocio_P int,
		@Monto_P float,
		@Fecha_P varchar(50)
	)
as
update Pagos
set
      	IdSocio_P = @IdSocio_P,
      	Monto_P = @Monto_P,
      	Fecha_P = @Fecha_P

where IdPago_P=@IdPago_P
GO
/****** Object:  StoredProcedure [dbo].[Sp_ModificarResponsable]    Script Date: 31/7/2024 18:25:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_ModificarResponsable]
(
	@idResponsable int,
	@telefono varchar(50)
)
AS
UPDATE Responsables
SET
Telefono_R = @telefono
WHERE IdResponsable_R = @idResponsable
GO
/****** Object:  StoredProcedure [dbo].[Sp_ModificarSocio]    Script Date: 31/7/2024 18:25:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_ModificarSocio]
(
	@idSocio int,
	@nombre varchar(50),
	@apellido varchar(50),
	@dni int,
	@ciudad varchar(50),
	@domicilio varchar(50),
	@telefono varchar(50),
	@email varchar(50)
)
AS
UPDATE Socios
SET
Nombre_S = @nombre,
Apellido_S = @apellido,
Dni_S = @dni,
Ciudad_S = @ciudad,
Domicilio_S = @domicilio,
Telefono_S = @telefono,
Email_S = @email
WHERE IdSocio_S = @idSocio
GO
USE [master]
GO
ALTER DATABASE [BDClubFutbol] SET  READ_WRITE 
GO
