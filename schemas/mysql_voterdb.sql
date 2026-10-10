-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: RepMyBlock
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.24.04.4

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AdminNotif`
--

DROP TABLE IF EXISTS `AdminNotif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AdminNotif` (
  `AdminNotif_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `SystemUser_ID` int unsigned DEFAULT NULL,
  `Team_ID` int unsigned DEFAULT NULL,
  `AdminNotif_PrivA` int unsigned DEFAULT NULL,
  PRIMARY KEY (`AdminNotif_ID`),
  UNIQUE KEY `SystemUser_ID` (`SystemUser_ID`,`Team_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AdminNotifList`
--

DROP TABLE IF EXISTS `AdminNotifList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AdminNotifList` (
  `AdminNotifList_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `AdminNotifList_Priv` char(1) DEFAULT NULL,
  `AdminNotifList_PrivNum` int unsigned DEFAULT NULL,
  `SystemUser_Priv` int unsigned DEFAULT NULL,
  `AdminNotifList_Description` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`AdminNotifList_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BadgeVerif`
--

DROP TABLE IF EXISTS `BadgeVerif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BadgeVerif` (
  `BadgeVerif_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `BadgeVerif_Code` char(20) DEFAULT NULL,
  `BadgeVerif_Reason` varchar(256) DEFAULT NULL,
  `BadgeVerif_Active` enum('yes','no') DEFAULT NULL,
  `BadgeVerif_ActiveFrom` datetime DEFAULT NULL,
  `BadgeVerif_ActiveTo` datetime DEFAULT NULL,
  `BadgeVerif_Picture` mediumblob,
  PRIMARY KEY (`BadgeVerif_ID`),
  KEY `BadgeVerif_Code_IDX` (`BadgeVerif_Code`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
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
  `Candidate_PetitionNameset` varchar(256) DEFAULT NULL,
  `Candidate_UniqStateVoterID` char(20) DEFAULT NULL,
  `DataCounty_ID` int unsigned DEFAULT NULL,
  `Voters_ID` int unsigned DEFAULT NULL,
  `CandidateElection_ID` int unsigned DEFAULT NULL,
  `Candidate_Party` char(3) DEFAULT NULL,
  `Candidate_FullPartyName` varchar(50) DEFAULT NULL,
  `CandidatePartySymbol_ID` int unsigned DEFAULT NULL,
  `Candidate_DisplayMap` varchar(256) DEFAULT NULL,
  `Candidate_DispName` varchar(256) DEFAULT NULL,
  `Candidate_DispResidence` varchar(256) DEFAULT NULL,
  `CandidateElection_DBTable` varchar(256) DEFAULT NULL,
  `CandidateElection_DBTableValue` varchar(256) DEFAULT NULL,
  `DataDistrictTown_ID` int unsigned DEFAULT NULL,
  `Candidate_StatsVoters` int DEFAULT NULL,
  `Candidate_Status` enum('published','pending','verified','nominated','deleted') DEFAULT NULL,
  `Candidate_Watermark` enum('yes','no') DEFAULT 'yes',
  `Candidate_LocalHash` char(32) DEFAULT NULL,
  `Candidate_NominatedBy` int unsigned DEFAULT NULL,
  `Candidate_LastModified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`Candidate_ID`),
  KEY `SystemUser_ID_IDX` (`SystemUser_ID`),
  KEY `Candidate_UniqStateVoterID_IDX` (`Candidate_UniqStateVoterID`),
  KEY `Candidate_Voters_IDX` (`Voters_ID`),
  KEY `CandidateElection_Candidate_ID_IDX` (`CandidateElection_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14962 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
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
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
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
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
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
  `ElectionsPosition_ID` int unsigned DEFAULT NULL,
  `CandidateElection_PositionType` enum('party','electoral','tobedetermined') DEFAULT NULL,
  `CandidateElection_Party` char(3) DEFAULT NULL,
  `CandidateElection_PartisanType` enum('closed','open','mixed','coalition','other') DEFAULT NULL,
  `CandidateElection_Text` varchar(256) DEFAULT NULL,
  `CandidateElection_PetitionText` varchar(256) DEFAULT NULL,
  `CandidateElection_URLExplain` varchar(256) DEFAULT NULL,
  `CandidateElection_Number` smallint DEFAULT '1',
  `CandidateElection_DisplayOrder` smallint DEFAULT NULL,
  `CandidateElection_SignDeadline` datetime DEFAULT NULL,
  `CandidateElection_Display` enum('yes','no') DEFAULT 'no',
  `CandidateElection_Sex` enum('male','female','both') DEFAULT NULL,
  `CandidateElection_DBTable` varchar(256) DEFAULT NULL,
  `CandidateElection_DBTableValue` varchar(256) DEFAULT NULL,
  `CandidateElection_VotingMember` enum('yes','no') DEFAULT NULL,
  `CandidateElection_WeightCoef` int DEFAULT NULL,
  `CandidateElection_PowerOf` tinyint DEFAULT NULL,
  `CandidateElection_CountVoter` int DEFAULT NULL,
  PRIMARY KEY (`CandidateElection_ID`),
  KEY `CandidateElectionElectionsPosition_IDX` (`ElectionsPosition_ID`),
  KEY `CandidateElection_DBTableValue_IDX` (`CandidateElection_DBTableValue`)
) ENGINE=InnoDB AUTO_INCREMENT=19231 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
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
  `CandidateGroup_SlateOrder` tinyint DEFAULT NULL,
  `DataCounty_ID` int unsigned DEFAULT NULL,
  `CandidateGroup_Party` char(3) DEFAULT NULL,
  `CandidateGroup_Watermark` enum('yes','no') DEFAULT 'yes',
  PRIMARY KEY (`CandidateGroup_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CandidateProfile`
--

DROP TABLE IF EXISTS `CandidateProfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CandidateProfile` (
  `CandidateProfile_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `CandidateProfile_CandidateID` int unsigned DEFAULT NULL,
  `CandidateProfile_WriteSysID` int unsigned DEFAULT NULL,
  `CandidateProfile_Quarantine` enum('yes','no') DEFAULT NULL,
  `CandidateProfile_PicFileName` varchar(256) DEFAULT NULL,
  `CandidateProfile_TmpPicFileName` varchar(255) DEFAULT NULL,
  `CandidateProfile_PicVerif` enum('yes','no') DEFAULT NULL,
  `CandidateProfile_PDFFileName` varchar(256) DEFAULT NULL,
  `CandidateProfile_TmpPDFFileName` varchar(255) DEFAULT NULL,
  `CandidateProfile_PDFVerif` enum('yes','no') DEFAULT NULL,
  `CandidateProfile_PDFPetition` char(12) DEFAULT NULL,
  `CandidateProfile_PDFPetitionState` char(2) DEFAULT NULL,
  `Team_ID` int unsigned DEFAULT NULL,
  `CandidateProfile_PolSelfParty` char(3) DEFAULT NULL,
  `CandidateProfile_PolSelfCaucus` tinyint unsigned DEFAULT NULL,
  `CandidateProfile_PolSelfAss` char(3) DEFAULT NULL,
  `CandidateProfile_FirstName` varchar(100) DEFAULT NULL,
  `CandidateProfile_LastName` varchar(100) DEFAULT NULL,
  `CandidateProfile_Alias` varchar(256) DEFAULT NULL,
  `CandidateRegAuthority_ID` int unsigned DEFAULT NULL,
  `CandidateProfile_RegID` varchar(40) DEFAULT NULL,
  `DataConference_ID` int unsigned DEFAULT NULL,
  `CandidateProfile_Website` varchar(256) DEFAULT NULL,
  `CandidateProfile_Email` varchar(256) DEFAULT NULL,
  `CandidateProfile_SocialImgPath` varchar(15) DEFAULT NULL,
  `CandidateProfile_Twitter` varchar(256) DEFAULT NULL,
  `CandidateProfile_BlueSky` varchar(256) DEFAULT NULL,
  `CandidateProfile_Truth` varchar(256) DEFAULT NULL,
  `CandidateProfile_Facebook` varchar(256) DEFAULT NULL,
  `CandidateProfile_LinkedIn` varchar(256) DEFAULT NULL,
  `CandidateProfile_Instagram` varchar(256) DEFAULT NULL,
  `CandidateProfile_TikTok` varchar(256) DEFAULT NULL,
  `CandidateProfile_YouTube` varchar(256) DEFAULT NULL,
  `CandidateProfile_BallotPedia` varchar(256) DEFAULT NULL,
  `CandidateProfile_PhoneNumber` varchar(30) DEFAULT NULL,
  `CandidateProfile_FaxNumber` varchar(30) DEFAULT NULL,
  `CandidateProfile_Statement` text,
  `CandidateProfile_Donation` varchar(255) DEFAULT NULL,
  `CandidateProfile_PublishPetition` enum('yes','no') DEFAULT 'no',
  `CandidateProfile_Complain` enum('yes','no') DEFAULT NULL,
  `CandidateProfile_LastModified` date DEFAULT NULL,
  PRIMARY KEY (`CandidateProfile_ID`),
  FULLTEXT KEY `CandidateProfile_Alias_FT` (`CandidateProfile_Alias`)
) ENGINE=InnoDB AUTO_INCREMENT=12433 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CandidateRegAuthority`
--

DROP TABLE IF EXISTS `CandidateRegAuthority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CandidateRegAuthority` (
  `CandidateRegAuthority_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `CandidateRegAuthority_Name` varchar(256) DEFAULT NULL,
  `CandidateRegAuthority_Abbrev` varchar(40) DEFAULT NULL,
  `DataState_ID` int unsigned DEFAULT NULL,
  `DataCounty_ID` int unsigned DEFAULT NULL,
  `DataCity_ID` int unsigned DEFAULT NULL,
  `CandidateRegAuthority_WebSite` varchar(256) DEFAULT NULL,
  `CandidateRegAuthority_Query` varchar(256) DEFAULT NULL,
  `CandidateRegAuthority_QueryPost` varchar(256) DEFAULT NULL,
  `CandidateRegAuthority_API` varchar(256) DEFAULT NULL,
  `CandidateRegAuthority_Status` enum('federal','state','county','city','other') DEFAULT NULL,
  PRIMARY KEY (`CandidateRegAuthority_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
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
  `CandidateSet_Random` char(12) DEFAULT NULL,
  `CandidateSet_TimeStamp` datetime DEFAULT NULL,
  PRIMARY KEY (`CandidateSet_ID`),
  KEY `CandidateSet_Random_IDX` (`CandidateSet_Random`)
) ENGINE=InnoDB AUTO_INCREMENT=415 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
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
  `DataCounty_ID` int unsigned DEFAULT NULL,
  `DataAddress_zipcode` varchar(30) DEFAULT NULL,
  `DataAddress_zip4` varchar(10) DEFAULT NULL,
  `Cordinate_ID` int unsigned DEFAULT NULL,
  `PG_OSM_osmid` bigint DEFAULT NULL,
  PRIMARY KEY (`DataAddress_ID`),
  KEY `DataAddressAll_IDX` (`DataAddress_HouseNumber`,`DataAddress_FracAddress`,`DataAddress_PreStreet`,`DataStreet_ID`,`DataAddress_PostStreet`,`DataCity_ID`,`DataAddress_zipcode`,`DataAddress_zip4`),
  KEY `DataAddressZipcodes_IDX` (`DataAddress_zipcode`),
  KEY `DataAddressMost` (`DataAddress_HouseNumber`,`DataAddress_FracAddress`,`DataAddress_PreStreet`,`DataStreet_ID`,`DataAddress_PostStreet`,`DataCity_ID`,`DataAddress_zipcode`),
  KEY `DataAddressCordinate_IDX` (`Cordinate_ID`),
  KEY `DataAddress_ID_IDX` (`DataAddress_ID`),
  KEY `DataAddress_DataStreet_IDX` (`DataStreet_ID`),
  KEY `DataAddress_City_IDX` (`DataCity_ID`),
  KEY `DataAddress_DataCounty_IDX` (`DataCounty_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7571577 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
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
) ENGINE=InnoDB AUTO_INCREMENT=4946 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DataClub`
--

DROP TABLE IF EXISTS `DataClub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DataClub` (
  `DataClub_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `State_ID` int unsigned DEFAULT NULL,
  `DataCounty_ID` int unsigned DEFAULT NULL,
  `DataParty_ID` int unsigned DEFAULT NULL,
  `DataClub_Name` varchar(256) DEFAULT NULL,
  `DataClub_Web` varchar(256) DEFAULT NULL,
  `DataClub_Email` varchar(256) DEFAULT NULL,
  `DataClub_enum` enum('party','club') DEFAULT NULL,
  `DataClub_LastVerified` datetime DEFAULT NULL,
  PRIMARY KEY (`DataClub_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DataConference`
--

DROP TABLE IF EXISTS `DataConference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DataConference` (
  `DataConference_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `DataConference_Name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataConference_Abbrev` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataConference_Web` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataConference_LogoPath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataConference_Left_ID` int unsigned DEFAULT NULL,
  `DataConference_Right_ID` int unsigned DEFAULT NULL,
  `CandidateElection_DBTable` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataInter_ID` int unsigned DEFAULT NULL,
  `DataConference_ValidFrom` datetime DEFAULT NULL,
  `DataConference_ValidTo` datetime DEFAULT NULL,
  PRIMARY KEY (`DataConference_ID`),
  KEY `DataConference_CandidateElection_DBTableIDX` (`CandidateElection_DBTable`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
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
  `DataCounty_GEOID` mediumint unsigned DEFAULT NULL,
  PRIMARY KEY (`DataCounty_ID`),
  KEY `DataCounty_BOEID_IDX` (`DataCounty_BOEID`)
) ENGINE=InnoDB AUTO_INCREMENT=3099 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DataDistrict`
--

DROP TABLE IF EXISTS `DataDistrict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DataDistrict` (
  `DataDistrict_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `DataDistrict_ZipCode` char(5) DEFAULT NULL,
  `DataDistrict_DBTable` varchar(100) DEFAULT NULL,
  `DataDistrict_DBTableValue` varchar(100) DEFAULT NULL,
  `DataCounty_ID` int unsigned DEFAULT NULL,
  `DataDistrictTown_ID` int unsigned DEFAULT NULL,
  `DataDistrict_Electoral` smallint unsigned DEFAULT NULL,
  `DataDistrict_StateAssembly` smallint unsigned DEFAULT NULL,
  `DataDistrict_StateSenate` tinyint unsigned DEFAULT NULL,
  `DataDistrict_Legislative` smallint unsigned DEFAULT NULL,
  `DataDistrict_Ward` char(3) DEFAULT NULL,
  `DataDistrict_Congress` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`DataDistrict_ID`),
  KEY `DataDistrict_DataCountyID_IDX` (`DataCounty_ID`),
  KEY `DataDistrict_StateAssembly_IDX` (`DataDistrict_StateAssembly`),
  KEY `DataDistrict_StateSenate_IDX` (`DataDistrict_StateSenate`),
  KEY `DataDistrict_Congress_IDX` (`DataDistrict_Congress`),
  KEY `DataDistrict_Town_IDX` (`DataDistrictTown_ID`),
  KEY `DataDistrict_Legislative_IDX` (`DataDistrict_Legislative`),
  KEY `DataDistrict_Ward_IDX` (`DataDistrict_Ward`),
  KEY `DataDistrict_Electoral_IDX` (`DataDistrict_Electoral`),
  KEY `DataDistrict_Electoral_StateAssembly_IDX` (`DataDistrict_Electoral`,`DataDistrict_StateAssembly`),
  KEY `ElectResultCandidate_DataDistrict_IDX` (`DataDistrict_ID`),
  KEY `DataDistrict_ZipCode_IDX` (`DataDistrict_ZipCode`),
  KEY `DataDistrict_DBTable_IDX` (`DataDistrict_DBTable`),
  KEY `DataDistrict_DBTableValue_IDX` (`DataDistrict_DBTableValue`)
) ENGINE=InnoDB AUTO_INCREMENT=131779 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
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
  `DataHouse_ID` int unsigned DEFAULT NULL,
  `DataDistrict_ID` int unsigned DEFAULT NULL,
  PRIMARY KEY (`DataDistrictTemporal_ID`),
  KEY `DataDistrictTemporal_DataDistrictCycle_IDX` (`DataDistrictCycle_ID`),
  KEY `DataDistrictTemporal_GroupIDCycle_IDX` (`DataDistrictCycle_ID`),
  KEY `DataDistrict_ID_IDX` (`DataDistrict_ID`),
  KEY `DataDistrictTemporal_DataHouse_IDX` (`DataHouse_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21404111 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
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
) ENGINE=InnoDB AUTO_INCREMENT=1691 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=777193 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
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
  `DataHouse_Type` varchar(10) DEFAULT NULL,
  `DataHouse_Apt` varchar(100) DEFAULT NULL,
  `DataStreetNonStdFormat_ID` int unsigned DEFAULT NULL,
  `DataHouse_BIN` int unsigned DEFAULT NULL,
  PRIMARY KEY (`DataHouse_ID`),
  KEY `DataHouseDataAddress_IDX` (`DataAddress_ID`),
  KEY `DataHouseDataAddressApt_IDX` (`DataAddress_ID`,`DataHouse_Apt`),
  KEY `DataHouse_BIN_IDX` (`DataHouse_BIN`)
) ENGINE=InnoDB AUTO_INCREMENT=14492860 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DataInter`
--

DROP TABLE IF EXISTS `DataInter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DataInter` (
  `DataInter_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `DataInter_Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataInter_Abbrev` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataInter_Web` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataInter_LogoPath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataInter_Left_ID` int unsigned DEFAULT NULL,
  `DataInter_Right_ID` int unsigned DEFAULT NULL,
  `DataInter_DBTable` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataInter_ValidFrom` datetime DEFAULT NULL,
  `DataInter_ValidTo` datetime DEFAULT NULL,
  PRIMARY KEY (`DataInter_ID`),
  KEY `DataInter_DataInter_Name_IDX` (`DataInter_Name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=2713739 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DataMailingAddress`
--

DROP TABLE IF EXISTS `DataMailingAddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DataMailingAddress` (
  `DataMailingAddress_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `DataMailingAddress_Line1` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataMailingAddress_Line2` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataMailingAddress_Line3` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataMailingAddress_Line4` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`DataMailingAddress_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1959977 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
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
) ENGINE=InnoDB AUTO_INCREMENT=214330 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DataPAC`
--

DROP TABLE IF EXISTS `DataPAC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DataPAC` (
  `DataPAC_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `DataPAC_Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataPAC_Web` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataPAC_LogoPath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataPAC_EuropeanModel` enum('right','left') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataPAC_AmericanModel` enum('right','left') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataPAC_Type` enum('pac','caucus','party','other') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataPAC_Official` enum('yes','no','adhoc') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`DataPAC_ID`),
  KEY `DataPAC_Name_IDX` (`DataPAC_Name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DataPACCandidate`
--

DROP TABLE IF EXISTS `DataPACCandidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DataPACCandidate` (
  `DataPACCandidate_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `CandidateProfile_ID` int unsigned DEFAULT NULL,
  `DataPAC_ID` int unsigned DEFAULT NULL,
  PRIMARY KEY (`DataPACCandidate_ID`),
  KEY `DataPACCandidate_CandidateProfile_ID_IDX` (`CandidateProfile_ID`),
  KEY `DataPACCandidate_DataPAC_ID_IDX` (`DataPAC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DataPartyPAC`
--

DROP TABLE IF EXISTS `DataPartyPAC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DataPartyPAC` (
  `DataPartyPAC_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `DataPAC_ID` int unsigned DEFAULT NULL,
  `DataParty_ID` int unsigned DEFAULT NULL,
  `DataPartyPAC_ValidFrom` date DEFAULT NULL,
  `DataPartyPAC_ValidTo` date DEFAULT NULL,
  PRIMARY KEY (`DataPartyPAC_ID`),
  KEY `DataPartyPac_DataPAC_ID_IDX` (`DataPAC_ID`),
  KEY `DataPartyPac_DataParty_ID_IDX` (`DataParty_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `DataState_Country` char(2) DEFAULT NULL,
  PRIMARY KEY (`DataState_ID`),
  UNIQUE KEY `DataState_Name` (`DataState_Name`),
  KEY `DataStateName_IDX` (`DataState_Name`),
  KEY `DataState_Abbrev_IDX` (`DataState_Abbrev`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=119361 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DataStreetNonStdFormat`
--

DROP TABLE IF EXISTS `DataStreetNonStdFormat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DataStreetNonStdFormat` (
  `DataStreetNonStdFormat_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `DataStreetNonStdFormat_Text` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`DataStreetNonStdFormat_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26218 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ElectResultCandidate`
--

DROP TABLE IF EXISTS `ElectResultCandidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ElectResultCandidate` (
  `ElectResultCandidate_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `ElectResult_ID` int unsigned DEFAULT NULL,
  `CandidateProfile_ID` int unsigned DEFAULT NULL,
  `CandidateElection_ID` int unsigned DEFAULT NULL,
  `ElectResultCandidate_Count` smallint unsigned DEFAULT NULL,
  `ElectResultCandidate_Elected` enum('yes','no','pending') DEFAULT NULL,
  `ElectResultCandidate_InOffice` enum('yes','no') DEFAULT NULL,
  PRIMARY KEY (`ElectResultCandidate_ID`),
  KEY `ElectResultCandidate_ElectResult_ID_IDX` (`ElectResult_ID`),
  KEY `ElectResultCandidate_CandidateProfile_ID_IDX` (`CandidateProfile_ID`),
  KEY `ElectResultCandidate_CandidateElection_ID_IDX` (`CandidateElection_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=504 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
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
  `Elections_Type` enum('primary','general','special','runoff','other','toverify') DEFAULT NULL,
  PRIMARY KEY (`Elections_ID`),
  KEY `Elections_ID_IDX` (`Elections_Text`),
  KEY `Elections_DateState_IDX` (`Elections_Date`,`DataState_ID`),
  KEY `Elections_DataState_IDX` (`DataState_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1599 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
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
  `ElectionsPosition_ID` int unsigned DEFAULT NULL,
  `DataCounty_ID` int unsigned DEFAULT NULL,
  `ElectionsPartyCall_DBTable` varchar(256) DEFAULT NULL,
  `ElectionsPartyCall_DBTableValue` varchar(256) DEFAULT NULL,
  `ElectionsPartyCall_ConversionValue` varchar(256) DEFAULT NULL,
  `ElectionsPartyCall_SignDeadline` datetime DEFAULT NULL,
  `ElectionsPartyCall_TotalNumberCandidates` int unsigned DEFAULT NULL,
  `ElectionsPartyCall_NumberFemale` int unsigned DEFAULT NULL,
  `Elections_ID_Female` int unsigned DEFAULT NULL,
  `ElectionsPartyCall_NumberMale` int unsigned DEFAULT NULL,
  `Elections_ID_Male` int unsigned DEFAULT NULL,
  `ElectionsPartyCall_NumberUnixSex` int unsigned DEFAULT NULL,
  `Elections_ID_Unisex` int unsigned DEFAULT NULL,
  PRIMARY KEY (`ElectionsPartyCall_ID`),
  KEY `ElectionsPartyCall_ElectionsPartyCall_DBTable_IDX` (`ElectionsPartyCall_DBTable`),
  KEY `ElectionsPartyCall_ElectionsPartyCall_DBTableValue_IDX` (`ElectionsPartyCall_DBTableValue`),
  KEY `ElectionsPartyCall_ElectionsPartyCall_ConversionValue_IDX` (`ElectionsPartyCall_ConversionValue`),
  KEY `ElectionsPartyCall_DataCounty_ID_IDX` (`DataCounty_ID`),
  KEY `ElectionsPartyCall_ElectionsID_IDX` (`Elections_ID`),
  KEY `ElectionsPartyCall_ElectionsPartyCall_Party_IDX` (`ElectionsPartyCall_Party`),
  KEY `ElectionsPartyCall_ElectionsPositionID_IDX` (`ElectionsPosition_ID`),
  KEY `ElectionsPartyCall_SignDeadline_IDX` (`ElectionsPartyCall_SignDeadline`)
) ENGINE=InnoDB AUTO_INCREMENT=22119 DEFAULT CHARSET=latin1;
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
  `ElectionsPosition_Type` enum('party','office','corporate') DEFAULT NULL,
  `ElectionsPosition_Name` varchar(100) DEFAULT NULL,
  `ElectionsPosition_Party` char(3) DEFAULT NULL,
  `ElectionsPosition_Order` int unsigned DEFAULT NULL,
  `ElectionsPosition_Location` enum('table','partycall','state','other') DEFAULT NULL,
  `ElectionsPosition_DBTableName` varchar(256) DEFAULT NULL,
  `ElectionsPosition_Explanation` text,
  PRIMARY KEY (`ElectionsPosition_ID`),
  KEY `ElectionsPosition_DataState_IDX` (`DataState_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=859 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FillingDoc`
--

DROP TABLE IF EXISTS `FillingDoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FillingDoc` (
  `FillingDoc_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `FillingDoc_Type` varchar(100) DEFAULT NULL,
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
  KEY `FillingDoc_ID_IDX` (`FillingDoc_ID`),
  KEY `FillingDoc_Type_IDX` (`FillingDoc_Type`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FillingObjections`
--

DROP TABLE IF EXISTS `FillingObjections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FillingObjections` (
  `FillingObjections_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `County_ID` int unsigned DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Objections`
--

DROP TABLE IF EXISTS `Objections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Objections` (
  `Objections_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `SystemUser_ID` int unsigned DEFAULT NULL,
  `Team_ID` int unsigned DEFAULT NULL,
  `Candidate_ID` int unsigned DEFAULT NULL,
  `Slate_ID` int unsigned DEFAULT NULL,
  `Objections_VolumeID` varchar(256) DEFAULT NULL,
  `Objections_SheetsNumber` smallint unsigned DEFAULT NULL,
  `Objections_Created` datetime DEFAULT NULL,
  PRIMARY KEY (`Objections_ID`),
  KEY `Objections_VolumeID_IDX` (`Objections_VolumeID`),
  KEY `Slate_ID_IDX` (`Slate_ID`),
  KEY `SystemUser_IDX` (`SystemUser_ID`),
  KEY `Candidate_ID_IDX` (`Candidate_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ObjectionsDetails`
--

DROP TABLE IF EXISTS `ObjectionsDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ObjectionsDetails` (
  `ObjectionsDetails_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Objections_ID` int unsigned DEFAULT NULL,
  `Voter_ID` int unsigned DEFAULT NULL,
  `Voters_UniqStateVoterID` varchar(50) DEFAULT NULL,
  `ObjectionsDetails_Sheet` smallint unsigned DEFAULT NULL,
  `ObjectionsDetails_Line` tinyint unsigned DEFAULT NULL,
  `ObjectionsDetails_Specs` varchar(255) DEFAULT NULL,
  `ObjectionsDetails_Date` date DEFAULT NULL,
  `ObjectionsDetails_Name` varchar(256) DEFAULT NULL,
  `ObjectionsDetails_Signature` varchar(256) DEFAULT NULL,
  `OjectionssDetails_ResidenceLine1` varchar(256) DEFAULT NULL,
  `OjectionssDetails_ResidenceLine2` varchar(256) DEFAULT NULL,
  `OjectionssDetails_County` varchar(256) DEFAULT NULL,
  `ObjectionsDetails_EntryBySystemID` int unsigned DEFAULT NULL,
  PRIMARY KEY (`ObjectionsDetails_ID`),
  KEY `Objections_ID_IDX` (`Objections_ID`),
  KEY `Voter_ID_IDX` (`Voter_ID`),
  KEY `Voters_UniqStateVoterID_IDX` (`Voters_UniqStateVoterID`),
  KEY `ObjectionsDetails_Name_IDX` (`ObjectionsDetails_Name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `OpenAddresses`
--

DROP TABLE IF EXISTS `OpenAddresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OpenAddresses` (
  `OpenAddresses_ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `OpenAddresses_Lon` decimal(10,7) DEFAULT NULL,
  `OpenAddresses_Lat` decimal(10,7) DEFAULT NULL,
  `OpenAddresses_Number` varchar(50) DEFAULT NULL,
  `OpenAddresses_Street` varchar(255) DEFAULT NULL,
  `OpenAddresses_Unit` varchar(100) DEFAULT NULL,
  `OpenAddresses_City` varchar(150) DEFAULT NULL,
  `OpenAddresses_District` varchar(150) DEFAULT NULL,
  `OpenAddresses_Region` varchar(50) DEFAULT NULL,
  `OpenAddresses_Postcode` varchar(20) DEFAULT NULL,
  `OpenAddresses_OA_ID` varchar(100) DEFAULT NULL,
  `OpenAddresses_OA_hash` varchar(100) DEFAULT NULL,
  `OpenAddresses_FullAddress` varchar(600) GENERATED ALWAYS AS (trim(concat_ws(_utf8mb4' ',`OpenAddresses_Number`,`OpenAddresses_Street`,`OpenAddresses_Unit`,`OpenAddresses_City`,`OpenAddresses_Region`,`OpenAddresses_Postcode`))) STORED,
  PRIMARY KEY (`OpenAddresses_ID`),
  KEY `OpenAddresses_Postcode_IDX` (`OpenAddresses_Postcode`),
  KEY `OpenAddresses_City_Street_IDX` (`OpenAddresses_City`,`OpenAddresses_Street`),
  KEY `OpenAddresses_Region_IDX` (`OpenAddresses_Region`),
  FULLTEXT KEY `OpenAddresses_FTAddress_IDX` (`OpenAddresses_FullAddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PublicProfile`
--

DROP TABLE IF EXISTS `PublicProfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PublicProfile` (
  `PublicProfile_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `CandidateProfile_ID` int unsigned DEFAULT NULL,
  `Candidate_ID` int unsigned DEFAULT NULL,
  `PublicProfile_NotOnBallot` enum('yes','no') DEFAULT NULL,
  `PublicProfile_Elected` enum('yes','no') DEFAULT NULL,
  `PublicProfile_PublishProfile` enum('yes','no') DEFAULT 'no',
  `PublicProfile_LastModified` datetime DEFAULT NULL,
  PRIMARY KEY (`PublicProfile_ID`),
  KEY `CandidateProfile_Candidate_ID_IDX` (`Candidate_ID`),
  KEY `CandidateProfile_ID_IDX` (`CandidateProfile_ID`),
  KEY `PublicProfile_PublicProfile_IDX` (`PublicProfile_PublishProfile`)
) ENGINE=InnoDB AUTO_INCREMENT=12156 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PublicTeam`
--

DROP TABLE IF EXISTS `PublicTeam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PublicTeam` (
  `PublicTeam_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Team_ID` int unsigned DEFAULT NULL,
  `PublicProfile_ID` int unsigned NOT NULL,
  PRIMARY KEY (`PublicTeam_ID`),
  KEY `PublicTeam_Team_ID_IDX` (`Team_ID`),
  KEY `PublicTeam_PublicProfile_ID_IDX` (`PublicProfile_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SearchCandidates`
--

DROP TABLE IF EXISTS `SearchCandidates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SearchCandidates` (
  `SearchCandidates_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Candidate_ID` int unsigned NOT NULL,
  `PublicProfile_ID` int unsigned DEFAULT NULL,
  `SearchCandidates_Name` varchar(512) NOT NULL,
  `SearchCandidates_NameClean` varchar(512) NOT NULL,
  PRIMARY KEY (`SearchCandidates_ID`),
  KEY `SearchCandidates_Candidate_ID_IDX` (`Candidate_ID`),
  KEY `SearchCandidates_PublicProfile_ID_IDX` (`PublicProfile_ID`),
  FULLTEXT KEY `SearchCandidates_NameClean_FT` (`SearchCandidates_NameClean`)
) ENGINE=InnoDB AUTO_INCREMENT=12146 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SurveyPresDelInfo`
--

DROP TABLE IF EXISTS `SurveyPresDelInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SurveyPresDelInfo` (
  `SurveyPresDelInfo_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Candidate_ID` int unsigned NOT NULL,
  `SurveyPresDelInfo_StateName` varchar(256) DEFAULT NULL,
  `SurveyPresDelInfo_StateCode` char(2) DEFAULT NULL,
  `SurveyPresDelInfo_Party` char(4) DEFAULT NULL,
  `SurveyPresDelInfo_TotalDelegate` smallint unsigned DEFAULT NULL,
  `SurveyPresDelInfo_DraftCandidateTotal` smallint unsigned DEFAULT NULL,
  `SurveyPresDelInfo_LastDaySwitchParty` date DEFAULT NULL,
  PRIMARY KEY (`SurveyPresDelInfo_ID`),
  KEY `SurveyPresDelInfo_PartyCandidate_IDX` (`SurveyPresDelInfo_Party`,`Candidate_ID`),
  KEY `SurveyPresDelInfo_Candidate_IDX` (`Candidate_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=latin1 KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SurveyPresDocuments`
--

DROP TABLE IF EXISTS `SurveyPresDocuments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SurveyPresDocuments` (
  `SurveyPresDocuments_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `SurveyPresDocuments_Party` char(3) DEFAULT NULL,
  `SurveyPresDocuments_StateCode` char(2) DEFAULT NULL,
  `SurveyPresDocuments_RMBURL` varchar(256) DEFAULT NULL,
  `SurveyPresDocuments_PartyURL` varchar(256) DEFAULT NULL,
  `SurveyPresDocuments_TotalSigs` smallint unsigned DEFAULT NULL,
  PRIMARY KEY (`SurveyPresDocuments_ID`),
  KEY `SurveyPresDocuments_PartyCandidate_IDX` (`SurveyPresDocuments_Party`,`SurveyPresDocuments_StateCode`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1 KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SurveyPresUser`
--

DROP TABLE IF EXISTS `SurveyPresUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SurveyPresUser` (
  `SurveyPresUser_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `SurveyPresUser_RandomKey` char(12) DEFAULT NULL,
  `Candidate_ID` int unsigned DEFAULT NULL,
  `SurveyPresUser_State` char(3) DEFAULT NULL,
  `SurveyPresUser_FirstName` varchar(100) DEFAULT NULL,
  `SurveyPresUser_LastName` varchar(100) DEFAULT NULL,
  `SurveyPresUser_County` varchar(100) DEFAULT NULL,
  `SurveyPresUser_ZipCode` varchar(50) DEFAULT NULL,
  `SurveyPresUser_PartisanPartyCounty` enum('yes','no') DEFAULT NULL,
  `SurveyPresUser_PartisanClubMember` enum('yes','no') DEFAULT NULL,
  `SurveyPresUser_PartisanRanForOffice` enum('yes','no') DEFAULT NULL,
  `SurveyPresUser_PartisanElectedToOffice` enum('yes','no') DEFAULT NULL,
  `SurveyPresUser_PartisanNever` enum('yes','no') DEFAULT NULL,
  `SurveyPresUser_DelegateStatusCandDelegate` enum('yes','no') DEFAULT NULL,
  `SurveyPresUser_DelegateStatusWouldloveToBe` enum('yes','no') DEFAULT NULL,
  `SurveyPresUser_DelegateStatusVolunteerFor` enum('yes','no') DEFAULT NULL,
  `SurveyPresUser_DelegateStatusTimeToRead` enum('yes','no') DEFAULT NULL,
  `SurveyPresUser_DelegateStatusWasDelegate` enum('yes','no') DEFAULT NULL,
  `SurveyPresUser_AffirmativeAfricanAmerican` enum('yes','no') DEFAULT NULL,
  `SurveyPresUser_AffirmativeHispanic` enum('yes','no') DEFAULT NULL,
  `SurveyPresUser_AffirmativeAsianPacific` enum('yes','no') DEFAULT NULL,
  `SurveyPresUser_AffirmativeNativeAmerican` enum('yes','no') DEFAULT NULL,
  `SurveyPresUser_AffirmativeDisability` enum('yes','no') DEFAULT NULL,
  `SurveyPresUser_AffirmativeLGBT` enum('yes','no') DEFAULT NULL,
  `SurveyPresUser_AffirmativeYouth` enum('yes','no') DEFAULT NULL,
  `SurveyPresUser_Age` tinyint unsigned DEFAULT NULL,
  `SurveyPresUser_IP` varchar(40) DEFAULT NULL,
  `SurveyPresUser_DateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`SurveyPresUser_ID`),
  KEY `SurveyPresUser_RandomKey_IDX` (`SurveyPresUser_RandomKey`)
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=latin1 KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SystemAPI`
--

DROP TABLE IF EXISTS `SystemAPI`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SystemAPI` (
  `SystemAPI_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Candidate_ID` int unsigned DEFAULT NULL,
  `SystemAPI_Txt` varchar(256) DEFAULT NULL,
  `SystemUser_createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`SystemAPI_ID`),
  KEY `SystemAPI_Txt_IDX` (`SystemAPI_Txt`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `SystemUser_StateAbbrev` char(2) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
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
  `SystemUserEmail_RefMailCode` char(10) DEFAULT NULL,
  `SystemUserEmail_WebCode` varchar(20) DEFAULT NULL,
  `SystemUserEmail_Concluded` enum('yes','no') DEFAULT NULL,
  `SystemUser_ID` int unsigned DEFAULT NULL,
  `SystemUserEmail_Received` datetime DEFAULT NULL,
  PRIMARY KEY (`SystemUserEmail_ID`),
  KEY `SystemUserEmail_AddTo_IDX` (`SystemUserEmail_AddTo`),
  KEY `SystemUserEmail_MailCode_IDX` (`SystemUserEmail_MailCode`),
  KEY `SystemUserEmail_RefMailCode_IDX` (`SystemUserEmail_Reason`),
  KEY `SystemUserEmail_WebCode_IDX` (`SystemUserEmail_WebCode`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
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
  `SystemUserQuery_Contact` varchar(255) DEFAULT NULL,
  `SystemUserQuery_BrandingGroup` varchar(100) DEFAULT NULL,
  `SystemUserQuery_UniqNYSVoterID` char(20) DEFAULT NULL,
  `SystemUserQuery_IP` varchar(100) DEFAULT NULL,
  `SystemUserQuery_Date` datetime DEFAULT NULL,
  PRIMARY KEY (`SystemUserQuery_ID`),
  KEY `SystemUserQuery_BrandingGroup_IDX` (`SystemUserQuery_BrandingGroup`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=latin1;
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
  PRIMARY KEY (`SystemUserSelfDistrict_ID`),
  KEY `SystemUserSelfDistrict_SystemUser_IDX` (`SystemUser_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SystemUserTeamPending`
--

DROP TABLE IF EXISTS `SystemUserTeamPending`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SystemUserTeamPending` (
  `SystemUserTeamPending_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `SystemUserTeamPending_email` varchar(256) DEFAULT NULL,
  `Team_ID` int unsigned DEFAULT NULL,
  `SystemUserTeamPending_FullAdmin` enum('yes','no') DEFAULT 'no',
  `SystemUserTeamPending_AdminCode` int unsigned DEFAULT NULL,
  `SystemUserTeamPending_Valid` enum('yes','no') DEFAULT 'no',
  `SystemUserTeamPending_GivenSysUsr` int unsigned NOT NULL,
  `SystemUserTeamPending_Given` datetime DEFAULT NULL,
  `SystemUserTeamPending_RvkSysUsr` int unsigned DEFAULT NULL,
  `SystemUserTeamPending_Rvk` datetime DEFAULT NULL,
  `SystemUserTeamPending_Tampon` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`SystemUserTeamPending_ID`),
  KEY `SystemUserTeamPending_email_IDX` (`SystemUserTeamPending_email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=293 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SystemUserTemporaryLastLogin`
--

DROP TABLE IF EXISTS `SystemUserTemporaryLastLogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SystemUserTemporaryLastLogin` (
  `SystemUserTemporary_ID` int unsigned DEFAULT NULL,
  `SystemUserTemporaryLastLogin` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `TeamNGO_ID` int unsigned DEFAULT NULL,
  `Team_Name` varchar(256) DEFAULT NULL,
  `Team_AccessCode` varchar(256) DEFAULT NULL,
  `Team_WebCode` varchar(20) DEFAULT NULL,
  `Team_EmailCode` varchar(255) DEFAULT NULL,
  `ElectionsPosition_ID` int unsigned DEFAULT NULL,
  `Team_URLRedirect` varchar(100) DEFAULT NULL,
  `Team_Active` enum('yes','no') DEFAULT NULL,
  `Team_Public` enum('public','private') DEFAULT NULL,
  `Team_Created` datetime DEFAULT NULL,
  PRIMARY KEY (`Team_ID`),
  KEY `Team_AccessCode_IDX` (`Team_AccessCode`),
  KEY `Team_Webcode_IDX` (`Team_WebCode`),
  KEY `Team_EmailCode_IDX` (`Team_EmailCode`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `TeamMember_Active` enum('yes','no','pending','declined','banned','requested','refused','other') DEFAULT NULL,
  `TeamMember_Privs` int unsigned DEFAULT NULL,
  `TeamMember_ApprovedBy` int unsigned DEFAULT NULL,
  `TeamMember_ApprovedNote` varchar(256) DEFAULT NULL,
  `TeamMember_ApprovedDate` datetime DEFAULT NULL,
  `TeamMember_RemovedBy` int unsigned DEFAULT NULL,
  `TeamMember_RemovedNote` varchar(256) DEFAULT NULL,
  `TeamMember_RemovedDate` datetime DEFAULT NULL,
  `TeamMember_DateRequest` datetime DEFAULT NULL,
  PRIMARY KEY (`TeamMember_ID`),
  KEY `TeamMember_SysTeam_IDX` (`SystemUser_ID`,`Team_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TeamMemberAssign`
--

DROP TABLE IF EXISTS `TeamMemberAssign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TeamMemberAssign` (
  `TeamMemberAssign_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `SystemUser_ID` int unsigned DEFAULT NULL,
  `Team_ID` int unsigned DEFAULT NULL,
  `TeamMemberAssign_Email` int unsigned DEFAULT NULL,
  `TeamMemberAssign_Used` enum('yes','no','pending','declined') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TeamMemberAssign_Privs` int unsigned DEFAULT NULL,
  `TeamMemberAssign_Added` datetime DEFAULT NULL,
  `TeamMemberAssign_Claimed` datetime DEFAULT NULL,
  `TeamMemberAssign_RemovedDate` datetime DEFAULT NULL,
  `TeamMemberAssign_RemovedBy` int unsigned DEFAULT NULL,
  `TeamMemberAssign_RemovedNote` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`TeamMemberAssign_ID`),
  KEY `TeamMemberAssign_Email_IDX` (`TeamMemberAssign_Email`),
  KEY `TeamMemberAssign_Team_ID_IDX` (`Team_ID`),
  KEY `TeamMemberAssign_SystemUser_ID_IDX` (`SystemUser_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TeamNGO`
--

DROP TABLE IF EXISTS `TeamNGO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TeamNGO` (
  `TeamNGO_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `TeamNGO_Name` varchar(256) DEFAULT NULL,
  `TeamNGO_TaxType` varchar(256) DEFAULT NULL,
  `TeamNGO_GovID` varchar(256) DEFAULT NULL,
  `TeamNGO_Website` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`TeamNGO_ID`),
  KEY `TeamNGO_Name_IDX` (`TeamNGO_Name`),
  KEY `TeamNGO_TaxType_IDX` (`TeamNGO_TaxType`),
  KEY `TeamNGO_GovID_IDX` (`TeamNGO_GovID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TeamNGOEnd`
--

DROP TABLE IF EXISTS `TeamNGOEnd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TeamNGOEnd` (
  `TeamNGOEnd_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `TeamNGO_ID` int unsigned DEFAULT NULL,
  `TeamNGOEnd_Major` enum('major','minor','local','support','other') DEFAULT NULL,
  `DataInter_ID` int unsigned DEFAULT NULL,
  `TeamNGOEnd_Type` enum('none','single','multiple') DEFAULT NULL,
  `TeamNGOEnd_Method` enum('number','letter') DEFAULT NULL,
  `TeamNGOEnd_Star` tinyint DEFAULT NULL,
  `TeamNGOEnd_End` tinyint DEFAULT NULL,
  `TeamNGOEnd_LetterSigned` enum('yes','no') DEFAULT NULL,
  `TeamNGOEnd_NumberPercent` enum('yes','no') DEFAULT NULL,
  `TeamNGOEnd_ContactIn` enum('yes','no') DEFAULT NULL,
  `TeamNGOEnd_ContactOut` enum('yes','no') DEFAULT NULL,
  `TeamNGOEnd_QuestionairePath` varchar(255) DEFAULT NULL,
  `TeamNGOEnd_LogoPath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TeamNGOEnd_ID`),
  KEY `TeamNGOEnd_TeamNGO_ID_IDX` (`TeamNGO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TeamNGOPublic`
--

DROP TABLE IF EXISTS `TeamNGOPublic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TeamNGOPublic` (
  `TeamNGOPublic_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `TeamNGOEnd_ID` int unsigned DEFAULT NULL,
  `PublicProfile_ID` int unsigned DEFAULT NULL,
  `TeamNGOPublic_CanAcceptDate` datetime DEFAULT NULL,
  `TeamNGOPublic_NGOAcceptDate` datetime DEFAULT NULL,
  `TeanNGOPublic_Rating` tinyint DEFAULT NULL,
  `TeanNGOPublic_Publish` enum('yes','no') DEFAULT NULL,
  `TeanNGOPublic_Date` datetime DEFAULT NULL,
  PRIMARY KEY (`TeamNGOPublic_ID`),
  KEY `TeamNGOPublic_TeamPublic_IDX` (`TeamNGOEnd_ID`,`PublicProfile_ID`),
  KEY `TeamNGOPublic_TeamNGOID_ID_IDX` (`TeamNGOEnd_ID`),
  KEY `TeamNGOPublic_PublicProfile_ID_IDX` (`PublicProfile_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Vendor`
--

DROP TABLE IF EXISTS `Vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vendor` (
  `Vendor_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `SystemUser_ID` int unsigned DEFAULT NULL,
  `Vendor_Order` int unsigned DEFAULT NULL,
  `Vendor_Name` varchar(255) DEFAULT NULL,
  `Vendor_Pitch` text,
  `Vendor_URL` varchar(255) DEFAULT NULL,
  `Vendor_Stage` enum('presave','visible') DEFAULT NULL,
  `Vendor_Visible` enum('yes','no') DEFAULT NULL,
  `Vendor_UpdateTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`Vendor_ID`)
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
  `DataHouse_ID` int unsigned DEFAULT NULL,
  `Voters_Gender` enum('male','female','other','undetermined','intersex','Undisclosed') DEFAULT NULL,
  `Voters_UniqStateVoterID` varchar(50) DEFAULT NULL,
  `DataState_ID` int unsigned DEFAULT NULL,
  `Voters_RegParty` char(3) DEFAULT NULL,
  `Voters_ReasonCode` enum('AdjudgedIncompetent','Death','Duplicate','Felon','MailCheck','MovedOutCounty','NCOA','NVRA','ReturnMail','VoterRequest','Other','Court','Inactive') DEFAULT NULL,
  `Voters_Status` enum('Active','ActiveMilitary','ActiveSpecialFederal','ActiveSpecialPresidential','ActiveUOCAVA','Inactive','Purged','Prereg17YearOlds','Confirmation') DEFAULT NULL,
  `VotersMailingAddress_ID` int unsigned DEFAULT NULL,
  `Voters_IDRequired` enum('yes','no') DEFAULT NULL,
  `Voters_IDMet` enum('yes','no') DEFAULT NULL,
  `Voters_ApplyDate` date DEFAULT NULL,
  `Voters_RegSource` enum('Agency','CBOE','DMV','LocalRegistrar','MailIn','School','OVR') DEFAULT NULL,
  `Voters_DateInactive` date DEFAULT NULL,
  `Voters_DatePurged` date DEFAULT NULL,
  `Voters_CountyVoterNumber` varchar(50) DEFAULT NULL,
  `Voters_RMBActive` enum('yes','no') DEFAULT 'yes',
  `Voters_RecFirstSeen` date DEFAULT NULL,
  `Voters_RecLastSeen` date DEFAULT NULL,
  PRIMARY KEY (`Voters_ID`),
  KEY `Voters_UniqStateVoterID_IDX` (`Voters_UniqStateVoterID`),
  KEY `Voters_RegParty_IDX` (`Voters_RegParty`),
  KEY `Voters_Status_IDX` (`Voters_Status`),
  KEY `Voters_StatusRegParty_IDX` (`Voters_Status`,`Voters_RegParty`),
  KEY `VotersIndexesID_IDX` (`VotersIndexes_ID`),
  KEY `Voters_DataHouseID_IDX` (`DataHouse_ID`),
  KEY `Voters_DataState_IDX` (`DataState_ID`),
  KEY `Voters_CountyVoterNumber_IDX` (`Voters_CountyVoterNumber`),
  KEY `Voters_RecFirstSeen_IDX` (`Voters_RecFirstSeen`),
  KEY `Voters_RecLastSeen_IDX` (`Voters_RecLastSeen`)
) ENGINE=InnoDB AUTO_INCREMENT=34792547 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `VotersComplementInfo`
--

DROP TABLE IF EXISTS `VotersComplementInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VotersComplementInfo` (
  `VotersComplementInfo_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Voters_ID` int unsigned DEFAULT NULL,
  `VotersComplementInfo_PrevName` varchar(150) DEFAULT NULL,
  `VotersComplementInfo_PrevAddress` varchar(100) DEFAULT NULL,
  `DataCountyID_PrevCounty` int unsigned DEFAULT NULL,
  `VotersComplementInfo_LastYearVoted` year DEFAULT NULL,
  `VotersComplementInfo_LastDateVoted` date DEFAULT NULL,
  `VotersComplementInfo_OtherParty` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`VotersComplementInfo_ID`),
  KEY `VotersComplementInfo_ALL_IDX` (`VotersComplementInfo_PrevName`,`VotersComplementInfo_PrevAddress`,`VotersComplementInfo_LastYearVoted`,`VotersComplementInfo_OtherParty`)
) ENGINE=InnoDB AUTO_INCREMENT=35029540 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `VotersIndexes`
--

DROP TABLE IF EXISTS `VotersIndexes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VotersIndexes` (
  `VotersIndexes_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `DataLastName_ID` int unsigned DEFAULT NULL,
  `DataFirstName_ID` int unsigned DEFAULT NULL,
  `DataMiddleName_ID` int unsigned DEFAULT NULL,
  `VotersIndexes_Suffix` varchar(10) DEFAULT NULL,
  `VotersIndexes_DOB` date DEFAULT NULL,
  `DataState_ID` int unsigned DEFAULT NULL,
  `VotersIndexes_UniqStateVoterID` char(20) DEFAULT NULL,
  PRIMARY KEY (`VotersIndexes_ID`),
  KEY `VotersIndexes_UniqStateVoterID_IDX` (`VotersIndexes_UniqStateVoterID`),
  KEY `VotersIndexes_DataFirstName_IDX` (`DataFirstName_ID`),
  KEY `VotersIndexes_DataMiddleName_IDX` (`DataMiddleName_ID`),
  KEY `VotersIndexes_DataLastName_IDX` (`DataLastName_ID`),
  KEY `VotersIndexes_DOB_IDX` (`VotersIndexes_DOB`),
  KEY `VotersIndexes_DataState_IDX` (`DataState_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22951771 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
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
  `ZDevVerif_MailCode` char(10) DEFAULT NULL,
  `ZDevVerif_Received` datetime DEFAULT NULL,
  PRIMARY KEY (`ZDevVerif_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8;
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-10  0:25:11
