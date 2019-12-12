-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2019 at 04:27 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_travels`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminid` int(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminid`, `name`, `email`, `password`) VALUES
(1, 'Nikhil Dugaje', 'dugajenikhil@gmail.com', '1234'),
(2, 'Niks', 'niks@rediffmail.com', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `busid` int(20) NOT NULL,
  `bustype` varchar(20) DEFAULT NULL,
  `busnumber` varchar(20) DEFAULT NULL,
  `capacity` int(20) DEFAULT NULL,
  `travelid` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`busid`, `bustype`, `busnumber`, `capacity`, `travelid`) VALUES
(72, 'AC', 'MH01KP2222', 26, 1),
(73, 'Non-AC', 'MH01KP2249', 24, 1),
(74, 'Sleeper', 'MH11AA0000', 25, 1),
(75, 'AC', 'MH12CD1234', 20, 2),
(76, 'Non-AC', 'MH14CU1324', 28, 2),
(77, 'AC', 'MH12KD1111', 25, 4),
(78, 'Non-AC', 'MH12KD1112', 24, 4),
(79, 'Sleeper', 'MH14CU1345', 26, 3),
(80, 'Sleeper', 'MH12KP7897', 24, 6);

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `routeid` int(11) NOT NULL,
  `from` varchar(50) NOT NULL,
  `to` varchar(50) NOT NULL,
  `departure` varchar(50) NOT NULL,
  `arrival` varchar(50) NOT NULL,
  `fare` int(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  `busid` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`routeid`, `from`, `to`, `departure`, `arrival`, `fare`, `date`, `busid`) VALUES
(1, 'Nashik', 'Pune', '12:00', '5:00', 410, '2019-12-03', 72),
(2, 'Delhi', 'Pune', '9:00', '1:00', 350, '2019-12-03', 73),
(3, 'Nashik', 'Pune', '9.30', '2:00', 350, '2019-12-03', 74),
(4, 'Satara', 'Mumbai', '12:00', '7:00', 380, '2019-12-03', 75),
(5, 'Satara', 'Pune', '9:00', '3:00', 600, '2019-12-03', 76),
(6, 'Satara', 'Pune', '6:00', '4:00', 410, '2019-12-04', 72),
(7, 'Satara', 'Nagpur', '6:00', '4:00', 410, '2019-12-04', 75),
(8, 'Satara', 'Surat', '12:00', '7:00', 520, '2019-12-04', 80),
(9, 'Satara', 'Surat', '1:00', '7:00', 520, '2019-12-04', 79);

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE `seats` (
  `seat_id` int(11) NOT NULL,
  `bus_id` int(11) NOT NULL,
  `seat_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seats`
--

INSERT INTO `seats` (`seat_id`, `bus_id`, `seat_status`) VALUES
(254, 72, 1),
(255, 72, 1),
(256, 72, 1),
(257, 72, 0),
(258, 72, 1),
(259, 72, 1),
(260, 72, 1),
(261, 72, 1),
(262, 72, 1),
(263, 72, 1),
(264, 72, 1),
(265, 72, 1),
(266, 72, 0),
(267, 72, 1),
(268, 72, 1),
(269, 72, 1),
(270, 72, 0),
(271, 72, 1),
(272, 72, 1),
(273, 72, 0),
(274, 72, 0),
(275, 72, 1),
(276, 72, 1),
(277, 72, 0),
(278, 72, 0),
(279, 72, 0),
(280, 73, 0),
(281, 73, 0),
(282, 73, 0),
(283, 73, 0),
(284, 73, 0),
(285, 73, 0),
(286, 73, 0),
(287, 73, 0),
(288, 73, 0),
(289, 73, 0),
(290, 73, 0),
(291, 73, 0),
(292, 73, 0),
(293, 73, 0),
(294, 73, 0),
(295, 73, 0),
(296, 73, 0),
(297, 73, 0),
(298, 73, 0),
(299, 73, 0),
(300, 73, 0),
(301, 73, 0),
(302, 73, 0),
(303, 73, 0),
(304, 74, 0),
(305, 74, 0),
(306, 74, 0),
(307, 74, 0),
(308, 74, 1),
(309, 74, 1),
(310, 74, 0),
(311, 74, 0),
(312, 74, 0),
(313, 74, 1),
(314, 74, 1),
(315, 74, 0),
(316, 74, 0),
(317, 74, 1),
(318, 74, 0),
(319, 74, 0),
(320, 74, 0),
(321, 74, 1),
(322, 74, 1),
(323, 74, 1),
(324, 74, 0),
(325, 74, 1),
(326, 74, 1),
(327, 74, 0),
(328, 74, 0),
(329, 75, 0),
(330, 75, 0),
(331, 75, 0),
(332, 75, 0),
(333, 75, 0),
(334, 75, 0),
(335, 75, 0),
(336, 75, 0),
(337, 75, 0),
(338, 75, 0),
(339, 75, 1),
(340, 75, 0),
(341, 75, 0),
(342, 75, 0),
(343, 75, 0),
(344, 75, 0),
(345, 75, 0),
(346, 75, 0),
(347, 75, 0),
(348, 75, 0),
(349, 76, 0),
(350, 76, 0),
(351, 76, 0),
(352, 76, 0),
(353, 76, 0),
(354, 76, 0),
(355, 76, 0),
(356, 76, 0),
(357, 76, 0),
(358, 76, 0),
(359, 76, 0),
(360, 76, 0),
(361, 76, 0),
(362, 76, 0),
(363, 76, 0),
(364, 76, 0),
(365, 76, 0),
(366, 76, 0),
(367, 76, 0),
(368, 76, 0),
(369, 76, 0),
(370, 76, 0),
(371, 76, 0),
(372, 76, 0),
(373, 76, 0),
(374, 76, 0),
(375, 76, 0),
(376, 76, 0),
(377, 77, 0),
(378, 77, 0),
(379, 77, 0),
(380, 77, 0),
(381, 77, 0),
(382, 77, 0),
(383, 77, 0),
(384, 77, 0),
(385, 77, 0),
(386, 77, 0),
(387, 77, 0),
(388, 77, 0),
(389, 77, 0),
(390, 77, 0),
(391, 77, 0),
(392, 77, 0),
(393, 77, 0),
(394, 77, 0),
(395, 77, 0),
(396, 77, 0),
(397, 77, 0),
(398, 77, 0),
(399, 77, 0),
(400, 77, 0),
(401, 77, 0),
(402, 78, 0),
(403, 78, 0),
(404, 78, 0),
(405, 78, 0),
(406, 78, 0),
(407, 78, 0),
(408, 78, 0),
(409, 78, 0),
(410, 78, 0),
(411, 78, 0),
(412, 78, 0),
(413, 78, 0),
(414, 78, 0),
(415, 78, 0),
(416, 78, 0),
(417, 78, 0),
(418, 78, 0),
(419, 78, 0),
(420, 78, 0),
(421, 78, 0),
(422, 78, 0),
(423, 78, 0),
(424, 78, 0),
(425, 78, 0),
(426, 79, 0),
(427, 79, 0),
(428, 79, 0),
(429, 79, 0),
(430, 79, 0),
(431, 79, 0),
(432, 79, 0),
(433, 79, 0),
(434, 79, 0),
(435, 79, 0),
(436, 79, 0),
(437, 79, 0),
(438, 79, 0),
(439, 79, 0),
(440, 79, 0),
(441, 79, 0),
(442, 79, 0),
(443, 79, 0),
(444, 79, 0),
(445, 79, 0),
(446, 79, 0),
(447, 79, 0),
(448, 79, 0),
(449, 79, 0),
(450, 79, 0),
(451, 79, 0),
(452, 80, 0),
(453, 80, 0),
(454, 80, 0),
(455, 80, 0),
(456, 80, 0),
(457, 80, 0),
(458, 80, 0),
(459, 80, 0),
(460, 80, 0),
(461, 80, 0),
(462, 80, 0),
(463, 80, 0),
(464, 80, 0),
(465, 80, 0),
(466, 80, 0),
(467, 80, 0),
(468, 80, 0),
(469, 80, 0),
(470, 80, 0),
(471, 80, 0),
(472, 80, 0),
(473, 80, 0),
(474, 80, 0),
(475, 80, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `ticketid` int(11) NOT NULL,
  `travel` varchar(25) DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL,
  `from` varchar(25) DEFAULT NULL,
  `to` varchar(25) DEFAULT NULL,
  `seats` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `uemail` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`ticketid`, `travel`, `type`, `from`, `to`, `seats`, `amount`, `uemail`) VALUES
(153, 'Shivshahi', 'AC', 'Nashik', 'Pune', 4, 1640, 'dugajenikhil@gmail.com'),
(154, 'Shivshahi', 'Sleeper', 'Nashik', 'Pune', 2, 700, 'dugajenikhil@gmail.com'),
(156, 'Shivshahi', 'AC', 'Nashik', 'Pune', 1, 410, 'dugajenikhil@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `travels`
--

CREATE TABLE `travels` (
  `travelsid` int(50) NOT NULL,
  `travels` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `agentname` varchar(50) DEFAULT NULL,
  `phonenumber` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `travels`
--

INSERT INTO `travels` (`travelsid`, `travels`, `location`, `address`, `agentname`, `phonenumber`) VALUES
(1, 'Shivshahi', 'Nashik  ABB', 'Pune', 'Pramod', 789465312),
(2, 'Prasanna', 'Petrol Pump', 'Nagpur', 'Priyanka', 789465132),
(3, 'Purple', 'Jalna KM Rd', 'Jalna', 'Safa', 789465123),
(4, 'Neeta', 'Near AB Hospital', 'Pune', 'Praveen', 847946512),
(5, 'SR', 'Near CCM', 'Nashik', 'Aman', 847446512),
(6, 'Chintamani', 'Near Tech M', 'Mumbai', 'Snehal', 847446512);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uid` int(11) NOT NULL,
  `uname` varchar(25) NOT NULL,
  `uemail` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `uname`, `uemail`, `password`) VALUES
(37, 'Nikhil Balasaheb Dugaje', 'dugajenikhil@gmail.com', '1234'),
(38, 'Pramod Pawar', 'pramod@gmail.com', '1234'),
(39, 'Ashok Pawar', 'ashok@gmail.com', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminid`);

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`busid`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`routeid`);

--
-- Indexes for table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`seat_id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ticketid`);

--
-- Indexes for table `travels`
--
ALTER TABLE `travels`
  ADD PRIMARY KEY (`travelsid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminid` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bus`
--
ALTER TABLE `bus`
  MODIFY `busid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `route`
--
ALTER TABLE `route`
  MODIFY `routeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `seats`
--
ALTER TABLE `seats`
  MODIFY `seat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=476;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `ticketid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `travels`
--
ALTER TABLE `travels`
  MODIFY `travelsid` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
