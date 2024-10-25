USE [BTL_Ql_Phong_TH]
GO
/****** Object:  Table [dbo].[LichSuDung]    Script Date: 07/10/2024 08:37:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichSuDung](
	[id_lich] [varchar](20) NOT NULL,
	[id_phong] [varchar](20) NULL,
	[id_nguoi_dung] [varchar](20) NULL,
	[ngay_bat_dau] [datetime] NOT NULL,
	[ngay_ket_thuc] [datetime] NOT NULL,
	[trang_thai] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_lich] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 07/10/2024 08:37:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[id_nguoi_dung] [varchar](20) NOT NULL,
	[ten_dang_nhap] [varchar](20) NOT NULL,
	[mat_khau] [varbinary](20) NOT NULL,
	[loai_nguoi_dung] [int] NOT NULL,
	[ho_ten] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NULL,
	[so_dien_thoai] [varchar](15) NULL,
 CONSTRAINT [PK__NguoiDun__75D6A11E7B883248] PRIMARY KEY CLUSTERED 
(
	[id_nguoi_dung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhongThucHanh]    Script Date: 07/10/2024 08:37:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongThucHanh](
	[id_phong] [varchar](20) NOT NULL,
	[ten_phong] [nvarchar](50) NOT NULL,
	[suc_chua] [int] NOT NULL,
	[mo_ta] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_phong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThietBi]    Script Date: 07/10/2024 08:37:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThietBi](
	[id_thiet_bi] [varchar](20) NOT NULL,
	[ten_thiet_bi] [nvarchar](255) NOT NULL,
	[so_luong] [int] NOT NULL,
	[id_phong] [varchar](20) NULL,
	[trang_thai] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_thiet_bi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__NguoiDun__363698B3ECCB70DC]    Script Date: 07/10/2024 08:37:35 ******/
ALTER TABLE [dbo].[NguoiDung] ADD  CONSTRAINT [UQ__NguoiDun__363698B3ECCB70DC] UNIQUE NONCLUSTERED 
(
	[ten_dang_nhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LichSuDung]  WITH CHECK ADD  CONSTRAINT [fk_nguoi_dung] FOREIGN KEY([id_nguoi_dung])
REFERENCES [dbo].[NguoiDung] ([id_nguoi_dung])
GO
ALTER TABLE [dbo].[LichSuDung] CHECK CONSTRAINT [fk_nguoi_dung]
GO
ALTER TABLE [dbo].[LichSuDung]  WITH CHECK ADD  CONSTRAINT [fk_phong_su_dung] FOREIGN KEY([id_phong])
REFERENCES [dbo].[PhongThucHanh] ([id_phong])
GO
ALTER TABLE [dbo].[LichSuDung] CHECK CONSTRAINT [fk_phong_su_dung]
GO
ALTER TABLE [dbo].[ThietBi]  WITH CHECK ADD  CONSTRAINT [fk_phong_th] FOREIGN KEY([id_phong])
REFERENCES [dbo].[PhongThucHanh] ([id_phong])
GO
ALTER TABLE [dbo].[ThietBi] CHECK CONSTRAINT [fk_phong_th]
GO
