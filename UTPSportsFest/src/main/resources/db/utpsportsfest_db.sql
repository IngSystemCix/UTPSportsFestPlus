CREATE DATABASE [UTPSportsFest]
GO
USE [UTPSportsFest]
GO
/****** Object:  User [TestUTPSportsFest]    Script Date: 06/11/2023 11:45:25 ******/
CREATE USER [TestUTPSportsFest] FOR LOGIN [TestUTPSportsFest] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [TestUTPSportsFest]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [TestUTPSportsFest]
GO
/****** Object:  Table [dbo].[administrativo]    Script Date: 06/11/2023 11:45:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[administrativo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](255) NULL,
	[apellido_pat] [varchar](255) NULL,
	[apellido_mat] [varchar](255) NULL,
	[genero] [tinyint] NULL,
	[usuario_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[competencia]    Script Date: 06/11/2023 11:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[competencia](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventoID] [int] NULL,
	[Categoria] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuracion]    Script Date: 06/11/2023 11:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuracion](
	[id_configuracion] [int] IDENTITY(1,1) NOT NULL,
	[modo_oscuro_claro] [tinyint] NULL,
	[id_usuario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_configuracion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[deporte]    Script Date: 06/11/2023 11:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[deporte](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NombreDeporte] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[deportista]    Script Date: 06/11/2023 11:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[deportista](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EquipoID] [int] NULL,
	[usuario_id] [int] NULL,
	[estudiante_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enfrentamientos]    Script Date: 06/11/2023 11:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enfrentamientos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FechaHora] [datetime] NULL,
	[EquipoLocalID] [int] NULL,
	[EquipoVisitanteID] [int] NULL,
	[DeporteID] [int] NULL,
	[Estado] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[entrenador]    Script Date: 06/11/2023 11:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[entrenador](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
	[CorreoElectronico] [varchar](255) NOT NULL,
	[Telefono] [varchar](15) NULL,
	[Direccion] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[equipo]    Script Date: 06/11/2023 11:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[equipo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[logoEquipo] [varchar](255) NOT NULL,
	[NombreEquipo] [varchar](255) NOT NULL,
	[EntrenadorID] [int] NOT NULL,
	[EventoID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estudiante]    Script Date: 06/11/2023 11:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estudiante](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](255) NULL,
	[apellido_pat] [varchar](255) NULL,
	[apellido_mat] [varchar](255) NULL,
	[genero] [tinyint] NULL,
	[usuario_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[evento]    Script Date: 06/11/2023 11:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[evento](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NombreEvento] [varchar](255) NULL,
	[SedeID] [int] NULL,
	[DeporteID] [int] NULL,
	[fechaInicio] [date] NULL,
	[fechaFin] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[medalla]    Script Date: 06/11/2023 11:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[medalla](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DeportistaID] [int] NULL,
	[CompetenciaID] [int] NULL,
	[TipoMedalla] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recordatorio]    Script Date: 06/11/2023 11:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recordatorio](
	[usuario_id] [int] NULL,
	[titulo] [varchar](255) NULL,
	[descripcion] [text] NULL,
	[fecha_hora] [datetime] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[estado] [tinyint] NULL,
 CONSTRAINT [PK_recordatorio_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[resultado]    Script Date: 06/11/2023 11:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[resultado](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CompetenciaID] [int] NULL,
	[Posicion] [int] NULL,
	[TiempoPuntuacion] [varchar](50) NULL,
	[Observaciones] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sede]    Script Date: 06/11/2023 11:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sede](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NombreSede] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tablaposiciones]    Script Date: 06/11/2023 11:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tablaposiciones](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CompetenciaID] [int] NULL,
	[EquipoID] [int] NULL,
	[Puntaje] [int] NULL,
	[TarjetasVerdes] [int] NULL,
	[TarjetasRojas] [int] NULL,
	[TarjetasAmarillas] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tresprimerospuestos]    Script Date: 06/11/2023 11:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tresprimerospuestos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CompetenciaID] [int] NULL,
	[PrimerPuestoEquipoID] [int] NULL,
	[SegundoPuestoEquipoID] [int] NULL,
	[TercerPuestoEquipoID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 06/11/2023 11:45:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](10) NOT NULL,
	[contraseña] [varbinary](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Configuracion] ON 
GO
INSERT [dbo].[Configuracion] ([id_configuracion], [modo_oscuro_claro], [id_usuario]) VALUES (1, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Configuracion] OFF
GO
SET IDENTITY_INSERT [dbo].[deporte] ON 
GO
INSERT [dbo].[deporte] ([ID], [NombreDeporte]) VALUES (1, N'Football')
GO
INSERT [dbo].[deporte] ([ID], [NombreDeporte]) VALUES (2, N'Volley')
GO
INSERT [dbo].[deporte] ([ID], [NombreDeporte]) VALUES (3, N'Basket')
GO
SET IDENTITY_INSERT [dbo].[deporte] OFF
GO
SET IDENTITY_INSERT [dbo].[Enfrentamientos] ON 
GO
INSERT [dbo].[Enfrentamientos] ([ID], [FechaHora], [EquipoLocalID], [EquipoVisitanteID], [DeporteID], [Estado]) VALUES (2, CAST(N'2023-09-11T04:43:00.000' AS DateTime), 1, 5, 1, N'E')
GO
INSERT [dbo].[Enfrentamientos] ([ID], [FechaHora], [EquipoLocalID], [EquipoVisitanteID], [DeporteID], [Estado]) VALUES (3, CAST(N'2023-05-11T16:45:00.000' AS DateTime), 2, 4, 3, N'P')
GO
INSERT [dbo].[Enfrentamientos] ([ID], [FechaHora], [EquipoLocalID], [EquipoVisitanteID], [DeporteID], [Estado]) VALUES (10, CAST(N'2023-03-11T12:00:00.000' AS DateTime), 1, 2, 1, N'C')
GO
INSERT [dbo].[Enfrentamientos] ([ID], [FechaHora], [EquipoLocalID], [EquipoVisitanteID], [DeporteID], [Estado]) VALUES (11, CAST(N'2023-06-11T11:15:00.000' AS DateTime), 3, 5, 1, N'C')
GO
INSERT [dbo].[Enfrentamientos] ([ID], [FechaHora], [EquipoLocalID], [EquipoVisitanteID], [DeporteID], [Estado]) VALUES (12, CAST(N'2023-07-11T13:20:00.000' AS DateTime), 2, 6, 2, N'E')
GO
INSERT [dbo].[Enfrentamientos] ([ID], [FechaHora], [EquipoLocalID], [EquipoVisitanteID], [DeporteID], [Estado]) VALUES (13, CAST(N'2023-08-11T15:00:00.000' AS DateTime), 4, 7, 3, N'P')
GO
INSERT [dbo].[Enfrentamientos] ([ID], [FechaHora], [EquipoLocalID], [EquipoVisitanteID], [DeporteID], [Estado]) VALUES (14, CAST(N'2023-09-11T14:00:00.000' AS DateTime), 6, 8, 1, N'C')
GO
INSERT [dbo].[Enfrentamientos] ([ID], [FechaHora], [EquipoLocalID], [EquipoVisitanteID], [DeporteID], [Estado]) VALUES (22, CAST(N'2023-11-06T18:05:00.000' AS DateTime), 1, 8, 1, N'E')
GO
SET IDENTITY_INSERT [dbo].[Enfrentamientos] OFF
GO
SET IDENTITY_INSERT [dbo].[entrenador] ON 
GO
INSERT [dbo].[entrenador] ([ID], [Nombre], [CorreoElectronico], [Telefono], [Direccion]) VALUES (1, N'John Smith', N'john.smith@gmail.com', N'123456789', N'123 Main Street')
GO
INSERT [dbo].[entrenador] ([ID], [Nombre], [CorreoElectronico], [Telefono], [Direccion]) VALUES (2, N'Maria Rodriguez', N'maria.rodriguez@gmail.com', N'987654321', N'456 Elm Avenue')
GO
INSERT [dbo].[entrenador] ([ID], [Nombre], [CorreoElectronico], [Telefono], [Direccion]) VALUES (3, N'Robert Johnson', N'robert.johnson@gmail.com', N'111222333', N'789 Oak Drive')
GO
INSERT [dbo].[entrenador] ([ID], [Nombre], [CorreoElectronico], [Telefono], [Direccion]) VALUES (4, N'Emily Davis', N'emily.davis@gmail.com', N'444555666', N'234 Birch Lane')
GO
INSERT [dbo].[entrenador] ([ID], [Nombre], [CorreoElectronico], [Telefono], [Direccion]) VALUES (5, N'William Brown', N'william.brown@gmail.com', N'777888999', N'567 Maple Road')
GO
INSERT [dbo].[entrenador] ([ID], [Nombre], [CorreoElectronico], [Telefono], [Direccion]) VALUES (6, N'Linda Martinez', N'linda.martinez@gmail.com', N'222333444', N'890 Pine Street')
GO
INSERT [dbo].[entrenador] ([ID], [Nombre], [CorreoElectronico], [Telefono], [Direccion]) VALUES (7, N'Michael Wilson', N'michael.wilson@gmail.com', N'555666777', N'345 Cedar Avenue')
GO
INSERT [dbo].[entrenador] ([ID], [Nombre], [CorreoElectronico], [Telefono], [Direccion]) VALUES (8, N'Jennifer Lee', N'jennifer.lee@gmail.com', N'888999000', N'678 Redwood Lane')
GO
INSERT [dbo].[entrenador] ([ID], [Nombre], [CorreoElectronico], [Telefono], [Direccion]) VALUES (9, N'David Thomas', N'david.thomas@gmail.com', N'333444555', N'123 Spruce Road')
GO
INSERT [dbo].[entrenador] ([ID], [Nombre], [CorreoElectronico], [Telefono], [Direccion]) VALUES (10, N'Susan Taylor', N'susan.taylor@gmail.com', N'999000111', N'456 Sequoia Drive')
GO
INSERT [dbo].[entrenador] ([ID], [Nombre], [CorreoElectronico], [Telefono], [Direccion]) VALUES (11, N'Richard Anderson', N'richard.anderson@gmail.com', N'666777888', N'789 Willow Street')
GO
INSERT [dbo].[entrenador] ([ID], [Nombre], [CorreoElectronico], [Telefono], [Direccion]) VALUES (12, N'Karen Hall', N'karen.hall@gmail.com', N'111222333', N'234 Palm Avenue')
GO
SET IDENTITY_INSERT [dbo].[entrenador] OFF
GO
SET IDENTITY_INSERT [dbo].[equipo] ON 
GO
INSERT [dbo].[equipo] ([ID], [logoEquipo], [NombreEquipo], [EntrenadorID], [EventoID]) VALUES (1, N'los_tigres.png', N'Los Tigres', 1, 1)
GO
INSERT [dbo].[equipo] ([ID], [logoEquipo], [NombreEquipo], [EntrenadorID], [EventoID]) VALUES (2, N'los_leones.png', N'Los Leones', 2, 2)
GO
INSERT [dbo].[equipo] ([ID], [logoEquipo], [NombreEquipo], [EntrenadorID], [EventoID]) VALUES (3, N'las_aguilas.png', N'Las Águilas', 3, 3)
GO
INSERT [dbo].[equipo] ([ID], [logoEquipo], [NombreEquipo], [EntrenadorID], [EventoID]) VALUES (4, N'los_halcones.png', N'Los Halcones', 4, 4)
GO
INSERT [dbo].[equipo] ([ID], [logoEquipo], [NombreEquipo], [EntrenadorID], [EventoID]) VALUES (5, N'los_lobos.png', N'Los Lobos', 5, 5)
GO
INSERT [dbo].[equipo] ([ID], [logoEquipo], [NombreEquipo], [EntrenadorID], [EventoID]) VALUES (6, N'las_serpientes.png', N'Las Serpientes', 6, 6)
GO
INSERT [dbo].[equipo] ([ID], [logoEquipo], [NombreEquipo], [EntrenadorID], [EventoID]) VALUES (7, N'los_osos.png', N'Los Osos', 7, 7)
GO
INSERT [dbo].[equipo] ([ID], [logoEquipo], [NombreEquipo], [EntrenadorID], [EventoID]) VALUES (8, N'los_tiburones.png', N'Los Tiburones', 8, 8)
GO
INSERT [dbo].[equipo] ([ID], [logoEquipo], [NombreEquipo], [EntrenadorID], [EventoID]) VALUES (9, N'los_canguros.png', N'Los Canguros', 9, 9)
GO
INSERT [dbo].[equipo] ([ID], [logoEquipo], [NombreEquipo], [EntrenadorID], [EventoID]) VALUES (10, N'los_dragones.png', N'Los Dragones', 10, 10)
GO
SET IDENTITY_INSERT [dbo].[equipo] OFF
GO
SET IDENTITY_INSERT [dbo].[evento] ON 
GO
INSERT [dbo].[evento] ([ID], [NombreEvento], [SedeID], [DeporteID], [fechaInicio], [fechaFin]) VALUES (1, N'Evento de Fútbol en Lima Centro', 1, 1, CAST(N'2023-11-01' AS Date), CAST(N'2023-11-10' AS Date))
GO
INSERT [dbo].[evento] ([ID], [NombreEvento], [SedeID], [DeporteID], [fechaInicio], [fechaFin]) VALUES (2, N'Evento de Fútbol en Lima Norte', 2, 1, CAST(N'2023-11-05' AS Date), CAST(N'2023-11-15' AS Date))
GO
INSERT [dbo].[evento] ([ID], [NombreEvento], [SedeID], [DeporteID], [fechaInicio], [fechaFin]) VALUES (3, N'Evento de Fútbol en Lima Sur', 3, 1, CAST(N'2023-11-08' AS Date), CAST(N'2023-11-18' AS Date))
GO
INSERT [dbo].[evento] ([ID], [NombreEvento], [SedeID], [DeporteID], [fechaInicio], [fechaFin]) VALUES (4, N'Evento de Fútbol en Lima Este - SJL', 4, 1, CAST(N'2023-11-12' AS Date), CAST(N'2023-11-22' AS Date))
GO
INSERT [dbo].[evento] ([ID], [NombreEvento], [SedeID], [DeporteID], [fechaInicio], [fechaFin]) VALUES (5, N'Evento de Fútbol en Lima Este - Ate', 5, 1, CAST(N'2023-11-15' AS Date), CAST(N'2023-11-25' AS Date))
GO
INSERT [dbo].[evento] ([ID], [NombreEvento], [SedeID], [DeporteID], [fechaInicio], [fechaFin]) VALUES (6, N'Evento de Fútbol en Ciudad Arequipa', 6, 1, CAST(N'2023-11-19' AS Date), CAST(N'2023-11-29' AS Date))
GO
INSERT [dbo].[evento] ([ID], [NombreEvento], [SedeID], [DeporteID], [fechaInicio], [fechaFin]) VALUES (7, N'Evento de Fútbol en Ciudad Chiclayo', 7, 1, CAST(N'2023-11-23' AS Date), CAST(N'2023-12-03' AS Date))
GO
INSERT [dbo].[evento] ([ID], [NombreEvento], [SedeID], [DeporteID], [fechaInicio], [fechaFin]) VALUES (8, N'Evento de Fútbol en Ciudad Chimbote', 8, 1, CAST(N'2023-11-27' AS Date), CAST(N'2023-12-07' AS Date))
GO
INSERT [dbo].[evento] ([ID], [NombreEvento], [SedeID], [DeporteID], [fechaInicio], [fechaFin]) VALUES (9, N'Evento de Fútbol en Ciudad Huancayo', 9, 1, CAST(N'2023-12-01' AS Date), CAST(N'2023-12-11' AS Date))
GO
INSERT [dbo].[evento] ([ID], [NombreEvento], [SedeID], [DeporteID], [fechaInicio], [fechaFin]) VALUES (10, N'Evento de Fútbol en Ciudad Ica', 10, 1, CAST(N'2023-12-05' AS Date), CAST(N'2023-12-15' AS Date))
GO
INSERT [dbo].[evento] ([ID], [NombreEvento], [SedeID], [DeporteID], [fechaInicio], [fechaFin]) VALUES (11, N'Evento de Fútbol en Ciudad Piura', 11, 1, CAST(N'2023-12-09' AS Date), CAST(N'2023-12-19' AS Date))
GO
INSERT [dbo].[evento] ([ID], [NombreEvento], [SedeID], [DeporteID], [fechaInicio], [fechaFin]) VALUES (12, N'Evento de Fútbol en Ciudad Trujillo', 12, 1, CAST(N'2023-12-13' AS Date), CAST(N'2023-12-23' AS Date))
GO
INSERT [dbo].[evento] ([ID], [NombreEvento], [SedeID], [DeporteID], [fechaInicio], [fechaFin]) VALUES (13, N'Evento de Vóley en Lima Centro', 1, 2, CAST(N'2023-11-01' AS Date), CAST(N'2023-11-10' AS Date))
GO
INSERT [dbo].[evento] ([ID], [NombreEvento], [SedeID], [DeporteID], [fechaInicio], [fechaFin]) VALUES (14, N'Evento de Vóley en Lima Norte', 2, 2, CAST(N'2023-11-05' AS Date), CAST(N'2023-11-15' AS Date))
GO
INSERT [dbo].[evento] ([ID], [NombreEvento], [SedeID], [DeporteID], [fechaInicio], [fechaFin]) VALUES (15, N'Evento de Vóley en Lima Sur', 3, 2, CAST(N'2023-11-08' AS Date), CAST(N'2023-11-18' AS Date))
GO
INSERT [dbo].[evento] ([ID], [NombreEvento], [SedeID], [DeporteID], [fechaInicio], [fechaFin]) VALUES (16, N'Evento de Vóley en Lima Este - SJL', 4, 2, CAST(N'2023-11-12' AS Date), CAST(N'2023-11-22' AS Date))
GO
INSERT [dbo].[evento] ([ID], [NombreEvento], [SedeID], [DeporteID], [fechaInicio], [fechaFin]) VALUES (17, N'Evento de Vóley en Lima Este - Ate', 5, 2, CAST(N'2023-11-15' AS Date), CAST(N'2023-11-25' AS Date))
GO
INSERT [dbo].[evento] ([ID], [NombreEvento], [SedeID], [DeporteID], [fechaInicio], [fechaFin]) VALUES (18, N'Evento de Vóley en Ciudad Arequipa', 6, 2, CAST(N'2023-11-19' AS Date), CAST(N'2023-11-29' AS Date))
GO
INSERT [dbo].[evento] ([ID], [NombreEvento], [SedeID], [DeporteID], [fechaInicio], [fechaFin]) VALUES (19, N'Evento de Vóley en Ciudad Chiclayo', 7, 2, CAST(N'2023-11-23' AS Date), CAST(N'2023-12-03' AS Date))
GO
INSERT [dbo].[evento] ([ID], [NombreEvento], [SedeID], [DeporteID], [fechaInicio], [fechaFin]) VALUES (20, N'Evento de Vóley en Ciudad Chimbote', 8, 2, CAST(N'2023-11-27' AS Date), CAST(N'2023-12-07' AS Date))
GO
INSERT [dbo].[evento] ([ID], [NombreEvento], [SedeID], [DeporteID], [fechaInicio], [fechaFin]) VALUES (21, N'Evento de Vóley en Ciudad Huancayo', 9, 2, CAST(N'2023-12-01' AS Date), CAST(N'2023-12-11' AS Date))
GO
INSERT [dbo].[evento] ([ID], [NombreEvento], [SedeID], [DeporteID], [fechaInicio], [fechaFin]) VALUES (22, N'Evento de Vóley en Ciudad Ica', 10, 2, CAST(N'2023-12-05' AS Date), CAST(N'2023-12-15' AS Date))
GO
INSERT [dbo].[evento] ([ID], [NombreEvento], [SedeID], [DeporteID], [fechaInicio], [fechaFin]) VALUES (23, N'Evento de Vóley en Ciudad Piura', 11, 2, CAST(N'2023-12-09' AS Date), CAST(N'2023-12-19' AS Date))
GO
INSERT [dbo].[evento] ([ID], [NombreEvento], [SedeID], [DeporteID], [fechaInicio], [fechaFin]) VALUES (24, N'Evento de Vóley en Ciudad Trujillo', 12, 2, CAST(N'2023-12-13' AS Date), CAST(N'2023-12-23' AS Date))
GO
INSERT [dbo].[evento] ([ID], [NombreEvento], [SedeID], [DeporteID], [fechaInicio], [fechaFin]) VALUES (25, N'Evento de Baloncesto en Lima Centro', 1, 3, CAST(N'2023-11-01' AS Date), CAST(N'2023-11-10' AS Date))
GO
INSERT [dbo].[evento] ([ID], [NombreEvento], [SedeID], [DeporteID], [fechaInicio], [fechaFin]) VALUES (26, N'Evento de Baloncesto en Lima Norte', 2, 3, CAST(N'2023-11-05' AS Date), CAST(N'2023-11-15' AS Date))
GO
INSERT [dbo].[evento] ([ID], [NombreEvento], [SedeID], [DeporteID], [fechaInicio], [fechaFin]) VALUES (27, N'Evento de Baloncesto en Lima Sur', 3, 3, CAST(N'2023-11-08' AS Date), CAST(N'2023-11-18' AS Date))
GO
INSERT [dbo].[evento] ([ID], [NombreEvento], [SedeID], [DeporteID], [fechaInicio], [fechaFin]) VALUES (28, N'Evento de Baloncesto en Lima Este - SJL', 4, 3, CAST(N'2023-11-12' AS Date), CAST(N'2023-11-22' AS Date))
GO
INSERT [dbo].[evento] ([ID], [NombreEvento], [SedeID], [DeporteID], [fechaInicio], [fechaFin]) VALUES (29, N'Evento de Baloncesto en Lima Este - Ate', 5, 3, CAST(N'2023-11-15' AS Date), CAST(N'2023-11-25' AS Date))
GO
INSERT [dbo].[evento] ([ID], [NombreEvento], [SedeID], [DeporteID], [fechaInicio], [fechaFin]) VALUES (30, N'Evento de Baloncesto en Ciudad Arequipa', 6, 3, CAST(N'2023-11-19' AS Date), CAST(N'2023-11-29' AS Date))
GO
INSERT [dbo].[evento] ([ID], [NombreEvento], [SedeID], [DeporteID], [fechaInicio], [fechaFin]) VALUES (31, N'Evento de Baloncesto en Ciudad Chiclayo', 7, 3, CAST(N'2023-11-23' AS Date), CAST(N'2023-12-03' AS Date))
GO
INSERT [dbo].[evento] ([ID], [NombreEvento], [SedeID], [DeporteID], [fechaInicio], [fechaFin]) VALUES (32, N'Evento de Baloncesto en Ciudad Chimbote', 8, 3, CAST(N'2023-11-27' AS Date), CAST(N'2023-12-07' AS Date))
GO
INSERT [dbo].[evento] ([ID], [NombreEvento], [SedeID], [DeporteID], [fechaInicio], [fechaFin]) VALUES (33, N'Evento de Baloncesto en Ciudad Huancayo', 9, 3, CAST(N'2023-12-01' AS Date), CAST(N'2023-12-11' AS Date))
GO
INSERT [dbo].[evento] ([ID], [NombreEvento], [SedeID], [DeporteID], [fechaInicio], [fechaFin]) VALUES (34, N'Evento de Baloncesto en Ciudad Ica', 10, 3, CAST(N'2023-12-05' AS Date), CAST(N'2023-12-15' AS Date))
GO
INSERT [dbo].[evento] ([ID], [NombreEvento], [SedeID], [DeporteID], [fechaInicio], [fechaFin]) VALUES (35, N'Evento de Baloncesto en Ciudad Piura', 11, 3, CAST(N'2023-12-09' AS Date), CAST(N'2023-12-19' AS Date))
GO
INSERT [dbo].[evento] ([ID], [NombreEvento], [SedeID], [DeporteID], [fechaInicio], [fechaFin]) VALUES (36, N'Evento de Baloncesto en Ciudad Trujillo', 12, 3, CAST(N'2023-12-13' AS Date), CAST(N'2023-12-23' AS Date))
GO
SET IDENTITY_INSERT [dbo].[evento] OFF
GO
SET IDENTITY_INSERT [dbo].[recordatorio] ON 
GO
INSERT [dbo].[recordatorio] ([usuario_id], [titulo], [descripcion], [fecha_hora], [id], [estado]) VALUES (1, N'Dar la bienvenida a los estudiantes', N'Tengo que hacer un discurso', CAST(N'2023-03-11T10:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[recordatorio] ([usuario_id], [titulo], [descripcion], [fecha_hora], [id], [estado]) VALUES (1, N'Dar comienzo al torneo', N'Tengo presentar como se desarrollara el evento', CAST(N'2023-03-11T12:00:00.000' AS DateTime), 2, 1)
GO
SET IDENTITY_INSERT [dbo].[recordatorio] OFF
GO
SET IDENTITY_INSERT [dbo].[sede] ON 
GO
INSERT [dbo].[sede] ([ID], [NombreSede]) VALUES (1, N'Lima Centro')
GO
INSERT [dbo].[sede] ([ID], [NombreSede]) VALUES (2, N'Lima Norte')
GO
INSERT [dbo].[sede] ([ID], [NombreSede]) VALUES (3, N'Lima Sur')
GO
INSERT [dbo].[sede] ([ID], [NombreSede]) VALUES (4, N'Lima Este - SJL')
GO
INSERT [dbo].[sede] ([ID], [NombreSede]) VALUES (5, N'Lima Este - Ate')
GO
INSERT [dbo].[sede] ([ID], [NombreSede]) VALUES (6, N'Ciudad Arequipa')
GO
INSERT [dbo].[sede] ([ID], [NombreSede]) VALUES (7, N'Ciudad Chiclayo')
GO
INSERT [dbo].[sede] ([ID], [NombreSede]) VALUES (8, N'Ciudad Chimbote')
GO
INSERT [dbo].[sede] ([ID], [NombreSede]) VALUES (9, N'Ciudad Huancayo')
GO
INSERT [dbo].[sede] ([ID], [NombreSede]) VALUES (10, N'Ciudad Ica')
GO
INSERT [dbo].[sede] ([ID], [NombreSede]) VALUES (11, N'Ciudad Piura')
GO
INSERT [dbo].[sede] ([ID], [NombreSede]) VALUES (12, N'Ciudad Trujillo')
GO
SET IDENTITY_INSERT [dbo].[sede] OFF
GO
SET IDENTITY_INSERT [dbo].[usuario] ON 
GO
INSERT [dbo].[usuario] ([id], [codigo], [contraseña]) VALUES (1, N'U22219787', 0xC1C224B03CD9BC7B6A86D77F5DACE40191766C485CD55DC48CAF9AC873335D6F)
GO
SET IDENTITY_INSERT [dbo].[usuario] OFF
GO
ALTER TABLE [dbo].[administrativo] ADD  DEFAULT ((1)) FOR [genero]
GO
ALTER TABLE [dbo].[Configuracion] ADD  DEFAULT ((1)) FOR [modo_oscuro_claro]
GO
ALTER TABLE [dbo].[estudiante] ADD  DEFAULT ((1)) FOR [genero]
GO
ALTER TABLE [dbo].[administrativo]  WITH CHECK ADD FOREIGN KEY([usuario_id])
REFERENCES [dbo].[usuario] ([id])
GO
ALTER TABLE [dbo].[competencia]  WITH CHECK ADD FOREIGN KEY([EventoID])
REFERENCES [dbo].[evento] ([ID])
GO
ALTER TABLE [dbo].[Configuracion]  WITH CHECK ADD FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id])
GO
ALTER TABLE [dbo].[deportista]  WITH CHECK ADD FOREIGN KEY([EquipoID])
REFERENCES [dbo].[equipo] ([ID])
GO
ALTER TABLE [dbo].[deportista]  WITH CHECK ADD  CONSTRAINT [FK_deportista_estudiante] FOREIGN KEY([estudiante_id])
REFERENCES [dbo].[estudiante] ([id])
GO
ALTER TABLE [dbo].[deportista] CHECK CONSTRAINT [FK_deportista_estudiante]
GO
ALTER TABLE [dbo].[deportista]  WITH CHECK ADD  CONSTRAINT [FK_deportista_usuario] FOREIGN KEY([usuario_id])
REFERENCES [dbo].[usuario] ([id])
GO
ALTER TABLE [dbo].[deportista] CHECK CONSTRAINT [FK_deportista_usuario]
GO
ALTER TABLE [dbo].[Enfrentamientos]  WITH CHECK ADD FOREIGN KEY([DeporteID])
REFERENCES [dbo].[deporte] ([ID])
GO
ALTER TABLE [dbo].[Enfrentamientos]  WITH CHECK ADD FOREIGN KEY([EquipoLocalID])
REFERENCES [dbo].[equipo] ([ID])
GO
ALTER TABLE [dbo].[Enfrentamientos]  WITH CHECK ADD FOREIGN KEY([EquipoVisitanteID])
REFERENCES [dbo].[equipo] ([ID])
GO
ALTER TABLE [dbo].[equipo]  WITH CHECK ADD FOREIGN KEY([EntrenadorID])
REFERENCES [dbo].[entrenador] ([ID])
GO
ALTER TABLE [dbo].[equipo]  WITH CHECK ADD FOREIGN KEY([EventoID])
REFERENCES [dbo].[evento] ([ID])
GO
ALTER TABLE [dbo].[estudiante]  WITH CHECK ADD FOREIGN KEY([usuario_id])
REFERENCES [dbo].[usuario] ([id])
GO
ALTER TABLE [dbo].[evento]  WITH CHECK ADD FOREIGN KEY([DeporteID])
REFERENCES [dbo].[deporte] ([ID])
GO
ALTER TABLE [dbo].[evento]  WITH CHECK ADD FOREIGN KEY([SedeID])
REFERENCES [dbo].[sede] ([ID])
GO
ALTER TABLE [dbo].[medalla]  WITH CHECK ADD FOREIGN KEY([CompetenciaID])
REFERENCES [dbo].[competencia] ([ID])
GO
ALTER TABLE [dbo].[medalla]  WITH CHECK ADD FOREIGN KEY([DeportistaID])
REFERENCES [dbo].[deportista] ([ID])
GO
ALTER TABLE [dbo].[recordatorio]  WITH CHECK ADD FOREIGN KEY([usuario_id])
REFERENCES [dbo].[usuario] ([id])
GO
ALTER TABLE [dbo].[resultado]  WITH CHECK ADD FOREIGN KEY([CompetenciaID])
REFERENCES [dbo].[competencia] ([ID])
GO
ALTER TABLE [dbo].[tablaposiciones]  WITH CHECK ADD FOREIGN KEY([CompetenciaID])
REFERENCES [dbo].[competencia] ([ID])
GO
ALTER TABLE [dbo].[tablaposiciones]  WITH CHECK ADD FOREIGN KEY([EquipoID])
REFERENCES [dbo].[equipo] ([ID])
GO
ALTER TABLE [dbo].[tresprimerospuestos]  WITH CHECK ADD FOREIGN KEY([CompetenciaID])
REFERENCES [dbo].[competencia] ([ID])
GO
ALTER TABLE [dbo].[tresprimerospuestos]  WITH CHECK ADD FOREIGN KEY([PrimerPuestoEquipoID])
REFERENCES [dbo].[equipo] ([ID])
GO
ALTER TABLE [dbo].[tresprimerospuestos]  WITH CHECK ADD FOREIGN KEY([SegundoPuestoEquipoID])
REFERENCES [dbo].[equipo] ([ID])
GO
ALTER TABLE [dbo].[tresprimerospuestos]  WITH CHECK ADD FOREIGN KEY([TercerPuestoEquipoID])
REFERENCES [dbo].[equipo] ([ID])
GO
ALTER TABLE [dbo].[Enfrentamientos]  WITH CHECK ADD  CONSTRAINT [CheckEstado] CHECK  (([Estado]='P' OR [Estado]='E' OR [Estado]='C'))
GO
ALTER TABLE [dbo].[Enfrentamientos] CHECK CONSTRAINT [CheckEstado]
GO
