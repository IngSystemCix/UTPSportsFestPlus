CREATE DATABASE [UTPSportsFest]
GO
USE [UTPSportsFest]
GO
/****** Object:  Table [dbo].[competencia]    Script Date: 03/11/2023 21:59:01 ******/
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
/****** Object:  Table [dbo].[deporte]    Script Date: 03/11/2023 21:59:02 ******/
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
/****** Object:  Table [dbo].[deportista]    Script Date: 03/11/2023 21:59:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[deportista](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
	[Edad] [int] NOT NULL,
	[Genero] [char](1) NOT NULL,
	[EquipoID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[entrenador]    Script Date: 03/11/2023 21:59:02 ******/
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
/****** Object:  Table [dbo].[equipo]    Script Date: 03/11/2023 21:59:02 ******/
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
/****** Object:  Table [dbo].[evento]    Script Date: 03/11/2023 21:59:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[evento](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NombreEvento] [varchar](255) NULL,
	[Descripcion] [text] NULL,
	[SedeID] [int] NULL,
	[DeporteID] [int] NULL,
	[FechasHorarios] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[medalla]    Script Date: 03/11/2023 21:59:02 ******/
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
/****** Object:  Table [dbo].[resultado]    Script Date: 03/11/2023 21:59:02 ******/
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
/****** Object:  Table [dbo].[sede]    Script Date: 03/11/2023 21:59:02 ******/
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
/****** Object:  Table [dbo].[tablaposiciones]    Script Date: 03/11/2023 21:59:02 ******/
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
/****** Object:  Table [dbo].[tresprimerospuestos]    Script Date: 03/11/2023 21:59:02 ******/
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
/****** Object:  Table [dbo].[usuario]    Script Date: 03/11/2023 21:59:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](10) NOT NULL,
	[contraseña] [varbinary](64) NOT NULL,
	[cargo] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[usuario] ON 
GO
INSERT [dbo].[usuario] ([id], [codigo], [contraseña], [cargo]) VALUES (1, N'U22219787', 0xC1C224B03CD9BC7B6A86D77F5DACE40191766C485CD55DC48CAF9AC873335D6F, N'A')
GO
SET IDENTITY_INSERT [dbo].[usuario] OFF
GO
ALTER TABLE [dbo].[competencia]  WITH CHECK ADD FOREIGN KEY([EventoID])
REFERENCES [dbo].[evento] ([ID])
GO
ALTER TABLE [dbo].[deportista]  WITH CHECK ADD FOREIGN KEY([EquipoID])
REFERENCES [dbo].[equipo] ([ID])
GO
ALTER TABLE [dbo].[equipo]  WITH CHECK ADD FOREIGN KEY([EntrenadorID])
REFERENCES [dbo].[entrenador] ([ID])
GO
ALTER TABLE [dbo].[equipo]  WITH CHECK ADD FOREIGN KEY([EventoID])
REFERENCES [dbo].[evento] ([ID])
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
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD CHECK  (([cargo]='E' OR [cargo]='D' OR [cargo]='A'))
GO
