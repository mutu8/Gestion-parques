USE [master]
GO
/****** Object:  Database [BD_GestionAmbiental]    Script Date: 15/08/2024 21:34:27 ******/
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
/****** Object:  Table [dbo].[Asistencias]    Script Date: 15/08/2024 21:34:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asistencias](
	[ID_Asistencia] [int] IDENTITY(1,1) NOT NULL,
	[Fecha_Asistencia] [date] NOT NULL,
	[ID_Empleado] [int] NOT NULL,
	[Asistio] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Asistencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalles_Localidades]    Script Date: 15/08/2024 21:34:27 ******/
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
/****** Object:  Table [dbo].[Empleados]    Script Date: 15/08/2024 21:34:27 ******/
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
/****** Object:  Table [dbo].[Localidades]    Script Date: 15/08/2024 21:34:27 ******/
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
/****** Object:  Table [dbo].[Visitas]    Script Date: 15/08/2024 21:34:27 ******/
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
ALTER TABLE [dbo].[Asistencias]  WITH CHECK ADD FOREIGN KEY([ID_Empleado])
REFERENCES [dbo].[Empleados] ([ID_Empleado])
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
/****** Object:  Trigger [dbo].[TRG_UniqueEmpleado]    Script Date: 15/08/2024 21:34:27 ******/
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
/****** Object:  Trigger [dbo].[TRG_UpdateEstadoActivo]    Script Date: 15/08/2024 21:34:28 ******/
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
/****** Object:  Trigger [dbo].[TRG_UniqueLocalidad]    Script Date: 15/08/2024 21:34:28 ******/
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
/****** Object:  Trigger [dbo].[TRG_UniqueVisitasPorDia]    Script Date: 15/08/2024 21:34:28 ******/
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
