# noinspection SqlNoDataSourceInspectionForFile

-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 27 2017 г., 20:36
-- Версия сервера: 10.1.21-MariaDB
-- Версия PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `yii2basic`
--

-- --------------------------------------------------------

--
-- Структура таблицы `student`
--

CREATE TABLE `student` (
  `FirstName` VARCHAR(64)
              CHARACTER SET utf8 NOT NULL,
  `LastName`  VARCHAR(64)
              CHARACTER SET utf8 NOT NULL,
  `BirthDate` DATE               NOT NULL,
  `Gruppa`    VARCHAR(64)
              CHARACTER SET utf8 NOT NULL,
  `ID`        INT(11)            NOT NULL
)
  ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

--
-- Дамп данных таблицы `student`
--

INSERT INTO `student` (`FirstName`, `LastName`, `BirthDate`, `Gruppa`, `ID`) VALUES
  ('Игорь', 'Комиссаров', '1990-09-30', 'АСОИ-135', 1),
  ('Максим', 'Шерстнёв', '1989-12-22', 'ИВТ-12', 3),
  ('Виталий', 'Липатов', '1990-07-11', 'НН-117', 4),
  ('Андрей', 'Ильин', '1989-12-29', 'АСОИ-135', 9);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `student`
--
ALTER TABLE `student`
  MODIFY `ID` INT(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 10;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
