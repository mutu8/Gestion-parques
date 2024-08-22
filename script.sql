USE [master]
GO
/****** Object:  Database [BD_GestionAmbiental]    Script Date: 21/08/2024 20:09:48 ******/
CREATE DATABASE [BD_GestionAmbiental]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BD_GestionAmbiental', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BD_GestionAmbiental.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BD_GestionAmbiental_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BD_GestionAmbiental_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BD_GestionAmbiental] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BD_GestionAmbiental].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BD_GestionAmbiental] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BD_GestionAmbiental] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BD_GestionAmbiental] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BD_GestionAmbiental] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BD_GestionAmbiental] SET ARITHABORT OFF 
GO
ALTER DATABASE [BD_GestionAmbiental] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BD_GestionAmbiental] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BD_GestionAmbiental] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BD_GestionAmbiental] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BD_GestionAmbiental] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BD_GestionAmbiental] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BD_GestionAmbiental] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BD_GestionAmbiental] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BD_GestionAmbiental] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BD_GestionAmbiental] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BD_GestionAmbiental] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BD_GestionAmbiental] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BD_GestionAmbiental] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BD_GestionAmbiental] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BD_GestionAmbiental] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BD_GestionAmbiental] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BD_GestionAmbiental] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BD_GestionAmbiental] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BD_GestionAmbiental] SET  MULTI_USER 
GO
ALTER DATABASE [BD_GestionAmbiental] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BD_GestionAmbiental] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BD_GestionAmbiental] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BD_GestionAmbiental] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BD_GestionAmbiental] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BD_GestionAmbiental] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BD_GestionAmbiental] SET QUERY_STORE = ON
GO
ALTER DATABASE [BD_GestionAmbiental] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BD_GestionAmbiental]
GO
/****** Object:  Table [dbo].[Asistencias]    Script Date: 21/08/2024 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asistencias](
	[ID_Asistencia] [int] IDENTITY(1,1) NOT NULL,
	[Fecha_Asistencia] [date] NOT NULL,
	[ID_Empleado] [int] NOT NULL,
	[ID_Opcion] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Asistencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalles_Localidades]    Script Date: 21/08/2024 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalles_Localidades](
	[ID_Detalle_Localidad] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](max) NULL,
	[Referencias] [nvarchar](max) NULL,
	[Urbanizacion] [nvarchar](100) NULL,
	[Sector] [nvarchar](50) NULL,
	[Direccion] [nvarchar](255) NULL,
	[Latitud] [decimal](10, 8) NULL,
	[Longitud] [decimal](11, 8) NULL,
	[url_Localidad] [nvarchar](max) NULL,
	[ID_Empleado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Detalle_Localidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 21/08/2024 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[ID_Empleado] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [nvarchar](100) NOT NULL,
	[Apellidos] [nvarchar](100) NOT NULL,
	[esApoyo] [bit] NULL,
	[urlFoto] [varchar](255) NULL,
	[DireccionCorreo] [nvarchar](100) NULL,
	[DNI] [nvarchar](8) NULL,
	[FechaNacimiento] [date] NULL,
	[EstadoActivo] [bit] NULL,
	[esPersonalLimpieza] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localidades]    Script Date: 21/08/2024 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localidades](
	[ID_Localidad] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Localidad] [nvarchar](100) NULL,
	[ID_Detalle_Localidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Localidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Opcion]    Script Date: 21/08/2024 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opcion](
	[ID_Opcion] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Opcion] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Opcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Visitas]    Script Date: 21/08/2024 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visitas](
	[ID_Visita] [int] IDENTITY(1,1) NOT NULL,
	[Fecha_Visita] [date] NULL,
	[Estado] [bit] NULL,
	[ID_Localidad] [int] NULL,
	[ID_Empleado] [int] NULL,
	[Nota] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Visita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Detalles_Localidades] ON 

INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (1, N'', N'', N'', N'Liberación Social', N'Liberación Social', CAST(-8.14309248 AS Decimal(10, 8)), CAST(-79.05560419 AS Decimal(11, 8)), N'', 1)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (2, N'', N'', N'', N'Liberación Social', N'Liberación Social', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), N'', 1)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (3, N'', N'', N'', N'Liberación Social', N'Espalda de la Posta Médica L.S', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 2)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (4, N'', N'', N'', N'San Andrés V Etapa', N'Av. Chota', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 40)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (5, N'', N'', N'', N'San Andrés V Etapa', N'Av. Chota ', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 4)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (6, N'', N'', N'', N'San Andrés V Etapa', N'Paralela Av. Juan Pablo II y Av. Chota', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 5)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (7, N'', N'', N'', N'San Andrés V Etapa', N'Av. Larco Frente del Colegio Alfred Nobel', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 6)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (8, N'', N'', N'', N'San Andrés V Etapa', N'Calle Chota', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), N'', 1)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (9, N'', N'', N'', N'San Andrés V Etapa', N'Espalda de Coco Torete Av. Larco', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 6)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (10, N'', N'', N'', N'San Andrés V Etapa', N'Av.Larco Frente del Colegio Alfred Nobel', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 7)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (11, N'', N'', N'', N'San Andrés V Etapa', N'Av.Larco Frente del Colegio Alfred Nobel', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 8)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (12, N'', N'', N'', N'San Andrés V Etapa', N'Espalda de Centro Hogar de la Niña', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 5)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (13, N'', N'', N'', N'Las Flores', N'San Andres V etapa', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 9)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (14, N'', N'', N'', N'Las Flores', N'Calle las Poncianas - San Andres V Etapa', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 10)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (15, N'', N'', N'', N'Las Flores', N'San Andres V Etapa, Paralela Av. Paujiles', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 11)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (16, N'', N'', N'', N'San Andrés - Costado de Paseo de Aguas', N'Av. Huaman', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 12)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (17, N'', N'', N'', N'San Andrés - Costado de Paseo de Aguas', N'Av. Larco', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 13)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (18, N'', N'', N'', N'San Andrés - Costado de Paseo de Aguas', N'Av. Huaman', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 14)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (19, N'', N'', N'', N'San Andrés - Costado de Paseo de Aguas', N'Calle las Poncianas', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 15)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (20, N'', N'', N'', N'San Andrés - Costado de Paseo de Aguas', N'Entre Seoane y Huaman', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 15)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (21, N'', N'', N'', N'San Andrés - Costado de Paseo de Aguas', N'Sin Dirección', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 15)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (22, N'', N'', N'', N'San Andrés - Costado de Paseo de Aguas', N'Calle los Casuarinas, Santa Edelmira', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 15)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (23, N'', N'', N'', N'California', N'Pasaje los Jazmines', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 16)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (24, N'', N'', N'', N'California', N'Pasaje los Jazmines', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 17)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (25, N'', N'', N'', N'California', N'Calle los Tulipanes y Huaman', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 18)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (26, N'', N'', N'', N'California', N'Calle los Tulipanes y Huamanes', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 19)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (27, N'', N'', N'', N'Huaman', N'Entre calle Taico y Frente a la Iglesia', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 13)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (28, N'', N'', N'', N'Huaman', N'Entre Manuel Seoane y calle Ruben Dario', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 13)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (29, N'', N'', N'', N'California', N'Calle los geranios', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 40)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (30, N'', N'', N'', N'California', N'Espalda de Iglesia Fatima', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 40)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (31, N'', N'', N'', N'California', N'Calle los Alamos', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 40)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (32, N'', N'', N'', N'Las Hortenzias', N'Av. Los Angeles', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 41)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (33, N'', N'', N'', N'Las Hortenzias', N'Av. Los Angeles', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 41)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (34, N'', N'', N'', N'Las Hortenzias', N'Av. Los Angeles', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 41)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (35, N'', N'', N'', N'Las Flores - El Golf', N'Paralela entre Av. Fatima y Prolongación Vallejo', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 42)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (36, N'', N'', N'', N'Las Flores - El Golf', N'Entre Av. Los Angeles y Los Sauces', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 42)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (37, N'', N'', N'', N'Las Flores - El Golf', N'Entre Calles Las Cucardas y Begonias', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 43)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (38, N'', N'', N'', N'Las Flores - El Golf', N'Entre Calles Las Cucardas y Begonias', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 43)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (39, N'', N'', N'', N'Las Flores - El Golf', N'Entre Calles Las Cucardas y Begonias', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 43)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (40, N'', N'', N'', N'Las Flores - El Golf', N'Entre Av. Huaman y Prolongación Vallejo', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 44)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (41, N'', N'', N'', N'Las Flores - El Golf', N'A Espalda de Av. Huaman', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 44)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (42, N'', N'', N'', N'Las Flores - El Golf', N'Entre Av. Huaman y Prolongación Vallejo', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 45)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (43, N'', N'', N'', N'Las Flores - El Golf', N'Espalda de Wong de California', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 42)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (44, N'', N'', N'', N'Las Flores - El Golf', N'Entre Av. Fatima y Psje San Luis', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 42)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (45, N'', N'', N'', N'Palmeras y Palmas del Golf', N'Entre Calle los Pensamientos y los Azahares', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 29)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (46, N'', N'', N'', N'Palmeras y Palmas del Golf', N'Paralela de la calle las cucardas', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 29)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (47, N'', N'', N'', N'Palmeras y Palmas del Golf', N'Entre Calles Las Camelias y Bugambilias', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 64)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (48, N'', N'', N'', N'Palmeras y Palmas del Golf', N'Entre Calles las Begonias y los Jazmines', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 65)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (49, N'', N'', N'', N'Palmeras y Palmas del Golf', N'Calle los Cascanueces', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 66)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (50, N'', N'', N'', N'Palmeras y Palmas del Golf', N'Entre las calles Las Cucardas y los Tallanes', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 67)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (51, N'', N'', N'', N'Palmeras y Palmas del Golf', N'Calle los Cantaros', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 68)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (52, N'', N'', N'', N'Palmeras y Palmas del Golf', N'Referencia del Ovalo la Marinera a lado izquierdo - el Golf', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 47)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (53, N'', N'', N'', N'Palmeras y Palmas del Golf', N'Entre las calles Cantaros y Cucardas', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 46)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (54, N'', N'', N'', N'Palmeras y Palmas del Golf', N'Entre las calles Bugambilias y Flor de la Canela', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 46)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (55, N'', N'', N'', N'Palmeras y Palmas del Golf', N'Entre las calles Bugambilias y Flor de Canela', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 46)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (56, N'', N'', N'', N'Palmeras y Palmas del Golf', N'Av. El Golf', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 47)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (57, N'', N'Antes de llegar al Mercado de Liberación', N'', N'San Andrés V Etapa', N'Prolongación Huaman', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 48)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (58, N'', N'', N'', N'San Andrés V Etapa', N'San Andres V Etapa', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 48)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (59, N'', N'', N'', N'San Andres V', N'San Andres V Etapa, Espalda de Larco Mar', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 49)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (60, N'', N'', N'', N'San Andres V', N'San Andres V Etapa, Paralela Parque Virgen de la Puerta', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 50)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (61, N'', N'', N'', N'San Andres V', N'San Andres V Etapa, Calle Olivos', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 51)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (62, N'', N'', N'', N'San Andres V', N'San Andres V etapa', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 52)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (63, N'', N'', N'', N'Vista Alegre', N'Calle Manuel Razuri y Pasaje Perú - 2 de Mayo', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 53)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (64, N'', N'', N'', N'Vista Alegre', N'Calle Pachacutec', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 53)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (65, N'', N'', N'', N'Vista Alegre', N'Pasando Estadio Municipal de Vista de Alegre', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 54)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (66, N'', N'', N'', N'Vista Alegre', N'Pasando la Calle Simón Bolivar', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 31)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (67, N'', N'', N'', N'Vista Alegre', N'Calle las Orquideas, Vista Alegre', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 31)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (68, N'', N'', N'', N'Vista Alegre', N'Entre Calle Florida y los Cedros', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 31)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (69, N'', N'', N'', N'Vista Alegre', N'Entre Calle Pachacutec y Wiracocha', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 33)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (70, N'', N'', N'', N'Vista Alegre', N'Las Vegas', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 32)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (71, N'', N'', N'', N'Golf - Primera Etapa', N'Palmeras Golf II etapa I , II', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 34)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (72, N'', N'', N'', N'Golf - Primera Etapa', N'J.J Ganoza Este-Familia', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 35)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (73, N'', N'', N'', N'Golf - Primera Etapa', N'J.J Ganoza Oeste-.Familia', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), N'', 36)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (74, N'', N'', N'', N'Buenos Aires Sur', N'Buenos Aires Sur', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 37)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (75, N'', N'', N'', N'Buenos Aires Sur', N'Urb. Villa Florencia esta al frente de la derrama magisterial y la universitad Tecsup.', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 38)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (76, N'', N'', N'', N'Buenos Aires Sur', N'Urb. Villa Florencia esta al frente de la derrama magisterial y la universitad Tecsup.', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 38)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (77, N'', N'', N'', N'Buenos Aires Sur', N'Urb. Villa Florencia esta al frente de la derrama magisterial y la universitad Tecsup.', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 38)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (78, N'', N'', N'', N'Buenos Aires Sur', N'Zarumilla y Santa Rosa, Buenos Aires Sur', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 38)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (79, N'', N'', N'', N'Buenos Aires Sur', N'Calle Santa Rosa 814, Buenos Aires Sur', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 22)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (80, N'', N'', N'', N'Buenos Aires Centro', N'Entre O´ Higgins y Tacna, Bnos Aires Centro', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 20)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (81, N'', N'', N'', N'Buenos Aires Centro', N'Buenos aires Centro', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 20)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (82, N'', N'', N'', N'Buenos Aires Centro', N'Buenos aires Norte', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 21)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (83, N'', N'', N'', N'Buenos Aires Centro', N'Entre calle Bolognesi y Santa Rosa referencia por la iglesia -  Buenos Aires Centro', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 21)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (84, N'', N'', N'', N'Buenos Aires Centro', N'Calle Mariscal Miller y Bolivia - Buenos Aires Centro', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 20)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (85, N'', N'', N'', N'Buenos Aires Norte Progreso', N'Calles Pedro Herrera y Miguel Grau cuadra 8- Buenos Aires Norte', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 22)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (86, N'', N'', N'', N'Buenos Aires Norte Progreso', N'Calles Pedro Herrera y Miguel Grau cuadra 3 - Buenos Aires Norter', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 23)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (87, N'', N'', N'', N'Rosales de San Luis', N'Entre  la Juan Pablo II y Soccer City', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 24)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (88, N'', N'', N'', N'San Andrés V Etapa', N'San Andres V Etapa - Espalda de Larco Sport Center', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 23)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (89, N'', N'', N'', N'San Andrés V Etapa', N'Urb San Andres V Etapa', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 23)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (90, N'', N'', N'', N'San Andrés V Etapa', N'Buenos Aires Nortec', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 25)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (91, N'', N'', N'', N'San Andrés V Etapa', N'Entre Calle los Lirios y Calle las Poncianas', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 26)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (92, N'', N'', N'', N'San Andrés V Etapa', N'Entre Calle las Begonias y Calle los Nardos', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 27)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (93, N'', N'', N'', N'Vista Alegre', N'Frente a la I.E Andres Avelico Caceres', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 28)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (94, N'', N'', N'', N'Vista Alegre', N'Calle José  Galvez - Vista Alegre', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 29)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (95, N'', N'', N'', N'Vista Alegre', N'Entre Av. el Golf y calle Ganoza', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 30)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (96, N'', N'', N'', N'Vista Alegre', N'Entre Av. el Golf y calle Ganoza', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 30)
INSERT [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad], [Descripcion], [Referencias], [Urbanizacion], [Sector], [Direccion], [Latitud], [Longitud], [url_Localidad], [ID_Empleado]) VALUES (97, N'', N'', N'', N'Vista Alegre', N'Entre Av. el Golf y calle Ganoza', CAST(0.00000000 AS Decimal(10, 8)), CAST(0.00000000 AS Decimal(11, 8)), NULL, 30)
SET IDENTITY_INSERT [dbo].[Detalles_Localidades] OFF
GO
SET IDENTITY_INSERT [dbo].[Empleados] ON 

INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (1, N'Julia', N'Lobato Lopez', 1, N'', N'', N'', NULL, 1, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (2, N'Carranza', N'Narro Hanako', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (3, N'Erika', N'Guerrero', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (4, N'Iraida', N'Cespedes Cadenillas', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (5, N'Jose', N'Peralta Flores', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (6, N'Elena', N'Polo Ruiz', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (7, N'Pandura', N'Alegria Ofelia', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (8, N'Alberto', N'Mercado Chamorro', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (9, N'Santos', N'Rodriguez León', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (10, N'Jhonny', N'Reyes', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (11, N'Javier', N'Bazan Alva', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (12, N'Nicasio', N'Cruz', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (13, N'Aracely', N'Valderrama Rodriguez', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (14, N'Jose', N'Silva Guevaron', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (15, N'Benises', N'Vereau Luis', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (16, N'Rumay', N'Reyes José', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (17, N'Trujillo', N'Torres Luis', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (18, N'Quiroz', N'Cholan Miuler', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (19, N'Rubio', N'Moya Adolfo', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (20, N'Segunda', N'Garcia Ruiz', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (21, N'Salcedo', N'Merino Cesar', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (22, N'Betty', N'Cabrera Rivera', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (23, N'Rosa', N'Villa Cachi', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (24, N'Santiago', N'Medina Estrevés', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (25, N'Chavil', N'Vasquez Eduardo', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (26, N'Layza', N'Perfecto Antonio', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (27, N'Garro', N'Marin Ernesto', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (28, N'Pedro', N'Cruz Sanchez', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (29, N'Carolina', N'Dioses Lopez', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (30, N'Onstantino', N'Sequeiros Jimenez', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (31, N'Luna', N'Virtoria Romulo', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (32, N'José', N'Vallejos Praxederes', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (33, N'Tombia', N'Jicaro', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (34, N'Maria Anita', N'Cruz Marquina', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (35, N'Zenen', N'Avila Velasquez', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (36, N'Llave', N'Sanchez Juan', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (37, N'Yenny', N'Villegas Chavez', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (38, N'Garcia', N'Ruiz Luis', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (39, N'Betty', N'Cabrera Rivera', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (40, N'Erika', N'Rivera Guerrera', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (41, N'Carlos', N'Peralta Alvarado', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (42, N'Alcantara', N'Leiva Segundo', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (43, N'Lopez', N'Campos Teodora', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (44, N'Ana Maria', N'Santos', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (45, N'Fortunato', N'Valderrama Vega', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (46, N'Juan', N'Crespin Mariños', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (47, N'Rosalia', N'Dioses Lopez', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (48, N'Mengole', N'Rodriguez Dolores', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (49, N'Carmen', N'Zavalera Cosavalente', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (50, N'Nelly', N'Morales Solano', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (51, N'Julcamoro', N'Morales Hilario', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (52, N'Bertha', N'Nieto Polo', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (53, N'Celedonio', N'Castillo Cisneros', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (54, N'Victor Hugo', N'Contreras Moran', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (55, N'Romulo', N'Luna Victoria', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (56, N'Praxederes', N'José Vallejos', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (57, N'Jicaro', N'Tombia', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (58, N'Maria Anita', N'Cruz Marquina', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (59, N'Zenen', N'Avila Velasquez', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (60, N'Llave', N'Sanchez Juan', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (61, N'Yenny', N'Villegas Chavez', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (62, N'Luis', N'Garcia Ruiz', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (63, N'Betty', N'Cabrera Rivera', 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (64, N'José', N'Núñez Garcia', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (65, N'Eusebio', N'Rodriguez Zavaleta', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (66, N'Ana', N'Peña Cortez', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (67, N'Crispin', N'Mariños Juan', 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (68, N'Alcalde', N'Carrllo Humberto', 0, N'', N'', N'', CAST(N'2006-12-31' AS Date), 1, NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (99, N'AGUSTÍN', N'GUEVARA MÉNDEZ', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (100, N'ALBERTO', N'CORREA CERNA', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (101, N'ALDO', N'CHILCON CARBONEL', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (102, N'ANTONIO', N'LAUREANO POMA', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (103, N'BERTHA', N'PINCHI USHIÑAGUA', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (104, N'BETTY', N'CABRERA RIVERA', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (105, N'CARLOS ALBERTO', N'DEZA MELÉNDEZ', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (106, N'CARLOS', N'LUGONES GUZMAN', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (107, N'CARLOS', N'RUIZ BRICEÑO', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (108, N'CARLOS', N'RUIZ SARE', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (109, N'GUILLERMO', N'CHAMAYA LUMBA', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (110, N'CARMEN', N'NAVARRETE', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (111, N'CARMEN', N'DIOSES', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (112, N'CELIA', N'LOPEZ ANISMENDIZ', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (113, N'CESAR', N'ASCÓN SERRANO', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (114, N'CÉSAR', N'CHÁVEZ CORONEL', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (115, N'CÉSAR IVAN', N'ANTICONA VILLANUEVA', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (116, N'CHARLES', N'BRIONES ROJAS', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (117, N'CONSUELO', N'TORRES DOMINGUEZ', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (118, N'CRISTHIAN', N'JERÓNIMO CHANG', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (119, N'DAVID', N'MERINO QUIÑONES', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (120, N'DEYSI PATRICIA', N'GARCIA CHICLAYO', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (121, N'DEYSI', N'RODRÍGUEZ DIESTRA', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (122, N'DOLLY', N'API PERALTA', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (123, N'DORIS', N'SALDAÑA RAMÍREZ', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (124, N'EDGAR JHONATAN', N'ESCOBEDO MARTINEZ', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (125, N'EDITA', N'DEL CASTILLO ABANTO', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (126, N'EDITH', N'ESPIRITU GUERRA', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (127, N'EDUARDO', N'FERNÁNDEZ ALCÁNTARA', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (128, N'ELIAS', N'LAYZA HORNA', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (129, N'ESTEBAN', N'MAURICIO VALVERDE', 1, NULL, NULL, NULL, NULL, 1, 1)
GO
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (130, N'EVELYN', N'CASTAÑEDA', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (131, N'ESTHER', N'TRUJILLO MARCHENA', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (132, N'EUDOCIA', N'PAREDES CRUZ', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (133, N'EUFEMIO', N'TORRES ZAVALETA', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (134, N'FELICITA', N'VENAUTE MEZA', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (135, N'FRANCIS', N'CUEVA CHININI', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (136, N'GEOVANA', N'BOBADILLA CONICILLA', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (137, N'GONZALO', N'SÁNCHEZ ÁLVAREZ', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (138, N'GUADALUPE', N'SANTOS CRUZ', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (139, N'GUILLERMO', N'CHAMAYA LUMBA', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (140, N'HARRY', N'ARANDA GALLOSO', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (141, N'ISABEL', N'BRICEÑO APONTE', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (142, N'IRVIN', N'MERA', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (143, N'JHON', N'MATTUS CÁRDENAS', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (144, N'JHONATAN', N'SANCHEZ AZABACHE', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (145, N'JONATHAN', N'SALINAS EURIBE', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (146, N'JORGE', N'BUENO', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (147, N'JORGE LUIS', N'GARCÍA COSTILLA', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (148, N'JORGE LUIS', N'LOZANO DOMINGUEZ', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (149, N'JORGE', N'POLO SOTELO', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (150, N'JOSE', N'LORENZO ABANTO', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (151, N'JOSÉ ZACARÍAS', N'ZAVALETA SANTOS', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (152, N'JUAN', N'CASTILLO RAMOS', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (153, N'JUAN', N'GUERRA LOPEZ', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (154, N'JUAN', N'VARGAS TELLO', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (155, N'JULIO CÉSAR', N'EDQUEN VERÁSTEGUI', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (156, N'LIDER', N'VILLANUEVA DIESTRA', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (157, N'LUIS', N'ANTICONA QUIROZ', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (158, N'LUIS', N'CULQUI PEÑA', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (159, N'LUIS NICASIO', N'MORALES', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (160, N'LUIS JOEL', N'TERRONES RONCAL', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (161, N'MANUEL JESUS', N'CALDERON FLORES', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (162, N'MANUEL', N'OLIVA AVALOS', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (163, N'MANUEL', N'PORTOCARRERO HURTADO', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (164, N'MARCELO', N'SÁNCHEZ GIL', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (165, N'MARIA', N'GARCIA DE RISCO', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (166, N'MARÍA ISABEL', N'LAIZA CASTILLO', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (167, N'MÁRTIRES', N'ROSAS CRUZ', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (168, N'MARUJA ISABEL', N'SALAS PANOCA', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (169, N'MATEO', N'SILVA ROMERO', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (170, N'MIGUEL', N'SALINAS CHAVEZ', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (171, N'MILTON', N'LÓPEZ MOSTACERO', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (172, N'NORMA', N'SEVILLANO CARBAJAL', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (173, N'OSCAR', N'VIZCARRA RIVAS', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (174, N'PETER', N'CLAUDIO ZARE BRICEÑO', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (175, N'RICHARD', N'SANCHEZ AZABACHE', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (176, N'ROBERTH', N'PELAEZ MEREGILDO', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (177, N'ROBERTO', N'VALERIANO DIESTRA', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (178, N'ROCÍO', N'RUBIO ASUNCIÓN', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (179, N'RONALD', N'REINA CANO', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (180, N'ROSA ELENA', N'MENDOZA GUERRA', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (181, N'ROSA ELVIRA', N'VARGAS ÁVILA', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (182, N'SANTIAGO', N'RODRIGUEZ ASUNCION', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (183, N'SANTOS', N'CARBAJAL JIMÉNEZ', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (184, N'SANTOS', N'MUÑOZ REYES', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (185, N'SANTOS', N'SANDOVAL MAURICIO', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (186, N'SANTOS', N'VILCA CRUZ', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (187, N'SEGUNDO', N'CASANOVA ALCANTARA', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (188, N'SERAPIO', N'ENCOMENDEROS SOTO', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (189, N'VICTOR', N'ARCE CASTILLO', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (190, N'VICTOR', N'CASTILLO CARRANZA', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (191, N'VICTOR', N'GARCIA ANDRADE', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (192, N'VICTOR', N'SANDOVAL CASTILLO', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (193, N'WILDER', N'CORREA ALVAREZ', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (194, N'YENNY', N'VILLEGAS CHAVEZ', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (195, N'YENY', N'AVALOS IBAÑEZ', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (196, N'YIMI', N'AREVALO PINCHI', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (197, N'YOSHI', N'CAVERO CHAVEZ', 1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombres], [Apellidos], [esApoyo], [urlFoto], [DireccionCorreo], [DNI], [FechaNacimiento], [EstadoActivo], [esPersonalLimpieza]) VALUES (198, N'ALEXANDER SAUL', N'CHERO COBA', 1, NULL, NULL, NULL, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[Empleados] OFF
GO
SET IDENTITY_INSERT [dbo].[Localidades] ON 

INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (1, N'El Tingo', 1)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (2, N'Indoamerica', 2)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (3, N'La amistad', 3)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (4, N'21 de abril', 4)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (5, N'B.Vecindad', 5)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (6, N'Lorgio Caceda', 6)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (7, N'Enrejado', 7)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (8, N'El Chotano', 8)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (9, N'Hogar de la niña ', 9)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (10, N'Paseo Aguas 1', 10)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (11, N'Paseo Aguas 2', 11)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (12, N'Las Artes', 12)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (13, N'El Delfin', 13)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (14, N'Celendino', 14)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (15, N'Las Flores', 15)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (16, N'Robinson Soto', 16)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (17, N'Pasaje Italia', 17)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (18, N'Com.D. Sta. Edelmira', 18)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (19, N'Segundo Estrada', 19)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (20, N'Sedalib', 20)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (21, N'Reservorio', 21)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (22, N'La Paz', 22)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (23, N'Cesar vall. Calif. 1', 23)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (24, N'Cesar Vall. Calif. 2', 24)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (25, N'San Jose California I', 25)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (26, N'San Jose California II', 26)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (27, N'Plaza huaman', 27)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (28, N'Alameda Jhon Kennedy', 28)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (29, N'J.Julio Ganoza', 29)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (30, N'Cecilio Cox', 30)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (31, N'Ovalo el Trebol', 31)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (32, N'Hortensias California I', 32)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (33, N'Hortensias California II', 33)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (34, N'Hortensias California III', 34)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (35, N'Praderas del Golf', 35)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (36, N'El Floral', 36)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (37, N'Jandínes de Golf I', 37)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (38, N'Jandínes del Golf II', 38)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (39, N'Jardines del Golf III', 39)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (40, N'LAS FLORES DEL GOLF I,II', 40)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (41, N'Condominio las Flores', 41)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (42, N'COCOTEROS', 42)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (43, N'Triangulo', 43)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (44, N'Ovalo San Luis California', 44)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (45, N'Deysi Ganoza', 45)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (46, N'Los Portales del Golf', 46)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (47, N'Guillermo Ganoza Vargas', 47)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (48, N'Azucenas el Golf', 48)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (49, N'La Alameda el Golf', 49)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (50, N'Las Palmas I , II', 50)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (51, N'EL CARMELO', 51)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (52, N'Los Tallanes I , II', 52)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (53, N'Castaños el Golf', 53)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (54, N'Cucardas  el Golf I', 54)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (55, N'Cucardas el Golf II', 55)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (56, N'Ovalo Marinera', 56)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (57, N'San Vicente de Paúl', 57)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (58, N'Ciro Lazo, Marcos Calderon', 58)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (59, N'Virgen de la Puerta', 59)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (60, N'Medalla Milagros', 60)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (61, N'Las Orquideas', 61)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (62, N'Cesar Vallejo', 62)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (63, N'Miguel Grau', 63)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (64, N'Micaela Bastidas', 64)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (65, N'San Pedro N°1', 65)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (66, N'Victoria de Pimillos', 66)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (67, N'Jorge Juan P. Cox', 67)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (68, N'Posta Medica Huaman', 68)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (69, N'Triangulo Razuri', 69)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (70, N'Las Vegas', 70)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (71, N'Palmeras Golf II etapa I , II', 71)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (72, N'J.J Ganoza Este-Familia', 72)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (73, N'J.J Ganoza Oeste-.Familia', 73)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (74, N'La Poza - La Amistad', 74)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (75, N'Villa Florencia I', 75)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (76, N'Villa Florencia II', 76)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (77, N'Villa Florencia III', 77)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (78, N'Armano Villanueva', 78)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (79, N'Santa Rosa', 79)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (80, N'Pedro Ureña', 80)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (81, N'España', 81)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (82, N'Plaza de A. Bnos Aires', 82)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (83, N'Alameda Santa Rosa', 83)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (84, N'Huascar y Atahualpa', 84)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (85, N'El progreso', 85)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (86, N'Victor R. Haya de la Torre', 86)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (87, N'Rosales de San Luis I, II. III', 87)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (88, N'Semi Rustica', 88)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (89, N'PARQUE #3', 89)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (90, N'Los Sauces', 90)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (91, N'El Celendino', 91)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (92, N'Los Acacias - reservorio', 92)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (93, N'Plaza de A.Vista Alegre', 93)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (94, N'Tupac Amaru', 94)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (95, N'CONDOMINIO LAS PALMERAS DEL GOLF I', 95)
INSERT [dbo].[Localidades] ([ID_Localidad], [Nombre_Localidad], [ID_Detalle_Localidad]) VALUES (96, N'CONDOMINIO LAS PALMERAS DEL GOLF II', 96)
SET IDENTITY_INSERT [dbo].[Localidades] OFF
GO
SET IDENTITY_INSERT [dbo].[Opcion] ON 

INSERT [dbo].[Opcion] ([ID_Opcion], [Nombre_Opcion]) VALUES (1, N'Asistió')
INSERT [dbo].[Opcion] ([ID_Opcion], [Nombre_Opcion]) VALUES (2, N'Faltó')
INSERT [dbo].[Opcion] ([ID_Opcion], [Nombre_Opcion]) VALUES (3, N'Permiso')
INSERT [dbo].[Opcion] ([ID_Opcion], [Nombre_Opcion]) VALUES (4, N'Recuperación hora')
INSERT [dbo].[Opcion] ([ID_Opcion], [Nombre_Opcion]) VALUES (5, N'Descanso')
SET IDENTITY_INSERT [dbo].[Opcion] OFF
GO
ALTER TABLE [dbo].[Asistencias]  WITH CHECK ADD FOREIGN KEY([ID_Empleado])
REFERENCES [dbo].[Empleados] ([ID_Empleado])
GO
ALTER TABLE [dbo].[Asistencias]  WITH CHECK ADD FOREIGN KEY([ID_Opcion])
REFERENCES [dbo].[Opcion] ([ID_Opcion])
GO
ALTER TABLE [dbo].[Detalles_Localidades]  WITH CHECK ADD FOREIGN KEY([ID_Empleado])
REFERENCES [dbo].[Empleados] ([ID_Empleado])
GO
ALTER TABLE [dbo].[Localidades]  WITH CHECK ADD FOREIGN KEY([ID_Detalle_Localidad])
REFERENCES [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad])
GO
ALTER TABLE [dbo].[Visitas]  WITH CHECK ADD FOREIGN KEY([ID_Empleado])
REFERENCES [dbo].[Empleados] ([ID_Empleado])
GO
ALTER TABLE [dbo].[Visitas]  WITH CHECK ADD FOREIGN KEY([ID_Localidad])
REFERENCES [dbo].[Detalles_Localidades] ([ID_Detalle_Localidad])
GO
/****** Object:  Trigger [dbo].[TRG_UniqueEmpleado]    Script Date: 21/08/2024 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   TRIGGER [dbo].[TRG_UniqueEmpleado]
ON [dbo].[Empleados]
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Verificar si hay algún DNI duplicado en los registros insertados
    IF EXISTS (
        SELECT 1
        FROM Empleados e
        JOIN inserted i ON e.DNI = i.DNI
    )
    BEGIN
        RAISERROR ('No se pueden insertar valores con DNI duplicado en la tabla Empleados.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    -- Insertar los registros nuevos si no hay DNI duplicados
    INSERT INTO Empleados (Nombres, Apellidos, esApoyo, DireccionCorreo, urlFoto, DNI)
    SELECT Nombres, Apellidos, esApoyo, DireccionCorreo, urlFoto, DNI
    FROM inserted;
END;
GO
ALTER TABLE [dbo].[Empleados] ENABLE TRIGGER [TRG_UniqueEmpleado]
GO
/****** Object:  Trigger [dbo].[TRG_UpdateEstadoActivo]    Script Date: 21/08/2024 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   TRIGGER [dbo].[TRG_UpdateEstadoActivo]
ON [dbo].[Empleados]
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Actualizar el estado EstadoActivo basado en la fecha de nacimiento
    UPDATE e
    SET e.EstadoActivo = CASE 
                            WHEN DATEPART(DAY, i.FechaNacimiento) = DATEPART(DAY, GETDATE()) 
                             AND DATEPART(MONTH, i.FechaNacimiento) = DATEPART(MONTH, GETDATE()) THEN 0 
                            ELSE 1 
                         END
    FROM Empleados e
    INNER JOIN inserted i ON e.ID_Empleado = i.ID_Empleado;
END;
GO
ALTER TABLE [dbo].[Empleados] ENABLE TRIGGER [TRG_UpdateEstadoActivo]
GO
/****** Object:  Trigger [dbo].[TRG_UniqueLocalidad]    Script Date: 21/08/2024 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   TRIGGER [dbo].[TRG_UniqueLocalidad]
ON [dbo].[Localidades]
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM Localidades l
        JOIN inserted i ON l.Nombre_Localidad = i.Nombre_Localidad
    )
    BEGIN
        RAISERROR ('No se pueden insertar valores duplicados en la tabla Localidades.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    INSERT INTO Localidades (Nombre_Localidad, ID_Detalle_Localidad)
    SELECT Nombre_Localidad, ID_Detalle_Localidad
    FROM inserted;	
END;
GO
ALTER TABLE [dbo].[Localidades] ENABLE TRIGGER [TRG_UniqueLocalidad]
GO
/****** Object:  Trigger [dbo].[TRG_UniqueVisitasPorDia]    Script Date: 21/08/2024 20:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   TRIGGER [dbo].[TRG_UniqueVisitasPorDia]
ON [dbo].[Visitas]
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN Visitas v ON i.ID_Localidad = v.ID_Localidad AND i.Fecha_Visita = v.Fecha_Visita
    )
    BEGIN
        RAISERROR ('No se pueden insertar visitas duplicadas en una misma localidad en el mismo día.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    INSERT INTO Visitas (Fecha_Visita, Estado, ID_Localidad, ID_Empleado)
    SELECT Fecha_Visita, Estado, ID_Localidad, ID_Empleado
    FROM inserted;
END;
GO
ALTER TABLE [dbo].[Visitas] ENABLE TRIGGER [TRG_UniqueVisitasPorDia]
GO
USE [master]
GO
ALTER DATABASE [BD_GestionAmbiental] SET  READ_WRITE 
GO
