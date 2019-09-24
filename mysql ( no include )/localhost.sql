-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 25, 2019 at 07:15 AM
-- Server version: 5.5.60-log
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `miniprogram-1`
--
CREATE DATABASE IF NOT EXISTS `miniprogram-1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `miniprogram-1`;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `cid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `comment` varchar(256) NOT NULL,
  `evaluation` float NOT NULL,
  `reward` float DEFAULT '0',
  `publictime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `timestamp` bigint(20) NOT NULL DEFAULT '1558526753'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`cid`, `mid`, `uid`, `comment`, `evaluation`, `reward`, `publictime`, `timestamp`) VALUES
(1, 1, 2, '测试评论', 3, 20, '2019-05-18 04:36:59', 1558526753),
(2, 1, 2, '测试评论', 0, 20, '2019-05-18 04:37:16', 1558526753),
(3, 1, 2, '测试评论', 1, 20, '2019-05-18 04:37:16', 1558526753),
(4, 1, 2, '测试评论', 4, 20, '2019-05-18 04:37:16', 1558526753),
(24, 1, 2, '测试评论', 2, 20, '2019-05-18 04:37:17', 1558526753),
(25, 1, 4, '哗哗哗的', 3, 0, '2019-05-22 12:43:56', 1558526753),
(26, 1, 2, '呼呼', 2, 0, '2019-05-22 13:18:38', 1558531118),
(27, 1, 2, 'ffffff🐟', 3, 0, '2019-05-22 13:25:02', 1558531502),
(28, 1, 2, 'wwwwww', 4, 0, '2019-05-22 13:27:08', 1558531628),
(29, 1, 2, 'ttt', 5, 0, '2019-05-22 13:34:38', 1558532078),
(30, 1, 4, '哈哈????', 3, 0, '2019-05-22 13:43:48', 1558532628),
(31, 1, 4, '测试评论', 2, 0, '2019-05-22 14:13:44', 1558534424),
(32, 1, 4, '????????????????????????????????', 3, 0, '2019-05-22 14:14:27', 1558534467),
(33, 1, 4, '????????????????????????????????', 1, 0, '2019-05-22 14:14:32', 1558534472),
(34, 1, 2, '不错，很棒', 2, 0, '2019-05-22 14:18:54', 1558534734),
(35, 1, 4, '????????', 3, 0, '2019-05-23 02:55:46', 1558580146),
(36, 1, 2, '测试评论', 4, 0, '2019-05-23 04:44:04', 1558586644),
(37, 1, 4, '测试评论，????????????????????????????????????????????????????️????️????????️????️????????️????????????????', 3, 0, '2019-05-23 14:37:54', 1558622274),
(38, 1, 4, '测试评论，????????????????????????????????????????????????????️????️????????️????️????????️????????????????', 4, 0, '2019-05-23 14:37:59', 1558622279),
(39, 1, 4, '测试评论，好多好多好多好多好多好多好多话好多好多好多好多话好多好多好多好多话', 3, 0, '2019-05-23 14:38:47', 1558622327),
(40, 1, 2, '测试评论', 3, 0, '2019-05-23 14:43:50', 1558622630),
(41, 1, 5, '?', 4, 0, '2019-05-24 10:11:59', 1558692719),
(42, 1, 4, '不错', 4, 0, '2019-05-24 10:15:29', 1558692929),
(43, 1, 4, '好', 1, 0, '2019-05-24 10:23:23', 1558693403),
(44, 1, 4, '好', 4, 0, '2019-05-24 10:24:11', 1558693451),
(45, 1, 6, '好', 4, 0, '2019-05-24 10:28:22', 1558693702),
(46, 1, 6, '员工服务很好', 4, 0, '2019-05-24 10:29:52', 1558693792),
(47, 1, 4, '好', 4, 0, '2019-05-24 10:42:22', 1558694542),
(48, 1, 5, '好', 4, 0, '2019-05-24 10:54:32', 1558695272),
(49, 1, 5, '好\n', 4, 0, '2019-05-24 11:36:01', 1558697761),
(50, 1, 6, '服务员很棒', 5, 0, '2019-05-25 03:12:57', 1558753977),
(51, 1, 6, '服务很好', 5, 0, '2019-05-25 03:13:44', 1558754024),
(52, 1, 6, '服务好', 5, 0, '2019-05-25 03:15:20', 1558754120),
(53, 1, 6, '服务态度好', 5, 0, '2019-05-25 03:16:37', 1558754197),
(54, 1, 4, '好', 4, 0, '2019-05-26 01:40:33', 1558834833),
(55, 3, 4, '测试', 4, 0, '2019-05-26 04:14:15', 1558844055),
(56, 1, 5, '好', 4, 0, '2019-05-26 06:21:48', 1558851708),
(57, 2, 4, '测试评论', 4, 0, '2019-05-26 10:17:42', 1558865862),
(58, 3, 5, '测试', 4, 0, '2019-05-26 10:45:21', 1558867521),
(59, 2, 5, '就', 4, 0, '2019-05-27 11:00:45', 1558954845),
(60, 1, 5, '好', 4, 0, '2019-05-29 10:38:32', 1559126312),
(61, 1, 5, '好', 4, 0, '2019-05-29 10:38:48', 1559126328);

-- --------------------------------------------------------

--
-- Table structure for table `mainparts`
--

CREATE TABLE `mainparts` (
  `mid` int(11) NOT NULL,
  `mName` varchar(64) NOT NULL,
  `mDescribe` varchar(512) NOT NULL,
  `mImage` varchar(512) NOT NULL,
  `creatTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mainparts`
--

INSERT INTO `mainparts` (`mid`, `mName`, `mDescribe`, `mImage`, `creatTime`) VALUES
(1, '测试员工', '易于沟通，能够比较轻易地融入工作群体,这是一段描述,用以描述员工!', 'https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1558621140&di=fbcc9f36b2bfea435a2cc50fc744b678&src=http://b-ssl.duitang.com/uploads/item/201704/27/20170427155254_Kctx8.jpeg', '2019-05-18 04:27:30'),
(2, '测试员工2', '易于沟通，能够比较轻易地融入工作群体,这是一段描述,用以描述员工2!', 'http://img4.imgtn.bdimg.com/it/u=29359696,1174685172&fm=26&gp=0.jpg', '2019-05-18 04:27:30'),
(3, '测试员工3', '这是一段描述,用以描述员工3!', 'https://tse1-mm.cn.bing.net/th?id=OIP.rAKq3YSfhZM28e7C-b_kfAAAAA&w=203&h=204&c=7&o=5&dpr=1.25&pid=1.7', '2019-05-26 04:27:30');

-- --------------------------------------------------------

--
-- Table structure for table `publicwelfares`
--

CREATE TABLE `publicwelfares` (
  `wid` int(11) NOT NULL,
  `wOrgName` varchar(64) NOT NULL,
  `wName` varchar(128) NOT NULL,
  `wDescribe` varchar(1024) NOT NULL,
  `heart` int(11) NOT NULL,
  `wImage` varchar(512) NOT NULL,
  `wAvatar` varchar(512) NOT NULL,
  `creattime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `timestamp` bigint(20) NOT NULL DEFAULT '1558526753'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `publicwelfares`
--

INSERT INTO `publicwelfares` (`wid`, `wOrgName`, `wName`, `wDescribe`, `heart`, `wImage`, `wAvatar`, `creattime`, `timestamp`) VALUES
(1, 'i公益', '小水源地保护', '水是生命之母，江河湖海的污染往往牵动人心，但你知道怎样保护隐藏在农村的“小”水源地吗？你知道一个小水源地的保护如何改变一座、百座村庄吗？来听听从业者的笑与泪吧。', 19, 'http://www.ngocn.cn/uploads/cover/2019-05-07/1557210370.thumb.jpg', 'https://avatars2.githubusercontent.com/u/16521693?s=460&v=4', '2019-05-24 08:07:38', 1559926753),
(2, '公益!', '关爱留守儿童', '关爱留守儿童', 23, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1558669421782&di=1ca3492443b2d94b106437c499f102d9&imgtype=0&src=http%3A%2F%2Fview.k618.cn%2Fwlgcy%2F201603%2FW020160330319334684207.jpg', 'https://avatars2.githubusercontent.com/u/16521693?s=460&v=4', '2019-05-24 08:11:26', 1559926753),
(3, '测试公益1', '战胜先天疾病', '战胜先天疾病', 56, 'http://img1.imgtn.bdimg.com/it/u=1659156971,2299751090&fm=26&gp=0.jpg', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2814109303,2147705560&fm=27&gp=0.jpg', '2019-05-24 09:04:18', 1559926753),
(4, '测试公益2', '送盲童一本书', '送盲童一本书', 77, 'http://img1.imgtn.bdimg.com/it/u=2465355550,3594364639&fm=26&gp=0.jpg', 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3768890033,68770272&fm=27&gp=0.jpg', '2019-05-24 09:05:30', 1559926753),
(5, '测试公益6', '小水源地保护', '水是生命之母，江河湖海的污染往往牵动人心，但你知道怎样保护隐藏在农村的“小”水源地吗？你知道一个小水源地的保护如何改变一座、百座村庄吗？来听听从业者的笑与泪吧。', 19, 'http://www.ngocn.cn/uploads/cover/2019-05-07/1557210370.thumb.jpg', 'https://avatars2.githubusercontent.com/u/16521693?s=460&v=4', '2019-05-24 08:07:38', 1558526753),
(6, '测试公益4', '关爱留守儿童', '关爱留守儿童', 23, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1558669421782&di=1ca3492443b2d94b106437c499f102d9&imgtype=0&src=http%3A%2F%2Fview.k618.cn%2Fwlgcy%2F201603%2FW020160330319334684207.jpg', 'https://avatars2.githubusercontent.com/u/16521693?s=460&v=4', '2019-05-24 08:11:26', 1558526753),
(7, '测试公益4', '战胜先天疾病', '战胜先天疾病', 56, 'http://img1.imgtn.bdimg.com/it/u=1659156971,2299751090&fm=26&gp=0.jpg', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2814109303,2147705560&fm=27&gp=0.jpg', '2019-05-24 09:04:18', 1558726753),
(8, '测试公益5', '送盲童一本书', '送盲童一本书', 77, 'http://img1.imgtn.bdimg.com/it/u=2465355550,3594364639&fm=26&gp=0.jpg', 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3768890033,68770272&fm=27&gp=0.jpg', '2019-05-24 09:05:30', 1558596753);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uid` int(11) NOT NULL,
  `openid` varchar(64) NOT NULL,
  `nickName` varchar(32) NOT NULL,
  `gender` int(1) NOT NULL DEFAULT '1',
  `language` varchar(8) NOT NULL DEFAULT 'zh_CN',
  `city` varchar(32) NOT NULL,
  `province` varchar(32) NOT NULL,
  `country` varchar(32) NOT NULL,
  `avatarUrl` varchar(512) NOT NULL,
  `creatTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `openid`, `nickName`, `gender`, `language`, `city`, `province`, `country`, `avatarUrl`, `creatTime`) VALUES
(2, 'ohY8g5XFL30r7R7TPVZiJzxvV6_0', 'follow', 1, 'zh_TW', '', 'Dublin', 'Ireland', 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKttDWia5wXbyvQ7mDjdl5INaUR8JMiawwzAK6ibxXgIXq2pamh7YE0lrIU6LI9KAQE7ic9oJ92523jJg/132', '2019-05-18 00:57:15'),
(4, 'ohY8g5Th62cPtD1BaJaVYvKQlwh4', 'Hanny', 1, 'zh_TW', 'Ningde', 'Fujian', 'China', 'https://wx.qlogo.cn/mmopen/vi_32/ga1N2KJewdicgD7KrCtNcbCZC1cdib19kSrbRUS4F1XCc8feqJprves1OTU5YhMwKNrarPESX1aQ8ou4Y34pD2gQ/132', '2019-05-18 04:17:08'),
(5, 'ohY8g5VW43eeJsX-V96bqGuaMksE', '时间？！', 1, 'zh_CN', 'Nanping', 'Fujian', 'China', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJyW5nq2TKNeicMvibIXYN6tWYuRMmialEqWic8yHDDLDD4Nl5cpiawG1sDia7kzl26aLPDmiaWOunQFtLAw/132', '2019-05-22 02:52:06'),
(6, 'ohY8g5VWlUZlUd-z_fRD7OIm-Z6Y', '张张正好', 2, 'zh_CN', '', '', 'Andorra', 'https://wx.qlogo.cn/mmopen/vi_32/aDFic64vdTvXD30r0lRNJNQyHkSKl56dZAaPTbcYaVv0ckLXZle6Q0c8icPxZerKw51w5AFzxWxoJ0CAnwroUEQQ/132', '2019-05-24 10:28:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `mainparts`
--
ALTER TABLE `mainparts`
  ADD PRIMARY KEY (`mid`);

--
-- Indexes for table `publicwelfares`
--
ALTER TABLE `publicwelfares`
  ADD PRIMARY KEY (`wid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `mainparts`
--
ALTER TABLE `mainparts`
  MODIFY `mid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `publicwelfares`
--
ALTER TABLE `publicwelfares`
  MODIFY `wid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
