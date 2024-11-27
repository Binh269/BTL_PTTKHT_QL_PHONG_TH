USE [QL_TH_BTL]
GO
/****** Object:  Table [dbo].[giang_vien]    Script Date: 27/11/2024 18:55:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[giang_vien](
	[magv] [varchar](50) NOT NULL,
	[hoten] [nvarchar](100) NULL,
	[ngaysinh] [date] NULL,
	[gioitinh] [nvarchar](10) NULL,
	[dienthoai] [nvarchar](15) NULL,
	[diachi] [nvarchar](255) NULL,
	[khoa] [nvarchar](100) NULL,
	[nganh] [nvarchar](100) NULL,
 CONSTRAINT [PK__giang_vi__7A2118CD5FD812E2] PRIMARY KEY CLUSTERED 
(
	[magv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lop]    Script Date: 27/11/2024 18:55:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lop](
	[malop] [varchar](50) NOT NULL,
	[tenlop] [nvarchar](50) NULL,
	[soluong_sv] [int] NULL,
 CONSTRAINT [PK_lop] PRIMARY KEY CLUSTERED 
(
	[malop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phong_hoc]    Script Date: 27/11/2024 18:55:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phong_hoc](
	[maphong] [varchar](50) NOT NULL,
	[tenphong] [nvarchar](100) NULL,
	[ttphong] [int] NULL,
 CONSTRAINT [PK__phong_ho__BBA25480E7036BE4] PRIMARY KEY CLUSTERED 
(
	[maphong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sinh_vien]    Script Date: 27/11/2024 18:55:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sinh_vien](
	[masv] [varchar](50) NOT NULL,
	[hoten] [nvarchar](100) NULL,
	[ngaysinh] [date] NULL,
	[gioitinh] [nvarchar](10) NULL,
	[nganh] [nvarchar](100) NULL,
	[malop] [varchar](50) NULL,
	[khoa] [nvarchar](100) NULL,
 CONSTRAINT [PK__sinh_vie__7A21767C2EE63735] PRIMARY KEY CLUSTERED 
(
	[masv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[thiet_bi]    Script Date: 27/11/2024 18:55:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[thiet_bi](
	[matb] [varchar](50) NOT NULL,
	[maphong] [varchar](50) NULL,
	[tentb] [nvarchar](100) NULL,
	[tttbi] [int] NULL,
 CONSTRAINT [PK__thiet_bi__7A217E61BCC6B156] PRIMARY KEY CLUSTERED 
(
	[matb] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tkb]    Script Date: 27/11/2024 18:55:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tkb](
	[id] [varchar](50) NOT NULL,
	[date] [date] NULL,
	[time] [time](7) NULL,
	[maphong] [varchar](50) NULL,
	[magv] [varchar](50) NULL,
	[malop] [varchar](50) NULL,
 CONSTRAINT [PK__tkb__3213E83FE61DF44B] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_login]    Script Date: 27/11/2024 18:55:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_login](
	[user] [varchar](50) NOT NULL,
	[pass] [varbinary](64) NULL,
	[name] [nvarchar](100) NULL,
	[level] [int] NULL,
	[maso] [varchar](20) NULL,
	[gmail] [varchar](50) NULL,
	[dienthoai] [varchar](20) NULL,
	[diachi] [nvarchar](max) NULL,
	[lastLogin] [datetime] NULL,
 CONSTRAINT [PK_user_login] PRIMARY KEY CLUSTERED 
(
	[user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_login_salt]    Script Date: 27/11/2024 18:55:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_login_salt](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user] [varchar](50) NULL,
	[salt] [varchar](50) NULL,
 CONSTRAINT [PK__user_log__3213E83FC94CE51F] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[giang_vien] ([magv], [hoten], [ngaysinh], [gioitinh], [dienthoai], [diachi], [khoa], [nganh]) VALUES (N'GV001', N'Trần Văn A', CAST(N'1980-01-15' AS Date), N'Nam', N'0901234567', N'Hà Nội', N'CNTT', N'Khoa học máy tính')
GO
INSERT [dbo].[giang_vien] ([magv], [hoten], [ngaysinh], [gioitinh], [dienthoai], [diachi], [khoa], [nganh]) VALUES (N'GV002', N'Nguyễn Thị B', CAST(N'1982-03-22' AS Date), N'Nữ', N'0902345678', N'Hà Nội', N'Toán', N'Toán ứng dụng')
GO
INSERT [dbo].[giang_vien] ([magv], [hoten], [ngaysinh], [gioitinh], [dienthoai], [diachi], [khoa], [nganh]) VALUES (N'GV003', N'Lê Văn C', CAST(N'1985-07-10' AS Date), N'Nam', N'0903456789', N'Hà Nội', N'Vật lý', N'Vật lý hạt nhân')
GO
INSERT [dbo].[lop] ([malop], [tenlop], [soluong_sv]) VALUES (N'L001', N'Lớp K57KMT', 30)
GO
INSERT [dbo].[lop] ([malop], [tenlop], [soluong_sv]) VALUES (N'L002', N'Lớp K58KMT', 25)
GO
INSERT [dbo].[lop] ([malop], [tenlop], [soluong_sv]) VALUES (N'L003', N'Lớp K59KMT', 28)
GO
INSERT [dbo].[lop] ([malop], [tenlop], [soluong_sv]) VALUES (N'L004', N'Lớp K60KMT', 22)
GO
INSERT [dbo].[lop] ([malop], [tenlop], [soluong_sv]) VALUES (N'L005', N'Lớp K56KMT', 20)
GO
INSERT [dbo].[phong_hoc] ([maphong], [tenphong], [ttphong]) VALUES (N'PH001', N'Phòng 101', 1)
GO
INSERT [dbo].[phong_hoc] ([maphong], [tenphong], [ttphong]) VALUES (N'PH002', N'Phòng 102', 2)
GO
INSERT [dbo].[phong_hoc] ([maphong], [tenphong], [ttphong]) VALUES (N'PH003', N'Phòng 103', 3)
GO
INSERT [dbo].[phong_hoc] ([maphong], [tenphong], [ttphong]) VALUES (N'PH004', N'Phòng 104', 2)
GO
INSERT [dbo].[phong_hoc] ([maphong], [tenphong], [ttphong]) VALUES (N'PH005', N'Phòng 105', 1)
GO
INSERT [dbo].[phong_hoc] ([maphong], [tenphong], [ttphong]) VALUES (N'PH006', N'Phòng 106', 2)
GO
INSERT [dbo].[sinh_vien] ([masv], [hoten], [ngaysinh], [gioitinh], [nganh], [malop], [khoa]) VALUES (N'SV001', N'Nguyễn Văn D', CAST(N'2000-05-20' AS Date), N'Nam', N'Khoa học máy tính', N'L001', N'CNTT')
GO
INSERT [dbo].[sinh_vien] ([masv], [hoten], [ngaysinh], [gioitinh], [nganh], [malop], [khoa]) VALUES (N'SV002', N'Phạm Thị E', CAST(N'2001-08-15' AS Date), N'Nữ', N'Khoa học máy tính', N'L001', N'CNTT')
GO
INSERT [dbo].[sinh_vien] ([masv], [hoten], [ngaysinh], [gioitinh], [nganh], [malop], [khoa]) VALUES (N'SV003', N'Hoàng Văn F', CAST(N'1999-12-05' AS Date), N'Nam', N'Khoa học máy tính', N'L002', N'CNTT')
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB001', N'PH001', N'may1', 1)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB002', N'PH001', N'may2', 2)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB003', N'PH001', N'may3', 3)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB004', N'PH001', N'may4', 1)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB005', N'PH001', N'may5', 2)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB006', N'PH001', N'may6', 3)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB007', N'PH001', N'may7', 1)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB008', N'PH001', N'may8', 2)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB009', N'PH001', N'may9', 3)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB010', N'PH001', N'may10', 1)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB011', N'PH002', N'may11', 1)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB012', N'PH002', N'may12', 3)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB013', N'PH002', N'may13', 1)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB014', N'PH002', N'may14', 2)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB015', N'PH002', N'may15', 3)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB016', N'PH002', N'may16', 1)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB017', N'PH002', N'may17', 2)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB018', N'PH002', N'may18', 3)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB019', N'PH002', N'may19', 1)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB020', N'PH002', N'may20', 2)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB021', N'PH003', N'may21', 3)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB022', N'PH003', N'may22', 1)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB023', N'PH003', N'may23', 2)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB024', N'PH003', N'may24', 3)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB025', N'PH003', N'may25', 1)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB026', N'PH003', N'may26', 2)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB027', N'PH003', N'may27', 3)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB028', N'PH003', N'may28', 1)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB029', N'PH003', N'may29', 2)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB030', N'PH003', N'may30', 3)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB031', N'PH004', N'may31', 1)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB032', N'PH004', N'may32', 2)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB033', N'PH004', N'may33', 3)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB034', N'PH004', N'may34', 1)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB035', N'PH004', N'may35', 2)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB036', N'PH004', N'may36', 3)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB037', N'PH004', N'may37', 1)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB038', N'PH004', N'may38', 2)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB039', N'PH004', N'may39', 3)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB040', N'PH004', N'may40', 1)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB041', N'PH005', N'may41', 2)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB042', N'PH005', N'may42', 3)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB043', N'PH005', N'may43', 1)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB044', N'PH005', N'may44', 2)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB045', N'PH005', N'may45', 3)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB046', N'PH005', N'may46', 1)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB047', N'PH005', N'may47', 2)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB048', N'PH005', N'may48', 3)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB049', N'PH005', N'may49', 1)
GO
INSERT [dbo].[thiet_bi] ([matb], [maphong], [tentb], [tttbi]) VALUES (N'TB050', N'PH005', N'may50', 2)
GO
INSERT [dbo].[tkb] ([id], [date], [time], [maphong], [magv], [malop]) VALUES (N'001', CAST(N'2024-10-23' AS Date), CAST(N'09:00:00' AS Time), N'PH001', N'GV001', N'L001')
GO
INSERT [dbo].[tkb] ([id], [date], [time], [maphong], [magv], [malop]) VALUES (N'002', CAST(N'2024-10-23' AS Date), CAST(N'10:00:00' AS Time), N'PH002', N'GV002', N'L002')
GO
INSERT [dbo].[user_login] ([user], [pass], [name], [level], [maso], [gmail], [dienthoai], [diachi], [lastLogin]) VALUES (N'2', 0x5607ADDB3DC2C1698EFC70C3A33C322180263D7705DE6BAC4FBF8896833D9450, N'2', 1, N'2', N'2', N'2', N'Hải Dương', CAST(N'2024-10-31T17:47:26.900' AS DateTime))
GO
INSERT [dbo].[user_login] ([user], [pass], [name], [level], [maso], [gmail], [dienthoai], [diachi], [lastLogin]) VALUES (N'3', 0x3EE6EB72BEA318C79304EBA58DE578E6AC85F7875DB7DA3BC75F53C81B419811, N'3', 1, N'3', N'3', N'3', N'Hải Dương', CAST(N'2024-10-31T16:52:53.997' AS DateTime))
GO
INSERT [dbo].[user_login] ([user], [pass], [name], [level], [maso], [gmail], [dienthoai], [diachi], [lastLogin]) VALUES (N'admin', 0x1A6C46603030D8B7AD5CD8E9BAB70A8384C322D1AE968B21B47ACE5E73E178F8, N'Ðỗ Thanh Bình', 3, N'K215480106137', N'Boss@gmail.com', N'03575776541', N'Hải Dương', CAST(N'2024-11-27T18:50:38.453' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[user_login_salt] ON 
GO
INSERT [dbo].[user_login_salt] ([id], [user], [salt]) VALUES (45, N'admin', N'6DF8E787')
GO
INSERT [dbo].[user_login_salt] ([id], [user], [salt]) VALUES (47, N'2', N'AB3CFD02')
GO
INSERT [dbo].[user_login_salt] ([id], [user], [salt]) VALUES (48, N'3', N'F66DCB34')
GO
SET IDENTITY_INSERT [dbo].[user_login_salt] OFF
GO
ALTER TABLE [dbo].[sinh_vien]  WITH CHECK ADD  CONSTRAINT [FK_sinh_vien_lop] FOREIGN KEY([malop])
REFERENCES [dbo].[lop] ([malop])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sinh_vien] CHECK CONSTRAINT [FK_sinh_vien_lop]
GO
ALTER TABLE [dbo].[thiet_bi]  WITH CHECK ADD  CONSTRAINT [FK_thiet_bi_phong_hoc] FOREIGN KEY([maphong])
REFERENCES [dbo].[phong_hoc] ([maphong])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[thiet_bi] CHECK CONSTRAINT [FK_thiet_bi_phong_hoc]
GO
ALTER TABLE [dbo].[tkb]  WITH CHECK ADD  CONSTRAINT [FK__tkb__magv__3E52440B] FOREIGN KEY([magv])
REFERENCES [dbo].[giang_vien] ([magv])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tkb] CHECK CONSTRAINT [FK__tkb__magv__3E52440B]
GO
ALTER TABLE [dbo].[tkb]  WITH CHECK ADD  CONSTRAINT [FK__tkb__maphong__3D5E1FD2] FOREIGN KEY([maphong])
REFERENCES [dbo].[phong_hoc] ([maphong])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tkb] CHECK CONSTRAINT [FK__tkb__maphong__3D5E1FD2]
GO
ALTER TABLE [dbo].[tkb]  WITH CHECK ADD  CONSTRAINT [FK_tkb_lop] FOREIGN KEY([malop])
REFERENCES [dbo].[lop] ([malop])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tkb] CHECK CONSTRAINT [FK_tkb_lop]
GO
ALTER TABLE [dbo].[user_login_salt]  WITH CHECK ADD  CONSTRAINT [FK_user_login_salt_user_login] FOREIGN KEY([user])
REFERENCES [dbo].[user_login] ([user])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[user_login_salt] CHECK CONSTRAINT [FK_user_login_salt_user_login]
GO
/****** Object:  StoredProcedure [dbo].[SP_baomat]    Script Date: 27/11/2024 18:55:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_baomat]
    @action varchar(50),
    @user varchar(50) = NULL,
    @name Nvarchar(100) = NULL,
    @maso varchar(20) = NULL,
    @gmail varchar(50) = NULL,
    @dienthoai varchar(20) = NULL,
    @diachi nvarchar(max) = NULL,
    @uid varchar(50) = NULL,
    @pass varchar(255) = NULL,
	@salt varchar(255) = NULL,
	@passLogIn varchar(255) = NULL,
	@passnew varchar(255) = NULL,
	@IsLoggedIn int = 0

AS
BEGIN
    BEGIN TRY
        IF (@action = 'dangky')
        BEGIN
            IF EXISTS (SELECT * FROM user_login WHERE [user] = @user)
            BEGIN
                SELECT 0 AS ok, N'Tài khoản đã tồn tại' AS message
                FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
                RETURN;
            END

            IF EXISTS (SELECT * FROM user_login WHERE [gmail] = @gmail)
            BEGIN
                SELECT 0 AS ok, N'Gmail đã được sử dụng rồi ' AS message
                FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
                RETURN;
            END

            IF EXISTS (SELECT * FROM user_login WHERE [dienthoai] = @dienthoai)
            BEGIN
                SELECT 0 AS ok, N'Điện thoại đã tồn tại' AS message
                FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
                RETURN;
            END

            IF EXISTS (SELECT * FROM user_login WHERE [maso] = @maso)
            BEGIN
                SELECT 0 AS ok, N'Mã số đã tồn tại' AS message
                FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
                RETURN;
            END

            DECLARE @RandomString NVARCHAR(8);
            SET @RandomString = SUBSTRING(CONVERT(VARCHAR(40), NEWID()), 1, 8);

            DECLARE @HashedPass VARBINARY(64); 
			DECLARE @RandomMH varchar(255); 

            SET @RandomMH = HASHBYTES('SHA2_256',@RandomString);
			SET @HashedPass = HASHBYTES('SHA2_256',@pass);

            INSERT INTO user_login ([user], [pass], [name], [level], [maso], [gmail], [dienthoai], [diachi], [lastLogin]) 
            VALUES (@user, @HashedPass, @name, 1, @maso, @gmail, @dienthoai, @diachi, GETDATE());

            INSERT INTO user_login_salt ([user], [salt]) 
            VALUES (@user, @RandomString);

            SELECT '1' AS ok, @RandomString AS 'salt', N'Đăng ký thành công' AS message 
            FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
        END
        ELSE IF (@action = 'get_salt')
        BEGIN  
		IF NOT EXISTS (SELECT * FROM user_login WHERE [user] = @uid)
				BEGIN
					SELECT 0 AS ok, N'Tài khoản không tồn tại' AS message
					FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
					RETURN;
				END
            SELECT 1 AS ok, [salt]
            FROM user_login_salt
            WHERE [user] = @uid
            FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
        END
        ELSE IF (@action = 'login')
        BEGIN
			IF NOT EXISTS (SELECT * FROM user_login WHERE [user] = @uid)
				BEGIN
					SELECT 0 AS ok, N'Tài khoản không tồn tại' AS message
					FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
					RETURN;
				END
            IF EXISTS(SELECT * FROM [user_login] WHERE ([user] = @uid) AND ([pass] = HASHBYTES('SHA2_256',@passLogIn)))
				BEGIN
					SET NOCOUNT ON;
					SELECT 1 AS ok, N'Login thành công' AS [msg], [user], [name],[level], [maso], [gmail], [dienthoai], [diachi], [lastLogin]
					FROM [user_login]
					WHERE [user] = @uid 
					FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;

					UPDATE [user_login] SET lastLogin = GETDATE() WHERE [user] = @uid;
				END
            ELSE
				BEGIN
					SELECT 0 AS ok, N'Có gì đó sai sai' AS msg 
					FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
				END
        END
	ELSE IF (@action = 'change_tt')
	begin
		IF EXISTS(SELECT * FROM [user_login] WHERE ([user] = @uid) AND ([pass] = HASHBYTES('SHA2_256',@passLogIn)))
			begin
				update user_login
				SET [pass]=HASHBYTES('SHA2_256',@passnew),[name] =@name,[maso] =@maso,[gmail] =@gmail,[dienthoai] =@dienthoai,[diachi] =@diachi
				WHERE [user]=@uid	 
				SELECT 'ok' AS ok, 'Cập nhật thành công' AS message FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
			end
			 ELSE
				BEGIN
					SELECT 0 AS ok, N'Có gì đó sai sai' AS msg 
					FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
				END
		END
    END TRY
    BEGIN CATCH
        SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Phong_TB]    Script Date: 27/11/2024 18:55:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Phong_TB]
    @action varchar(50),
	@timkiem nvarchar(255) = null ,
    @maphong varchar(50) = NULL,
	@tenphong nvarchar(50) = NULL,
	@ttphong nvarchar(50) = NULL,
    @matb varchar(50) = NULL,
	@tentb nvarchar(50) = NULL,
	@tttbi int = NULL,
	@magv varchar(50) = NULL,
	@id nvarchar(50) = NULL,
    @date date = NULL,
    @time time(7) = NULL,
    @malop varchar(50) = NULL
AS
BEGIN
    declare @json nvarchar(max)='';
    IF (@action = 'get_infor')
    BEGIN        
	    select @json=(
        SELECT
			'get_infor' AS status,
			phong_hoc.maphong,
			phong_hoc.tenphong,
			phong_hoc.ttphong,
			(
			SELECT thiet_bi.matb,thiet_bi.tentb, thiet_bi.tttbi
			FROM thiet_bi
			WHERE thiet_bi.maphong = phong_hoc.maphong
			FOR JSON PATH
			) AS thiet_bi_list
		FROM phong_hoc
		FOR JSON PATH);
		select @json as [json];
    END

	ELSE IF (@action = 'add_tb')
    BEGIN

        INSERT INTO thiet_bi(matb, maphong,tentb,tttbi) 
        VALUES (@matb, @maphong,@tentb,@tttbi);
        SELECT 'ok' AS ok, 'Thêm thành công' AS message FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
    END

	ELSE IF (@action = 'update_tb')
    BEGIN
        UPDATE thiet_bi
        SET tentb=@tentb,tttbi=@tttbi
        WHERE matb = @matb;
         SELECT 'ok' AS ok, 'Cập nhật thành công' AS message FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
    END

    ELSE IF (@action = 'delete_tb')
    BEGIN
        DELETE FROM thiet_bi
        WHERE matb = @matb;
        SELECT 'ok' AS ok,'Xóa thành công' AS message FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
    END


	ELSE IF (@action = 'add_phong')
    BEGIN
        INSERT INTO phong_hoc(maphong,tenphong,ttphong) 
        VALUES (@maphong,@tenphong,@ttphong);
        SELECT 'ok' AS ok, 'Thêm thành công' AS message FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
    END

	ELSE IF (@action = 'update_phong')
    BEGIN
        UPDATE phong_hoc
        SET tenphong=@tenphong,ttphong=@ttphong
        WHERE maphong = @maphong;
        SELECT 'ok' AS ok, 'Cập nhật thành công' AS message FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
    END

    ELSE IF (@action = 'delete_phong')
    BEGIN
		DELETE FROM thiet_bi
		WHERE maphong = @maphong;
        DELETE FROM phong_hoc
        WHERE maphong = @maphong;        
        SELECT 'ok' AS ok,'Xóa thành công' AS message FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
    END

	ELSE IF (@action = 'thietbi_hong')
    BEGIN
        SELECT @json = (
        SELECT
            thiet_bi.matb,
            thiet_bi.maphong,
            phong_hoc.tenphong,
            thiet_bi.tentb,
            thiet_bi.tttbi
        FROM thiet_bi
        INNER JOIN phong_hoc ON thiet_bi.maphong = phong_hoc.maphong
        WHERE thiet_bi.tttbi = 3
        FOR JSON PATH);
        SELECT @json AS [json];
    END

    ELSE IF (@action = 'thietbi_dangdung')
    BEGIN
        SELECT @json = (
        SELECT
            thiet_bi.matb,
            thiet_bi.maphong,
            phong_hoc.tenphong,
            thiet_bi.tentb,
            thiet_bi.tttbi
        FROM thiet_bi
        INNER JOIN phong_hoc ON thiet_bi.maphong = phong_hoc.maphong
        WHERE thiet_bi.tttbi = 1
        FOR JSON PATH);
        SELECT @json AS [json];
    END

    ELSE IF (@action = 'thietbi_khongdung')
    BEGIN
        SELECT @json = (
        SELECT
            thiet_bi.matb,
            thiet_bi.maphong,
            phong_hoc.tenphong,
            thiet_bi.tentb,
            thiet_bi.tttbi
        FROM thiet_bi
        INNER JOIN phong_hoc ON thiet_bi.maphong = phong_hoc.maphong
        WHERE thiet_bi.tttbi = 2
        FOR JSON PATH);
        SELECT @json AS [json];
    END

	IF (@action = 'get_tkb')
    BEGIN
        SELECT @json = (
        SELECT 
            id,
            date,
            time,
            maphong,
            magv,
            malop
        FROM tkb
        FOR JSON PATH
        );
        SELECT @json AS [json];
    END

    ELSE IF (@action = 'add_tkb')
    BEGIN
        INSERT INTO tkb (id, date, time, maphong, magv, malop)
        VALUES (@id, @date, @time, @maphong, @magv, @malop);

        SELECT 'ok' AS ok, 'Thêm thời khóa biểu thành công' AS message
        FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
    END

    ELSE IF (@action = 'update_tkb')
    BEGIN
        UPDATE tkb
        SET date = @date, 
            time = @time, 
            maphong = @maphong, 
            magv = @magv, 
            malop = @malop
        WHERE id = @id;

        SELECT 'ok' AS ok, 'Cập nhật thời khóa biểu thành công' AS message
        FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
    END

    ELSE IF (@action = 'delete_tkb')
    BEGIN
        DELETE FROM tkb
        WHERE id = @id;

        SELECT 'ok' AS ok, 'Xóa thời khóa biểu thành công' AS message
        FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;
    END

	ELSE IF (@action = 'thongtin')
		BEGIN
			SELECT @json = (
			SELECT 
				phong_hoc.maphong,
				phong_hoc.tenphong,
				lop.malop,
				lop.tenlop,
				giang_vien.magv,
				giang_vien.hoten AS tengiangvien
			FROM phong_hoc
			FULL OUTER JOIN tkb ON phong_hoc.maphong = tkb.maphong
			FULL OUTER JOIN lop ON tkb.malop = lop.malop
			FULL OUTER JOIN giang_vien ON tkb.magv = giang_vien.magv
			FOR JSON PATH
			);
			SELECT @json AS [json];
		END
	ELSE IF (@action = 'search')
		BEGIN
			SELECT @json = (
			SELECT 
				'search' AS status,
				phong_hoc.maphong,
				phong_hoc.tenphong,
				phong_hoc.ttphong,
				(
					SELECT 
						thiet_bi.matb,
						thiet_bi.tentb,
						thiet_bi.tttbi
					FROM thiet_bi
					WHERE thiet_bi.maphong = phong_hoc.maphong
					FOR JSON PATH
				) AS thiet_bi_list
			FROM phong_hoc
			WHERE phong_hoc.maphong LIKE '%' + @timkiem + '%'
			   OR phong_hoc.tenphong LIKE N'%' + @timkiem + '%'
			   OR EXISTS (
					SELECT 1 
					FROM thiet_bi 
					WHERE thiet_bi.maphong = phong_hoc.maphong 
					  AND (thiet_bi.matb LIKE '%' + @timkiem + '%'
						   OR thiet_bi.tentb LIKE N'%' + @timkiem + '%')
				)
			FOR JSON PATH
			);
			SELECT @json AS [json];
		END
	ELSE IF (@action = 'timkiem_tkb')
		BEGIN
			SELECT @json = (
			SELECT 
				id,
				date,
				time,
				maphong,
				magv,
				malop
			FROM tkb
			WHERE maphong LIKE '%' + @timkiem + '%'
			   OR id LIKE '%' + @timkiem + '%'
			   OR magv LIKE '%' + @timkiem + '%'
			   OR malop LIKE '%' + @timkiem + '%'
			FOR JSON PATH
			);
			SELECT @json AS [json];
		END


END


GO
