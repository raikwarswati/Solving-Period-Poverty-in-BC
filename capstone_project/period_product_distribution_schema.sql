-- Create Regions Table
CREATE TABLE Regions (
    RegionID INT PRIMARY KEY AUTO_INCREMENT,
    RegionName VARCHAR(255) NOT NULL
);

-- Create Organizations Table
CREATE TABLE Organizations (
    OrganizationID INT PRIMARY KEY AUTO_INCREMENT,
    OrganizationName VARCHAR(255) NOT NULL,
    ANDAR_ID VARCHAR(100),
    PostalCode VARCHAR(50),
    RegionID INT,
    FOREIGN KEY (RegionID) REFERENCES Regions(RegionID)
);

-- Create SupportGroups Table
CREATE TABLE SupportGroups (
    GroupID INT PRIMARY KEY AUTO_INCREMENT,
    GroupName VARCHAR(255) NOT NULL,
    Description TEXT
);

-- Create Communities Table
CREATE TABLE Communities (
    CommunityID INT PRIMARY KEY AUTO_INCREMENT,
    CommunityName VARCHAR(255) NOT NULL,
    Description TEXT
);

-- Create OrganizationSupportGroups Table
-- This table establishes a many-to-many relationship between Organizations and SupportGroups
CREATE TABLE OrganizationSupportGroups (
    OrganizationID INT,
    GroupID INT,
    PRIMARY KEY (OrganizationID, GroupID),
    FOREIGN KEY (OrganizationID) REFERENCES Organizations(OrganizationID),
    FOREIGN KEY (GroupID) REFERENCES SupportGroups(GroupID)
);

-- Create OrganizationCommunities Table
-- This table establishes a many-to-many relationship between Organizations and Communities
CREATE TABLE OrganizationCommunities (
    OrganizationID INT,
    CommunityID INT,
    PRIMARY KEY (OrganizationID, CommunityID),
    FOREIGN KEY (OrganizationID) REFERENCES Organizations(OrganizationID),
    FOREIGN KEY (CommunityID) REFERENCES Communities(CommunityID)
);

-- Create Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(255) NOT NULL
);

-- Create NeedsAssessment Table
CREATE TABLE NeedsAssessment (
    AssessmentID INT PRIMARY KEY AUTO_INCREMENT,
    OrganizationID INT,
    Year INT,
    ProductID INT,
    QuantityNeeded INT,
    FOREIGN KEY (OrganizationID) REFERENCES Organizations(OrganizationID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Create Distributions Table
CREATE TABLE Distributions (
    DistributionID INT PRIMARY KEY AUTO_INCREMENT,
    OrganizationID INT,
    Year INT,
    ProductID INT,
    QuantityDistributed INT,
    FOREIGN KEY (OrganizationID) REFERENCES Organizations(OrganizationID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Create Collections Table
CREATE TABLE Collections (
    CollectionID INT PRIMARY KEY AUTO_INCREMENT,
    Year INT,
    RegionID INT,
    ProductID INT,
    QuantityCollected INT,
    FOREIGN KEY (RegionID) REFERENCES Regions(RegionID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
