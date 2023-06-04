﻿

create database EattingNowApp

go

use EattingNowApp

go

create table Cuisine(
	CuisineId int identity primary key,
	AbsoluteImage nvarchar(max),
	Name nvarchar(50),
)

go


create table Province(
	ProvinceId int identity primary key,
	Name nvarchar(50),
)

go

create table District(
	DistrictId int identity primary key,
	Name nvarchar(50),
	ProvinceId int,

	foreign key (ProvinceId) references Province(ProvinceId),
)

go

create table Ward(
	WardId int identity primary key,
	Name nvarchar(50),
	DistrictId int,

	foreign key (DistrictId) references District(DistrictId),
)

go

CREATE TABLE Users (
	UserId int identity primary key,
	AbsoluteImage nvarchar(max),
	FullName nvarchar(255),
	Description nvarchar(255),
	OpenTime nvarchar(255),
	ProvinceId int,
	CuisineId int,
	Email nvarchar(30),
	Address nvarchar(max),
	OwnerName nvarchar(50),
	Phone nvarchar(15),
	Latitude float,
	Longitude float,
	Status bit,

	foreign key (ProvinceId) references Province(ProvinceId),
	foreign key (CuisineId) references Cuisine(CuisineId)
)

go

CREATE TABLE CategoryList (
	CategoryId int identity primary key,
	CategoryName nvarchar(255),
	UserId int,
	Status bit,

	foreign key (UserId) references Users(UserId)
) 

go

CREATE TABLE FoodList (
	FoodListId int identity primary key,
	CategoryId int,
	FoodName nvarchar(50),
	Price int,
	qty int,
	UploadImage nvarchar(100),
	Description nvarchar(100),
	UserId int,
	Status bit,

	foreign key (CategoryId) references CategoryList(CategoryId)
)

go

CREATE TABLE AccountType (
	Id int identity primary key,
	Name nvarchar(255),
	Status bit,
)

go

CREATE TABLE Account (
	Id int identity primary key,
	UserId int,
	Username nvarchar(50),
	Password nvarchar(255),
	Status bit,
	AccountId int,

	foreign key (UserId) references Users(UserId),
	foreign key (AccountId) references AccountType(Id)
)

go

CREATE TABLE DeliveryDriver (
	DeliveryDriverId int identity primary key,
	CompleteName nvarchar(50),
	ProvinceId int,
	DistrictId int,
	WardId int,
	Phone nvarchar(15),
	Email nvarchar(50),
	UploadImage nvarchar(255),
	Username nvarchar(50),
	Password nvarchar(50),
	Status bit,

	foreign key (ProvinceId) references Province(ProvinceId),
	foreign key (DistrictId) references District(DistrictId),
	foreign key (WardId) references Ward(WardId)
)

go


CREATE TABLE Customer (
	CustomerId nvarchar(250) primary key,
	CompleteName nvarchar(250),
	ProvinceId int,
	DistrictId int,
	WardId int,
	Phone nvarchar(15),
	Address nvarchar(250),
	Status bit,

	foreign key (ProvinceId) references Province(ProvinceId),
	foreign key (DistrictId) references District(DistrictId),
	foreign key (WardId) references Ward(WardId),
)

go

CREATE TABLE OrderHeader (
	OrderHeaderId nvarchar(250) primary key,
	CreationDate datetime,
	CustomerId nvarchar(250),
	TotalAmt float,
	TransportFee float,
	IntoMoney float,
	UserId int,

	foreign key (CustomerId) references Customer(CustomerId),
	foreign key (UserId) references Users(UserId),
) 

go


CREATE TABLE OrderLine (
	OrderLineId int identity,
	OrderHeaderId nvarchar(250) primary key,
	FoodListId int,
	CategoryId int,
	FoodName nvarchar(50),
	Price int,
	qty int,
	UploadImage nvarchar(100),
	Description nvarchar(100),

	foreign key (OrderHeaderId) references OrderHeader(OrderHeaderId),
) 

go

--FrameWork--


CREATE TABLE z_Role (
	SystemName nvarchar(255) primary key,
	Display nvarchar(255),
	Active bit,
	Permissons nvarchar(255),
	UserCanDeleted bit,
	LockEditProduct bit,
) 

go

CREATE TABLE z_Setting (
	Id int identity primary key,
	Name nvarchar(255),
	Value nvarchar(255),
) 

go

CREATE TABLE z_User (
	Id int identity primary key,
	UserName nvarchar(255),
	DisplayName nvarchar(255),
	AvatarUrl nvarchar(255),
	Password nvarchar(255),
	Salt nvarchar(255),
	Active bit,
	Roles nvarchar(255),
	RoleSystem nvarchar(255),
	Deleted bit,
) 

go

CREATE TABLE z_UserClaim (
	Id int identity primary key,
	UserId int,
	ClaimName nvarchar(255),
	ClaimValue nvarchar(255),
	Deleted bit,

	foreign key (UserId) references z_User(Id),
) 

go

CREATE TABLE Logs (
	Id int identity primary key,
	LogLevelId int,
	ShortMessage nvarchar(255),
	FullMessage nvarchar(max),
	IpAddress nvarchar(255),
	FalconUserId int,
	PageUrl nvarchar(255),
	ReferrerUrl nvarchar(255),
	CreatedOnUtc Datetime,
	LogLevel int,
) 

go

CREATE TABLE ImageRecords (
	Id int identity primary key,
	FileName nvarchar(255),
	RelativePath nvarchar(255),
	AbsolutePath nvarchar(255),
	IsExternal bit,
	CreatedAt datetime,
	IsUsed bit,
	Deleted bit,
	IsMain bit,
	IsWeb bit,
) 

go

CREATE TABLE WMS_Location (
	Id int identity,
	BranchCode nvarchar(50),
	Code nvarchar(50) primary key,
	Name nvarchar(250),
	Address nvarchar(250),
	City int,
	PhoneNo nvarchar(50),
	FaxNo nvarchar(50),
	EmloyeeCode nvarchar(50),
	Description nvarchar(250),
	CreatedBy nvarchar(250),
	CreationDate datetime,
	LastUpdatedBy nvarchar(250),
	LastUpdateDate datetime,
	Image image,
	Left_Image float,
	Top_Image float,
	Column_Image int,
	Row_Image int,
	LocationFullName nvarchar(500),
	ManagerName nvarchar(500),
	ManagerRole nvarchar(500),
	TaxCode nvarchar(500),
	BankingCode nvarchar(500),
	Long float,
	Lat float,
	Note nvarchar(MAX),
	IsDeleted bit,
) 

go

CREATE TABLE WMS_Employee (
	Id int identity,
	EmployeeCode nvarchar(50) primary key,
	UserLogin nvarchar(50),
	EmployeeGroup_Id int,
	FESUserId int,
	FullName nvarchar(500),
	DOB nvarchar(50),
	Tel nvarchar(50),
	Address nvarchar(500),
	Email nvarchar(500),
	Image image,
	ImageRecordId int,
	IsAdministrator bit,
	BranchCode nvarchar(50),
	LocationCode nvarchar(50),
	Department_Id int,
	Position nvarchar(250),
	Signature nvarchar(MAX),
) 

go

insert into z_User (UserName, DisplayName, AvatarUrl, Password, Salt, Active, Roles, RoleSystem, Deleted) VALUES ('admin', 'Administrator', NULL, 'A06934B85B2BF563A21D7196F432721FEE4769EB', 'lNnmnigdWR7gAjMl', 1, 'Admin', 'Admin', 0);
insert into z_UserClaim (UserId, ClaimName, ClaimValue, Deleted) VALUES (1, 'Admin', 'ALLROLES', 0);

insert into z_Role (SystemName, Display, Active, Permissons, UserCanDeleted, LockEditProduct) VALUES ('Admin', N'Quản trị hệ thống', 1, 'ALLROLES', 0, 0);
insert into z_Setting VALUES ('metadatasettings.secretkey', '1jBP7ubfwcBBOJMIamwvtux8jJQskiap');
insert into z_Setting VALUES ('metadatasettings.hashchat', 'True');
insert into z_Setting VALUES ('metadatasettings.starttime', '07:30');
insert into z_Setting VALUES ('metadatasettings.endtime', '17:00');

insert into Cuisine values ('http://localhost:3000/uploads/DaiPhucVinh/image/price-638112699205892277.png', N'Cơm')
insert into Cuisine values ('http://localhost:3000/uploads/DaiPhucVinh/image/banhmy-638112699443869772.png', N'Bánh Mỳ')
insert into Cuisine values ('http://localhost:3000/uploads/DaiPhucVinh/image/fastfood-638112699646178215.png', N'Đồ Ăn Nhanh')

insert into WMS_Location values ('CN-0107120001', '45764572', 'QUY NHƠN', 'Thửa đất số 42, tờ bản đồ số 50, Khu vực 8, Phường Bùi Thị Xuân, Thành phố Quy Nhơn, Tỉnh Bình Định', 107, '0981 718 343', NULL, NULL, NULL, 'kiettc', GETDATE(), 'kiettc', GETDATE(), '0x89504E470D0A1A0A0000000D494844520000004B0000003B080300000004B287190000000373424954080808DBE14FE0000002FD504C5445FFFFFFFFFFFFE9E1DEE0E0E2C0B6B38DBDC5B9AEABA2A19B959495968E8B6D939C8678785A7B8583676F496B764C596278484B424C5333383A14262A0C242D191919111111000F18080808000000B5F1FFD4B6B686B4B78B858662838C5A7B85546B753E46483C3F4233383A14262A222220191919B4EFF6D9D7D8C0BFC18DBDC58AB7C69FA0A3999999698B9462838C7A7A745876823F5A65425057591211496B7682ADB6D3CAC8BFBFB69ED4DD94C6CE8AB7BDE9E1DEDEDED7D9D7D88DBDC58E8C8A9FA0A364727B626C74203C4AA6BDC291C1C78DBDC5A3B6BDA3A5A7366878FFFFFFECEEEDE8E9E8B5F1FFB4EFF6E9E1DEE0E0E2DEDED7AEE8F7D7DCDDAAE3EFD9D7D8A7DEEDA6DEE4D7D2CCA3D8E6BBD2D7CCCCCC9ED4DDC6C5C79BCEDDC5C4BBB8C4C997CAD8ADC5CAC0BFC1BFBFB694C6D5D4B6B694C6CEB5BDC1ACBDC7CBB6B5A6BDC291C0CEADBABE91C1C7C0B6B3B6B6AF8DBDC58CBCCCA3B6BDAAB4B69BB5B9B1B0A58AB7C68AB7BDADADAEB9AD7784B4C486B4B784B2BD99AEB495ABB083ADBD7EADBC82ADB6A3A5A77FABB492A6ADA2A19B9FA0A391A2A67BA5B47BA4AC8B9EA49999998B9CA0859DA5749CAC959495739BA685959B8C9193968E8B7095A56D95A58290938E8C8A76929C6D939C7A8D94848A8F64919E728C96698D9C8686898B8586698B94858485658A967B848483807D9182406284937D7D806C818B62838C7A7B7B7A7A74707A828A7A33627C865C7C8A73767A5A7B857272706A737C58768264727B6A71744E73816D6C66676C72626C746B6A6A646C6A666666596A72546B759C5656496B7659646C5A6161536068545C6159595B4C596256565178484B5151524850532B57674250574B4B4B424C53205465E2211E324F5B344C523E46485E3A38C41D1B3C3F42413F3229424C164759423D3B23404C3B3A3AAD1917203C4A33383A1F39441A3A493235369E17163333334C2C2BA5131192161517323F9113121031404B201F2929287712110C2B3A93060514262A591211222220620F0E0C242D6D09081919195D07074E050411111108080893BF43F20000004B74524E53001111111111111111111111111111111111111111111111111122222222222222222222222222333333333333333333333333333355667777999999AAAAAAAACCDDDDDDDDEEEEEEEEEEEE78375EBC000000097048597300000B1200000B1201D2DD7EFC0000001C74455874536F6674776172650041646F62652046697265776F726B732043533406B2D3A000000A974944415458C3AD97795813771AC7E9DEF77D9FDDD3BADB76DDB68216AB60B7D856C56A8C81D410099A45CB6021D14E6898908489E53782C30427C4893A18063A71901A12082A18DA721724F6D0522C4AA15E5405AB54AD3CFB0EB6BA767B78ECEF7978C83FF93CDFF7FB7EDF37BF5F54D40D9FAF4E9A143B3D296156F4A43BA36EEB7C2B3A763643E4925476526262D2F4E85B27DD199B40313449E5EAB4B91C47AA1295EAE89FDD1A697A829D63ECB9A66C92A5D31728ED5E46A75426DC82B6BF01894126288F22340BD49497542A0891D1A8D5B37E7F73A45F3D388764283B4991FAA4243DE325140ABB40A95494486834DAE89BF2299B62198A24D3559A5C8EC116A890442AD594842B3181D569D5B1374AFADDAC049263ED76930EA3384A93A8A6BD76858A9608A5DECB6A358C88E974B3BE7723A47BA70389CA3599EC14939B94A863BDB8424D8BB852E7E5B41A5AC234E44E33A64FF8E2B04D7A30816448E0D0B9FA24A581E7D3134148B6420F20B946B55522B4563F61D0277CE7F349BF89CD26659B28933A4943708C2E51CB7A0D0A59918A94CC6A5C22B5B8847484DF8A6373BEFF39A47F80E31C87C85C9D7A35CDD9D589E9BC57BF209DE73400220044690D12AD83FF7AABDF6AC566FDE2B348FF9C3E87E42199D9E904CB99140B0C5E4E97980E8A9476C9AAC644468B099C0E1359BD5942060430C36774F3EFD331C4229329175164BA424978198D02BEAB515A25BB4A6E9F9EE3757A9ED31B441623FC08A7253332447FAAE3D988210988F86AB55283BC942A11F7B23288540140AB6585743D236018E7C57091319001AB9913CDC87CEFFFA46056364C3022A9D5AAA4D50C4728156691512B09006979AF4ECE8196920C3A5A3440630D563F85D37EC2267224897EFA09D21C709CB49BB45A98E48911A6540ABB88945ACEAB9373A025255C87241C6344032E7038E927094E20909FA2ADB1D7F9946D6749580538445C9B08F306234CC2C06838AF5E4D4A260DB44C0BA1D203CCC009B855A2CDA00A892E92F5DB1872EA55522C6182CE99ECA4293D49A163BC26054C9E5DA16101649DC8018240917AF88CD1126EF6F238F293565EB0D10184049EA6E92B55FE3096C2319D46AD52C0CACCA62199F21A50A8592FA6344BA41A93682D36112884D9219D8C08AA182BEDB722892539C9C60610435F111667359B6D88A611B261EAC4440DC5A52B20E7E94AF8B25A2F305A181C1D26301381A2FC6633CF132840DABC02F0102DB990101058EEFEA8A8FB669911B77D7B6DB567BB67134BDBF44A983C5607204AAD831CE8C0303DC7E9210398D58FCC8C8493A08AF1DB683F8D7811717E8E130417333B6AAADDCCD4849B3D1E4F41455169B5732B8330A502F3926AB97D5A464AD7C981E2390C97689C0A106092990A9048E46D8C1F317E172BF839D6C5C74D8D8AA31EBE7FC513296B3C9EB59EBC82524B45A993B569156A86D3C96192FFE4741A78CE609B504590126DE3405580A64401F175828B75B966DF27FF588167CE35F3E72E5C63F1182DCE0CA7A3A09AA171B58AF0625AFB4E08941F02251820B6380AD8AC026F86D651220FB591AE80C4B900253DFC7122FEF0A8C393396FEEFC7C8BA328CD69B1943A3C2CA155E102AEB506083DA414E7BDB8EC150BC327D18893101300D3259E175C341708355C65FDF15163A9D161993F77DE9AD255454623882B65905E6310AD7A79DD41A0AC220B5ED96C029854071406097E969380E47AF19DC3F5A1D91FB3FEF44886C7E8701A3317CE9D9FEAB16414A5AD2F706C457A2D2E12180A98CD1073F0CAEAF25BA9008D04410E944BF2BB189974ACBDB2FA1AEB478F18D72C2E72A695E6A52E9CBB30D5E179B220CFB87903C274B86896978A55E0C0241BB40EC9B1F4D3B458C7BB58860552D85D5C56FDDFBAD6AECC5ABED4B8DD68294D95BB60745A5639D76CA00DE976C96C6661A9F829B975280014DEC607048E03C7654DE5C1AEA0FB3A5D6B5383BD254B53328B9CAB8AA0A7F3F20B8CCEB4220FC20D1494277004B48EF66F29DE1A0061C284E3BC143ADC595618BE78F9BCAFE23A5DA9DB223D3D9B97A61464945AD6E62F9C3B6FA527C351E44038EEE2655572BE5DA1B38DA2C8F27E9EA5B9178F451A7AC365CF2D3FDF55D3F80996BBABB5ED406F75EAE222073435733174C15964DC64C3CD026D63FDC815DCBC65E7C19DAE3AD1C582E3EF4275A1DE7079EF8A9C25EECA8AEBBC9F60F5F4BD7FFAA5A716AFF5A4AD5F9F0AB4956BAB292BC4DC464B027DE2E0965DCEEDBC0BF2D4FACEB1C69292326005C783F9670E6455D73E7C9DAEF6D637DE3D7DF2C4D9B32FFDFBC9340F88CB04DF72D633361B2BD8F83AD72B5D794B376EDFE29235B5B883912A77A8B7B1FD62FEB1F19CA79B5EFFD7355D19C0EA39FDDE89A3274F1E956929C6BCD28C020BF896099B4864E8BA9737653D5DDFEE11B737BDDDE22E895C6E69811A1BBBDA732EFB966CEC387595F5935D5B538BBB47478EBCF9E691A3474F5EB874012A2D3016AC375A16CF7D92864021B1636FF9CBBBEA7D15F5CD115F49643C9C12F1D5F6867DED2DBB53DC6D7D4357597F7EFC90A570FF0763EF1D79EDB5232363E7C6463EFCF095A7163BE4F4662EC94534EC82C0DECDDE926D9BF3AB9B23C1E79697E5F41E2E06BF4A7CE5C5AD83C303FD57593F7EFC55E73A9975F4C89B23E7C6C6C646C62E016DD992CCAD1979A579886639D7969DEEAA96B28A226055F94A52C0F49C86C8EEE2B2E681E1A1FE81D1BE6F5E636D58D72DEB3A7254468D8D5CB874EEF4C5B79F5DB674D586A25576C4B07C53D0D71DDE515E58DB1CA93C70B92C783EE5B98EBE96E6FEE1C1FE815343B58FFDF623D6CFF7BDBA3EBF7B42D7511975EEF4B9E3913367222FBCF56CF2F2A23407A2EBDA2AB8F2CAF2CDE5CD21F0EBC0787E55D9D26D6F9C1A82EA064E0D363F16F3312A6ACAA6435B73BADE3F77F68AAE4BE7BABBF6768EBFDDFE7CE70B079FCDC870841ADA5A3C01F79E8EB6AA0699D578BEDD9DE26BED07D0C0A9E1A6F8982F5DFB9DFDDA8C475273C2E196E323274E00E97857B831D8327EA6536655AECAC86B6A686E2EA9290F5755FAF6849ABBAADCE5E5EE0ED9F1FED1C1A6F8695FB9FE26F1EB19B17F99129F5373F0C287C7BBF606E573F862E4F9CEB7C65B5233F21A80B5E780AF6C4F6B4D6D6D4397AFB80C7A073E8D0E81A6AF7FFA7D69F2CC9525C10A777161E1C6CA1DBB5BC0AF8BE72B5766E4851A9A5B3BF6FB6ADA8255F5A18EFDF5AD0357480DF1D3BEF4D937C2C90F2D4AC9CACA7A665D65381289B49F190F67654EE86A6DDD5FBFADB2BAB6A66F7858767CE8D460C36331DFFDFC9BEADD0F2D49CEDAD1D91E74BB77779E1F3F23EB92596D3DF5651D3DF5F54303138E0F86E2A7DDF1C577F1C9339F4859B771477B677B188405533FD2D55D5FB6B7A2A646468D0E34C4C77CFBC6DE08F7CC58B46EF7B67C28D51DCC9FA8B1A9B9ADAFA7706FFF6055FFD0E850283EE626DE2E77CD98BF68191897B56EC59A344BA8B6B9A76FB4AF78B0A5B27C081C8FF9C6CDBDA9EE796851F20A8025EF941CA18EFEE1E1E1C14277D51B7BAA6F4AD335DF16253FFD4CF2AE432FBF3E343C38383C5CD833DA53F5C964DEE8B97BE6A265C975FBF60D0D0C02EB83CDBEB2B8B8A9B7FC36BE7BE613C01A00D6E8707761FC945FDE062B2A2A26F0EABE81A1D1C1B6B8C9D3E2A6C4551EBC0DD61DC67D8746079AE2E06571577E71F4C885DB607D3966B10732FE03B9B52FFD35EA8107A26EEBCCF828050F8C44FDDFCE176AFA0F214A71433812DB8C0000000049454E44AE426082', NULL, NULL, NULL, NULL, 'CÔNG TY TNHH ĐẠI PHÚC VINH - CHI NHÁNH QUY NHƠN', 'Ông NGUYỄN CÔNG TRUNG', 'Giám đốc chi nhánh', '3600974909-004', '1903 8662 598 885 Tại Techcombank - CN Đồng Nai', 109.16882, 13.71649, 'Quy Nhơn', NULL);
insert into WMS_Employee values ('NV-0906140001', 'admin', NULL, 3, 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '45764572', NULL, NULL, '{\rtf1\ansi\ansicpg1252\uc1\htmautsp\deff2{\fonttbl{\f0\fcharset0 Times New Roman;}{\f2\fcharset0 Segoe UI;}}{\colortbl\red0\green0\blue0;\red255\green255\blue255;\red21\green66\blue139;}\loch\hich\dbch\pard\plain\ltrpar\itap0{\lang1033\fs18\f2\cf2 \cf2\ql{\f2 \li0\ri0\sa0\sb0\fi0\ql\par}  }  }');

INSERT INTO Province VALUES (N'An Giang');
INSERT INTO Province VALUES (N'Bà Rịa-Vũng Tàu');
INSERT INTO Province VALUES (N'Bắc Giang');
INSERT INTO Province VALUES (N'Bắc Kạn');
INSERT INTO Province VALUES (N'Bạc Liêu');
INSERT INTO Province VALUES (N'Bắc Ninh');
INSERT INTO Province VALUES (N'Bến Tre');
INSERT INTO Province VALUES (N'Bình Định');
INSERT INTO Province VALUES (N'Bình Dương');
INSERT INTO Province VALUES (N'Bình Phước');
INSERT INTO Province VALUES (N'Bình Thuận');
INSERT INTO Province VALUES (N'Cà Mau');
INSERT INTO Province VALUES (N'Cần Thơ');
INSERT INTO Province VALUES (N'Cao Bằng');
INSERT INTO Province VALUES (N'Đà Nẵng');
INSERT INTO Province VALUES (N'Đắk Lắk');
INSERT INTO Province VALUES (N'Đắk Nông');
INSERT INTO Province VALUES (N'Điện Biên');
INSERT INTO Province VALUES (N'Đồng Nai');
INSERT INTO Province VALUES (N'Đồng Tháp');
INSERT INTO Province VALUES (N'Gia Lai');
INSERT INTO Province VALUES (N'Hà Giang');
INSERT INTO Province VALUES (N'Hà Nam');
INSERT INTO Province VALUES (N'Hà Nội');
INSERT INTO Province VALUES (N'Hà Tĩnh');
INSERT INTO Province VALUES (N'Hải Dương');
INSERT INTO Province VALUES (N'Hải Phòng');
INSERT INTO Province VALUES (N'Hậu Giang');
INSERT INTO Province VALUES (N'Hòa Bình');
INSERT INTO Province VALUES (N'Hưng Yên');
INSERT INTO Province VALUES (N'Khánh Hòa');
INSERT INTO Province VALUES (N'Kiên Giang');
INSERT INTO Province VALUES (N'Kon Tum');
INSERT INTO Province VALUES (N'Lai Châu');
INSERT INTO Province VALUES (N'Lâm Đồng');
INSERT INTO Province VALUES (N'Lạng Sơn');
INSERT INTO Province VALUES (N'Lào Cai');
INSERT INTO Province VALUES (N'Long An');
INSERT INTO Province VALUES (N'Nam Định');
INSERT INTO Province VALUES (N'Nghệ An');
INSERT INTO Province VALUES (N'Ninh Bình');
INSERT INTO Province VALUES (N'Ninh Thuận');
INSERT INTO Province VALUES (N'Phú Thọ');
INSERT INTO Province VALUES (N'Phú Yên');
INSERT INTO Province VALUES (N'Quảng Bình');
INSERT INTO Province VALUES (N'Quảng Nam');
INSERT INTO Province VALUES (N'Quảng Ngãi');
INSERT INTO Province VALUES (N'Quảng Ninh');
INSERT INTO Province VALUES (N'Quảng Trị');
INSERT INTO Province VALUES (N'Sóc Trăng');
INSERT INTO Province VALUES (N'Sơn La');
INSERT INTO Province VALUES (N'Tây Ninh');
INSERT INTO Province VALUES (N'Thái Bình');
INSERT INTO Province VALUES (N'Thái Nguyên');
INSERT INTO Province VALUES (N'Thanh Hóa');
INSERT INTO Province VALUES (N'Thừa Thiên Huế');
INSERT INTO Province VALUES (N'Tiền Giang');
INSERT INTO Province VALUES (N'Trà Vinh');
INSERT INTO Province VALUES (N'Tuyên Quang');
INSERT INTO Province VALUES (N'Vĩnh Long');
INSERT INTO Province VALUES (N'Vĩnh Phúc');
INSERT INTO Province VALUES (N'Yên Bái');
INSERT INTO Province VALUES (N'Phú Quốc');
INSERT INTO Province VALUES (N'Ba Ria');
INSERT INTO Province VALUES (N'Hải Dương');
INSERT INTO Province VALUES (N'Hậu Giang');
INSERT INTO Province VALUES (N'Lào Cai');
INSERT INTO Province VALUES (N'Tuyên Quang');
INSERT INTO Province VALUES (N'Đông Hưng - Thái Bình');
INSERT INTO Province VALUES (N'Sóc Sơn - Hà Nội');
INSERT INTO Province VALUES (N'Sơn Tây - Hà Nội');

insert into AccountType values (N'Quản lý cửa hàng', 1);
insert into AccountType values (N'Người dùng', 1);





