USE [master]
GO
/****** Object:  Database [UAMDB]    Script Date: 19/05/2024 6:39:45 p. m. ******/
CREATE DATABASE [UAMDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UAMDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\UAMDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UAMDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\UAMDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [UAMDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UAMDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UAMDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UAMDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UAMDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UAMDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UAMDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [UAMDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UAMDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UAMDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UAMDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UAMDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UAMDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UAMDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UAMDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UAMDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UAMDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UAMDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UAMDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UAMDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UAMDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UAMDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UAMDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UAMDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UAMDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UAMDB] SET  MULTI_USER 
GO
ALTER DATABASE [UAMDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UAMDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UAMDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UAMDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UAMDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UAMDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [UAMDB] SET QUERY_STORE = OFF
GO
USE [UAMDB]
GO
/****** Object:  User [admin]    Script Date: 19/05/2024 6:39:45 p. m. ******/
CREATE USER [admin] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Aspirante]    Script Date: 19/05/2024 6:39:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aspirante](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](100) NOT NULL,
	[Apellidos] [varchar](100) NOT NULL,
	[Fecha_Nacimiento] [date] NOT NULL,
	[Id_Ciudad_Nacimiento] [int] NOT NULL,
	[Id_Grupo_Sanguineo] [int] NOT NULL,
	[Id_Tipo_Documento] [int] NOT NULL,
	[Numero_Documento] [varchar](20) NOT NULL,
	[Fecha_Expedicion] [date] NOT NULL,
	[Id_Ciudad_Expedicion] [int] NOT NULL,
	[Id_Genero] [int] NOT NULL,
	[Id_Estado_Civil] [int] NOT NULL,
	[Numero_Telefono] [varchar](50) NULL,
	[Numero_Celular] [varchar](20) NOT NULL,
	[Foto] [varchar](200) NOT NULL,
	[Id_Inscripcion] [bigint] NOT NULL,
	[Completo] [bit] NOT NULL,
 CONSTRAINT [PK_Aspirante] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 19/05/2024 6:39:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamento](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](60) NOT NULL,
	[Id_Pais] [int] NOT NULL,
 CONSTRAINT [PK_Departamento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado_Civil]    Script Date: 19/05/2024 6:39:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado_Civil](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Estado] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Estado_Civil] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado_Inscripcion]    Script Date: 19/05/2024 6:39:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado_Inscripcion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Estado] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Estado_Inscripcion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genero]    Script Date: 19/05/2024 6:39:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genero](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Sexo] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Genero_Sexual] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grupo_Sanguineo]    Script Date: 19/05/2024 6:39:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grupo_Sanguineo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Grupo] [nchar](3) NOT NULL,
 CONSTRAINT [PK_Grupo_Sanguineo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inscripcion]    Script Date: 19/05/2024 6:39:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inscripcion](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Id_Tipo_Aspirante] [int] NOT NULL,
	[Id_Modalidad] [int] NOT NULL,
	[Id_Sede] [int] NOT NULL,
	[Id_Programa] [int] NOT NULL,
	[Id_Periodo] [int] NOT NULL,
	[Id_Estado_Inscripcion] [int] NOT NULL,
	[Id_Usuario] [bigint] NOT NULL,
	[Completo] [bit] NOT NULL,
 CONSTRAINT [PK_Inscripcion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modalidad]    Script Date: 19/05/2024 6:39:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modalidad](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Modalidad] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Municipio]    Script Date: 19/05/2024 6:39:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Municipio](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Estado] [int] NOT NULL,
	[Id_Departamento] [int] NOT NULL,
 CONSTRAINT [PK_Municipio] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 19/05/2024 6:39:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Pais] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Periodo_Academico]    Script Date: 19/05/2024 6:39:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Periodo_Academico](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Periodo] [int] NOT NULL,
 CONSTRAINT [PK_Periodo_Academico] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Programa_Academico]    Script Date: 19/05/2024 6:39:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Programa_Academico](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Programa_Academico] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sede]    Script Date: 19/05/2024 6:39:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sede](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Sede] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Aspirante]    Script Date: 19/05/2024 6:39:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Aspirante](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tipo_Aspirante] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Documento]    Script Date: 19/05/2024 6:39:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Documento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [varchar](40) NOT NULL,
 CONSTRAINT [PK_Tipo_Documento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Usuario]    Script Date: 19/05/2024 6:39:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Role] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Tipo_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 19/05/2024 6:39:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Id_Rol] [int] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Departamento] ([Id], [Nombre], [Id_Pais]) VALUES (5, N'ANTIOQUIA', 1)
INSERT [dbo].[Departamento] ([Id], [Nombre], [Id_Pais]) VALUES (8, N'ATLÁNTICO', 1)
INSERT [dbo].[Departamento] ([Id], [Nombre], [Id_Pais]) VALUES (11, N'BOGOTÁ, D.C.', 1)
INSERT [dbo].[Departamento] ([Id], [Nombre], [Id_Pais]) VALUES (13, N'BOLÍVAR', 1)
INSERT [dbo].[Departamento] ([Id], [Nombre], [Id_Pais]) VALUES (15, N'BOYACÁ', 1)
INSERT [dbo].[Departamento] ([Id], [Nombre], [Id_Pais]) VALUES (17, N'CALDAS', 1)
INSERT [dbo].[Departamento] ([Id], [Nombre], [Id_Pais]) VALUES (18, N'CAQUETÁ', 1)
INSERT [dbo].[Departamento] ([Id], [Nombre], [Id_Pais]) VALUES (19, N'CAUCA', 1)
INSERT [dbo].[Departamento] ([Id], [Nombre], [Id_Pais]) VALUES (20, N'CESAR', 1)
INSERT [dbo].[Departamento] ([Id], [Nombre], [Id_Pais]) VALUES (23, N'CÓRDOBA', 1)
INSERT [dbo].[Departamento] ([Id], [Nombre], [Id_Pais]) VALUES (25, N'CUNDINAMARCA', 1)
INSERT [dbo].[Departamento] ([Id], [Nombre], [Id_Pais]) VALUES (27, N'CHOCÓ', 1)
INSERT [dbo].[Departamento] ([Id], [Nombre], [Id_Pais]) VALUES (41, N'HUILA', 1)
INSERT [dbo].[Departamento] ([Id], [Nombre], [Id_Pais]) VALUES (44, N'LA GUAJIRA', 1)
INSERT [dbo].[Departamento] ([Id], [Nombre], [Id_Pais]) VALUES (47, N'MAGDALENA', 1)
INSERT [dbo].[Departamento] ([Id], [Nombre], [Id_Pais]) VALUES (50, N'META', 1)
INSERT [dbo].[Departamento] ([Id], [Nombre], [Id_Pais]) VALUES (52, N'NARIÑO', 1)
INSERT [dbo].[Departamento] ([Id], [Nombre], [Id_Pais]) VALUES (54, N'NORTE DE SANTANDER', 1)
INSERT [dbo].[Departamento] ([Id], [Nombre], [Id_Pais]) VALUES (63, N'QUINDIO', 1)
INSERT [dbo].[Departamento] ([Id], [Nombre], [Id_Pais]) VALUES (66, N'RISARALDA', 1)
INSERT [dbo].[Departamento] ([Id], [Nombre], [Id_Pais]) VALUES (68, N'SANTANDER', 1)
INSERT [dbo].[Departamento] ([Id], [Nombre], [Id_Pais]) VALUES (70, N'SUCRE', 1)
INSERT [dbo].[Departamento] ([Id], [Nombre], [Id_Pais]) VALUES (73, N'TOLIMA', 1)
INSERT [dbo].[Departamento] ([Id], [Nombre], [Id_Pais]) VALUES (76, N'VALLE DEL CAUCA', 1)
INSERT [dbo].[Departamento] ([Id], [Nombre], [Id_Pais]) VALUES (81, N'ARAUCA', 1)
INSERT [dbo].[Departamento] ([Id], [Nombre], [Id_Pais]) VALUES (85, N'CASANARE', 1)
INSERT [dbo].[Departamento] ([Id], [Nombre], [Id_Pais]) VALUES (86, N'PUTUMAYO', 1)
INSERT [dbo].[Departamento] ([Id], [Nombre], [Id_Pais]) VALUES (88, N'ARCHIPIÉLAGO DE SAN ANDRÉS, PROVIDENCIA Y SANTA CATALINA', 1)
INSERT [dbo].[Departamento] ([Id], [Nombre], [Id_Pais]) VALUES (91, N'AMAZONAS', 1)
INSERT [dbo].[Departamento] ([Id], [Nombre], [Id_Pais]) VALUES (94, N'GUAINÍA', 1)
INSERT [dbo].[Departamento] ([Id], [Nombre], [Id_Pais]) VALUES (95, N'GUAVIARE', 1)
INSERT [dbo].[Departamento] ([Id], [Nombre], [Id_Pais]) VALUES (97, N'VAUPÉS', 1)
INSERT [dbo].[Departamento] ([Id], [Nombre], [Id_Pais]) VALUES (99, N'VICHADA', 1)
GO
SET IDENTITY_INSERT [dbo].[Estado_Civil] ON 

INSERT [dbo].[Estado_Civil] ([Id], [Estado]) VALUES (1, N'Soltero (a)')
INSERT [dbo].[Estado_Civil] ([Id], [Estado]) VALUES (2, N'Casado (a)')
INSERT [dbo].[Estado_Civil] ([Id], [Estado]) VALUES (3, N'Unión Libre')
INSERT [dbo].[Estado_Civil] ([Id], [Estado]) VALUES (4, N'Viudo (a)')
INSERT [dbo].[Estado_Civil] ([Id], [Estado]) VALUES (5, N'Separado (a)')
SET IDENTITY_INSERT [dbo].[Estado_Civil] OFF
GO
SET IDENTITY_INSERT [dbo].[Estado_Inscripcion] ON 

INSERT [dbo].[Estado_Inscripcion] ([Id], [Estado]) VALUES (1, N'Inscrito')
INSERT [dbo].[Estado_Inscripcion] ([Id], [Estado]) VALUES (2, N'Con entrevista')
INSERT [dbo].[Estado_Inscripcion] ([Id], [Estado]) VALUES (3, N'Sin entrevista')
INSERT [dbo].[Estado_Inscripcion] ([Id], [Estado]) VALUES (7, N'Con actualización')
INSERT [dbo].[Estado_Inscripcion] ([Id], [Estado]) VALUES (8, N'Con rechazos')
SET IDENTITY_INSERT [dbo].[Estado_Inscripcion] OFF
GO
SET IDENTITY_INSERT [dbo].[Genero] ON 

INSERT [dbo].[Genero] ([Id], [Sexo]) VALUES (1, N'Masculino')
INSERT [dbo].[Genero] ([Id], [Sexo]) VALUES (2, N'Femenino')
SET IDENTITY_INSERT [dbo].[Genero] OFF
GO
SET IDENTITY_INSERT [dbo].[Grupo_Sanguineo] ON 

INSERT [dbo].[Grupo_Sanguineo] ([Id], [Grupo]) VALUES (1, N'O+ ')
INSERT [dbo].[Grupo_Sanguineo] ([Id], [Grupo]) VALUES (2, N'O- ')
INSERT [dbo].[Grupo_Sanguineo] ([Id], [Grupo]) VALUES (3, N'A+ ')
INSERT [dbo].[Grupo_Sanguineo] ([Id], [Grupo]) VALUES (4, N'A- ')
INSERT [dbo].[Grupo_Sanguineo] ([Id], [Grupo]) VALUES (5, N'B+ ')
INSERT [dbo].[Grupo_Sanguineo] ([Id], [Grupo]) VALUES (6, N'B- ')
INSERT [dbo].[Grupo_Sanguineo] ([Id], [Grupo]) VALUES (7, N'AB+')
INSERT [dbo].[Grupo_Sanguineo] ([Id], [Grupo]) VALUES (8, N'AB-')
SET IDENTITY_INSERT [dbo].[Grupo_Sanguineo] OFF
GO
SET IDENTITY_INSERT [dbo].[Inscripcion] ON 

INSERT [dbo].[Inscripcion] ([Id], [Id_Tipo_Aspirante], [Id_Modalidad], [Id_Sede], [Id_Programa], [Id_Periodo], [Id_Estado_Inscripcion], [Id_Usuario], [Completo]) VALUES (1, 1, 3, 1, 1, 2, 1, 3, 1)
INSERT [dbo].[Inscripcion] ([Id], [Id_Tipo_Aspirante], [Id_Modalidad], [Id_Sede], [Id_Programa], [Id_Periodo], [Id_Estado_Inscripcion], [Id_Usuario], [Completo]) VALUES (2, 1, 1, 2, 4, 2, 1, 4, 1)
SET IDENTITY_INSERT [dbo].[Inscripcion] OFF
GO
SET IDENTITY_INSERT [dbo].[Modalidad] ON 

INSERT [dbo].[Modalidad] ([Id], [Tipo]) VALUES (1, N'Presencial')
INSERT [dbo].[Modalidad] ([Id], [Tipo]) VALUES (2, N'Semipresencial')
INSERT [dbo].[Modalidad] ([Id], [Tipo]) VALUES (3, N'A Distancia')
SET IDENTITY_INSERT [dbo].[Modalidad] OFF
GO
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1, N'Abriaquí', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (2, N'Acacías', 1, 50)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (3, N'Acandí', 1, 27)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (4, N'Acevedo', 1, 41)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (5, N'Achí', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (6, N'Agrado', 1, 41)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (7, N'Agua de Dios', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (8, N'Aguachica', 1, 20)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (9, N'Aguada', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (10, N'Aguadas', 1, 17)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (11, N'Aguazul', 1, 85)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (12, N'Agustín Codazzi', 1, 20)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (13, N'Aipe', 1, 41)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (14, N'Albania', 1, 18)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (15, N'Albania', 1, 44)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (16, N'Albania', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (17, N'Albán', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (18, N'Albán (San José)', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (19, N'Alcalá', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (20, N'Alejandria', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (21, N'Algarrobo', 1, 47)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (22, N'Algeciras', 1, 41)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (23, N'Almaguer', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (24, N'Almeida', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (25, N'Alpujarra', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (26, N'Altamira', 1, 41)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (27, N'Alto Baudó (Pie de Pato)', 1, 27)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (28, N'Altos del Rosario', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (29, N'Alvarado', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (30, N'Amagá', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (31, N'Amalfi', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (32, N'Ambalema', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (33, N'Anapoima', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (34, N'Ancuya', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (35, N'Andalucía', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (36, N'Andes', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (37, N'Angelópolis', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (38, N'Angostura', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (39, N'Anolaima', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (40, N'Anorí', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (41, N'Anserma', 1, 17)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (42, N'Ansermanuevo', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (43, N'Anzoátegui', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (44, N'Anzá', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (45, N'Apartadó', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (46, N'Apulo', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (47, N'Apía', 1, 66)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (48, N'Aquitania', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (49, N'Aracataca', 1, 47)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (50, N'Aranzazu', 1, 17)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (51, N'Aratoca', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (52, N'Arauca', 1, 81)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (53, N'Arauquita', 1, 81)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (54, N'Arbeláez', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (55, N'Arboleda (Berruecos)', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (56, N'Arboledas', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (57, N'Arboletes', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (58, N'Arcabuco', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (59, N'Arenal', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (60, N'Argelia', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (61, N'Argelia', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (62, N'Argelia', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (63, N'Ariguaní (El Difícil)', 1, 47)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (64, N'Arjona', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (65, N'Armenia', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (66, N'Armenia', 1, 63)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (67, N'Armero (Guayabal)', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (68, N'Arroyohondo', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (69, N'Astrea', 1, 20)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (70, N'Ataco', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (71, N'Atrato (Yuto)', 1, 27)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (72, N'Ayapel', 1, 23)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (73, N'Bagadó', 1, 27)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (74, N'Bahía Solano (Mútis)', 1, 27)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (75, N'Bajo Baudó (Pizarro)', 1, 27)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (76, N'Balboa', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (77, N'Balboa', 1, 66)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (78, N'Baranoa', 1, 8)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (79, N'Baraya', 1, 41)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (80, N'Barbacoas', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (81, N'Barbosa', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (82, N'Barbosa', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (83, N'Barichara', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (84, N'Barranca de Upía', 1, 50)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (85, N'Barrancabermeja', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (86, N'Barrancas', 1, 44)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (87, N'Barranco de Loba', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (88, N'Barranquilla', 1, 8)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (89, N'Becerríl', 1, 20)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (90, N'Belalcázar', 1, 17)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (91, N'Bello', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (92, N'Belmira', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (93, N'Beltrán', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (94, N'Belén', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (95, N'Belén', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (96, N'Belén de Bajirá', 1, 27)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (97, N'Belén de Umbría', 1, 66)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (98, N'Belén de los Andaquíes', 1, 18)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (99, N'Berbeo', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (100, N'Betania', 1, 5)
GO
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (101, N'Beteitiva', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (102, N'Betulia', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (103, N'Betulia', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (104, N'Bituima', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (105, N'Boavita', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (106, N'Bochalema', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (107, N'Bogotá D.C.', 1, 11)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (108, N'Bojacá', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (109, N'Bojayá (Bellavista)', 1, 27)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (110, N'Bolívar', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (111, N'Bolívar', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (112, N'Bolívar', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (113, N'Bolívar', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (114, N'Bosconia', 1, 20)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (115, N'Boyacá', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (116, N'Briceño', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (117, N'Briceño', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (118, N'Bucaramanga', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (119, N'Bucarasica', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (120, N'Buenaventura', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (121, N'Buenavista', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (122, N'Buenavista', 1, 23)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (123, N'Buenavista', 1, 63)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (124, N'Buenavista', 1, 70)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (125, N'Buenos Aires', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (126, N'Buesaco', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (127, N'Buga', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (128, N'Bugalagrande', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (129, N'Burítica', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (130, N'Busbanza', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (131, N'Cabrera', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (132, N'Cabrera', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (133, N'Cabuyaro', 1, 50)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (134, N'Cachipay', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (135, N'Caicedo', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (136, N'Caicedonia', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (137, N'Caimito', 1, 70)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (138, N'Cajamarca', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (139, N'Cajibío', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (140, N'Cajicá', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (141, N'Calamar', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (142, N'Calamar', 1, 95)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (143, N'Calarcá', 1, 63)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (144, N'Caldas', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (145, N'Caldas', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (146, N'Caldono', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (147, N'California', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (148, N'Calima (Darién)', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (149, N'Caloto', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (150, N'Calí', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (151, N'Campamento', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (152, N'Campo de la Cruz', 1, 8)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (153, N'Campoalegre', 1, 41)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (154, N'Campohermoso', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (155, N'Canalete', 1, 23)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (156, N'Candelaria', 1, 8)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (157, N'Candelaria', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (158, N'Cantagallo', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (159, N'Cantón de San Pablo', 1, 27)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (160, N'Caparrapí', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (161, N'Capitanejo', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (162, N'Caracolí', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (163, N'Caramanta', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (164, N'Carcasí', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (165, N'Carepa', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (166, N'Carmen de Apicalá', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (167, N'Carmen de Carupa', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (168, N'Carmen de Viboral', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (169, N'Carmen del Darién (CURBARADÓ)', 1, 27)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (170, N'Carolina', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (171, N'Cartagena', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (172, N'Cartagena del Chairá', 1, 18)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (173, N'Cartago', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (174, N'Carurú', 1, 97)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (175, N'Casabianca', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (176, N'Castilla la Nueva', 1, 50)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (177, N'Caucasia', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (178, N'Cañasgordas', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (179, N'Cepita', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (180, N'Cereté', 1, 23)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (181, N'Cerinza', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (182, N'Cerrito', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (183, N'Cerro San Antonio', 1, 47)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (184, N'Chachaguí', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (185, N'Chaguaní', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (186, N'Chalán', 1, 70)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (187, N'Chaparral', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (188, N'Charalá', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (189, N'Charta', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (190, N'Chigorodó', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (191, N'Chima', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (192, N'Chimichagua', 1, 20)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (193, N'Chimá', 1, 23)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (194, N'Chinavita', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (195, N'Chinchiná', 1, 17)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (196, N'Chinácota', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (197, N'Chinú', 1, 23)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (198, N'Chipaque', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (199, N'Chipatá', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (200, N'Chiquinquirá', 1, 15)
GO
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (201, N'Chiriguaná', 1, 20)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (202, N'Chiscas', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (203, N'Chita', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (204, N'Chitagá', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (205, N'Chitaraque', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (206, N'Chivatá', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (207, N'Chivolo', 1, 47)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (208, N'Choachí', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (209, N'Chocontá', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (210, N'Chámeza', 1, 85)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (211, N'Chía', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (212, N'Chíquiza', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (213, N'Chívor', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (214, N'Cicuco', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (215, N'Cimitarra', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (216, N'Circasia', 1, 63)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (217, N'Cisneros', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (218, N'Ciénaga', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (219, N'Ciénaga', 1, 47)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (220, N'Ciénaga de Oro', 1, 23)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (221, N'Clemencia', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (222, N'Cocorná', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (223, N'Coello', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (224, N'Cogua', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (225, N'Colombia', 1, 41)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (226, N'Colosó (Ricaurte)', 1, 70)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (227, N'Colón', 1, 86)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (228, N'Colón (Génova)', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (229, N'Concepción', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (230, N'Concepción', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (231, N'Concordia', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (232, N'Concordia', 1, 47)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (233, N'Condoto', 1, 27)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (234, N'Confines', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (235, N'Consaca', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (236, N'Contadero', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (237, N'Contratación', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (238, N'Convención', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (239, N'Copacabana', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (240, N'Coper', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (241, N'Cordobá', 1, 63)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (242, N'Corinto', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (243, N'Coromoro', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (244, N'Corozal', 1, 70)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (245, N'Corrales', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (246, N'Cota', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (247, N'Cotorra', 1, 23)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (248, N'Covarachía', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (249, N'Coveñas', 1, 70)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (250, N'Coyaima', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (251, N'Cravo Norte', 1, 81)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (252, N'Cuaspud (Carlosama)', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (253, N'Cubarral', 1, 50)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (254, N'Cubará', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (255, N'Cucaita', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (256, N'Cucunubá', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (257, N'Cucutilla', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (258, N'Cuitiva', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (259, N'Cumaral', 1, 50)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (260, N'Cumaribo', 1, 99)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (261, N'Cumbal', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (262, N'Cumbitara', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (263, N'Cunday', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (264, N'Curillo', 1, 18)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (265, N'Curití', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (266, N'Curumaní', 1, 20)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (267, N'Cáceres', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (268, N'Cáchira', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (269, N'Cácota', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (270, N'Cáqueza', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (271, N'Cértegui', 1, 27)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (272, N'Cómbita', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (273, N'Córdoba', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (274, N'Córdoba', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (275, N'Cúcuta', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (276, N'Dabeiba', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (277, N'Dagua', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (278, N'Dibulla', 1, 44)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (279, N'Distracción', 1, 44)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (280, N'Dolores', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (281, N'Don Matías', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (282, N'Dos Quebradas', 1, 66)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (283, N'Duitama', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (284, N'Durania', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (285, N'Ebéjico', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (286, N'El Bagre', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (287, N'El Banco', 1, 47)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (288, N'El Cairo', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (289, N'El Calvario', 1, 50)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (290, N'El Carmen', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (291, N'El Carmen', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (292, N'El Carmen de Atrato', 1, 27)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (293, N'El Carmen de Bolívar', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (294, N'El Castillo', 1, 50)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (295, N'El Cerrito', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (296, N'El Charco', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (297, N'El Cocuy', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (298, N'El Colegio', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (299, N'El Copey', 1, 20)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (300, N'El Doncello', 1, 18)
GO
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (301, N'El Dorado', 1, 50)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (302, N'El Dovio', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (303, N'El Espino', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (304, N'El Guacamayo', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (305, N'El Guamo', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (306, N'El Molino', 1, 44)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (307, N'El Paso', 1, 20)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (308, N'El Paujil', 1, 18)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (309, N'El Peñol', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (310, N'El Peñon', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (311, N'El Peñon', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (312, N'El Peñón', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (313, N'El Piñon', 1, 47)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (314, N'El Playón', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (315, N'El Retorno', 1, 95)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (316, N'El Retén', 1, 47)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (317, N'El Roble', 1, 70)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (318, N'El Rosal', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (319, N'El Rosario', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (320, N'El Tablón de Gómez', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (321, N'El Tambo', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (322, N'El Tambo', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (323, N'El Tarra', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (324, N'El Zulia', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (325, N'El Águila', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (326, N'Elías', 1, 41)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (327, N'Encino', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (328, N'Enciso', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (329, N'Entrerríos', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (330, N'Envigado', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (331, N'Espinal', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (332, N'Facatativá', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (333, N'Falan', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (334, N'Filadelfia', 1, 17)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (335, N'Filandia', 1, 63)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (336, N'Firavitoba', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (337, N'Flandes', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (338, N'Florencia', 1, 18)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (339, N'Florencia', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (340, N'Floresta', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (341, N'Florida', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (342, N'Floridablanca', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (343, N'Florián', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (344, N'Fonseca', 1, 44)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (345, N'Fortúl', 1, 81)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (346, N'Fosca', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (347, N'Francisco Pizarro', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (348, N'Fredonia', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (349, N'Fresno', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (350, N'Frontino', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (351, N'Fuente de Oro', 1, 50)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (352, N'Fundación', 1, 47)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (353, N'Funes', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (354, N'Funza', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (355, N'Fusagasugá', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (356, N'Fómeque', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (357, N'Fúquene', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (358, N'Gachalá', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (359, N'Gachancipá', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (360, N'Gachantivá', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (361, N'Gachetá', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (362, N'Galapa', 1, 8)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (363, N'Galeras (Nueva Granada)', 1, 70)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (364, N'Galán', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (365, N'Gama', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (366, N'Gamarra', 1, 20)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (367, N'Garagoa', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (368, N'Garzón', 1, 41)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (369, N'Gigante', 1, 41)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (370, N'Ginebra', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (371, N'Giraldo', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (372, N'Girardot', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (373, N'Girardota', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (374, N'Girón', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (375, N'Gonzalez', 1, 20)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (376, N'Gramalote', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (377, N'Granada', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (378, N'Granada', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (379, N'Granada', 1, 50)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (380, N'Guaca', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (381, N'Guacamayas', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (382, N'Guacarí', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (383, N'Guachavés', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (384, N'Guachené', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (385, N'Guachetá', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (386, N'Guachucal', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (387, N'Guadalupe', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (388, N'Guadalupe', 1, 41)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (389, N'Guadalupe', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (390, N'Guaduas', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (391, N'Guaitarilla', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (392, N'Gualmatán', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (393, N'Guamal', 1, 47)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (394, N'Guamal', 1, 50)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (395, N'Guamo', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (396, N'Guapota', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (397, N'Guapí', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (398, N'Guaranda', 1, 70)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (399, N'Guarne', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (400, N'Guasca', 1, 25)
GO
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (401, N'Guatapé', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (402, N'Guataquí', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (403, N'Guatavita', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (404, N'Guateque', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (405, N'Guavatá', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (406, N'Guayabal de Siquima', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (407, N'Guayabetal', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (408, N'Guayatá', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (409, N'Guepsa', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (410, N'Guicán', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (411, N'Gutiérrez', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (412, N'Guática', 1, 66)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (413, N'Gámbita', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (414, N'Gámeza', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (415, N'Génova', 1, 63)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (416, N'Gómez Plata', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (417, N'Hacarí', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (418, N'Hatillo de Loba', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (419, N'Hato', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (420, N'Hato Corozal', 1, 85)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (421, N'Hatonuevo', 1, 44)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (422, N'Heliconia', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (423, N'Herrán', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (424, N'Herveo', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (425, N'Hispania', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (426, N'Hobo', 1, 41)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (427, N'Honda', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (428, N'Ibagué', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (429, N'Icononzo', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (430, N'Iles', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (431, N'Imúes', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (432, N'Inzá', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (433, N'Inírida', 1, 94)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (434, N'Ipiales', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (435, N'Isnos', 1, 41)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (436, N'Istmina', 1, 27)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (437, N'Itagüí', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (438, N'Ituango', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (439, N'Izá', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (440, N'Jambaló', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (441, N'Jamundí', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (442, N'Jardín', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (443, N'Jenesano', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (444, N'Jericó', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (445, N'Jericó', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (446, N'Jerusalén', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (447, N'Jesús María', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (448, N'Jordán', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (449, N'Juan de Acosta', 1, 8)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (450, N'Junín', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (451, N'Juradó', 1, 27)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (452, N'La Apartada y La Frontera', 1, 23)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (453, N'La Argentina', 1, 41)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (454, N'La Belleza', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (455, N'La Calera', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (456, N'La Capilla', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (457, N'La Ceja', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (458, N'La Celia', 1, 66)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (459, N'La Cruz', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (460, N'La Cumbre', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (461, N'La Dorada', 1, 17)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (462, N'La Esperanza', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (463, N'La Estrella', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (464, N'La Florida', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (465, N'La Gloria', 1, 20)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (466, N'La Jagua de Ibirico', 1, 20)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (467, N'La Jagua del Pilar', 1, 44)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (468, N'La Llanada', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (469, N'La Macarena', 1, 50)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (470, N'La Merced', 1, 17)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (471, N'La Mesa', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (472, N'La Montañita', 1, 18)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (473, N'La Palma', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (474, N'La Paz', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (475, N'La Paz (Robles)', 1, 20)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (476, N'La Peña', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (477, N'La Pintada', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (478, N'La Plata', 1, 41)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (479, N'La Playa', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (480, N'La Primavera', 1, 99)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (481, N'La Salina', 1, 85)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (482, N'La Sierra', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (483, N'La Tebaida', 1, 63)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (484, N'La Tola', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (485, N'La Unión', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (486, N'La Unión', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (487, N'La Unión', 1, 70)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (488, N'La Unión', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (489, N'La Uvita', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (490, N'La Vega', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (491, N'La Vega', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (492, N'La Victoria', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (493, N'La Victoria', 1, 17)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (494, N'La Victoria', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (495, N'La Virginia', 1, 66)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (496, N'Labateca', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (497, N'Labranzagrande', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (498, N'Landázuri', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (499, N'Lebrija', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (500, N'Leiva', 1, 52)
GO
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (501, N'Lejanías', 1, 50)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (502, N'Lenguazaque', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (503, N'Leticia', 1, 91)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (504, N'Liborina', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (505, N'Linares', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (506, N'Lloró', 1, 27)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (507, N'Lorica', 1, 23)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (508, N'Los Córdobas', 1, 23)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (509, N'Los Palmitos', 1, 70)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (510, N'Los Patios', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (511, N'Los Santos', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (512, N'Lourdes', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (513, N'Luruaco', 1, 8)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (514, N'Lérida', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (515, N'Líbano', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (516, N'López (Micay)', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (517, N'Macanal', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (518, N'Macaravita', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (519, N'Maceo', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (520, N'Machetá', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (521, N'Madrid', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (522, N'Magangué', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (523, N'Magüi (Payán)', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (524, N'Mahates', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (525, N'Maicao', 1, 44)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (526, N'Majagual', 1, 70)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (527, N'Malambo', 1, 8)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (528, N'Mallama (Piedrancha)', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (529, N'Manatí', 1, 8)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (530, N'Manaure', 1, 44)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (531, N'Manaure Balcón del Cesar', 1, 20)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (532, N'Manizales', 1, 17)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (533, N'Manta', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (534, N'Manzanares', 1, 17)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (535, N'Maní', 1, 85)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (536, N'Mapiripan', 1, 50)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (537, N'Margarita', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (538, N'Marinilla', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (539, N'Maripí', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (540, N'Mariquita', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (541, N'Marmato', 1, 17)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (542, N'Marquetalia', 1, 17)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (543, N'Marsella', 1, 66)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (544, N'Marulanda', 1, 17)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (545, N'María la Baja', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (546, N'Matanza', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (547, N'Medellín', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (548, N'Medina', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (549, N'Medio Atrato', 1, 27)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (550, N'Medio Baudó', 1, 27)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (551, N'Medio San Juan (ANDAGOYA)', 1, 27)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (552, N'Melgar', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (553, N'Mercaderes', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (554, N'Mesetas', 1, 50)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (555, N'Milán', 1, 18)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (556, N'Miraflores', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (557, N'Miraflores', 1, 95)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (558, N'Miranda', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (559, N'Mistrató', 1, 66)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (560, N'Mitú', 1, 97)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (561, N'Mocoa', 1, 86)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (562, N'Mogotes', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (563, N'Molagavita', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (564, N'Momil', 1, 23)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (565, N'Mompós', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (566, N'Mongua', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (567, N'Monguí', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (568, N'Moniquirá', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (569, N'Montebello', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (570, N'Montecristo', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (571, N'Montelíbano', 1, 23)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (572, N'Montenegro', 1, 63)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (573, N'Monteria', 1, 23)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (574, N'Monterrey', 1, 85)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (575, N'Morales', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (576, N'Morales', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (577, N'Morelia', 1, 18)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (578, N'Morroa', 1, 70)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (579, N'Mosquera', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (580, N'Mosquera', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (581, N'Motavita', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (582, N'Moñitos', 1, 23)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (583, N'Murillo', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (584, N'Murindó', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (585, N'Mutatá', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (586, N'Mutiscua', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (587, N'Muzo', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (588, N'Málaga', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (589, N'Nariño', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (590, N'Nariño', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (591, N'Nariño', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (592, N'Natagaima', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (593, N'Nechí', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (594, N'Necoclí', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (595, N'Neira', 1, 17)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (596, N'Neiva', 1, 41)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (597, N'Nemocón', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (598, N'Nilo', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (599, N'Nimaima', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (600, N'Nobsa', 1, 15)
GO
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (601, N'Nocaima', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (602, N'Norcasia', 1, 17)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (603, N'Norosí', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (604, N'Novita', 1, 27)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (605, N'Nueva Granada', 1, 47)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (606, N'Nuevo Colón', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (607, N'Nunchía', 1, 85)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (608, N'Nuquí', 1, 27)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (609, N'Nátaga', 1, 41)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (610, N'Obando', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (611, N'Ocamonte', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (612, N'Ocaña', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (613, N'Oiba', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (614, N'Oicatá', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (615, N'Olaya', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (616, N'Olaya Herrera', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (617, N'Onzaga', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (618, N'Oporapa', 1, 41)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (619, N'Orito', 1, 86)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (620, N'Orocué', 1, 85)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (621, N'Ortega', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (622, N'Ospina', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (623, N'Otanche', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (624, N'Ovejas', 1, 70)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (625, N'Pachavita', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (626, N'Pacho', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (627, N'Padilla', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (628, N'Paicol', 1, 41)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (629, N'Pailitas', 1, 20)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (630, N'Paime', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (631, N'Paipa', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (632, N'Pajarito', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (633, N'Palermo', 1, 41)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (634, N'Palestina', 1, 17)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (635, N'Palestina', 1, 41)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (636, N'Palmar', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (637, N'Palmar de Varela', 1, 8)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (638, N'Palmas del Socorro', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (639, N'Palmira', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (640, N'Palmito', 1, 70)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (641, N'Palocabildo', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (642, N'Pamplona', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (643, N'Pamplonita', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (644, N'Pandi', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (645, N'Panqueba', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (646, N'Paratebueno', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (647, N'Pasca', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (648, N'Patía (El Bordo)', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (649, N'Pauna', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (650, N'Paya', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (651, N'Paz de Ariporo', 1, 85)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (652, N'Paz de Río', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (653, N'Pedraza', 1, 47)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (654, N'Pelaya', 1, 20)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (655, N'Pensilvania', 1, 17)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (656, N'Peque', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (657, N'Pereira', 1, 66)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (658, N'Pesca', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (659, N'Peñol', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (660, N'Piamonte', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (661, N'Pie de Cuesta', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (662, N'Piedras', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (663, N'Piendamó', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (664, N'Pijao', 1, 63)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (665, N'Pijiño', 1, 47)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (666, N'Pinchote', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (667, N'Pinillos', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (668, N'Piojo', 1, 8)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (669, N'Pisva', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (670, N'Pital', 1, 41)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (671, N'Pitalito', 1, 41)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (672, N'Pivijay', 1, 47)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (673, N'Planadas', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (674, N'Planeta Rica', 1, 23)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (675, N'Plato', 1, 47)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (676, N'Policarpa', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (677, N'Polonuevo', 1, 8)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (678, N'Ponedera', 1, 8)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (679, N'Popayán', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (680, N'Pore', 1, 85)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (681, N'Potosí', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (682, N'Pradera', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (683, N'Prado', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (684, N'Providencia', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (685, N'Providencia', 1, 88)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (686, N'Pueblo Bello', 1, 20)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (687, N'Pueblo Nuevo', 1, 23)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (688, N'Pueblo Rico', 1, 66)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (689, N'Pueblorrico', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (690, N'Puebloviejo', 1, 47)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (691, N'Puente Nacional', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (692, N'Puerres', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (693, N'Puerto Asís', 1, 86)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (694, N'Puerto Berrío', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (695, N'Puerto Boyacá', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (696, N'Puerto Caicedo', 1, 86)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (697, N'Puerto Carreño', 1, 99)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (698, N'Puerto Colombia', 1, 8)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (699, N'Puerto Concordia', 1, 50)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (700, N'Puerto Escondido', 1, 23)
GO
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (701, N'Puerto Gaitán', 1, 50)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (702, N'Puerto Guzmán', 1, 86)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (703, N'Puerto Leguízamo', 1, 86)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (704, N'Puerto Libertador', 1, 23)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (705, N'Puerto Lleras', 1, 50)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (706, N'Puerto López', 1, 50)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (707, N'Puerto Nare', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (708, N'Puerto Nariño', 1, 91)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (709, N'Puerto Parra', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (710, N'Puerto Rico', 1, 18)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (711, N'Puerto Rico', 1, 50)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (712, N'Puerto Rondón', 1, 81)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (713, N'Puerto Salgar', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (714, N'Puerto Santander', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (715, N'Puerto Tejada', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (716, N'Puerto Triunfo', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (717, N'Puerto Wilches', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (718, N'Pulí', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (719, N'Pupiales', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (720, N'Puracé (Coconuco)', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (721, N'Purificación', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (722, N'Purísima', 1, 23)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (723, N'Pácora', 1, 17)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (724, N'Páez', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (725, N'Páez (Belalcazar)', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (726, N'Páramo', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (727, N'Quebradanegra', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (728, N'Quetame', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (729, N'Quibdó', 1, 27)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (730, N'Quimbaya', 1, 63)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (731, N'Quinchía', 1, 66)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (732, N'Quipama', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (733, N'Quipile', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (734, N'Ragonvalia', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (735, N'Ramiriquí', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (736, N'Recetor', 1, 85)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (737, N'Regidor', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (738, N'Remedios', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (739, N'Remolino', 1, 47)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (740, N'Repelón', 1, 8)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (741, N'Restrepo', 1, 50)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (742, N'Restrepo', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (743, N'Retiro', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (744, N'Ricaurte', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (745, N'Ricaurte', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (746, N'Rio Negro', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (747, N'Rioblanco', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (748, N'Riofrío', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (749, N'Riohacha', 1, 44)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (750, N'Risaralda', 1, 17)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (751, N'Rivera', 1, 41)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (752, N'Roberto Payán (San José)', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (753, N'Roldanillo', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (754, N'Roncesvalles', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (755, N'Rondón', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (756, N'Rosas', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (757, N'Rovira', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (758, N'Ráquira', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (759, N'Río Iró', 1, 27)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (760, N'Río Quito', 1, 27)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (761, N'Río Sucio', 1, 17)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (762, N'Río Viejo', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (763, N'Río de oro', 1, 20)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (764, N'Ríonegro', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (765, N'Ríosucio', 1, 27)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (766, N'Sabana de Torres', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (767, N'Sabanagrande', 1, 8)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (768, N'Sabanalarga', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (769, N'Sabanalarga', 1, 8)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (770, N'Sabanalarga', 1, 85)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (771, N'Sabanas de San Angel (SAN ANGEL)', 1, 47)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (772, N'Sabaneta', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (773, N'Saboyá', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (774, N'Sahagún', 1, 23)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (775, N'Saladoblanco', 1, 41)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (776, N'Salamina', 1, 17)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (777, N'Salamina', 1, 47)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (778, N'Salazar', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (779, N'Saldaña', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (780, N'Salento', 1, 63)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (781, N'Salgar', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (782, N'Samacá', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (783, N'Samaniego', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (784, N'Samaná', 1, 17)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (785, N'Sampués', 1, 70)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (786, N'San Agustín', 1, 41)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (787, N'San Alberto', 1, 20)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (788, N'San Andrés', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (789, N'San Andrés Sotavento', 1, 23)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (790, N'San Andrés de Cuerquía', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (791, N'San Antero', 1, 23)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (792, N'San Antonio', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (793, N'San Antonio de Tequendama', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (794, N'San Benito', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (795, N'San Benito Abad', 1, 70)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (796, N'San Bernardo', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (797, N'San Bernardo', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (798, N'San Bernardo del Viento', 1, 23)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (799, N'San Calixto', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (800, N'San Carlos', 1, 5)
GO
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (801, N'San Carlos', 1, 23)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (802, N'San Carlos de Guaroa', 1, 50)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (803, N'San Cayetano', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (804, N'San Cayetano', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (805, N'San Cristobal', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (806, N'San Diego', 1, 20)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (807, N'San Eduardo', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (808, N'San Estanislao', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (809, N'San Fernando', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (810, N'San Francisco', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (811, N'San Francisco', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (812, N'San Francisco', 1, 86)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (813, N'San Gíl', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (814, N'San Jacinto', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (815, N'San Jacinto del Cauca', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (816, N'San Jerónimo', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (817, N'San Joaquín', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (818, N'San José', 1, 17)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (819, N'San José de Miranda', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (820, N'San José de Montaña', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (821, N'San José de Pare', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (822, N'San José de Uré', 1, 23)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (823, N'San José del Fragua', 1, 18)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (824, N'San José del Guaviare', 1, 95)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (825, N'San José del Palmar', 1, 27)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (826, N'San Juan de Arama', 1, 50)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (827, N'San Juan de Betulia', 1, 70)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (828, N'San Juan de Nepomuceno', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (829, N'San Juan de Pasto', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (830, N'San Juan de Río Seco', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (831, N'San Juan de Urabá', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (832, N'San Juan del Cesar', 1, 44)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (833, N'San Juanito', 1, 50)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (834, N'San Lorenzo', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (835, N'San Luis', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (836, N'San Luís', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (837, N'San Luís de Gaceno', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (838, N'San Luís de Palenque', 1, 85)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (839, N'San Marcos', 1, 70)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (840, N'San Martín', 1, 20)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (841, N'San Martín', 1, 50)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (842, N'San Martín de Loba', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (843, N'San Mateo', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (844, N'San Miguel', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (845, N'San Miguel', 1, 86)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (846, N'San Miguel de Sema', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (847, N'San Onofre', 1, 70)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (848, N'San Pablo', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (849, N'San Pablo', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (850, N'San Pablo de Borbur', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (851, N'San Pedro', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (852, N'San Pedro', 1, 70)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (853, N'San Pedro', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (854, N'San Pedro de Cartago', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (855, N'San Pedro de Urabá', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (856, N'San Pelayo', 1, 23)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (857, N'San Rafael', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (858, N'San Roque', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (859, N'San Sebastián', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (860, N'San Sebastián de Buenavista', 1, 47)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (861, N'San Vicente', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (862, N'San Vicente del Caguán', 1, 18)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (863, N'San Vicente del Chucurí', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (864, N'San Zenón', 1, 47)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (865, N'Sandoná', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (866, N'Santa Ana', 1, 47)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (867, N'Santa Bárbara', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (868, N'Santa Bárbara', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (869, N'Santa Bárbara (Iscuandé)', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (870, N'Santa Bárbara de Pinto', 1, 47)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (871, N'Santa Catalina', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (872, N'Santa Fé de Antioquia', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (873, N'Santa Genoveva de Docorodó', 1, 27)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (874, N'Santa Helena del Opón', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (875, N'Santa Isabel', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (876, N'Santa Lucía', 1, 8)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (877, N'Santa Marta', 1, 47)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (878, N'Santa María', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (879, N'Santa María', 1, 41)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (880, N'Santa Rosa', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (881, N'Santa Rosa', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (882, N'Santa Rosa de Cabal', 1, 66)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (883, N'Santa Rosa de Osos', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (884, N'Santa Rosa de Viterbo', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (885, N'Santa Rosa del Sur', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (886, N'Santa Rosalía', 1, 99)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (887, N'Santa Sofía', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (888, N'Santana', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (889, N'Santander de Quilichao', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (890, N'Santiago', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (891, N'Santiago', 1, 86)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (892, N'Santo Domingo', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (893, N'Santo Tomás', 1, 8)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (894, N'Santuario', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (895, N'Santuario', 1, 66)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (896, N'Sapuyes', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (897, N'Saravena', 1, 81)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (898, N'Sardinata', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (899, N'Sasaima', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (900, N'Sativanorte', 1, 15)
GO
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (901, N'Sativasur', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (902, N'Segovia', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (903, N'Sesquilé', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (904, N'Sevilla', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (905, N'Siachoque', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (906, N'Sibaté', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (907, N'Sibundoy', 1, 86)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (908, N'Silos', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (909, N'Silvania', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (910, N'Silvia', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (911, N'Simacota', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (912, N'Simijaca', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (913, N'Simití', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (914, N'Sincelejo', 1, 70)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (915, N'Sincé', 1, 70)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (916, N'Sipí', 1, 27)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (917, N'Sitionuevo', 1, 47)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (918, N'Soacha', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (919, N'Soatá', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (920, N'Socha', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (921, N'Socorro', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (922, N'Socotá', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (923, N'Sogamoso', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (924, N'Solano', 1, 18)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (925, N'Soledad', 1, 8)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (926, N'Solita', 1, 18)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (927, N'Somondoco', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (928, N'Sonsón', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (929, N'Sopetrán', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (930, N'Soplaviento', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (931, N'Sopó', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (932, N'Sora', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (933, N'Soracá', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (934, N'Sotaquirá', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (935, N'Sotara (Paispamba)', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (936, N'Sotomayor (Los Andes)', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (937, N'Suaita', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (938, N'Suan', 1, 8)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (939, N'Suaza', 1, 41)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (940, N'Subachoque', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (941, N'Sucre', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (942, N'Sucre', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (943, N'Sucre', 1, 70)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (944, N'Suesca', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (945, N'Supatá', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (946, N'Supía', 1, 17)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (947, N'Suratá', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (948, N'Susa', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (949, N'Susacón', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (950, N'Sutamarchán', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (951, N'Sutatausa', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (952, N'Sutatenza', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (953, N'Suárez', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (954, N'Suárez', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (955, N'Sácama', 1, 85)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (956, N'Sáchica', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (957, N'Tabio', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (958, N'Tadó', 1, 27)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (959, N'Talaigua Nuevo', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (960, N'Tamalameque', 1, 20)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (961, N'Tame', 1, 81)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (962, N'Taminango', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (963, N'Tangua', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (964, N'Taraira', 1, 97)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (965, N'Tarazá', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (966, N'Tarqui', 1, 41)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (967, N'Tarso', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (968, N'Tasco', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (969, N'Tauramena', 1, 85)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (970, N'Tausa', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (971, N'Tello', 1, 41)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (972, N'Tena', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (973, N'Tenerife', 1, 47)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (974, N'Tenjo', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (975, N'Tenza', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (976, N'Teorama', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (977, N'Teruel', 1, 41)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (978, N'Tesalia', 1, 41)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (979, N'Tibacuy', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (980, N'Tibaná', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (981, N'Tibasosa', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (982, N'Tibirita', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (983, N'Tibú', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (984, N'Tierralta', 1, 23)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (985, N'Timaná', 1, 41)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (986, N'Timbiquí', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (987, N'Timbío', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (988, N'Tinjacá', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (989, N'Tipacoque', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (990, N'Tiquisio (Puerto Rico)', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (991, N'Titiribí', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (992, N'Toca', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (993, N'Tocaima', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (994, N'Tocancipá', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (995, N'Toguí', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (996, N'Toledo', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (997, N'Toledo', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (998, N'Tolú', 1, 70)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (999, N'Tolú Viejo', 1, 70)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1000, N'Tona', 1, 68)
GO
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1001, N'Topagá', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1002, N'Topaipí', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1003, N'Toribío', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1004, N'Toro', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1005, N'Tota', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1006, N'Totoró', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1007, N'Trinidad', 1, 85)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1008, N'Trujillo', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1009, N'Tubará', 1, 8)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1010, N'Tuchín', 1, 23)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1011, N'Tulúa', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1012, N'Tumaco', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1013, N'Tunja', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1014, N'Tunungua', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1015, N'Turbaco', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1016, N'Turbaná', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1017, N'Turbo', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1018, N'Turmequé', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1019, N'Tuta', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1020, N'Tutasá', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1021, N'Támara', 1, 85)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1022, N'Támesis', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1023, N'Túquerres', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1024, N'Ubalá', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1025, N'Ubaque', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1026, N'Ubaté', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1027, N'Ulloa', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1028, N'Une', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1029, N'Unguía', 1, 27)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1030, N'Unión Panamericana (ÁNIMAS)', 1, 27)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1031, N'Uramita', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1032, N'Uribe', 1, 50)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1033, N'Uribia', 1, 44)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1034, N'Urrao', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1035, N'Urumita', 1, 44)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1036, N'Usiacuri', 1, 8)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1037, N'Valdivia', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1038, N'Valencia', 1, 23)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1039, N'Valle de San José', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1040, N'Valle de San Juan', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1041, N'Valle del Guamuez', 1, 86)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1042, N'Valledupar', 1, 20)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1043, N'Valparaiso', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1044, N'Valparaiso', 1, 18)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1045, N'Vegachí', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1046, N'Venadillo', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1047, N'Venecia', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1048, N'Venecia (Ospina Pérez)', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1049, N'Ventaquemada', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1050, N'Vergara', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1051, N'Versalles', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1052, N'Vetas', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1053, N'Viani', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1054, N'Vigía del Fuerte', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1055, N'Vijes', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1056, N'Villa Caro', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1057, N'Villa Rica', 1, 19)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1058, N'Villa de Leiva', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1059, N'Villa del Rosario', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1060, N'Villagarzón', 1, 86)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1061, N'Villagómez', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1062, N'Villahermosa', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1063, N'Villamaría', 1, 17)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1064, N'Villanueva', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1065, N'Villanueva', 1, 44)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1066, N'Villanueva', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1067, N'Villanueva', 1, 85)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1068, N'Villapinzón', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1069, N'Villarrica', 1, 73)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1070, N'Villavicencio', 1, 50)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1071, N'Villavieja', 1, 41)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1072, N'Villeta', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1073, N'Viotá', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1074, N'Viracachá', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1075, N'Vista Hermosa', 1, 50)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1076, N'Viterbo', 1, 17)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1077, N'Vélez', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1078, N'Yacopí', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1079, N'Yacuanquer', 1, 52)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1080, N'Yaguará', 1, 41)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1081, N'Yalí', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1082, N'Yarumal', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1083, N'Yolombó', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1084, N'Yondó (Casabe)', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1085, N'Yopal', 1, 85)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1086, N'Yotoco', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1087, N'Yumbo', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1088, N'Zambrano', 1, 13)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1089, N'Zapatoca', 1, 68)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1090, N'Zapayán (PUNTA DE PIEDRAS)', 1, 47)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1091, N'Zaragoza', 1, 5)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1092, N'Zarzal', 1, 76)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1093, N'Zetaquirá', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1094, N'Zipacón', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1095, N'Zipaquirá', 1, 25)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1096, N'Zona Bananera (PRADO - SEVILLA)', 1, 47)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1097, N'Ábrego', 1, 54)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1098, N'Íquira', 1, 41)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1099, N'Úmbita', 1, 15)
INSERT [dbo].[Municipio] ([Id], [Nombre], [Estado], [Id_Departamento]) VALUES (1100, N'Útica', 1, 25)
GO
SET IDENTITY_INSERT [dbo].[Pais] ON 

INSERT [dbo].[Pais] ([Id], [Nombre]) VALUES (1, N'Colombia')
SET IDENTITY_INSERT [dbo].[Pais] OFF
GO
SET IDENTITY_INSERT [dbo].[Periodo_Academico] ON 

INSERT [dbo].[Periodo_Academico] ([Id], [Periodo]) VALUES (1, 20241)
INSERT [dbo].[Periodo_Academico] ([Id], [Periodo]) VALUES (2, 20242)
SET IDENTITY_INSERT [dbo].[Periodo_Academico] OFF
GO
SET IDENTITY_INSERT [dbo].[Programa_Academico] ON 

INSERT [dbo].[Programa_Academico] ([Id], [Nombre]) VALUES (1, N'Derecho')
INSERT [dbo].[Programa_Academico] ([Id], [Nombre]) VALUES (2, N'Ingeniería Administrativa')
INSERT [dbo].[Programa_Academico] ([Id], [Nombre]) VALUES (3, N'Medicina Veterinaria y Zootecnia')
INSERT [dbo].[Programa_Academico] ([Id], [Nombre]) VALUES (4, N'Odontología')
SET IDENTITY_INSERT [dbo].[Programa_Academico] OFF
GO
SET IDENTITY_INSERT [dbo].[Sede] ON 

INSERT [dbo].[Sede] ([Id], [Nombre]) VALUES (1, N'Medellín')
INSERT [dbo].[Sede] ([Id], [Nombre]) VALUES (2, N'Pereira')
SET IDENTITY_INSERT [dbo].[Sede] OFF
GO
SET IDENTITY_INSERT [dbo].[Tipo_Aspirante] ON 

INSERT [dbo].[Tipo_Aspirante] ([Id], [Tipo]) VALUES (1, N'Nuevo')
INSERT [dbo].[Tipo_Aspirante] ([Id], [Tipo]) VALUES (2, N'Reingreso')
INSERT [dbo].[Tipo_Aspirante] ([Id], [Tipo]) VALUES (3, N'Transferencia Interna')
INSERT [dbo].[Tipo_Aspirante] ([Id], [Tipo]) VALUES (4, N'Transferencia Externa')
SET IDENTITY_INSERT [dbo].[Tipo_Aspirante] OFF
GO
SET IDENTITY_INSERT [dbo].[Tipo_Documento] ON 

INSERT [dbo].[Tipo_Documento] ([Id], [Tipo]) VALUES (1, N'Tarjeta de Identidad')
INSERT [dbo].[Tipo_Documento] ([Id], [Tipo]) VALUES (2, N'Cédula de Ciudadanía')
SET IDENTITY_INSERT [dbo].[Tipo_Documento] OFF
GO
SET IDENTITY_INSERT [dbo].[Tipo_Usuario] ON 

INSERT [dbo].[Tipo_Usuario] ([Id], [Role]) VALUES (1, N'Administrador')
INSERT [dbo].[Tipo_Usuario] ([Id], [Role]) VALUES (2, N'Aspirante')
SET IDENTITY_INSERT [dbo].[Tipo_Usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([Id], [Email], [Password], [Id_Rol]) VALUES (1, N'master@uam.edu.co', N'master123', 1)
INSERT [dbo].[Usuario] ([Id], [Email], [Password], [Id_Rol]) VALUES (2, N'usuario@gmail.com', N'usuario123', 2)
INSERT [dbo].[Usuario] ([Id], [Email], [Password], [Id_Rol]) VALUES (3, N'aspirante1@uam.edu.co', N'aspirante123', 2)
INSERT [dbo].[Usuario] ([Id], [Email], [Password], [Id_Rol]) VALUES (4, N'aspirante2@uam.edu.co', N'aspirante123', 2)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[Aspirante]  WITH CHECK ADD  CONSTRAINT [FK_Aspirante_Estado_Civil] FOREIGN KEY([Id_Estado_Civil])
REFERENCES [dbo].[Estado_Civil] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Aspirante] CHECK CONSTRAINT [FK_Aspirante_Estado_Civil]
GO
ALTER TABLE [dbo].[Aspirante]  WITH CHECK ADD  CONSTRAINT [FK_Aspirante_Genero] FOREIGN KEY([Id_Genero])
REFERENCES [dbo].[Genero] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Aspirante] CHECK CONSTRAINT [FK_Aspirante_Genero]
GO
ALTER TABLE [dbo].[Aspirante]  WITH CHECK ADD  CONSTRAINT [FK_Aspirante_Grupo_Sanguineo] FOREIGN KEY([Id_Grupo_Sanguineo])
REFERENCES [dbo].[Grupo_Sanguineo] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Aspirante] CHECK CONSTRAINT [FK_Aspirante_Grupo_Sanguineo]
GO
ALTER TABLE [dbo].[Aspirante]  WITH CHECK ADD  CONSTRAINT [FK_Aspirante_Inscripcion] FOREIGN KEY([Id_Inscripcion])
REFERENCES [dbo].[Inscripcion] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Aspirante] CHECK CONSTRAINT [FK_Aspirante_Inscripcion]
GO
ALTER TABLE [dbo].[Aspirante]  WITH CHECK ADD  CONSTRAINT [FK_Aspirante_Municipio_Expedicion] FOREIGN KEY([Id_Ciudad_Expedicion])
REFERENCES [dbo].[Municipio] ([Id])
GO
ALTER TABLE [dbo].[Aspirante] CHECK CONSTRAINT [FK_Aspirante_Municipio_Expedicion]
GO
ALTER TABLE [dbo].[Aspirante]  WITH CHECK ADD  CONSTRAINT [FK_Aspirante_Municipio_Nacimiento] FOREIGN KEY([Id_Ciudad_Nacimiento])
REFERENCES [dbo].[Municipio] ([Id])
GO
ALTER TABLE [dbo].[Aspirante] CHECK CONSTRAINT [FK_Aspirante_Municipio_Nacimiento]
GO
ALTER TABLE [dbo].[Aspirante]  WITH CHECK ADD  CONSTRAINT [FK_Aspirante_Tipo_Documento] FOREIGN KEY([Id_Tipo_Documento])
REFERENCES [dbo].[Tipo_Documento] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Aspirante] CHECK CONSTRAINT [FK_Aspirante_Tipo_Documento]
GO
ALTER TABLE [dbo].[Departamento]  WITH CHECK ADD  CONSTRAINT [FK_Departamento_Pais] FOREIGN KEY([Id_Pais])
REFERENCES [dbo].[Pais] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Departamento] CHECK CONSTRAINT [FK_Departamento_Pais]
GO
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_Inscripcion_Estado_Inscripcion] FOREIGN KEY([Id_Estado_Inscripcion])
REFERENCES [dbo].[Estado_Inscripcion] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [FK_Inscripcion_Estado_Inscripcion]
GO
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_Inscripcion_Modalidad] FOREIGN KEY([Id_Modalidad])
REFERENCES [dbo].[Modalidad] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [FK_Inscripcion_Modalidad]
GO
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_Inscripcion_Periodo_Academico] FOREIGN KEY([Id_Periodo])
REFERENCES [dbo].[Periodo_Academico] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [FK_Inscripcion_Periodo_Academico]
GO
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_Inscripcion_Programa_Academico] FOREIGN KEY([Id_Programa])
REFERENCES [dbo].[Programa_Academico] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [FK_Inscripcion_Programa_Academico]
GO
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_Inscripcion_Sede] FOREIGN KEY([Id_Sede])
REFERENCES [dbo].[Sede] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [FK_Inscripcion_Sede]
GO
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_Inscripcion_Tipo_Aspirante] FOREIGN KEY([Id_Tipo_Aspirante])
REFERENCES [dbo].[Tipo_Aspirante] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [FK_Inscripcion_Tipo_Aspirante]
GO
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_Inscripcion_Usuario] FOREIGN KEY([Id_Usuario])
REFERENCES [dbo].[Usuario] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [FK_Inscripcion_Usuario]
GO
ALTER TABLE [dbo].[Municipio]  WITH CHECK ADD  CONSTRAINT [FK_Municipio_Departamento] FOREIGN KEY([Id_Departamento])
REFERENCES [dbo].[Departamento] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Municipio] CHECK CONSTRAINT [FK_Municipio_Departamento]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Tipo_Usuario] FOREIGN KEY([Id_Rol])
REFERENCES [dbo].[Tipo_Usuario] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Tipo_Usuario]
GO
USE [master]
GO
ALTER DATABASE [UAMDB] SET  READ_WRITE 
GO
