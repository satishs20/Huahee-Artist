1.First page is the gallery page where non-login/customer can use to view product



Database Values

CREATE TABLE [dbo].[wish] (
    [WishId]      INT            IDENTITY (1, 1) NOT NULL,
    [Wuser]       NVARCHAR (50)  NULL,
    [Pname]       NVARCHAR (50)  NOT NULL,
    [Size]        NVARCHAR (50)  NOT NULL,
    [Price]       NVARCHAR (50)  NOT NULL,
    [Description] NVARCHAR (600) NOT NULL,
    [Category]    NVARCHAR (50)  NOT NULL,
    [Date]        NVARCHAR (50)  NOT NULL,
    [CoverPhoto]  VARCHAR (MAX)  NOT NULL,
    [Image1]      VARCHAR (MAX)  NULL,
    [Image2]      VARCHAR (MAX)  NULL,
    [Image3]      VARCHAR (MAX)  NULL,
    [image4]      VARCHAR (MAX)  NULL,
    [Quantity]    INT            NULL,
    PRIMARY KEY CLUSTERED ([WishId] ASC)
);

CREATE TABLE [dbo].[user] (
    [User_Id]          INT           IDENTITY (1, 1) NOT NULL,
    [User_Username]    NVARCHAR (50) NULL,
    [User_Password]    NVARCHAR (50) NULL,
    [User_Name]        NVARCHAR (50) NULL,
    [User_Email]       NVARCHAR (50) NULL,
    [User_PhoneNumber] NVARCHAR (50) NULL,
    [User_Gender]      NVARCHAR (50) NULL,
    [User_Date]        NVARCHAR (50) NULL,
    [User_Address]     NVARCHAR (50) NULL,
    [User_Postcode]    NVARCHAR (50) NULL,
    [User_State]       NVARCHAR (50) NULL,
    [User_Image]       VARCHAR (MAX) NULL,
    [User_Type]        NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([User_Id] ASC)
);

CREATE TABLE [dbo].[cart] (
    [CartId]      INT            IDENTITY (1, 1) NOT NULL,
    [Cuser]       NVARCHAR (50)  NULL,
    [Pname]       NVARCHAR (50)  NOT NULL,
    [Size]        NVARCHAR (50)  NOT NULL,
    [Price]       NVARCHAR (50)  NOT NULL,
    [Description] NVARCHAR (600) NOT NULL,
    [Category]    NVARCHAR (50)  NOT NULL,
    [Date]        NVARCHAR (50)  NOT NULL,
    [CoverPhoto]  VARCHAR (MAX)  NOT NULL,
    [Image1]      VARCHAR (MAX)  NULL,
    [Image2]      VARCHAR (MAX)  NULL,
    [Image3]      VARCHAR (MAX)  NULL,
    [image4]      VARCHAR (MAX)  NULL,
    [Quantity]    INT            NULL,
    PRIMARY KEY CLUSTERED ([CartId] ASC)
);

CREATE TABLE [dbo].[product] (
    [ProductId]     INT            IDENTITY (1, 1) NOT NULL,
    [User_Username] NVARCHAR (50)  NULL,
    [Name]          NVARCHAR (50)  NOT NULL,
    [Size]          NVARCHAR (50)  NOT NULL,
    [Price]         NVARCHAR (50)  NOT NULL,
    [Description]   NVARCHAR (600) NOT NULL,
    [Category]      NVARCHAR (50)  NOT NULL,
    [Date]          NVARCHAR (50)  NOT NULL,
    [CoverPhoto]    VARCHAR (MAX)  NOT NULL,
    [Image1]        VARCHAR (MAX)  NULL,
    [Image2]        VARCHAR (MAX)  NULL,
    [Image3]        VARCHAR (MAX)  NULL,
    [image4]        VARCHAR (MAX)  NULL,
    [Quantity]      INT            NULL,
    PRIMARY KEY CLUSTERED ([ProductId] ASC)
);
