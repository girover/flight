-- Creating database

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `flight_system`
--
CREATE DATABASE flight_system
-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `ID` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Name` char(35) NOT NULL,
  `CountryCode` char(3) NOT NULL,
  `District` char(20) NOT NULL,
  `Population` int(11) NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `course`
--

CREATE TABLE `airport` (
  `AirportCode` char(3) NOT NULL,
  `Name` varchar(35) NOT NULL,
  `CityID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `Route`
--

CREATE TABLE `route` (
  `RouteID` int(11) NOT NULL,
  `FormAirportCode` char(3) NOT NULL,
  `ToAirportCode` char(3) NOT NULL,
  `PlaneID` int(11) NOT NULL,
  `Distance` double NOT NULL,
  `Duration` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `Plane`
--

CREATE TABLE `plane` (
  `PlaneID` int(11) NOT NULL,
  `Name` varchar(35) NOT NULL,
  `AirlineID` int(11) NOT NULL,
  `Seats` int(4) NOT NULL,
  `Class` enum('economic', 'business', 'first class') DEFAULT 'economic',
  `Duration` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `Airline`
--

CREATE TABLE `airline` (
  `AirlineID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `Flight`
--

CREATE TABLE `flight` (
  `FlightID` int(11) NOT NULL,
  `RouteID` int(11) NOT NULL,
  `DepartureTime` Datetime NOT NULL,
  `ArrivalTime` Datetime NOT NULL,
  `TicketPrice` Deciaml(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `Ticket`
--

CREATE TABLE `ticket` (
  `TicketID` char(10) NOT NULL,
  `PassengerID` int(11) NOT NULL,
  `FlightID` int(11) NOT NULL,
  `SeatNo` int(4) NOT NULL,
  `OrderedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OrderID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `Passenger`
--

CREATE TABLE `passenger` (
  `PassengerID` int(11) NOT NULL,
  `FirstName` varchar(35) NOT NULL,
  `LastName` varchar(35) NOT NULL,
  `Birthdate` Date NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `Order`
--

CREATE TABLE `order` (
  `OrderID` int(11) NOT NULL,
  `ClientID` int(11) NOT NULL,
  `OrderTime` Datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `Client`
--

CREATE TABLE `client` (
  `ClientID` int(11) NOT NULL,
  `FirstName` varchar(35) NOT NULL,
  `LastName` varchar(35) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

COMMIT;