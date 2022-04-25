-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: RepMyBlock
-- ------------------------------------------------------
-- Server version	8.0.28-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `AdminCode`
--

DROP TABLE IF EXISTS `AdminCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AdminCode` (
  `AdminCode_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `AdminCode_Code` int unsigned DEFAULT NULL,
  `AdminCode_Reason` varchar(256) DEFAULT NULL,
  `AdminCode_ProgName` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`AdminCode_ID`),
  KEY `SystemUserVoterUniqID_IDX` (`AdminCode_Code`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Candidate`
--

DROP TABLE IF EXISTS `Candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Candidate` (
  `Candidate_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `SystemUser_ID` int unsigned DEFAULT NULL,
  `Team_ID` int unsigned DEFAULT NULL,
  `CandidateProfile_ID` int unsigned DEFAULT NULL,
  `Candidate_PetitionNameset` varchar(256) DEFAULT NULL,
  `Candidate_UniqStateVoterID` char(20) DEFAULT NULL,
  `DataCounty_ID` int unsigned DEFAULT NULL,
  `Voter_ID` int unsigned DEFAULT NULL,
  `CandidateElection_ID` int unsigned DEFAULT NULL,
  `Candidate_Party` char(3) DEFAULT NULL,
  `Candidate_FullPartyName` varchar(50) DEFAULT NULL,
  `CandidatePartySymbol_ID` int unsigned DEFAULT NULL,
  `Candidate_DisplayMap` varchar(256) DEFAULT NULL,
  `Candidate_DispName` varchar(256) DEFAULT NULL,
  `Candidate_DispResidence` varchar(256) DEFAULT NULL,
  `CandidateElection_DBTable` varchar(256) DEFAULT NULL,
  `CandidateElection_DBTableValue` varchar(256) DEFAULT NULL,
  `Candidate_StatsVoters` int DEFAULT NULL,
  `Candidate_Status` enum('published','pending','verified','nominated','deleted') DEFAULT NULL,
  `Candidate_Watermark` enum('yes','no') DEFAULT 'yes',
  `Candidate_LocalHash` char(32) DEFAULT NULL,
  `Candidate_NominatedBy` int unsigned DEFAULT NULL,
  PRIMARY KEY (`Candidate_ID`),
  KEY `SystemUser_ID_IDX` (`SystemUser_ID`),
  KEY `Candidate_UniqStateVoterID_IDX` (`Candidate_UniqStateVoterID`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CandidateComRplce`
--

DROP TABLE IF EXISTS `CandidateComRplce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CandidateComRplce` (
  `CandidateComRplce_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Voters_ID` int unsigned DEFAULT NULL,
  `CandidateComRplce_FullName` varchar(256) DEFAULT NULL,
  `CandidateComRplce_Residence` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`CandidateComRplce_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CandidateComRplceSet`
--

DROP TABLE IF EXISTS `CandidateComRplceSet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CandidateComRplceSet` (
  `CandidateComRplceSet_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Candidate_ID` int unsigned DEFAULT NULL,
  `CandidateComRplce_ID` int unsigned DEFAULT NULL,
  `CandidateComRplce_Order` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`CandidateComRplceSet_ID`),
  KEY `CandidateComRplceID_IDX` (`CandidateComRplce_ID`),
  KEY `CandidateComRplceCandidate_ID_IDX` (`Candidate_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CandidateElection`
--

DROP TABLE IF EXISTS `CandidateElection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CandidateElection` (
  `CandidateElection_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Elections_ID` int unsigned DEFAULT NULL,
  `CandidateElection_PositionType` enum('party','electoral') DEFAULT NULL,
  `CandidateElection_Party` char(3) DEFAULT NULL,
  `CandidateElection_Text` varchar(256) DEFAULT NULL,
  `CandidateElection_PetitionText` varchar(256) DEFAULT NULL,
  `CandidateElection_URLExplain` varchar(256) DEFAULT NULL,
  `CandidateElection_Number` smallint DEFAULT '1',
  `CandidateElection_DisplayOrder` smallint DEFAULT NULL,
  `CandidateElection_Display` enum('yes','no') DEFAULT 'no',
  `CandidateElection_Sex` enum('male','female','both') DEFAULT NULL,
  `CandidateElection_DBTable` varchar(256) DEFAULT NULL,
  `CandidateElection_DBTableValue` varchar(256) DEFAULT NULL,
  `CandidateElection_CountVoter` int DEFAULT NULL,
  PRIMARY KEY (`CandidateElection_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15774 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CandidateGroup`
--

DROP TABLE IF EXISTS `CandidateGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CandidateGroup` (
  `CandidateGroup_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `CandidateSet_ID` int unsigned DEFAULT NULL,
  `Candidate_ID` int unsigned DEFAULT NULL,
  `CandidateGroup_Order` tinyint unsigned DEFAULT NULL,
  `DataCounty_ID` int unsigned DEFAULT NULL,
  `CandidateGroup_Party` char(3) DEFAULT NULL,
  `CandidateGroup_Watermark` enum('yes','no') DEFAULT 'yes',
  PRIMARY KEY (`CandidateGroup_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CandidatePartySymbol`
--

DROP TABLE IF EXISTS `CandidatePartySymbol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CandidatePartySymbol` (
  `CandidatePartySymbol_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `CandidatePartySymbol_Char` char(1) DEFAULT NULL,
  `CandidatePartySymbol_Size` float DEFAULT NULL,
  `CandidatePartySymbol_Font` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CandidatePartySymbol_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CandidateProfile`
--

DROP TABLE IF EXISTS `CandidateProfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CandidateProfile` (
  `CandidateProfile_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Candidate_ID` int unsigned DEFAULT NULL,
  `CandidateProfile_PicFileName` varchar(256) DEFAULT NULL,
  `CandidateProfile_PDFFileName` varchar(256) DEFAULT NULL,
  `CandidateProfile_FirstName` varchar(100) DEFAULT NULL,
  `CandidateProfile_LastName` varchar(100) DEFAULT NULL,
  `CandidateProfile_Alias` varchar(256) DEFAULT NULL,
  `CandidateProfile_Website` varchar(256) DEFAULT NULL,
  `CandidateProfile_Email` varchar(256) DEFAULT NULL,
  `CandidateProfile_Twitter` varchar(40) DEFAULT NULL,
  `CandidateProfile_Facebook` varchar(40) DEFAULT NULL,
  `CandidateProfile_Instagram` varchar(40) DEFAULT NULL,
  `CandidateProfile_TikTok` varchar(40) DEFAULT NULL,
  `CandidateProfile_YouTube` varchar(40) DEFAULT NULL,
  `CandidateProfile_BallotPedia` varchar(256) DEFAULT NULL,
  `CandidateProfile_PhoneNumber` varchar(30) DEFAULT NULL,
  `CandidateProfile_FaxNumber` varchar(30) DEFAULT NULL,
  `CandidateProfile_Statement` text,
  `CandidateProfile_PublishProfile` enum('yes','no') DEFAULT 'no',
  `CandidateProfile_PublishPetition` enum('yes','no') DEFAULT 'no',
  PRIMARY KEY (`CandidateProfile_ID`),
  KEY `CandidateProfile_ID_IDX` (`Candidate_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CandidateSet`
--

DROP TABLE IF EXISTS `CandidateSet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CandidateSet` (
  `CandidateSet_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `SystemUser_ID` int unsigned DEFAULT NULL,
  `CandidateSET_Random` char(12) DEFAULT NULL,
  `CandidateSet_TimeStamp` datetime DEFAULT NULL,
  PRIMARY KEY (`CandidateSet_ID`),
  KEY `CandidateSet_Random_IDX` (`CandidateSET_Random`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DataAddress`
--

DROP TABLE IF EXISTS `DataAddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DataAddress` (
  `DataAddress_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `DataAddress_HouseNumber` varchar(100) DEFAULT NULL,
  `DataAddress_FracAddress` varchar(100) DEFAULT NULL,
  `DataAddress_PreStreet` varchar(100) DEFAULT NULL,
  `DataStreet_ID` int unsigned DEFAULT NULL,
  `DataAddress_PostStreet` varchar(100) DEFAULT NULL,
  `DataCity_ID` int unsigned DEFAULT NULL,
  `DataState_ID` int unsigned DEFAULT NULL,
  `DataAddress_zipcode` varchar(30) DEFAULT NULL,
  `DataAddress_zip4` varchar(10) DEFAULT NULL,
  `Cordinate_ID` int unsigned DEFAULT NULL,
  `PG_OSM_osmid` bigint DEFAULT NULL,
  PRIMARY KEY (`DataAddress_ID`),
  KEY `DataAddressAll_IDX` (`DataAddress_HouseNumber`,`DataAddress_FracAddress`,`DataAddress_PreStreet`,`DataStreet_ID`,`DataAddress_PostStreet`,`DataCity_ID`,`DataState_ID`,`DataAddress_zipcode`,`DataAddress_zip4`),
  KEY `DataAddressZipcodes_IDX` (`DataAddress_zipcode`),
  KEY `DataAddressMost` (`DataAddress_HouseNumber`,`DataAddress_FracAddress`,`DataAddress_PreStreet`,`DataStreet_ID`,`DataAddress_PostStreet`,`DataCity_ID`,`DataState_ID`,`DataAddress_zipcode`),
  KEY `DataAddressCordinate_IDX` (`Cordinate_ID`),
  KEY `DataAddress_ID_IDX` (`DataAddress_ID`),
  KEY `DataAddress_DataStreet_IDX` (`DataStreet_ID`),
  KEY `DataAddress_City_IDX` (`DataCity_ID`),
  KEY `DataAddress_State_IDX` (`DataState_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9575653 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DataCity`
--

DROP TABLE IF EXISTS `DataCity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DataCity` (
  `DataCity_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `DataCity_Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DataCity_ID`),
  UNIQUE KEY `DataCity_Name` (`DataCity_Name`),
  KEY `DataCityName_IDX` (`DataCity_Name`)
) ENGINE=InnoDB AUTO_INCREMENT=2076 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DataCounty`
--

DROP TABLE IF EXISTS `DataCounty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DataCounty` (
  `DataCounty_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `DataState_ID` int unsigned DEFAULT NULL,
  `DataCounty_Name` varchar(40) DEFAULT NULL,
  `DataCounty_BOEID` int unsigned DEFAULT NULL,
  PRIMARY KEY (`DataCounty_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DataDistrict`
--

DROP TABLE IF EXISTS `DataDistrict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DataDistrict` (
  `DataDistrict_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `DataCounty_ID` int unsigned DEFAULT NULL,
  `DataDistrict_Electoral` smallint unsigned DEFAULT NULL,
  `DataDistrict_StateAssembly` tinyint unsigned DEFAULT NULL,
  `DataDistrict_SenateSenate` tinyint unsigned DEFAULT NULL,
  `DataDistrict_Legislative` smallint unsigned DEFAULT NULL,
  `DataDistrict_Ward` char(3) DEFAULT NULL,
  `DataDistrict_Congress` tinyint unsigned DEFAULT NULL,
  `DataDistrict_Council` tinyint unsigned DEFAULT NULL,
  `DataDistrict_CivilCourt` tinyint unsigned DEFAULT NULL,
  `DataDistrict_Judicial` smallint unsigned DEFAULT NULL,
  PRIMARY KEY (`DataDistrict_ID`),
  KEY `DataDistrict_StateAssembly_IDX` (`DataDistrict_StateAssembly`),
  KEY `DataDistrict_SenateSenate_IDX` (`DataDistrict_SenateSenate`),
  KEY `DataDistrict_Congress_IDX` (`DataDistrict_Congress`),
  KEY `DataDistrict_Council_IDX` (`DataDistrict_Council`),
  KEY `DataDistrict_Judicial_IDX` (`DataDistrict_Judicial`),
  KEY `DataDistrict_Legislative_IDX` (`DataDistrict_Legislative`),
  KEY `DataDistrict_Ward_IDX` (`DataDistrict_Ward`),
  KEY `DataDistrict_Electoral_IDX` (`DataDistrict_Electoral`),
  KEY `DataDistrict_Electoral_StateAssembly_IDX` (`DataDistrict_Electoral`,`DataDistrict_StateAssembly`),
  KEY `DataDistrict_CivilCourt_IDX` (`DataDistrict_CivilCourt`)
) ENGINE=InnoDB AUTO_INCREMENT=20210 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DataDistrictCycle`
--

DROP TABLE IF EXISTS `DataDistrictCycle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DataDistrictCycle` (
  `DataDistrictCycle_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `DataDistrictCycle_CycleStartDate` date DEFAULT NULL,
  `DataDistrictCycle_CycleEndDate` date DEFAULT NULL,
  PRIMARY KEY (`DataDistrictCycle_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DataDistrictTemporal`
--

DROP TABLE IF EXISTS `DataDistrictTemporal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DataDistrictTemporal` (
  `DataDistrictTemporal_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `DataDistrictCycle_ID` int unsigned DEFAULT NULL,
  `DataDistrictTemporal_GroupID` int unsigned DEFAULT NULL,
  `DataDistrict_ID` int unsigned DEFAULT NULL,
  `DataDistrictTemporal_DBTable` varchar(10) DEFAULT NULL,
  `DataDistrictTemporal_DBTableValue` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`DataDistrictTemporal_ID`),
  KEY `DataDistrictTemporal_DBTable_IDX` (`DataDistrictTemporal_DBTable`,`DataDistrictTemporal_DBTableValue`),
  KEY `DataDistrictTemporal_DataDistrictCycle_IDX` (`DataDistrictCycle_ID`),
  KEY `DataDistrictTemporal_GroupID_IDX` (`DataDistrictTemporal_GroupID`),
  KEY `DataDistrictTemporal_GroupIDCycle_IDX` (`DataDistrictTemporal_GroupID`,`DataDistrictCycle_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=30665 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DataDistrictTown`
--

DROP TABLE IF EXISTS `DataDistrictTown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DataDistrictTown` (
  `DataDistrictTown_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `DataDistrictTown_Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DataDistrictTown_ID`),
  UNIQUE KEY `DataDistrictTown_Name` (`DataDistrictTown_Name`),
  KEY `DataDistrictTown_IDX` (`DataDistrictTown_Name`)
) ENGINE=InnoDB AUTO_INCREMENT=1245 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DataFirstName`
--

DROP TABLE IF EXISTS `DataFirstName`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DataFirstName` (
  `DataFirstName_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `DataFirstName_Text` varchar(256) DEFAULT NULL,
  `DataFirstName_Compress` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`DataFirstName_ID`),
  KEY `DataFirstName_Text_IDX` (`DataFirstName_Text`),
  KEY `DataFirstName_Compress_IDX` (`DataFirstName_Compress`)
) ENGINE=InnoDB AUTO_INCREMENT=662080 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DataHouse`
--

DROP TABLE IF EXISTS `DataHouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DataHouse` (
  `DataHouse_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `DataAddress_ID` int unsigned DEFAULT NULL,
  `DataHouse_Apt` varchar(100) DEFAULT NULL,
  `DataDistrictTemporal_GroupID` int unsigned DEFAULT NULL,
  `DataDistrictTown_ID` int unsigned DEFAULT NULL,
  `DataHouse_BIN` int unsigned DEFAULT NULL,
  PRIMARY KEY (`DataHouse_ID`),
  KEY `DataHouseDataAddress_IDX` (`DataAddress_ID`),
  KEY `DataHouseDataAddressApt_IDX` (`DataAddress_ID`,`DataHouse_Apt`),
  KEY `DataHouse_BIN_IDX` (`DataHouse_BIN`)
) ENGINE=InnoDB AUTO_INCREMENT=9559625 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DataLastName`
--

DROP TABLE IF EXISTS `DataLastName`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DataLastName` (
  `DataLastName_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `DataLastName_Text` varchar(256) DEFAULT NULL,
  `DataLastName_Compress` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`DataLastName_ID`),
  KEY `DataLastName_Text_IDX` (`DataLastName_Text`),
  KEY `DataLastName_Compress_IDX` (`DataLastName_Compress`)
) ENGINE=InnoDB AUTO_INCREMENT=1152466 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DataMiddleName`
--

DROP TABLE IF EXISTS `DataMiddleName`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DataMiddleName` (
  `DataMiddleName_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `DataMiddleName_Text` varchar(256) DEFAULT NULL,
  `DataMiddleName_Compress` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`DataMiddleName_ID`),
  KEY `DataMiddleName_Text_IDX` (`DataMiddleName_Text`),
  KEY `DataMiddleName_Compress_IDX` (`DataMiddleName_Compress`)
) ENGINE=InnoDB AUTO_INCREMENT=142531 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DataParty`
--

DROP TABLE IF EXISTS `DataParty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DataParty` (
  `DataParty_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `DataState_ID` int unsigned DEFAULT NULL,
  `DataParty_Abbrev` char(3) DEFAULT NULL,
  `DataParty_Name` varchar(255) DEFAULT NULL,
  `DataParty_Recognized` enum('yes','no') DEFAULT NULL,
  PRIMARY KEY (`DataParty_ID`),
  KEY `DataParty_Abbrev_IDX` (`DataParty_Abbrev`),
  KEY `DataParty_DataState_IDX` (`DataState_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DataState`
--

DROP TABLE IF EXISTS `DataState`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DataState` (
  `DataState_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `DataState_Name` varchar(255) DEFAULT NULL,
  `DataState_Abbrev` char(2) DEFAULT NULL,
  PRIMARY KEY (`DataState_ID`),
  UNIQUE KEY `DataState_Name` (`DataState_Name`),
  KEY `DataStateName_IDX` (`DataState_Name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DataStreet`
--

DROP TABLE IF EXISTS `DataStreet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DataStreet` (
  `DataStreet_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `DataStreet_Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DataStreet_ID`),
  UNIQUE KEY `DataStreet_Name` (`DataStreet_Name`),
  KEY `DataStreetName_IDX` (`DataStreet_Name`),
  KEY `DataStreet_ID_IDX` (`DataStreet_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=107455 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Elections`
--

DROP TABLE IF EXISTS `Elections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Elections` (
  `Elections_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `DataState_ID` int unsigned DEFAULT NULL,
  `Elections_Text` varchar(256) DEFAULT NULL,
  `Elections_Date` date DEFAULT NULL,
  `Elections_Type` enum('primary','general','special','other') DEFAULT NULL,
  PRIMARY KEY (`Elections_ID`),
  KEY `Elections_ID_IDX` (`Elections_Text`)
) ENGINE=InnoDB AUTO_INCREMENT=1373 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ElectionsDistricts`
--

DROP TABLE IF EXISTS `ElectionsDistricts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ElectionsDistricts` (
  `ElectionsDistricts_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `ElectionsDistricts_Party` char(3) DEFAULT NULL,
  `Elections_ID` int unsigned DEFAULT NULL,
  `CandidatePositions_ID` int unsigned DEFAULT NULL,
  `DataCounty_ID` int unsigned DEFAULT NULL,
  `ElectionsDistricts_DBTable` varchar(256) DEFAULT NULL,
  `ElectionsDistricts_DBTableValue` varchar(256) DEFAULT NULL,
  `ElectionsDistricts_NumberFemale` int unsigned DEFAULT NULL,
  `Elections_ID_Female` int unsigned DEFAULT NULL,
  `ElectionsDistricts_NumberMale` int unsigned DEFAULT NULL,
  `Elections_ID_Male` int unsigned DEFAULT NULL,
  `ElectionsDistricts_NumberUnixSex` int unsigned DEFAULT NULL,
  `Elections_ID_Unisex` int unsigned DEFAULT NULL,
  PRIMARY KEY (`ElectionsDistricts_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ElectionsDistrictsConv`
--

DROP TABLE IF EXISTS `ElectionsDistrictsConv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ElectionsDistrictsConv` (
  `ElectionsDistrictsConv_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Elections_ID` int unsigned DEFAULT NULL,
  `DataCounty_ID` int unsigned DEFAULT NULL,
  `ElectionsDistricts_Party` char(3) DEFAULT NULL,
  `ElectionsDistricts_DBTable` varchar(256) DEFAULT NULL,
  `ElectionsDistricts_DBTableValue` varchar(256) DEFAULT NULL,
  `ElectionsDistrictsConv_DBTable` varchar(256) DEFAULT NULL,
  `ElectionsDistrictsConv_DBTableValue` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`ElectionsDistrictsConv_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ElectionsPartyCall`
--

DROP TABLE IF EXISTS `ElectionsPartyCall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ElectionsPartyCall` (
  `ElectionsPartyCall_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `ElectionsPartyCall_Party` char(3) DEFAULT NULL,
  `Elections_ID` int unsigned DEFAULT NULL,
  `CandidatePositions_ID` int unsigned DEFAULT NULL,
  `DataCounty_ID` int unsigned DEFAULT NULL,
  `ElectionsPartyCall_DBTable` varchar(256) DEFAULT NULL,
  `ElectionsPartyCall_DBTableValue` varchar(256) DEFAULT NULL,
  `ElectionsPartyCall_NumberFemale` int unsigned DEFAULT NULL,
  `Elections_ID_Female` int unsigned DEFAULT NULL,
  `ElectionsPartyCall_NumberMale` int unsigned DEFAULT NULL,
  `Elections_ID_Male` int unsigned DEFAULT NULL,
  `ElectionsPartyCall_NumberUnixSex` int unsigned DEFAULT NULL,
  `Elections_ID_Unisex` int unsigned DEFAULT NULL,
  PRIMARY KEY (`ElectionsPartyCall_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5279 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ElectionsPosition`
--

DROP TABLE IF EXISTS `ElectionsPosition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ElectionsPosition` (
  `ElectionsPosition_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `ElectionsPosition_DBTable` varchar(100) DEFAULT NULL,
  `DataState_ID` int unsigned DEFAULT NULL,
  `ElectionsPosition_State` char(2) DEFAULT NULL,
  `ElectionsPosition_Type` enum('party','office','corporate') DEFAULT NULL,
  `ElectionsPosition_Name` varchar(100) DEFAULT NULL,
  `ElectionsPosition_Party` char(3) DEFAULT NULL,
  `ElectionsPosition_Order` int unsigned DEFAULT NULL,
  `ElectionsPosition_Explanation` text,
  PRIMARY KEY (`ElectionsPosition_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FillingDoc`
--

DROP TABLE IF EXISTS `FillingDoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FillingDoc` (
  `FillingDoc_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Candidate_ID` int unsigned DEFAULT NULL,
  `FillingDoc_Fld1` varchar(256) DEFAULT NULL,
  `FillingDoc_Fld2` varchar(256) DEFAULT NULL,
  `FillingDoc_Fld3` varchar(256) DEFAULT NULL,
  `FillingDoc_Fld4` varchar(256) DEFAULT NULL,
  `FillingDoc_Fld5` varchar(256) DEFAULT NULL,
  `FillingDoc_Fld6` varchar(256) DEFAULT NULL,
  `FillingDoc_Fld7` varchar(256) DEFAULT NULL,
  `FillingDoc_Fld8` varchar(256) DEFAULT NULL,
  `FillingDoc_Fld9` varchar(256) DEFAULT NULL,
  `FillingDoc_Fld10` varchar(256) DEFAULT NULL,
  `FillingDoc_Fld11` varchar(256) DEFAULT NULL,
  `FillingDoc_Fld12` varchar(256) DEFAULT NULL,
  `FillingDoc_Fld13` varchar(256) DEFAULT NULL,
  `FillingDoc_Fld14` varchar(256) DEFAULT NULL,
  `FillingDoc_Fld15` varchar(256) DEFAULT NULL,
  `FillingDoc_Fld16` varchar(256) DEFAULT NULL,
  `FillingDoc_Fld17` varchar(256) DEFAULT NULL,
  `FillingDoc_Fld18` varchar(256) DEFAULT NULL,
  `FillingDoc_Fld19` varchar(256) DEFAULT NULL,
  `FillingDoc_Fld20` varchar(256) DEFAULT NULL,
  `FillingDoc_Date` datetime DEFAULT NULL,
  PRIMARY KEY (`FillingDoc_ID`),
  KEY `FillingDoc_ID_IDX` (`FillingDoc_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FillingField`
--

DROP TABLE IF EXISTS `FillingField`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FillingField` (
  `FillingField_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `FillingField_Text` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`FillingField_ID`),
  KEY `FillingField_TextIDX` (`FillingField_Text`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FillingObjections`
--

DROP TABLE IF EXISTS `FillingObjections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FillingObjections` (
  `FillingObjections_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `DataCounty_ID` int unsigned DEFAULT NULL,
  `Candidate_ID` int unsigned DEFAULT NULL,
  `CandidateSet_ID` int unsigned DEFAULT NULL,
  `FillingObjections_DateAppear` date DEFAULT NULL,
  `FillingObjections_SpecificationNumber` varchar(255) DEFAULT NULL,
  `FillingObjections_PetitionNumber` text,
  `FillingObjections_ObjectorName` varchar(100) DEFAULT NULL,
  `FillingObjections_CandidateName` varchar(100) DEFAULT NULL,
  `FillingObjections_CheckRep` tinyint DEFAULT NULL,
  `FillingObjections_RepType` varchar(25) DEFAULT NULL,
  `FillingObjections_RepreName` varchar(100) DEFAULT NULL,
  `FillingObjections_RepreFirm` varchar(255) DEFAULT NULL,
  `FillingObjections_RepAddress1` varchar(100) DEFAULT NULL,
  `FillingObjections_RepAddress2` varchar(100) DEFAULT NULL,
  `FillingObjections_RepTel` varchar(40) DEFAULT NULL,
  `FillingObjections_RepFax` varchar(40) DEFAULT NULL,
  `FillingObjections_RepEmail` varchar(255) DEFAULT NULL,
  `FillingObjections_SignedDate` date DEFAULT NULL,
  PRIMARY KEY (`FillingObjections_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FillingTrack`
--

DROP TABLE IF EXISTS `FillingTrack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FillingTrack` (
  `FillingTrack_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `FillingDoc_ID` int unsigned DEFAULT NULL,
  `CandidateSet_ID` int unsigned DEFAULT NULL,
  `FillingTrack_BOEID` varchar(30) DEFAULT NULL,
  `FillingField_ID` int unsigned DEFAULT NULL,
  `FillingDeficiencies_ID` int unsigned DEFAULT NULL,
  `FillingTrack_Locked` enum('yes','no') DEFAULT NULL,
  `FillingTrack_TimeStamp` datetime DEFAULT NULL,
  PRIMARY KEY (`FillingTrack_ID`),
  KEY `FillingTrack_BOEID_IDX` (`FillingTrack_BOEID`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SystemStats`
--

DROP TABLE IF EXISTS `SystemStats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SystemStats` (
  `SystemStats_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `SystemStats_Date` date DEFAULT NULL,
  `SystemStats_EmailRcvd` mediumint unsigned DEFAULT NULL,
  `SystemStats_MovRequest` mediumint unsigned DEFAULT NULL,
  `SystemStats_EmailTempConv` mediumint unsigned DEFAULT NULL,
  `SystemStats_EmailPermConv` mediumint unsigned DEFAULT NULL,
  `SystemStats_VoterConverted` mediumint unsigned DEFAULT NULL,
  `SystemStats_SelfCandidates` mediumint unsigned DEFAULT NULL,
  PRIMARY KEY (`SystemStats_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SystemUser`
--

DROP TABLE IF EXISTS `SystemUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SystemUser` (
  `SystemUser_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `SystemUserProfile_ID` int unsigned DEFAULT NULL,
  `Voters_ID` int unsigned DEFAULT NULL,
  `Voters_UniqStateVoterID` varchar(50) DEFAULT NULL,
  `SystemUser_EDAD` int DEFAULT NULL,
  `SystemUser_NumVoters` smallint DEFAULT NULL,
  `SystemUser_Party` char(3) DEFAULT NULL,
  `SystemUser_ComplexMenu` enum('yes','no') DEFAULT 'no',
  `SystemUser_email` varchar(256) DEFAULT NULL,
  `SystemUser_emailverified` enum('no','link','reply','both') DEFAULT 'no',
  `SystemUser_username` varchar(256) DEFAULT NULL,
  `SystemUser_password` varchar(256) DEFAULT NULL,
  `SystemUser_FirstName` varchar(256) DEFAULT NULL,
  `SystemUser_LastName` varchar(256) DEFAULT NULL,
  `SystemUser_Priv` int unsigned DEFAULT NULL,
  `SystemUser_loginmethod` enum('password','emaillink') DEFAULT 'password',
  `SystemUser_emaillinkid` varchar(256) DEFAULT NULL,
  `SystemUser_mobilephone` varchar(256) DEFAULT NULL,
  `SystemUser_mobileverified` enum('yes','no') DEFAULT 'no',
  `SystemUser_facebookusername` varchar(256) DEFAULT NULL,
  `SystemUser_facebookverified` enum('yes','no') DEFAULT 'no',
  `SystemUser_googleusername` varchar(256) DEFAULT NULL,
  `SystemUser_googleverified` enum('yes','no') DEFAULT 'no',
  `SystemUser_googleapimapid` varchar(256) DEFAULT NULL,
  `SystemUser_createtime` datetime DEFAULT NULL,
  `SystemUser_lastlogintime` datetime DEFAULT NULL,
  PRIMARY KEY (`SystemUser_ID`),
  UNIQUE KEY `SystemUser_email` (`SystemUser_email`),
  UNIQUE KEY `SystemUser_username` (`SystemUser_username`),
  KEY `SystemUser_EDAD_IDX` (`SystemUser_EDAD`),
  KEY `SystemUser_email_IDX` (`SystemUser_email`),
  KEY `SystemUser_UniqID_IDX` (`Voters_UniqStateVoterID`),
  KEY `SystemUser_username_IDX` (`SystemUser_username`),
  KEY `SystemUser_mobilephone_IDX` (`SystemUser_mobilephone`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SystemUserEmail`
--

DROP TABLE IF EXISTS `SystemUserEmail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SystemUserEmail` (
  `SystemUserEmail_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `SystemUserEmail_AddFrom` varchar(256) DEFAULT NULL,
  `SystemUserEmail_AddTo` varchar(256) DEFAULT NULL,
  `SystemUserEmail_MailCode` char(10) DEFAULT NULL,
  `SystemUserEmail_Reason` varchar(256) DEFAULT NULL,
  `SystemUserEmail_Concluded` enum('yes','no') DEFAULT NULL,
  `SystemUser_ID` int unsigned DEFAULT NULL,
  `SystemUserEmail_Received` datetime DEFAULT NULL,
  PRIMARY KEY (`SystemUserEmail_ID`),
  KEY `SystemUserEmail_AddTo_IDX` (`SystemUserEmail_AddTo`),
  KEY `SystemUserEmail_MailCode_IDX` (`SystemUserEmail_MailCode`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SystemUserLastLogin`
--

DROP TABLE IF EXISTS `SystemUserLastLogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SystemUserLastLogin` (
  `SystemUser_ID` int unsigned DEFAULT NULL,
  `SystemUserLastLogin` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SystemUserProfile`
--

DROP TABLE IF EXISTS `SystemUserProfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SystemUserProfile` (
  `SystemUserProfile_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `SystemUserProfile_bio` text,
  `SystemUserProfile_URL` varchar(256) DEFAULT NULL,
  `SystemUserProfile_Location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`SystemUserProfile_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SystemUserQuery`
--

DROP TABLE IF EXISTS `SystemUserQuery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SystemUserQuery` (
  `SystemUserQuery_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `SystemUserQuery_FirstName` varchar(255) DEFAULT NULL,
  `SystemUserQuery_LastName` varchar(255) DEFAULT NULL,
  `SystemUserQuery_DateOfBirth` date DEFAULT NULL,
  `SystemUserQuery_DatedFileID` int unsigned DEFAULT NULL,
  `SystemUserQuery_Email` varchar(255) DEFAULT NULL,
  `SystemUserQuery_UniqNYSVoterID` char(20) DEFAULT NULL,
  `SystemUserQuery_IP` varchar(100) DEFAULT NULL,
  `SystemUserQuery_Date` datetime DEFAULT NULL,
  PRIMARY KEY (`SystemUserQuery_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SystemUserSelfDistrict`
--

DROP TABLE IF EXISTS `SystemUserSelfDistrict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SystemUserSelfDistrict` (
  `SystemUserSelfDistrict_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `SystemUser_ID` int unsigned DEFAULT NULL,
  `SystemUserSelfDistrict_AD` int DEFAULT NULL,
  `SystemUserSelfDistrict_ED` int DEFAULT NULL,
  `SystemUserSelfDistrict_CG` int DEFAULT NULL,
  `SystemUserSelfDistrict_SN` int DEFAULT NULL,
  PRIMARY KEY (`SystemUserSelfDistrict_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SystemUserTemporary`
--

DROP TABLE IF EXISTS `SystemUserTemporary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SystemUserTemporary` (
  `SystemUserTemporary_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `SystemUser_ID` int unsigned DEFAULT NULL,
  `SystemUserTemporary_email` varchar(256) DEFAULT NULL,
  `SystemUserTemporary_emailverified` enum('no','link','reply','both') DEFAULT 'no',
  `SystemUserTemporary_username` varchar(256) DEFAULT NULL,
  `SystemUserTemporary_password` varchar(256) DEFAULT NULL,
  `SystemUserTemporary_emaillinkid` varchar(256) DEFAULT NULL,
  `SystemUserTemporary_mailID` varchar(30) DEFAULT NULL,
  `SystemUserTemporary_reference` varchar(256) DEFAULT NULL,
  `SystemUserTemporary_createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`SystemUserTemporary_ID`),
  UNIQUE KEY `SystemUserTemporary_email` (`SystemUserTemporary_email`),
  UNIQUE KEY `SystemUserTemporary_username` (`SystemUserTemporary_username`),
  KEY `SystemUserTemporary_emaill_IDX` (`SystemUserTemporary_email`),
  KEY `SystemUserTemporary_emaillinkid_IDX` (`SystemUserTemporary_emaillinkid`),
  KEY `SystemUserTemporary_username_IDX` (`SystemUserTemporary_username`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SystemUserVoter`
--

DROP TABLE IF EXISTS `SystemUserVoter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SystemUserVoter` (
  `SystemUser_ID` int unsigned DEFAULT NULL,
  `Voter_ID` int unsigned DEFAULT NULL,
  `Voter_UniqStateVoterID` varchar(50) DEFAULT NULL,
  `SystemUserVoter_Username` varchar(256) DEFAULT NULL,
  `SystemUserVoter_Email` varchar(256) DEFAULT NULL,
  `SystemUserVoter_Action` enum('interested','running','candidate','other','register','convert') DEFAULT NULL,
  `SystemUserVoter_Date` datetime DEFAULT NULL,
  `SystemUserVoter_IP` varchar(40) DEFAULT NULL,
  KEY `SystemUserVoter_ID_IDX` (`SystemUser_ID`),
  KEY `SystemUserVoterUniqID_IDX` (`Voter_UniqStateVoterID`),
  KEY `SystemUserVoter_VoterID_IDX` (`Voter_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Team`
--

DROP TABLE IF EXISTS `Team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Team` (
  `Team_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `SystemUser_ID` int unsigned DEFAULT NULL,
  `Team_Name` varchar(256) DEFAULT NULL,
  `Team_AccessCode` varchar(256) DEFAULT NULL,
  `Team_WebCode` varchar(20) DEFAULT NULL,
  `Team_Active` enum('yes','no') DEFAULT NULL,
  `Team_Public` enum('public','private') DEFAULT NULL,
  `Team_Created` datetime DEFAULT NULL,
  PRIMARY KEY (`Team_ID`),
  KEY `Team_AccessCode_IDX` (`Team_AccessCode`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TeamCandidates`
--

DROP TABLE IF EXISTS `TeamCandidates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TeamCandidates` (
  `TeamCandidates_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Team_ID` int unsigned DEFAULT NULL,
  `Candidate_ID` int unsigned DEFAULT NULL,
  `TeamCandidates_CreateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`TeamCandidates_ID`),
  KEY `TeamCandidates_Candidate_IDX` (`Candidate_ID`),
  KEY `TeamCandidates_Team_IDX` (`Team_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TeamMember`
--

DROP TABLE IF EXISTS `TeamMember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TeamMember` (
  `TeamMember_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `SystemUser_ID` int unsigned DEFAULT NULL,
  `Team_ID` int unsigned DEFAULT NULL,
  `TeamMember_Active` enum('yes','no','pending') DEFAULT NULL,
  `TeamMember_Privs` int unsigned DEFAULT NULL,
  `TeamMember_ApprovedBy` int unsigned DEFAULT NULL,
  `TeamMember_ApprovedNote` varchar(256) DEFAULT NULL,
  `TeamMember_ApprovedDate` datetime DEFAULT NULL,
  `TeamMember_RemovedBy` int unsigned DEFAULT NULL,
  `TeamMember_RemovedNote` varchar(256) DEFAULT NULL,
  `TeamMember_RemovedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`TeamMember_ID`),
  KEY `TeamMember_SysTeam_IDX` (`SystemUser_ID`,`Team_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Voters`
--

DROP TABLE IF EXISTS `Voters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Voters` (
  `Voters_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `VotersIndexes_ID` int unsigned DEFAULT NULL,
  `ElectionsDistricts_DBTable` varchar(256) DEFAULT NULL,
  `ElectionsDistricts_DBTableValue` varchar(256) DEFAULT NULL,
  `DataHouse_ID` int unsigned DEFAULT NULL,
  `Voters_Gender` enum('male','female','other','undetermined') DEFAULT NULL,
  `VotersComplementInfo_ID` int unsigned DEFAULT NULL,
  `Voters_UniqStateVoterID` varchar(50) DEFAULT NULL,
  `DataState_ID` tinyint unsigned DEFAULT NULL,
  `Voters_RegParty` char(3) DEFAULT NULL,
  `Voters_ReasonCode` enum('AdjudgedIncompetent','Death','Duplicate','Felon','MailCheck','MouvedOutCounty','NCOA','NVRA','ReturnMail','VoterRequest','Other','Court','Inactive') DEFAULT NULL,
  `Voters_Status` enum('Active','ActiveMilitary','ActiveSpecialFederal','ActiveSpecialPresidential','ActiveUOCAVA','Inactive','Purged','Prereg17YearOlds','Confirmation') DEFAULT NULL,
  `VotersMailingAddress_ID` int unsigned DEFAULT NULL,
  `Voters_IDRequired` enum('yes','no') DEFAULT NULL,
  `Voters_IDMet` enum('yes','no') DEFAULT NULL,
  `Voters_ApplyDate` date DEFAULT NULL,
  `Voters_RegSource` enum('Agency','CBOE','DMV','LocalRegistrar','MailIn','School') DEFAULT NULL,
  `Voters_DateInactive` date DEFAULT NULL,
  `Voters_DatePurged` date DEFAULT NULL,
  `Voters_CountyVoterNumber` varchar(50) DEFAULT NULL,
  `Voters_RecFirstSeen` date DEFAULT NULL,
  `Voters_RecLastSeen` date DEFAULT NULL,
  PRIMARY KEY (`Voters_ID`),
  KEY `Voters_UniqStateVoterID_IDX` (`Voters_UniqStateVoterID`),
  KEY `Voters_ID_IDX` (`Voters_ID`),
  KEY `Voters_RegParty_IDX` (`Voters_RegParty`),
  KEY `Voters_StatusRegParty_IDX` (`Voters_Status`,`Voters_RegParty`),
  KEY `Voters_Status_IDX` (`Voters_Status`),
  KEY `Voters_DataState_IDX` (`DataState_ID`),
  KEY `VotersIndexesID_IDX` (`VotersIndexes_ID`),
  KEY `Voters_DBTables_IDX` (`ElectionsDistricts_DBTable`,`ElectionsDistricts_DBTableValue`),
  KEY `Voters_DataHouseID_IDX` (`DataHouse_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20775836 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `VotersIndexes`
--

DROP TABLE IF EXISTS `VotersIndexes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VotersIndexes` (
  `VotersIndexes_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `DataState_ID` tinyint unsigned DEFAULT NULL,
  `DataLastName_ID` int unsigned DEFAULT NULL,
  `DataFirstName_ID` int unsigned DEFAULT NULL,
  `DataMiddleName_ID` int unsigned DEFAULT NULL,
  `VotersIndexes_Suffix` varchar(10) DEFAULT NULL,
  `VotersIndexes_DOB` date DEFAULT NULL,
  `VotersIndexes_UniqStateVoterID` char(20) DEFAULT NULL,
  PRIMARY KEY (`VotersIndexes_ID`),
  KEY `VotersIndexes_UniqStateVoterID_IDX` (`VotersIndexes_UniqStateVoterID`),
  KEY `VotersIndexes_DataFirstName_IDX` (`DataFirstName_ID`),
  KEY `VotersIndexes_DataMiddleName_IDX` (`DataMiddleName_ID`),
  KEY `VotersIndexes_DataLastName_IDX` (`DataLastName_ID`),
  KEY `VotersIndexes_DOB_IDX` (`VotersIndexes_DOB`)
) ENGINE=InnoDB AUTO_INCREMENT=20774300 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `VotersRaw_NYS`
--

DROP TABLE IF EXISTS `VotersRaw_NYS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VotersRaw_NYS` (
  `NY_Raw_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `LastName` varchar(50) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `MiddleName` varchar(50) DEFAULT NULL,
  `Suffix` varchar(10) DEFAULT NULL,
  `ResHouseNumber` varchar(10) DEFAULT NULL,
  `ResFracAddress` varchar(10) DEFAULT NULL,
  `ResPreStreet` varchar(10) DEFAULT NULL,
  `ResStreetName` varchar(70) DEFAULT NULL,
  `ResPostStDir` varchar(10) DEFAULT NULL,
  `ResType` varchar(10) DEFAULT NULL,
  `ResApartment` varchar(15) DEFAULT NULL,
  `ResNonStdFormat` varchar(250) DEFAULT NULL,
  `ResCity` varchar(50) DEFAULT NULL,
  `ResZip` char(5) DEFAULT NULL,
  `ResZip4` char(4) DEFAULT NULL,
  `ResMail1` varchar(100) DEFAULT NULL,
  `ResMail2` varchar(100) DEFAULT NULL,
  `ResMail3` varchar(100) DEFAULT NULL,
  `ResMail4` varchar(100) DEFAULT NULL,
  `DOB` char(8) DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `EnrollPolParty` char(3) DEFAULT NULL,
  `OtherParty` varchar(30) DEFAULT NULL,
  `CountyCode` char(2) DEFAULT NULL,
  `ElectDistr` char(3) DEFAULT NULL,
  `LegisDistr` char(3) DEFAULT NULL,
  `TownCity` varchar(30) DEFAULT NULL,
  `Ward` char(3) DEFAULT NULL,
  `CongressDistr` char(3) DEFAULT NULL,
  `SenateDistr` char(3) DEFAULT NULL,
  `AssemblyDistr` char(3) DEFAULT NULL,
  `LastDateVoted` char(8) DEFAULT NULL,
  `PrevYearVoted` varchar(4) DEFAULT NULL,
  `PrevCounty` char(2) DEFAULT NULL,
  `PrevAddress` varchar(100) DEFAULT NULL,
  `PrevName` varchar(150) DEFAULT NULL,
  `CountyVoterNumber` varchar(50) DEFAULT NULL,
  `RegistrationCharacter` char(8) DEFAULT NULL,
  `ApplicationSource` varchar(10) DEFAULT NULL,
  `IDRequired` char(1) DEFAULT NULL,
  `IDMet` char(1) DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL,
  `ReasonCode` varchar(15) DEFAULT NULL,
  `VoterMadeInactive` char(8) DEFAULT NULL,
  `VoterPurged` char(8) DEFAULT NULL,
  `UniqNYSVoterID` varchar(50) DEFAULT NULL,
  `VoterHistory` text,
  PRIMARY KEY (`NY_Raw_ID`),
  KEY `NY_Raw_20220305_LastName_IDX` (`LastName`),
  KEY `NY_Raw_20220305_UniqNYSVoterID_IDX` (`UniqNYSVoterID`),
  KEY `NY_Raw_20220305_Voter_CountyCode_IDX` (`CountyCode`),
  KEY `NY_Raw_20220305_Voter_ADED_IDX` (`AssemblyDistr`,`ElectDistr`),
  KEY `NY_Raw_20220305_LastName_DOB_IDX` (`LastName`,`DOB`),
  KEY `NY_Raw_20220305_AD_ED_Party_Status_IDX` (`AssemblyDistr`,`ElectDistr`,`EnrollPolParty`,`Status`),
  KEY `VotersRaw_NY_ElectDistr_IDX` (`ElectDistr`),
  KEY `VotersRaw_NY_ADED_IDX` (`AssemblyDistr`,`ElectDistr`),
  KEY `VotersRaw_NY_LastFisrtName_IDX` (`LastName`,`FirstName`),
  KEY `VotersRaw_NY_ADEDParty_IDX` (`AssemblyDistr`,`ElectDistr`,`EnrollPolParty`),
  KEY `VotersRaw_NY_CountyVoterNumber_IDX` (`CountyVoterNumber`),
  KEY `VotersRaw_NY_SenateDistr_IDX` (`SenateDistr`),
  KEY `VotersRaw_NY_Zipcode_IDX` (`ResZip`),
  KEY `VotersRaw_NY_FisrtName_IDX` (`FirstName`),
  KEY `VotersRaw_StreetName_IDX` (`ResStreetName`)
) ENGINE=InnoDB AUTO_INCREMENT=20938878 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ZDevVerif`
--

DROP TABLE IF EXISTS `ZDevVerif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ZDevVerif` (
  `ZDevVerif_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `ZDevVerif_UserName` varchar(100) DEFAULT NULL,
  `ZDevVerif_Email` varchar(256) DEFAULT NULL,
  `ZDevVerif_HashKey` varchar(100) DEFAULT NULL,
  `ZDevVerif_Received` datetime DEFAULT NULL,
  PRIMARY KEY (`ZDevVerif_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ZeMoviePwd`
--

DROP TABLE IF EXISTS `ZeMoviePwd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ZeMoviePwd` (
  `ZeMoviePwd_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `ZeMoviePwd_Password` char(20) DEFAULT NULL,
  `ZeMoviePwd_from` datetime DEFAULT NULL,
  `ZeMoviePwd_to` datetime DEFAULT NULL,
  PRIMARY KEY (`ZeMoviePwd_ID`),
  KEY `MoviePwd_Times_IDX` (`ZeMoviePwd_from`,`ZeMoviePwd_to`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ZeMovieWtchd`
--

DROP TABLE IF EXISTS `ZeMovieWtchd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ZeMovieWtchd` (
  `ZeMovieWtchd_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `SystemUser_ID` int unsigned DEFAULT NULL,
  `ZeMovieWtchd_FullName` varchar(256) DEFAULT NULL,
  `ZeMovieWtchd_Email` varchar(256) DEFAULT NULL,
  `ZeMovieWtchd_Time` datetime DEFAULT NULL,
  PRIMARY KEY (`ZeMovieWtchd_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-25 12:11:54
