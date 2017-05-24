USE [ticket]
GO
/****** Object:  Table [dbo].[chamado]    Script Date: 23/05/2017 23:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chamado](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_responsavel] [int] NULL,
	[id_solicitante] [int] NULL,
	[data_inc] [date] NULL,
	[data_alt] [date] NULL,
	[data_prazo] [date] NULL,
	[descricao] [varchar](250) NULL,
	[observacao] [varchar](1000) NULL,
	[id_status] [int] NULL,
	[id_tipo] [int] NULL,
	[status] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[departamento]    Script Date: 23/05/2017 23:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departamento](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](250) NOT NULL,
	[status] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[descricao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[funcionario]    Script Date: 23/05/2017 23:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[funcionario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[data_inc] [date] NULL,
	[data_alt] [date] NULL,
	[nome] [varchar](100) NULL,
	[data_nasc] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[telefone] [varchar](50) NULL,
	[celular] [varchar](50) NULL,
	[ramal] [varchar](50) NULL,
	[id_departamento] [int] NULL,
	[status] [char](1) NULL,
	[cargo] [varchar](50) NULL,
	[usuario] [varchar](50) NULL,
	[senha] [varchar](50) NULL,
	[fk_id_nivel] [int] NULL,
 CONSTRAINT [PK__funciona__3213E83F74F8CFC4] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[funcionarioxchamado]    Script Date: 23/05/2017 23:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[funcionarioxchamado](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_funcionario] [int] NULL,
	[id_chamado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[historico]    Script Date: 23/05/2017 23:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[historico](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[data] [date] NULL,
	[descricao] [varchar](1000) NULL,
	[id_chamado] [int] NULL,
	[id_funcionario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[historicoxchamado]    Script Date: 23/05/2017 23:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[historicoxchamado](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_chamado] [int] NULL,
	[id_historico] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nivel]    Script Date: 23/05/2017 23:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nivel](
	[id_nivel] [int] NOT NULL,
	[nivel_descricao] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_nivel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[perfil]    Script Date: 23/05/2017 23:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[perfil](
	[id] [int] NOT NULL,
	[data_inc] [datetime] NULL,
	[data_alt] [datetime] NULL,
	[status] [char](1) NULL,
	[per_descricao] [varchar](20) NULL,
	[per_ocultar] [char](1) NULL,
	[per_perfil] [char](1) NULL,
	[per_perfil_i] [char](1) NULL,
	[per_perfil_a] [char](1) NULL,
	[per_perfil_e] [char](1) NULL,
	[per_funcio] [char](1) NULL,
	[per_funcio_i] [char](1) NULL,
	[per_funcio_a] [char](1) NULL,
	[per_funcio_e] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[status_chamado]    Script Date: 23/05/2017 23:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status_chamado](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[descricao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tipo]    Script Date: 23/05/2017 23:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[descricao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[chamado]  WITH CHECK ADD  CONSTRAINT [fk_id_responsavel] FOREIGN KEY([id_responsavel])
REFERENCES [dbo].[funcionario] ([id])
GO
ALTER TABLE [dbo].[chamado] CHECK CONSTRAINT [fk_id_responsavel]
GO
ALTER TABLE [dbo].[chamado]  WITH CHECK ADD  CONSTRAINT [fk_id_solicitante] FOREIGN KEY([id_solicitante])
REFERENCES [dbo].[funcionario] ([id])
GO
ALTER TABLE [dbo].[chamado] CHECK CONSTRAINT [fk_id_solicitante]
GO
ALTER TABLE [dbo].[chamado]  WITH CHECK ADD  CONSTRAINT [fk_id_status_chamado] FOREIGN KEY([id_status])
REFERENCES [dbo].[status_chamado] ([id])
GO
ALTER TABLE [dbo].[chamado] CHECK CONSTRAINT [fk_id_status_chamado]
GO
ALTER TABLE [dbo].[chamado]  WITH CHECK ADD  CONSTRAINT [fk_id_tipo] FOREIGN KEY([id_tipo])
REFERENCES [dbo].[tipo] ([id])
GO
ALTER TABLE [dbo].[chamado] CHECK CONSTRAINT [fk_id_tipo]
GO
ALTER TABLE [dbo].[funcionario]  WITH CHECK ADD  CONSTRAINT [fk_id_nivel] FOREIGN KEY([fk_id_nivel])
REFERENCES [dbo].[nivel] ([id_nivel])
GO
ALTER TABLE [dbo].[funcionario] CHECK CONSTRAINT [fk_id_nivel]
GO
ALTER TABLE [dbo].[funcionarioxchamado]  WITH CHECK ADD  CONSTRAINT [fk_id_chamado] FOREIGN KEY([id_chamado])
REFERENCES [dbo].[chamado] ([id])
GO
ALTER TABLE [dbo].[funcionarioxchamado] CHECK CONSTRAINT [fk_id_chamado]
GO
ALTER TABLE [dbo].[funcionarioxchamado]  WITH CHECK ADD  CONSTRAINT [fk_id_funcionario] FOREIGN KEY([id_funcionario])
REFERENCES [dbo].[funcionario] ([id])
GO
ALTER TABLE [dbo].[funcionarioxchamado] CHECK CONSTRAINT [fk_id_funcionario]
GO
ALTER TABLE [dbo].[historico]  WITH CHECK ADD FOREIGN KEY([id_chamado])
REFERENCES [dbo].[chamado] ([id])
GO
ALTER TABLE [dbo].[historico]  WITH CHECK ADD  CONSTRAINT [FK__historico__id_fu__6754599E] FOREIGN KEY([id_funcionario])
REFERENCES [dbo].[funcionario] ([id])
GO
ALTER TABLE [dbo].[historico] CHECK CONSTRAINT [FK__historico__id_fu__6754599E]
GO
ALTER TABLE [dbo].[historicoxchamado]  WITH CHECK ADD FOREIGN KEY([id_chamado])
REFERENCES [dbo].[chamado] ([id])
GO
ALTER TABLE [dbo].[historicoxchamado]  WITH CHECK ADD FOREIGN KEY([id_historico])
REFERENCES [dbo].[historico] ([id])
GO
