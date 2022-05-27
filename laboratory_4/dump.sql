CREATE TABLE `FIRME` (
  `CODFIRMA` tinyint(4) NOT NULL,
  `DENFIRMA` varchar(20) NOT NULL,
  `LOC` varchar(20) DEFAULT NULL,
  `ZONA` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `FIRME`
--

/*INSERT INTO `FIRME` (`CODFIRMA`, `DENFIRMA`, `LOC`, `ZONA`) VALUES
(101, 'INCOMLAC', 'BALTI', 'NORD\r\n'),
(102, 'BUCURIA', 'CHISINAU', 'EST'),
(103, 'CARMEZ', 'CAHUL', 'SUD');*/

-- --------------------------------------------------------

--
-- Структура таблицы `PERSONAL`
--

CREATE TABLE `PERSONAL` (
  `CODAGENT` tinyint(4) NOT NULL,
  `NUMEAGENT` varchar(25) NOT NULL,
  `DATAANGAJARII` date DEFAULT NULL,
  `DATANASTERII` date DEFAULT NULL,
  `FUNCTIA` varchar(20) DEFAULT NULL,
  `CODFIRMA` tinyint(4) DEFAULT NULL,
  `VIRSTA` tinyint(4) DEFAULT NULL,
  `EMAIL` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `SALARIATI`
--

CREATE TABLE `SALARIATI` (
  `CODAGENT` tinyint(4) NOT NULL,
  `NUMEAGENT` varchar(25) NOT NULL,
  `DATAANGAJARII` date DEFAULT NULL,
  `DATANASTERII` date DEFAULT NULL,
  `FUNCTIA` varchar(20) DEFAULT NULL,
  `CODFIRMA` tinyint(4) DEFAULT NULL,
  `VIRSTA` tinyint(4) DEFAULT NULL,
  `EMAIL` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `SALARIATI`
--

/*INSERT INTO `SALARIATI` (`CODAGENT`, `NUMEAGENT`, `DATAANGAJARII`, `DATANASTERII`, `FUNCTIA`, `CODFIRMA`, `VIRSTA`, `EMAIL`) VALUES
(10, 'tROFIM', '2020-10-12', '1999-02-10', 'AGENT', 103, 25, 32);*/

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `FIRME`
--
ALTER TABLE `FIRME`
  ADD PRIMARY KEY (`CODFIRMA`);

--
-- Индексы таблицы `PERSONAL`
--
ALTER TABLE `PERSONAL`
  ADD PRIMARY KEY (`CODAGENT`),
  ADD KEY `FK_AGENTI_FIRME` (`CODFIRMA`);

--
-- Индексы таблицы `SALARIATI`
--
ALTER TABLE `SALARIATI`
  ADD PRIMARY KEY (`CODAGENT`),
  ADD KEY `FK_AGENTI_FIRME` (`CODFIRMA`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `PERSONAL`
--
ALTER TABLE `PERSONAL`
  ADD CONSTRAINT `FK_AGENTI_FIRME` FOREIGN KEY (`CODFIRMA`) REFERENCES `FIRME` (`CODFIRMA`);
--
-- База данных: `cercetători`
--
CREATE DATABASE IF NOT EXISTS `cercetători` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cercetători`;

-- --------------------------------------------------------

--
-- Структура таблицы `articole`
--

CREATE TABLE `articole` (
  `idArticol` int(11) NOT NULL,
  `denArticol` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `articole`
--

/*INSERT INTO `articole` (`idArticol`, `denArticol`) VALUES
(1, 'Articol1'),
(2, 'Articol2'),
(3, 'Articol3'),
(4, 'Articol4'),
(5, 'Articol5');*/

-- --------------------------------------------------------

--
-- Структура таблицы `cercetatori`
--

CREATE TABLE `cercetatori` (
  `idCercetator` int(11) NOT NULL,
  `numeCercetator` varchar(50) DEFAULT NULL,
  `idArticol` int(11) DEFAULT NULL,
  `idUniversitate` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cercetatori`
--

/*INSERT INTO `cercetatori` (`idCercetator`, `numeCercetator`, `idArticol`, `idUniversitate`) VALUES
(1, 'Dodu Petru', 1, 1),
(2, 'Lungu Vasile', 2, 2),
(3, 'Vrabie Maria', 3, 1),
(4, 'Vasilciuc Renata', 4, 3),
(5, 'Dreglea Ana', 3, 2),
(6, 'DREGLEA ANA', 5, 2),
(7, 'Gorea Adela', 3, 1),
(8, 'ALEXEEV', 2, 1),
(9, 'Ceobanas Igor', 2, 3),
(10, 'Gorea Adela', 4, 1),
(12, 'Nagoreanschi G', NULL, 1);*/

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `cercetatori_usarb`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `cercetatori_usarb` (
`numeCercetator` varchar(50)
);

-- --------------------------------------------------------

--
-- Структура таблицы `universitate`
--

CREATE TABLE `universitate` (
  `idUniversitate` int(11) NOT NULL,
  `denUniversitate` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `universitate`
--

/*INSERT INTO `universitate` (`idUniversitate`, `denUniversitate`) VALUES
(1, 'USARB'),
(2, 'USM'),
(3, 'ASEM');*/

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `ved1`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `ved1` (
`numeCercetator` varchar(50)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `ved2`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `ved2` (
`numeCercetator` varchar(50)
,`denArticol` varchar(50)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `ved3`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `ved3` (
`denUniversitate` varchar(50)
,`denArticol` varchar(50)
,`numeCercetator` varchar(50)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `ved4`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `ved4` (
`numeCercetator` varchar(50)
,`nr_articole` bigint(21)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `ved5`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `ved5` (
`numeCercetator` varchar(50)
,`denArticol` varchar(50)
,`denUniversitate` varchar(50)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `ved7`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `ved7` (
`numeCercetator` varchar(50)
,`nr_articol` bigint(21)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `ved8`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `ved8` (
`denuniversitate` varchar(50)
,`NUM_ARTICOL` bigint(21)
);

-- --------------------------------------------------------
/*
--
-- Структура для представления `cercetatori_usarb`
--
DROP TABLE IF EXISTS `cercetatori_usarb`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `cercetatori_usarb`  AS  select `cercetatori`.`numeCercetator` AS `numeCercetator` from (`cercetatori` join `universitate` on((`cercetatori`.`idUniversitate` = `universitate`.`idUniversitate`))) where (`universitate`.`denUniversitate` = 'USARB') ;

-- --------------------------------------------------------

--
-- Структура для представления `ved1`
--
DROP TABLE IF EXISTS `ved1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `ved1`  AS  select `cercetatori`.`numeCercetator` AS `numeCercetator` from (`cercetatori` join `universitate` on((`cercetatori`.`idUniversitate` = `universitate`.`idUniversitate`))) where (`universitate`.`denUniversitate` = 'ASEM') ;

-- --------------------------------------------------------

--
-- Структура для представления `ved2`
--
DROP TABLE IF EXISTS `ved2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `ved2`  AS  select `cercetatori`.`numeCercetator` AS `numeCercetator`,`articole`.`denArticol` AS `denArticol` from (`cercetatori` join `articole` on((`cercetatori`.`idArticol` = `articole`.`idArticol`))) ;

-- --------------------------------------------------------

--
-- Структура для представления `ved3`
--
DROP TABLE IF EXISTS `ved3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `ved3`  AS  select `u`.`denUniversitate` AS `denUniversitate`,`a`.`denArticol` AS `denArticol`,`c`.`numeCercetator` AS `numeCercetator` from ((`cercetatori` `c` join `articole` `a` on((`c`.`idArticol` = `a`.`idArticol`))) join `universitate` `u` on((`c`.`idUniversitate` = `u`.`idUniversitate`))) ;

-- --------------------------------------------------------

--
-- Структура для представления `ved4`
--
DROP TABLE IF EXISTS `ved4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `ved4`  AS  select `cercetatori`.`numeCercetator` AS `numeCercetator`,count(`cercetatori`.`idArticol`) AS `nr_articole` from `cercetatori` group by `cercetatori`.`numeCercetator` ;

-- --------------------------------------------------------

--
-- Структура для представления `ved5`
--
DROP TABLE IF EXISTS `ved5`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `ved5`  AS  select `ved2`.`numeCercetator` AS `numeCercetator`,`ved2`.`denArticol` AS `denArticol`,`universitate`.`denUniversitate` AS `denUniversitate` from (`ved2` join `universitate`) ;

-- --------------------------------------------------------

--
-- Структура для представления `ved7`
--
DROP TABLE IF EXISTS `ved7`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `ved7`  AS  select `cercetatori`.`numeCercetator` AS `numeCercetator`,count(`cercetatori`.`idArticol`) AS `nr_articol` from `cercetatori` group by `cercetatori`.`numeCercetator` ;

-- --------------------------------------------------------

--
-- Структура для представления `ved8`
--
DROP TABLE IF EXISTS `ved8`;
*/
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `ved8`  AS  select `universitate`.`denUniversitate` AS `denuniversitate`,count(`cercetatori`.`idArticol`) AS `NUM_ARTICOL` from (`universitate` join `cercetatori` on((`universitate`.`idUniversitate` = `cercetatori`.`idUniversitate`))) group by `universitate`.`idUniversitate` ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `articole`
--
ALTER TABLE `articole`
  ADD PRIMARY KEY (`idArticol`);

--
-- Индексы таблицы `cercetatori`
--
ALTER TABLE `cercetatori`
  ADD PRIMARY KEY (`idCercetator`),
  ADD KEY `FK_cercetători_articole` (`idArticol`),
  ADD KEY `FK_cercetători_universitate` (`idUniversitate`);

--
-- Индексы таблицы `universitate`
--
ALTER TABLE `universitate`
  ADD PRIMARY KEY (`idUniversitate`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `articole`
--
ALTER TABLE `articole`
  MODIFY `idArticol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `cercetatori`
--
ALTER TABLE `cercetatori`
  MODIFY `idCercetator` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `universitate`
--
ALTER TABLE `universitate`
  MODIFY `idUniversitate` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `cercetatori`
--
ALTER TABLE `cercetatori`
  ADD CONSTRAINT `FK_cercetători_articole` FOREIGN KEY (`idArticol`) REFERENCES `articole` (`idArticol`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_cercetători_universitate` FOREIGN KEY (`idUniversitate`) REFERENCES `universitate` (`idUniversitate`);
--
-- База данных: `Cinema`
--
CREATE DATABASE IF NOT EXISTS `Cinema` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `Cinema`;

-- --------------------------------------------------------

--
-- Структура таблицы `ACTORI`
--

CREATE TABLE `ACTORI` (
  `idActor` smallint(6) NOT NULL,
  `nume` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ACTORI`
--

/*INSERT INTO `ACTORI` (`idActor`, `nume`) VALUES
(1, 'JOHNNY DEEP'),
(2, 'AL PACINO'),
(3, 'SURAJ SHARMA'),
(4, 'BRAD PITT'),
(5, 'EDWARD NORTON');*/

-- --------------------------------------------------------

--
-- Структура таблицы `film`
--

CREATE TABLE `film` (
  `idFilm` smallint(6) NOT NULL,
  `titlu` varchar(25) DEFAULT NULL,
  `regizor` varchar(20) DEFAULT NULL,
  `anul` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `film`
--

/*INSERT INTO `film` (`idFilm`, `titlu`, `regizor`, `anul`) VALUES
(1, 'LES EVANDES', 'DARABONT', 1994),
(2, 'RANGO', 'VERBINSKI', 2015);*/

-- --------------------------------------------------------

--
-- Структура таблицы `FILMOGRAPHIE`
--

CREATE TABLE `FILMOGRAPHIE` (
  `idActor` smallint(6) NOT NULL,
  `idFilm` smallint(6) NOT NULL,
  `Rolu` varchar(30) DEFAULT NULL,
  `Salariul` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `ACTORI`
--
ALTER TABLE `ACTORI`
  ADD PRIMARY KEY (`idActor`);

--
-- Индексы таблицы `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`idFilm`);

--
-- Индексы таблицы `FILMOGRAPHIE`
--
ALTER TABLE `FILMOGRAPHIE`
  ADD PRIMARY KEY (`idActor`,`idFilm`),
  ADD KEY `FK_FILMOGRAPHIE_film` (`idFilm`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `FILMOGRAPHIE`
--
ALTER TABLE `FILMOGRAPHIE`
  ADD CONSTRAINT `FK_FILMOGRAPHIE_film` FOREIGN KEY (`idFilm`) REFERENCES `film` (`idFilm`),
  ADD CONSTRAINT `FK_fILMOGRAPHIE` FOREIGN KEY (`idActor`) REFERENCES `ACTORI` (`idActor`);
--
-- База данных: `Companie`
--
CREATE DATABASE IF NOT EXISTS `Companie` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `Companie`;

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `a`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `a` (
`salariul` decimal(10,0)
);

-- --------------------------------------------------------

--
-- Структура таблицы `ANGAJATI`
--

CREATE TABLE `ANGAJATI` (
  `ID_ANGAJAT` decimal(10,0) NOT NULL,
  `PRENUME` varchar(20) DEFAULT NULL,
  `NUME` varchar(25) DEFAULT NULL,
  `EMAIL` varchar(25) DEFAULT NULL,
  `TELEFON` varchar(20) DEFAULT NULL,
  `DATA_ANGAJARE` date DEFAULT NULL,
  `ID_FUNCTIE` varchar(10) DEFAULT NULL,
  `SALARIUL` decimal(10,0) DEFAULT NULL,
  `COMISION` decimal(10,0) DEFAULT NULL,
  `ID_MANAGER` decimal(10,0) DEFAULT NULL,
  `ID_DEPARTAMENT` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ANGAJATI`
--

/*INSERT INTO `ANGAJATI` (`ID_ANGAJAT`, `PRENUME`, `NUME`, `EMAIL`, `TELEFON`, `DATA_ANGAJARE`, `ID_FUNCTIE`, `SALARIUL`, `COMISION`, `ID_MANAGER`, `ID_DEPARTAMENT`) VALUES
('100', 'Steven', 'King', 'SKING', '515.123.4567', '1987-06-17', 'AD_PRES', '24000', NULL, '100', '90'),
('101', 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', '1980-06-17', 'AD_VP', '17000', NULL, '100', '90'),
('102', 'Lex', 'De Haan', 'LDEHAAN', '515.123.4569', '1980-06-17', 'AD_VP', '17000', NULL, '100', '90'),
('103', 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567', '1980-06-17', 'IT_PROG', '9000', NULL, '0', '60'),
('104', 'Bruce', 'Ernst', 'BERNST', '590.423.4568', '1980-06-17', 'IT_PROG', '6000', NULL, '103', '60'),
('105', 'David', 'Austin', 'DAUSTIN', '590.423.4569', '1980-06-17', 'IT_PROG', '4800', NULL, '103', '60'),
('106', 'Valli', 'Pataballa', 'VPATABAL', '590.423.4560', '1980-06-17', 'IT_PROG', '4800', NULL, '103', '60'),
('107', 'Diana', 'Lorentz', 'DLORENTZ', '590.423.5567', '1980-06-17', 'IT_PROG', '4200', NULL, '103', '60'),
('108', 'Nancy', 'Greenberg', 'NGREENBE', '515.124.4569', '1994-06-17', 'FI_MGR', '12000', NULL, '108', '100'),
('109', 'Daniel', 'Faviet', 'DFAVIET', '515.124.4169', '1980-06-17', 'FI_ACCOUNT', '9000', NULL, '108', '100'),
('110', 'John', 'Chen', 'JCHEN', '515.124.4269', '1994-06-17', 'FI_ACCOUNT', '8200', NULL, '108', '100'),
('111', 'Ismael', 'Sciarra', 'ISCIARRA', '515.124.4369', '1980-06-17', 'FI_ACCOUNT', '7700', NULL, '0', '100'),
('112', 'Jose Manuel', 'Urman', 'JMURMAN', '515.124.4469', '1980-06-17', 'FI_ACCOUNT', '7800', NULL, '108', '100'),
('113', 'Luis', 'Popp', 'LPOPP', '515.124.4567', '1980-06-17', 'FI_ACCOUNT', '6900', NULL, '108', '100'),
('114', 'Den', 'Raphaely', 'DRAPHEAL', '515.127.4561', '1980-06-17', 'PU_MAN', '11000', NULL, '103', '30'),
('115', 'Alexander', 'Khoo', 'AKHOO', '515.127.4562', '1980-06-17', 'PU_CLERK', '3100', NULL, '103', '30'),
('116', 'Shelli', 'Baida', 'SBAIDA', '515.127.4563', '1980-06-17', 'PU_CLERK', '2900', NULL, '103', '30'),
('117', 'Sigal', 'Tobias', 'STOBIAS', '515.127.4564', '1994-06-17', 'PU_CLERK', '2800', NULL, '103', '30'),
('118', 'Guy', 'Himuro', 'GHIMURO', '515.127.4565', '1980-06-17', 'PU_CLERK', '2600', NULL, '103', '30'),
('119', 'Karen', 'Colmenares', 'KCOLMENA', '515.127.4566', '1980-06-17', 'PU_CLERK', '2500', NULL, '103', '30'),
('120', 'Matthew', 'Weiss', 'MWEISS', '650.123.1234', '1980-06-17', 'ST_MAN', '8000', NULL, '103', '50'),
('121', 'Adam', 'Fripp', 'AFRIPP', '650.123.2234', '1980-06-17', 'ST_MAN', '8200', NULL, '103', '50'),
('122', 'Payam', 'Kaufling', 'PKAUFLIN', '650.123.3234', '1980-06-17', 'ST_MAN', '7900', NULL, '0', '50'),
('123', 'Shanta', 'Vollman', 'SVOLLMAN', '650.123.4234', '1980-06-17', 'ST_MAN', '6500', NULL, '0', '50'),
('124', 'Kevin', 'Mourgos', 'KMOURGOS', '650.123.5234', '1980-06-17', 'ST_MAN', '5800', NULL, '103', '50'),
('125', 'Julia', 'Nayer', 'JNAYER', '650.124.1214', '1980-06-17', 'ST_CLERK', '3200', NULL, '103', '50'),
('126', 'Irene', 'Mikkilineni', 'IMIKKILI', '650.124.1224', '1980-06-17', 'ST_CLERK', '2700', NULL, '103', '50'),
('127', 'James', 'Landry', 'JLANDRY', '650.124.1334', '1980-06-17', 'ST_CLERK', '2400', NULL, '103', '50'),
('128', 'Steven', 'Markle', 'SMARKLE', '650.124.1434', '1980-06-17', 'ST_CLERK', '2200', NULL, '103', '50'),
('129', 'Laura', 'Bissot', 'LBISSOT', '650.124.5234', '1980-06-17', 'ST_CLERK', '3300', NULL, '103', '50'),
('130', 'Mozhe', 'Atkinson', 'MATKINSO', '650.124.6234', '1980-06-17', 'ST_CLERK', '2800', NULL, '103', '50'),
('131', 'James', 'Marlow', 'JAMRLOW', '650.124.7234', '1980-06-17', 'ST_CLERK', '2500', NULL, '103', '50'),
('132', 'TJ', 'Olson', 'TJOLSON', '650.124.8234', '1980-06-17', 'ST_CLERK', '2100', NULL, '103', '50'),
('133', 'Jason', 'Mallin', 'JMALLIN', '650.127.1934', '1980-06-17', 'ST_CLERK', '3300', NULL, '103', '50'),
('134', 'Michael', 'Rogers', 'MROGERS', '650.127.1834', '1980-06-17', 'ST_CLERK', '2900', NULL, '103', '50'),
('135', 'Ki', 'Gee', 'KGEE', '650.127.1734', '1980-06-17', 'ST_CLERK', '2400', NULL, '103', '50'),
('136', 'Hazel', 'Philtanker', 'HPHILTAN', '650.127.1634', '1980-06-17', 'ST_CLERK', '2200', NULL, '103', '50'),
('137', 'Renske', 'Ladwig', 'RLADWIG', '650.121.1234', '1980-06-17', 'ST_CLERK', '3600', NULL, '103', '50'),
('138', 'Stephen', 'Stiles', 'SSTILES', '650.121.2034', '1980-06-17', 'ST_CLERK', '3200', NULL, '103', '50'),
('139', 'John', 'Seo', 'JSEO', '650.121.2019', '1980-06-17', 'ST_CLERK', '2700', NULL, '103', '50'),
('140', 'Joshua', 'Patel', 'JPATEL', '650.121.1834', '1980-06-17', 'ST_CLERK', '2500', NULL, '103', '50'),
('141', 'Trenna', 'Rajs', 'TRAJS', '650.121.8009', '1980-06-17', 'ST_CLERK', '3500', NULL, '103', '50'),
('142', 'Curtis', 'Davies', 'CDAVIES', '650.121.2994', '1980-06-17', 'ST_CLERK', '3100', NULL, '103', '50'),
('143', 'Randall', 'Matos', 'RMATOS', '650.121.2874', '1980-06-17', 'ST_CLERK', '2600', NULL, '103', '50'),
('144', 'Peter', 'Vargas', 'PVARGAS', '650.121.2004', '1980-06-17', 'ST_CLERK', '2500', NULL, '103', '50'),
('145', 'John', 'Russell', 'JRUSSEL', '011.44.1344.429268', '1980-06-17', 'SA_MAN', '14000', '0', '103', '80'),
('146', 'Karen', 'Partners', 'KPARTNER', '011.44.1344.467268', '1980-06-17', 'SA_MAN', '13500', '0', '103', '80'),
('147', 'Alberto', 'Errazuriz', 'AERRAZUR', '011.44.1344.429278', '1980-06-17', 'SA_MAN', '12000', '0', '103', '80'),
('148', 'Gerald', 'Cambrault', 'GCAMBRAU', '011.44.1344.619268', '1980-06-17', 'SA_MAN', '11000', '0', '103', '80'),
('149', 'Eleni', 'Zlotkey', 'EZLOTKEY', '011.44.1344.429018', '1980-06-17', 'SA_MAN', '10500', '0', '103', '80'),
('150', 'Peter', 'Tucker', 'PTUCKER', '011.44.1344.129268', '1980-06-17', 'SA_REP', '10000', '0', '103', '80'),
('151', 'David', 'Bernstein', 'DBERNSTE', '011.44.1344.345268', '1980-06-17', 'SA_REP', '9500', '0', '103', '80'),
('152', 'Peter', 'Hall', 'PHALL', '011.44.1344.478968', '1980-06-17', 'SA_REP', '9000', '0', '103', '80'),
('153', 'Christopher', 'Olsen', 'COLSEN', '011.44.1344.498718', '1980-06-17', 'SA_REP', '8000', '0', '103', '80'),
('154', 'Nanette', 'Cambrault', 'NCAMBRAU', '011.44.1344.987668', '1980-06-17', 'SA_REP', '7500', '0', '103', '80'),
('155', 'Oliver', 'Tuvault', 'OTUVAULT', '011.44.1344.486508', '1980-06-17', 'SA_REP', '7000', '0', '103', '80'),
('156', 'Janette', 'King', 'JKING', '011.44.1345.429268', '1980-06-17', 'SA_REP', '10000', '0', '103', '80'),
('157', 'Patrick', 'Sully', 'PSULLY', '011.44.1345.929268', '1980-06-17', 'SA_REP', '9500', '0', '103', '80'),
('158', 'Allan', 'McEwen', 'AMCEWEN', '011.44.1345.829268', '1980-06-17', 'SA_REP', '9000', '0', '103', '80'),
('159', 'Lindsey', 'Smith', 'LSMITH', '011.44.1345.729268', '1980-06-17', 'SA_REP', '8000', '0', '103', '80'),
('160', 'Louise', 'Doran', 'LDORAN', '011.44.1345.629268', '1980-06-17', 'SA_REP', '7500', '0', '103', '80'),
('161', 'Sarath', 'Sewall', 'SSEWALL', '011.44.1345.529268', '1980-06-17', 'SA_REP', '7000', '0', '103', '80'),
('162', 'Clara', 'Vishney', 'CVISHNEY', '011.44.1346.129268', '1980-06-17', 'SA_REP', '10500', '0', '103', '80'),
('163', 'Danielle', 'Greene', 'DGREENE', '011.44.1346.229268', '1980-06-17', 'SA_REP', '9500', '25', '103', '80'),
('164', 'Mattea', 'Marvins', 'MMARVINS', '011.44.1346.329268', '1980-06-17', 'SA_REP', '7200', '20', '103', '80'),
('165', 'David', 'Lee', 'DLEE', '011.44.1346.529268', '1980-06-17', 'SA_REP', '6800', '5', '101', '80'),
('166', 'Sundar', 'Ande', 'SANDE', '011.44.1346.629268', '1980-06-17', 'SA_REP', '6400', '10', '103', '80'),
('167', 'Amit', 'Banda', 'ABANDA', '011.44.1346.729268', '1980-06-17', 'SA_REP', '6200', '10', '0', '80'),
('168', 'Lisa', 'Ozer', 'LOZER', '011.44.1343.929268', '1980-06-17', 'SA_REP', '11500', '15', '103', '80'),
('169', 'Harrison', 'Bloom', 'HBLOOM', '011.44.1343.829268', '1980-06-17', 'SA_REP', '10000', '12', '101', '80'),
('170', 'Tayler', 'Fox', 'TFOX', '011.44.1343.729268', '1980-06-17', 'SA_REP', '9600', '10', '101', '80'),
('171', 'William', 'Smith', 'WSMITH', '011.44.1343.629268', '1980-06-17', 'SA_REP', '7400', '20', '103', '80'),
('172', 'Elizabeth', 'Bates', 'EBATES', '011.44.1343.529268', '1980-06-17', 'SA_REP', '7300', '15', '103', '80'),
('173', 'Sundita', 'Kumar', 'SKUMAR', '011.44.1343.329268', '1980-06-17', 'SA_REP', '6100', '0', '103', '80'),
('174', 'Ellen', 'Abel', 'EABEL', '011.44.1644.429267', '1980-06-17', 'SA_REP', '11000', '0', '103', '80'),
('175', 'Alyssa', 'Hutton', 'AHUTTON', '011.44.1644.429266', '1980-06-17', 'SA_REP', '8800', '0', '103', '80'),
('176', 'Jonathon', 'Taylor', 'JTAYLOR', '011.44.1644.429265', '1980-06-17', 'SA_REP', '8600', '0', '103', '80'),
('177', 'Jack', 'Livingston', 'JLIVINGS', '011.44.1644.429264', '1980-06-17', 'SA_REP', '8400', '0', '103', '80'),
('178', 'Kimberely', 'Grant', 'KGRANT', '011.44.1644.429263', '1980-06-17', 'SA_REP', '7000', '0', '103', NULL),
('179', 'Charles', 'Johnson', 'CJOHNSON', '011.44.1644.429262', '1980-06-17', 'SA_REP', '6200', '0', '103', '80'),
('180', 'Winston', 'Taylor', 'WTAYLOR', '650.507.9876', '1980-06-17', 'SH_CLERK', '3200', NULL, '103', '50'),
('181', 'Jean', 'Fleaur', 'JFLEAUR', '650.507.9877', '1980-06-17', 'SH_CLERK', '3100', NULL, '103', '50'),
('182', 'Martha', 'Sullivan', 'MSULLIVA', '650.507.9878', '1980-06-17', 'SH_CLERK', '2500', NULL, '103', '50'),
('183', 'Girard', 'Geoni', 'GGEONI', '650.507.9879', '1980-06-17', 'SH_CLERK', '2800', NULL, '103', '50'),
('184', 'Nandita', 'Sarchand', 'NSARCHAN', '650.509.1876', '1980-06-17', 'SH_CLERK', '4200', NULL, '103', '50'),
('185', 'Alexis', 'Bull', 'ABULL', '650.509.2876', '1980-06-17', 'SH_CLERK', '4100', NULL, '103', '50'),
('186', 'Julia', 'Dellinger', 'JDELLING', '650.509.3876', '1980-06-17', 'SH_CLERK', '3400', NULL, '103', '50'),
('187', 'Anthony', 'Cabrio', 'ACABRIO', '650.509.4876', '1980-06-17', 'SH_CLERK', '3000', NULL, '103', '50'),
('188', 'Kelly', 'Chung', 'KCHUNG', '650.505.1876', '1980-06-17', 'SH_CLERK', '3800', NULL, '0', '50'),
('189', 'Jennifer', 'Dilly', 'JDILLY', '650.505.2876', '1980-06-17', 'SH_CLERK', '3600', NULL, '103', '50'),
('190', 'Timothy', 'Gates', 'TGATES', '650.505.3876', '1980-06-17', 'SH_CLERK', '2900', NULL, '103', '50'),
('191', 'Randall', 'Perkins', 'RPERKINS', '650.505.4876', '1980-06-17', 'SH_CLERK', '2500', NULL, '103', '50'),
('192', 'Sarah', 'Bell', 'SBELL', '650.501.1876', '1980-06-17', 'SH_CLERK', '4000', NULL, '103', '50'),
('193', 'Britney', 'Everett', 'BEVERETT', '650.501.2876', '1980-06-17', 'SH_CLERK', '3900', NULL, '103', '50'),
('194', 'Samuel', 'McCain', 'SMCCAIN', '650.501.3876', '1980-06-17', 'SH_CLERK', '3200', NULL, '103', '50'),
('195', 'Vance', 'Jones', 'VJONES', '650.501.4876', '1980-06-17', 'SH_CLERK', '2800', NULL, '103', '50'),
('196', 'Alana', 'Walsh', 'AWALSH', '650.507.9811', '1980-06-17', 'SH_CLERK', '3100', NULL, '103', '50'),
('197', 'Kevin', 'Feeney', 'KFEENEY', '650.507.9822', '1980-06-17', 'SH_CLERK', '3000', NULL, '103', '50'),
('198', 'Donald', 'OConnell', 'DOCONNEL', '650.507.9833', '1980-06-17', 'SH_CLERK', '2600', NULL, '103', '50'),
('199', 'Douglas', 'Grant', 'DGRANT', '650.507.9844', '1980-06-17', 'SH_CLERK', '2600', NULL, '103', '50'),
('200', 'Jennifer', 'Whalen', 'JWHALEN', '515.123.4444', '1980-06-17', 'AD_ASST', '4400', NULL, '103', '10'),
('201', 'Michael', 'Hartstein', 'MHARTSTE', '515.123.5555', '1980-06-17', 'MK_MAN', '13000', NULL, '103', '20'),
('202', 'Pat', 'Fay', 'PFAY', '603.123.6666', '1980-06-17', 'MK_REP', '6000', NULL, '103', '20'),
('203', 'Susan', 'Mavris', 'SMAVRIS', '515.123.7777', '1980-06-17', 'HR_REP', '6500', NULL, '103', '40'),
('204', 'Hermann', 'Baer', 'HBAER', '515.123.8888', '1980-06-17', 'PR_REP', '10000', NULL, '103', '70'),
('205', 'Shelley', 'Higgins', 'SHIGGINS', '515.123.8080', '1980-06-17', 'AC_MGR', '12000', NULL, '103', '110'),
('206', 'William', 'Gietz', 'WGIETZ', '515.123.8181', '1980-06-17', 'AC_ACCOUNT', '8300', NULL, '103', '110'),
('276', 'Jonathon', 'Taylor', 'JTAYLOR', '011.44.1644.429265', '1998-03-24', 'SA_REP', '8600', '0', '103', '80'),
('350', 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', '1989-09-21', 'AD_VP', '17000', NULL, '100', '90'),
('351', 'Lex', 'De Haan', 'LDEHAAN', '515.123.4569', '1993-01-13', 'AD_VP', '17000', NULL, '100', '90'),
('352', 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567', '1990-01-03', 'IT_PROG', '9000', NULL, '103', '60'),
('554', 'Bruce', 'Ernst', 'BERNST', '590.423.4568', '1991-05-21', 'IT_PROG', '6000', NULL, '103', '60'),
('555', 'David', 'Austin', 'DAUSTIN', '590.423.4569', '1997-06-25', 'IT_PROG', '4800', NULL, '103', '60'),
('556', 'Valli', 'Pataballa', 'VPATABAL', '590.423.4560', '1998-02-05', 'IT_PROG', '4800', NULL, '103', '60'),
('557', 'Diana', 'Lorentz', 'DLORENTZ', '590.423.5567', '1999-02-07', 'IT_PROG', '4200', NULL, '103', '60'),
('558', 'Nancy', 'Greenberg', 'NGREENBE', '515.124.4569', '1994-08-17', 'FI_MGR', '12000', NULL, '108', '100'),
('559', 'Daniel', 'Faviet', 'DFAVIET', '515.124.4169', '1994-08-16', 'FI_ACCOUNT', '9000', NULL, '108', '100'),
('560', 'John', 'Chen', 'JCHEN', '515.124.4269', '1997-09-28', 'FI_ACCOUNT', '8200', NULL, '108', '100'),
('561', 'Ismael', 'Sciarra', 'ISCIARRA', '515.124.4369', '1997-09-30', 'FI_ACCOUNT', '7700', NULL, '108', '100'),
('562', 'Jose Manuel', 'Urman', 'JMURMAN', '515.124.4469', '1998-03-07', 'FI_ACCOUNT', '7800', NULL, '108', '100'),
('563', 'Luis', 'Popp', 'LPOPP', '515.124.4567', '1999-12-07', 'FI_ACCOUNT', '6900', NULL, '108', '100'),
('564', 'Den', 'Raphaely', 'DRAPHEAL', '515.127.4561', '1994-12-07', 'PU_MAN', '11000', NULL, '101', '30'),
('565', 'Alexander', 'Khoo', 'AKHOO', '515.127.4562', '1995-05-18', 'PU_CLERK', '3100', NULL, '101', '30'),
('566', 'Shelli', 'Baida', 'SBAIDA', '515.127.4563', '1997-12-24', 'PU_CLERK', '2900', NULL, '103', '30'),
('567', 'Sigal', 'Tobias', 'STOBIAS', '515.127.4564', '1997-07-24', 'PU_CLERK', '2800', NULL, '103', '30'),
('568', 'Guy', 'Himuro', 'GHIMURO', '515.127.4565', '1998-11-15', 'PU_CLERK', '2600', NULL, '103', '30'),
('569', 'Karen', 'Colmenares', 'KCOLMENA', '515.127.4566', '1999-08-10', 'PU_CLERK', '2500', NULL, '103', '30'),
('570', 'Matthew', 'Weiss', 'MWEISS', '650.123.1234', '1996-07-18', 'ST_MAN', '8000', NULL, '103', '50'),
('571', 'Adam', 'Fripp', 'AFRIPP', '650.123.2234', '1997-04-10', 'ST_MAN', '8200', NULL, '103', '50'),
('572', 'Payam', 'Kaufling', 'PKAUFLIN', '650.123.3234', '1995-05-01', 'ST_MAN', '7900', NULL, '103', '50'),
('573', 'Shanta', 'Vollman', 'SVOLLMAN', '650.123.4234', '1997-10-10', 'ST_MAN', '6500', '30', '103', '50'),
('574', 'Kevin', 'Mourgos', 'KMOURGOS', '650.123.5234', '1999-11-16', 'ST_MAN', '5800', NULL, '103', '50'),
('575', 'Julia', 'Nayer', 'JNAYER', '650.124.1214', '1997-07-16', 'ST_CLERK', '3200', '25', '103', '50'),
('576', 'Irene', 'Mikkilineni', 'IMIKKILI', '650.124.1224', '1998-09-28', 'ST_CLERK', '2700', NULL, '103', '50'),
('577', 'James', 'Landry', 'JLANDRY', '650.124.1334', '1999-01-14', 'ST_CLERK', '2400', NULL, '103', '50'),
('578', 'Steven', 'Markle', 'SMARKLE', '650.124.1434', '2000-03-08', 'ST_CLERK', '2200', NULL, '103', '50'),
('579', 'Laura', 'Bissot', 'LBISSOT', '650.124.5234', '1997-08-20', 'ST_CLERK', '3300', NULL, '103', '50'),
('580', 'Mozhe', 'Atkinson', 'MATKINSO', '650.124.6234', '1997-10-30', 'ST_CLERK', '2800', NULL, '103', '50'),
('581', 'James', 'Marlow', 'JAMRLOW', '650.124.7234', '1997-02-16', 'ST_CLERK', '2500', NULL, '103', '50'),
('582', 'TJ', 'Olson', 'TJOLSON', '650.124.8234', '1999-04-10', 'ST_CLERK', '2100', NULL, '103', '50'),
('583', 'Jason', 'Mallin', 'JMALLIN', '650.127.1934', '1996-06-14', 'ST_CLERK', '3300', NULL, '103', '50'),
('584', 'Michael', 'Rogers', 'MROGERS', '650.127.1834', '1998-08-26', 'ST_CLERK', '2900', NULL, '103', '50'),
('585', 'Ki', 'Gee', 'KGEE', '650.127.1734', '1999-12-12', 'ST_CLERK', '2400', NULL, '103', '50'),
('586', 'Hazel', 'Philtanker', 'HPHILTAN', '650.127.1634', '2000-02-06', 'ST_CLERK', '2200', NULL, '103', '50'),
('587', 'Renske', 'Ladwig', 'RLADWIG', '650.121.1234', '1995-07-14', 'ST_CLERK', '3600', NULL, '103', '50'),
('588', 'Stephen', 'Stiles', 'SSTILES', '650.121.2034', '1997-10-26', 'ST_CLERK', '3200', NULL, '103', '50'),
('589', 'John', 'Seo', 'JSEO', '650.121.2019', '1998-02-12', 'ST_CLERK', '2700', NULL, '103', '50'),
('590', 'Joshua', 'Patel', 'JPATEL', '650.121.1834', '1998-04-06', 'ST_CLERK', '2500', NULL, '103', '50'),
('601', 'David', 'Bernstein', 'DBERNSTE', '011.44.1344.345268', '1997-03-24', 'SA_REP', '9500', '0', '103', '80'),
('602', 'Peter', 'Hall', 'PHALL', '011.44.1344.478968', '1997-08-20', 'SA_REP', '9000', '0', '103', '80'),
('603', 'Christopher', 'Olsen', 'COLSEN', '011.44.1344.498718', '1998-03-30', 'SA_REP', '8000', '0', '103', '80'),
('604', 'Nanette', 'Cambrault', 'NCAMBRAU', '011.44.1344.987668', '1998-12-09', 'SA_REP', '7500', '0', '103', '80'),
('605', 'Oliver', 'Tuvault', 'OTUVAULT', '011.44.1344.486508', '1999-11-23', 'SA_REP', '7000', '0', '103', '80'),
('606', 'Janette', 'King', 'JKING', '011.44.1345.429268', '1996-01-30', 'SA_REP', '10000', '0', '103', '80'),
('607', 'Patrick', 'Sully', 'PSULLY', '011.44.1345.929268', '1996-03-04', 'SA_REP', '9500', '0', '103', '80'),
('608', 'Allan', 'McEwen', 'AMCEWEN', '011.44.1345.829268', '1996-08-01', 'SA_REP', '9000', '0', '103', '80'),
('609', 'Lindsey', 'Smith', 'LSMITH', '011.44.1345.729268', '1997-03-10', 'SA_REP', '8000', '0', '103', '80'),
('610', 'Louise', 'Doran', 'LDORAN', '011.44.1345.629268', '1997-12-15', 'SA_REP', '7500', '0', '103', '80'),
('611', 'Sarath', 'Sewall', 'SSEWALL', '011.44.1345.529268', '1998-11-03', 'SA_REP', '7000', '0', '103', '80'),
('612', 'Clara', 'Vishney', 'CVISHNEY', '011.44.1346.129268', '1997-11-11', 'SA_REP', '10500', '0', '103', '80'),
('613', 'Danielle', 'Greene', 'DGREENE', '011.44.1346.229268', '1999-03-19', 'SA_REP', '9500', '0', '103', '80'),
('614', 'Mattea', 'Marvins', 'MMARVINS', '011.44.1346.329268', '2000-01-24', 'SA_REP', '7200', '0', '103', '80'),
('615', 'David', 'Lee', 'DLEE', '011.44.1346.529268', '2000-02-23', 'SA_REP', '6800', '0', '103', '80'),
('616', 'Sundar', 'Ande', 'SANDE', '011.44.1346.629268', '2000-03-24', 'SA_REP', '6400', '0', '103', '80'),
('617', 'Amit', 'Banda', 'ABANDA', '011.44.1346.729268', '2000-04-21', 'SA_REP', '6200', '0', '103', '80'),
('618', 'Lisa', 'Ozer', 'LOZER', '011.44.1343.929268', '1997-03-11', 'SA_REP', '11500', '0', '103', '80'),
('619', 'Harrison', 'Bloom', 'HBLOOM', '011.44.1343.829268', '1998-03-23', 'SA_REP', '10000', '0', '103', '80'),
('620', 'Tayler', 'Fox', 'TFOX', '011.44.1343.729268', '1998-01-24', 'SA_REP', '9600', '0', '103', '80'),
('621', 'William', 'Smith', 'WSMITH', '011.44.1343.629268', '1999-02-23', 'SA_REP', '7400', '0', '103', '80'),
('622', 'Elizabeth', 'Bates', 'EBATES', '011.44.1343.529268', '1999-03-24', 'SA_REP', '7300', '0', '103', '80'),
('623', 'Sundita', 'Kumar', 'SKUMAR', '011.44.1343.329268', '2000-04-21', 'SA_REP', '6100', '0', '103', '80'),
('624', 'Ellen', 'Abel', 'EABEL', '011.44.1644.429267', '1996-05-11', 'SA_REP', '11000', '0', '103', '80'),
('625', 'Alyssa', 'Hutton', 'AHUTTON', '011.44.1644.429266', '1997-03-19', 'SA_REP', '8800', '0', '103', '80'),
('627', 'Jack', 'Livingston', 'JLIVINGS', '011.44.1644.429264', '1998-04-23', 'SA_REP', '8400', '0', '103', '80'),
('628', 'Kimberely', 'Grant', 'KGRANT', '011.44.1644.429263', '1999-05-24', 'SA_REP', '7000', '0', '103', NULL),
('629', 'Charles', 'Johnson', 'CJOHNSON', '011.44.1644.429262', '2000-01-04', 'SA_REP', '6200', '0', '103', '80'),
('630', 'Winston', 'Taylor', 'WTAYLOR', '650.507.9876', '1998-01-24', 'SH_CLERK', '3200', NULL, '103', '50'),
('631', 'Jean', 'Fleaur', 'JFLEAUR', '650.507.9877', '1998-02-23', 'SH_CLERK', '3100', NULL, '103', '50'),
('632', 'Martha', 'Sullivan', 'MSULLIVA', '650.507.9878', '1999-06-21', 'SH_CLERK', '2500', NULL, '103', '50'),
('633', 'Girard', 'Geoni', 'GGEONI', '650.507.9879', '2000-02-03', 'SH_CLERK', '2800', NULL, '103', '50'),
('634', 'Nandita', 'Sarchand', 'NSARCHAN', '650.509.1876', '1996-01-27', 'SH_CLERK', '4200', NULL, '103', '50'),
('635', 'Alexis', 'Bull', 'ABULL', '650.509.2876', '1997-02-20', 'SH_CLERK', '4100', NULL, '103', '50'),
('636', 'Julia', 'Dellinger', 'JDELLING', '650.509.3876', '1998-06-24', 'SH_CLERK', '3400', NULL, '103', '50'),
('637', 'Anthony', 'Cabrio', 'ACABRIO', '650.509.4876', '1999-02-07', 'SH_CLERK', '3000', NULL, '103', '50'),
('638', 'Kelly', 'Chung', 'KCHUNG', '650.505.1876', '1997-06-14', 'SH_CLERK', '3800', NULL, '103', '50'),
('639', 'Jennifer', 'Dilly', 'JDILLY', '650.505.2876', '1997-08-13', 'SH_CLERK', '3600', NULL, '103', '50'),
('640', 'Timothy', 'Gatesa', 'TGATES', '650.505.3876', '1998-07-11', 'SH_CLERK', '2900', NULL, '103', '50'),
('641', 'Randall', 'Perkins', 'RPERKINS', '650.505.4876', '1999-12-19', 'SH_CLERK', '2500', NULL, '103', '50'),
('642', 'Sarah', 'Bell', 'SBELL', '650.501.1876', '1996-02-04', 'SH_CLERK', '4000', NULL, '103', '50'),
('643', 'Britney', 'Everett', 'BEVERETT', '650.501.2876', '1997-03-03', 'SH_CLERK', '3900', NULL, '103', '50'),
('644', 'Samuel', 'McCain', 'SMCCAIN', '650.501.3876', '1998-07-01', 'SH_CLERK', '3200', NULL, '103', '50'),
('645', 'Vance', 'Jones', 'VJONES', '650.501.4876', '1999-03-17', 'SH_CLERK', '2800', NULL, '103', '50'),
('646', 'Alana', 'Walsh', 'AWALSH', '650.507.9811', '1998-04-24', 'SH_CLERK', '3100', NULL, '103', '50'),
('647', 'Kevin', 'Feeney', 'KFEENEY', '650.507.9822', '1998-05-23', 'SH_CLERK', '3000', NULL, '103', '50'),
('658', 'Donald', 'OConnell', 'DOCONNEL', '650.507.9833', '1999-06-21', 'SH_CLERK', '2600', NULL, '103', '50'),
('659', 'Douglas', 'Grant', 'DGRANT', '650.507.9844', '2000-01-13', 'SH_CLERK', '2600', NULL, '103', '50'),
('660', 'Jennifer', 'Whalen', 'JWHALEN', '515.123.4444', '1987-09-17', 'AD_ASST', '4400', NULL, '103', '10'),
('661', 'Michael', 'Hartstein', 'MHARTSTE', '515.123.5555', '1996-02-17', 'MK_MAN', '13000', NULL, '103', '20'),
('662', 'Pat', 'Fay', 'PFAY', '603.123.6666', '1997-08-17', 'MK_REP', '6000', NULL, '103', '20'),
('663', 'Susan', 'Mavris', 'SMAVRIS', '515.123.7777', '1994-06-07', 'HR_REP', '6500', NULL, '103', '40'),
('664', 'Hermann', 'Baer', 'HBAER', '515.123.8888', '1994-06-07', 'PR_REP', '10000', NULL, '103', '70'),
('665', 'Shelley', 'Higgins', 'SHIGGINS', '515.123.8080', '1994-06-07', 'AC_MGR', '12000', NULL, '103', '110'),
('666', 'William', 'Gietz', 'WGIETZ', '51hr5.123.8181', '1994-06-07', 'AC_ACCOUNT', '8300', NULL, '103', '110');*/

-- --------------------------------------------------------

--
-- Структура таблицы `CLIENTI`
--

CREATE TABLE `CLIENTI` (
  `ID_CLIENT` decimal(10,0) NOT NULL,
  `PRENUME_CLIENT` varchar(20) DEFAULT NULL,
  `NUME_CLIENT` varchar(20) DEFAULT NULL,
  `TELEFON` varchar(20) DEFAULT NULL,
  `LIMITA_CREDIT` decimal(10,0) DEFAULT NULL,
  `EMAIL_CLIENT` varchar(30) DEFAULT NULL,
  `DATA_NASTERE` date DEFAULT NULL,
  `STAREA_CIVILA` varchar(20) DEFAULT NULL,
  `SEX` varchar(1) DEFAULT NULL,
  `NIVEL_VENITURI` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `CLIENTI`
--

/*INSERT INTO `CLIENTI` (`ID_CLIENT`, `PRENUME_CLIENT`, `NUME_CLIENT`, `TELEFON`, `LIMITA_CREDIT`, `EMAIL_CLIENT`, `DATA_NASTERE`, `STAREA_CIVILA`, `SEX`, `NIVEL_VENITURI`) VALUES
('101', 'Constantin', 'Welles', NULL, '100', 'Constantin.Welles@ANHINGA.COM', '1960-10-21', 'married', 'M', 'B: 30,000 - 49,999'),
('102', 'Harrison', 'Pacino', NULL, '100', 'Harrison.Pacino@ANI.COM', '1960-10-21', 'single', 'M', 'I: 170,000 - 189,999'),
('103', 'Manisha', 'Taylor', NULL, '100', 'Manisha.Taylor@AUKLET.COM', '1960-10-21', 'married', 'F', 'H: 150,000 - 169,999'),
('104', 'Harrison', 'Sutherland', NULL, '100', 'Harrison.Sutherland@GODWIT.COM', '1960-10-21', 'single', 'F', 'H: 150,000 - 169,999'),
('105', 'Matthias', 'MacGraw', NULL, '100', 'Matthias.MacGraw@GOLDENEYE.COM', '1960-10-21', 'married', 'F', 'C: 50,000 - 69,999'),
('106', 'Matthias', 'Hannah', NULL, '100', 'Matthias.Hannah@GREBE.COM', '1960-10-21', 'single', 'M', 'F: 110,000 - 129,999'),
('107', 'Matthias', 'Cruise', NULL, '100', 'Matthias.Cruise@GROSBEAK.COM', '1960-10-21', 'married', 'F', 'G: 130,000 - 149,999'),
('108', 'Meenakshi', 'Mason', NULL, '100', 'Meenakshi.Mason@JACANA.COM', '1960-10-21', 'married', 'M', 'H: 150,000 - 169,999'),
('109', 'Christian', 'Cage', NULL, '100', 'Christian.Cage@KINGLET.COM', '1960-10-21', 'single', 'M', 'F: 110,000 - 129,999'),
('110', 'Charlie', 'Sutherland', NULL, '200', 'Charlie.Sutherland@LIMPKIN.COM', '1960-10-21', 'married', 'M', 'G: 130,000 - 149,999'),
('111', 'Charlie', 'Pacino', NULL, '200', 'Charlie.Pacino@LONGSPUR.COM', '1960-10-21', 'single', 'M', 'G: 130,000 - 149,999'),
('112', 'Guillaume', 'Jackson', NULL, '200', 'Guillaume.Jackson@MOORHEN.COM', '1960-10-21', 'married', 'M', 'I: 170,000 - 189,999'),
('113', 'Daniel', 'Costner', NULL, '200', 'Daniel.Costner@PARULA.COM', '1960-10-21', 'single', 'M', 'I: 170,000 - 189,999'),
('114', 'Dianne', 'Derek', NULL, '200', 'Dianne.Derek@SAW-WHET.COM', '1960-10-21', 'married', 'M', 'H: 150,000 - 169,999'),
('115', 'Geraldine', 'Schneider', NULL, '200', 'Geraldine.Schneider@SCAUP.COM', '1960-10-21', 'married', 'M', 'B: 30,000 - 49,999'),
('116', 'Geraldine', 'Martin', NULL, '200', 'Geraldine.Martin@SCOTER.COM', '1960-10-21', 'single', 'M', 'A: Below 30,000'),
('117', 'Guillaume', 'Edwards', NULL, '200', 'Guillaume.Edwards@SHRIKE.COM', '1960-10-21', 'married', 'M', 'E: 90,000 - 109,999'),
('118', 'Maurice', 'Mahoney', NULL, '200', 'Maurice.Mahoney@SNIPE.COM', '1960-10-21', 'single', 'M', 'F: 110,000 - 129,999'),
('119', 'Maurice', 'Hasan', NULL, '200', 'Maurice.Hasan@STILT.COM', '1960-10-21', 'married', 'M', 'G: 130,000 - 149,999'),
('120', 'Diane', 'Higgins', NULL, '200', 'Diane.Higgins@TANAGER.COM', '1960-10-21', 'single', 'M', 'H: 150,000 - 169,999'),
('121', 'Dianne', 'Sen', NULL, '200', 'Dianne.Sen@TATTLER.COM', '1960-10-21', 'married', 'M', 'H: 150,000 - 169,999'),
('122', 'Maurice', 'Daltrey', NULL, '200', 'Maurice.Daltrey@TEAL.COM', '1960-10-21', 'married', 'M', 'A: Below 30,000'),
('123', 'Elizabeth', 'Brown', NULL, '200', 'Elizabeth.Brown@THRASHER.COM', '1960-10-21', 'single', 'F', 'F: 110,000 - 129,999'),
('124', 'Diane', 'Mason', NULL, '200', 'Diane.Mason@TROGON.COM', '1960-10-21', 'married', 'F', 'K: 250,000 - 299,999'),
('125', 'Dianne', 'Andrews', NULL, '200', 'Dianne.Andrews@TURNSTONE.COM', '1960-10-21', 'single', 'F', 'F: 110,000 - 129,999'),
('126', 'Charles', 'Field', NULL, '300', 'Charles.Field@BECARD.COM', '1960-10-21', 'married', 'F', 'F: 110,000 - 129,999'),
('127', 'Charles', 'Broderick', NULL, '300', 'Charles.Broderick@BITTERN.COM', '1960-10-21', 'single', 'F', 'B: 30,000 - 49,999'),
('128', 'Isabella', 'Reed', NULL, '300', 'Isabella.Reed@BRANT.COM', '1960-10-21', 'married', 'F', 'J: 190,000 - 249,999'),
('129', 'Louis', 'Jackson', NULL, '400', 'Louis.Jackson@CARACARA.COM', '1960-10-21', 'single', 'M', 'D: 70,000 - 89,999'),
('130', 'Louis', 'Edwards', NULL, '400', 'Louis.Edwards@CHACHALACA.COM', '1960-10-21', 'married', 'M', 'C: 50,000 - 69,999'),
('131', 'Doris', 'Dutt', NULL, '400', 'Doris.Dutt@CHUKAR.COM', '1960-10-21', 'married', 'F', 'C: 50,000 - 69,999'),
('132', 'Doris', 'Spacek', NULL, '400', 'Doris.Spacek@FLICKER.COM', '1960-10-21', 'single', 'M', 'H: 150,000 - 169,999'),
('133', 'Kristin', 'Malden', NULL, '400', 'Kristin.Malden@GODWIT.COM', '1960-10-21', 'married', 'F', 'C: 50,000 - 69,999'),
('134', 'Sissy', 'Puri', NULL, '400', 'Sissy.Puri@GREBE.COM', '1960-10-21', 'married', 'F', 'F: 110,000 - 129,999'),
('135', 'Doris', 'Bel Geddes', NULL, '400', 'Doris.BelGeddes@GROSBEAK.COM', '1960-10-21', 'single', 'F', 'B: 30,000 - 49,999'),
('136', 'Sissy', 'Warden', NULL, '400', 'Sissy.Warden@JACANA.COM', '1960-10-21', 'married', 'F', 'F: 110,000 - 129,999'),
('137', 'Elia', 'Brando', NULL, '500', 'Elia.Brando@JUNCO.COM', '1960-10-21', 'single', 'M', 'H: 150,000 - 169,999'),
('138', 'Mani', 'Fonda', NULL, '500', 'Mani.Fonda@KINGLET.COM', '1960-10-21', 'married', 'M', 'F: 110,000 - 129,999'),
('139', 'Placido', 'Kubrick', NULL, '500', 'Placido.Kubrick@SCOTER.COM', '1960-10-21', 'single', 'M', 'F: 110,000 - 129,999'),
('140', 'Claudia', 'Kurosawa', NULL, '500', 'Claudia.Kurosawa@CHUKAR.COM', '1960-10-21', 'married', 'M', 'E: 90,000 - 109,999'),
('141', 'Maximilian', 'Henner', NULL, '500', 'Maximilian.Henner@DUNLIN.COM', '1960-10-21', 'single', 'M', 'H: 150,000 - 169,999'),
('142', 'Sachin', 'Spielberg', NULL, '500', 'Sachin.Spielberg@GADWALL.COM', '1960-10-21', 'married', 'M', 'C: 50,000 - 69,999'),
('143', 'Sachin', 'Neeson', NULL, '500', 'Sachin.Neeson@GALLINULE.COM', '1960-10-21', 'single', 'M', 'F: 110,000 - 129,999'),
('144', 'Sivaji', 'Landis', NULL, '500', 'Sivaji.Landis@GOLDENEYE.COM', '1960-10-21', 'married', 'M', 'F: 110,000 - 129,999'),
('145', 'Mammutti', 'Pacino', NULL, '500', 'Mammutti.Pacino@GREBE.COM', '1960-10-21', 'single', 'M', 'F: 110,000 - 129,999'),
('146', 'Elia', 'Fawcett', NULL, '500', 'Elia.Fawcett@JACANA.COM', '1960-10-21', 'married', 'F', 'L: 300,000 and above'),
('147', 'Ishwarya', 'Roberts', NULL, '600', 'Ishwarya.Roberts@LAPWING.COM', '1960-10-21', 'single', 'F', 'G: 130,000 - 149,999'),
('148', 'Gustav', 'Steenburgen', NULL, '600', 'Gustav.Steenburgen@PINTAIL.COM', '1960-10-21', 'married', 'M', 'F: 110,000 - 129,999'),
('149', 'Markus', 'Rampling', NULL, '600', 'Markus.Rampling@PUFFIN.COM', '1960-10-21', 'single', 'M', 'D: 70,000 - 89,999'),
('150', 'Goldie', 'Slater', NULL, '700', 'Goldie.Slater@PYRRHULOXIA.COM', '1960-10-21', 'married', 'M', 'D: 70,000 - 89,999'),
('151', 'Divine', 'Aykroyd', NULL, '700', 'Divine.Aykroyd@REDSTART.COM', '1960-10-21', 'single', 'M', 'F: 110,000 - 129,999'),
('152', 'Dieter', 'Matthau', NULL, '700', 'Dieter.Matthau@VERDIN.COM', '1960-10-21', 'married', 'M', 'A: Below 30,000'),
('153', 'Divine', 'Sheen', NULL, '700', 'Divine.Sheen@COWBIRD.COM', '1960-10-21', 'single', 'M', 'I: 170,000 - 189,999'),
('154', 'Frederic', 'Grodin', NULL, '700', 'Frederic.Grodin@CREEPER.COM', '1960-10-21', 'single', 'F', 'L: 300,000 and above'),
('155', 'Frederico', 'Romero', NULL, '700', 'Frederico.Romero@CURLEW.COM', '1960-10-21', 'married', 'M', 'E: 90,000 - 109,999'),
('156', 'Goldie', 'Montand', NULL, '700', 'Goldie.Montand@DIPPER.COM', '1960-10-21', 'married', 'F', 'F: 110,000 - 129,999'),
('157', 'Sidney', 'Capshaw', NULL, '700', 'Sidney.Capshaw@DUNLIN.COM', '1960-10-21', 'single', 'M', 'G: 130,000 - 149,999'),
('158', 'Frederico', 'Lyon', NULL, '700', 'Frederico.Lyon@FLICKER.COM', '1960-10-21', 'married', 'M', 'J: 190,000 - 249,999'),
('159', 'Eddie', 'Boyer', NULL, '700', 'Eddie.Boyer@GALLINULE.COM', '1960-10-21', 'married', 'M', 'G: 130,000 - 149,999'),
('160', 'Eddie', 'Stern', NULL, '700', 'Eddie.Stern@GODWIT.COM', '1960-10-21', 'married', 'M', 'G: 130,000 - 149,999'),
('161', 'Ernest', 'Weaver', NULL, '900', 'Ernest.Weaver@GROSBEAK.COM', '1960-10-21', 'single', 'M', 'B: 30,000 - 49,999'),
('162', 'Ernest', 'George', NULL, '900', 'Ernest.George@LAPWING.COM', '1960-10-21', 'married', 'M', 'D: 70,000 - 89,999'),
('163', 'Ernest', 'Chandar', NULL, '900', 'Ernest.Chandar@LIMPKIN.COM', '1960-10-21', 'single', 'M', 'H: 150,000 - 169,999'),
('164', 'Charlotte', 'Kazan', NULL, '1200', 'Charlotte.Kazan@MERGANSER.COM', '1960-10-21', 'married', 'M', 'I: 170,000 - 189,999'),
('165', 'Charlotte', 'Fonda', NULL, '1200', 'Charlotte.Fonda@MOORHEN.COM', '1960-10-21', 'married', 'M', 'J: 190,000 - 249,999'),
('166', 'Dheeraj', 'Alexander', NULL, '1200', 'Dheeraj.Alexander@NUTHATCH.COM', '1960-10-21', 'single', 'F', 'G: 130,000 - 149,999'),
('167', 'Gerard', 'Hershey', NULL, '1200', 'Gerard.Hershey@PARULA.COM', '1960-10-21', 'married', 'M', 'D: 70,000 - 89,999'),
('168', 'Hema', 'Voight', NULL, '1200', 'Hema.Voight@PHALAROPE.COM', '1960-10-21', 'single', 'M', 'H: 150,000 - 169,999'),
('169', 'Dheeraj', 'Davis', NULL, '1200', 'Dheeraj.Davis@PIPIT.COM', '1960-10-21', 'married', 'F', 'F: 110,000 - 129,999'),
('170', 'Harry Dean', 'Fonda', NULL, '1200', 'HarryDean.Fonda@PLOVER.COM', '1960-10-21', 'single', 'M', 'G: 130,000 - 149,999'),
('171', 'Hema', 'Powell', NULL, '1200', 'Hema.Powell@SANDERLING.COM', '1960-10-21', 'married', 'M', 'D: 70,000 - 89,999'),
('172', 'Harry Mean', 'Peckinpah', NULL, '1200', 'HarryMean.Peckinpah@VERDIN.COM', '1960-10-21', 'single', 'M', 'I: 170,000 - 189,999'),
('173', 'Kathleen', 'Walken', NULL, '1200', 'Kathleen.Walken@VIREO.COM', '1960-10-21', 'married', 'F', 'E: 90,000 - 109,999'),
('174', 'Blake', 'Seignier', NULL, '1200', 'Blake.Seignier@GALLINULE.COM', '1960-10-21', 'single', 'M', 'H: 150,000 - 169,999'),
('175', 'Claude', 'Powell', NULL, '1200', 'Claude.Powell@GODWIT.COM', '1960-10-21', 'married', 'M', 'F: 110,000 - 129,999'),
('176', 'Faye', 'Glenn', NULL, '1200', 'Faye.Glenn@GREBE.COM', '1960-10-21', 'single', 'F', 'B: 30,000 - 49,999'),
('177', 'Gerhard', 'Seignier', NULL, '1200', 'Gerhard.Seignier@JACANA.COM', '1960-10-21', 'married', 'M', 'E: 90,000 - 109,999'),
('178', 'Grace', 'Belushi', NULL, '1200', 'Grace.Belushi@KILLDEER.COM', '1960-10-21', 'married', 'M', 'H: 150,000 - 169,999'),
('179', 'Harry dean', 'Forrest', NULL, '1200', 'Harrydean.Forrest@KISKADEE.COM', '1960-10-21', 'single', 'M', 'G: 130,000 - 149,999'),
('180', 'Harry dean', 'Cage', NULL, '1200', 'Harrydean.Cage@LAPWING.COM', '1960-10-21', 'married', 'F', 'F: 110,000 - 129,999'),
('181', 'Lauren', 'Hershey', NULL, '1200', 'Lauren.Hershey@LIMPKIN.COM', '1960-10-21', 'single', 'F', 'H: 150,000 - 169,999'),
('182', 'Lauren', 'Dench', NULL, '1200', 'Lauren.Dench@LONGSPUR.COM', '1960-10-21', 'single', 'M', 'K: 250,000 - 299,999'),
('183', 'Lauren', 'Altman', NULL, '1200', 'Lauren.Altman@MERGANSER.COM', '1960-10-21', 'married', 'F', 'C: 50,000 - 69,999'),
('184', 'Mary Beth', 'Roberts', NULL, '1200', 'MaryBeth.Roberts@NUTHATCH.COM', '1960-10-21', 'single', 'M', 'A: Below 30,000'),
('185', 'Matthew', 'Wright', NULL, '1200', 'Matthew.Wright@OVENBIRD.COM', '1960-10-21', 'married', 'F', 'G: 130,000 - 149,999'),
('186', 'Meena', 'Alexander', NULL, '1200', 'Meena.Alexander@PARULA.COM', '1960-10-21', 'single', 'F', 'K: 250,000 - 299,999'),
('187', 'Grace', 'Dvrrie', NULL, '1200', 'Grace.Dvrrie@PHOEBE.COM', '1960-10-21', 'married', 'F', 'E: 90,000 - 109,999'),
('188', 'Charlotte', 'Buckley', NULL, '1200', 'Charlotte.Buckley@PINTAIL.COM', '1960-10-21', 'single', 'F', 'F: 110,000 - 129,999'),
('189', 'Gena', 'Harris', NULL, '1200', 'Gena.Harris@PIPIT.COM', '1960-10-21', 'married', 'M', 'F: 110,000 - 129,999'),
('190', 'Gena', 'Curtis', NULL, '1200', 'Gena.Curtis@PLOVER.COM', '1960-10-21', 'single', 'M', 'J: 190,000 - 249,999'),
('191', 'Maureen', 'Sanders', NULL, '1200', 'Maureen.Sanders@PUFFIN.COM', '1960-10-21', 'married', 'M', 'A: Below 30,000'),
('192', 'Sean', 'Stockwell', NULL, '1200', 'Sean.Stockwell@PYRRHULOXIA.COM', '1960-10-21', 'married', 'M', 'I: 170,000 - 189,999'),
('193', 'Harry dean', 'Kinski', NULL, '1200', 'Harrydean.Kinski@REDPOLL.COM', '1960-10-21', 'married', 'M', 'D: 70,000 - 89,999'),
('194', 'Kathleen', 'Garcia', NULL, '1200', 'Kathleen.Garcia@REDSTART.COM', '1960-10-21', 'married', 'F', 'I: 170,000 - 189,999'),
('195', 'Sean', 'Olin', NULL, '1200', 'Sean.Olin@SCAUP.COM', '1960-10-21', 'single', 'F', 'F: 110,000 - 129,999'),
('196', 'Gerard', 'Dench', NULL, '1200', 'Gerard.Dench@SCOTER.COM', '1960-10-21', 'married', 'F', 'E: 90,000 - 109,999'),
('197', 'Gerard', 'Altman', NULL, '1200', 'Gerard.Altman@SHRIKE.COM', '1960-10-21', 'single', 'F', 'F: 110,000 - 129,999'),
('198', 'Maureen', 'de Funes', NULL, '1200', 'Maureen.deFunes@SISKIN.COM', '1960-10-21', 'married', 'F', 'D: 70,000 - 89,999'),
('199', 'Clint', 'Chapman', NULL, '1400', 'Clint.Chapman@SNIPE.COM', '1960-10-21', 'single', 'F', 'F: 110,000 - 129,999'),
('200', 'Clint', 'Gielgud', NULL, '1400', 'Clint.Gielgud@STILT.COM', '1960-10-21', 'married', 'F', 'E: 90,000 - 109,999'),
('201', 'Eric', 'Prashant', NULL, '1400', 'Eric.Prashant@TATTLER.COM', '1960-10-21', 'married', 'F', 'C: 50,000 - 69,999'),
('202', 'Ingrid', 'Welles', NULL, '1400', 'Ingrid.Welles@TEAL.COM', '1960-10-21', 'married', 'M', 'D: 70,000 - 89,999'),
('203', 'Ingrid', 'Rampling', NULL, '1400', 'Ingrid.Rampling@WIGEON.COM', '1960-10-21', 'single', 'M', 'F: 110,000 - 129,999'),
('204', 'Cliff', 'Puri', NULL, '1400', 'Cliff.Puri@CORMORANT.COM', '1960-10-21', 'married', 'M', 'J: 190,000 - 249,999'),
('205', 'Emily', 'Pollack', NULL, '1400', 'Emily.Pollack@DIPPER.COM', '1960-10-21', 'single', 'M', 'L: 300,000 and above'),
('206', 'Fritz', 'Hackman', NULL, '1400', 'Fritz.Hackman@DUNLIN.COM', '1960-10-21', 'married', 'F', 'G: 130,000 - 149,999'),
('207', 'Cybill', 'Laughton', NULL, '1400', 'Cybill.Laughton@EIDER.COM', '1960-10-21', 'single', 'M', 'F: 110,000 - 129,999'),
('208', 'Cyndi', 'Griem', NULL, '1400', 'Cyndi.Griem@GALLINULE.COM', '1960-10-21', 'married', 'M', 'E: 90,000 - 109,999'),
('209', 'Cyndi', 'Collins', NULL, '1400', 'Cyndi.Collins@GODWIT.COM', '1960-10-21', 'single', 'M', 'D: 70,000 - 89,999'),
('210', 'Cybill', 'Clapton', NULL, '1400', 'Cybill.Clapton@GOLDENEYE.COM', '1960-10-21', 'married', 'F', 'D: 70,000 - 89,999'),
('211', 'Luchino', 'Jordan', NULL, '1500', 'Luchino.Jordan@GREBE.COM', '1960-10-21', 'single', 'F', 'A: Below 30,000'),
('212', 'Luchino', 'Falk', NULL, '1500', 'Luchino.Falk@OVENBIRD.COM', '1960-10-21', 'married', 'M', 'L: 300,000 and above'),
('213', 'Luchino', 'Bradford', NULL, '1500', 'Luchino.Bradford@PARULA.COM', '1960-10-21', 'married', 'M', 'A: Below 30,000'),
('214', 'Robin', 'Danson', NULL, '1500', 'Robin.Danson@PHAINOPEPLA.COM', '1960-10-21', 'single', 'M', 'F: 110,000 - 129,999'),
('215', 'Orson', 'Perkins', NULL, '1900', 'Orson.Perkins@PINTAIL.COM', '1960-10-21', 'married', 'M', 'E: 90,000 - 109,999'),
('216', 'Orson', 'Koirala', NULL, '1900', 'Orson.Koirala@PIPIT.COM', '1960-10-21', 'single', 'F', 'J: 190,000 - 249,999'),
('217', 'Bryan', 'Huston', NULL, '2300', 'Bryan.Huston@PYRRHULOXIA.COM', '1960-10-21', 'married', 'F', 'B: 30,000 - 49,999'),
('218', 'Bryan', 'Dvrrie', NULL, '2300', 'Bryan.Dvrrie@REDPOLL.COM', '1960-10-21', 'single', 'F', 'G: 130,000 - 149,999'),
('219', 'Ajay', 'Sen', NULL, '2300', 'Ajay.Sen@TROGON.COM', '1960-10-21', 'single', 'M', 'K: 250,000 - 299,999'),
('220', 'Carol', 'Jordan', NULL, '2300', 'Carol.Jordan@TURNSTONE.COM', '1960-10-21', 'married', 'M', 'I: 170,000 - 189,999'),
('221', 'Carol', 'Bradford', NULL, '2300', 'Carol.Bradford@VERDIN.COM', '1960-10-21', 'single', 'M', 'G: 130,000 - 149,999'),
('222', 'Cary', 'Stockwell', NULL, '2300', 'Cary.Stockwell@VIREO.COM', '1960-10-21', 'married', 'M', 'I: 170,000 - 189,999'),
('223', 'Cary', 'Olin', NULL, '2300', 'Cary.Olin@WATERTHRUSH.COM', '1960-10-21', 'single', 'M', 'D: 70,000 - 89,999'),
('224', 'Clara', 'Krige', NULL, '2300', 'Clara.Krige@WHIMBREL.COM', '1960-10-21', 'married', 'M', 'H: 150,000 - 169,999'),
('225', 'Clara', 'Ganesan', NULL, '2300', 'Clara.Ganesan@WIGEON.COM', '1960-10-21', 'single', 'F', 'I: 170,000 - 189,999'),
('226', 'Ajay', 'Andrews', NULL, '2300', 'Ajay.Andrews@YELLOWTHROAT.COM', '1960-10-21', 'married', 'M', 'F: 110,000 - 129,999'),
('227', 'Kathy', 'Prashant', NULL, '2400', 'Kathy.Prashant@ANI.COM', '1960-10-21', 'single', 'M', 'J: 190,000 - 249,999'),
('228', 'Graham', 'Neeson', NULL, '2400', 'Graham.Neeson@AUKLET.COM', '1960-10-21', 'married', 'M', 'E: 90,000 - 109,999'),
('229', 'Ian', 'Chapman', NULL, '2400', 'Ian.Chapman@AVOCET.COM', '1960-10-21', 'single', 'M', 'D: 70,000 - 89,999'),
('230', 'Danny', 'Wright', NULL, '2400', 'Danny.Wright@BITTERN.COM', '1960-10-21', 'married', 'M', 'F: 110,000 - 129,999'),
('231', 'Danny', 'Rourke', NULL, '2400', 'Danny.Rourke@BRANT.COM', '1960-10-21', 'single', 'M', 'F: 110,000 - 129,999'),
('232', 'Donald', 'Hunter', NULL, '2400', 'Donald.Hunter@CHACHALACA.COM', '1960-10-21', 'married', 'M', 'G: 130,000 - 149,999'),
('233', 'Graham', 'Spielberg', NULL, '2400', 'Graham.Spielberg@CHUKAR.COM', '1960-10-21', 'single', 'M', 'D: 70,000 - 89,999'),
('234', 'Dan', 'Roberts', NULL, '2400', 'Dan.Roberts@NUTHATCH.COM', '1960-10-21', 'married', 'M', 'I: 170,000 - 189,999'),
('235', 'Edward', 'Oates', NULL, '2400', 'Edward.Oates@OVENBIRD.COM', '1960-10-21', 'married', 'M', 'E: 90,000 - 109,999'),
('236', 'Edward', 'Julius', NULL, '2400', 'Edward.Julius@PARULA.COM', '1960-10-21', 'single', 'M', 'F: 110,000 - 129,999'),
('237', 'Farrah', 'Quinlan', NULL, '2400', 'Farrah.Quinlan@PHAINOPEPLA.COM', '1960-10-21', 'married', 'M', 'A: Below 30,000'),
('238', 'Farrah', 'Lange', NULL, '2400', 'Farrah.Lange@PHALAROPE.COM', '1960-10-21', 'married', 'M', 'F: 110,000 - 129,999'),
('239', 'Hal', 'Stockwell', NULL, '2400', 'Hal.Stockwell@PHOEBE.COM', '1960-10-21', 'single', 'M', 'H: 150,000 - 169,999'),
('240', 'Malcolm', 'Kanth', NULL, '2400', 'Malcolm.Kanth@PIPIT.COM', '1960-10-21', 'married', 'F', 'H: 150,000 - 169,999'),
('241', 'Malcolm', 'Broderick', NULL, '2400', 'Malcolm.Broderick@PLOVER.COM', '1960-10-21', 'single', 'M', 'F: 110,000 - 129,999'),
('242', 'Mary', 'Lemmon', NULL, '2400', 'Mary.Lemmon@PUFFIN.COM', '1960-10-21', 'married', 'M', 'K: 250,000 - 299,999'),
('243', 'Mary', 'Collins', NULL, '2400', 'Mary.Collins@PYRRHULOXIA.COM', '1960-10-21', 'married', 'F', 'F: 110,000 - 129,999'),
('244', 'Matt', 'Gueney', NULL, '2400', 'Matt.Gueney@REDPOLL.COM', '1960-10-21', 'single', 'M', 'G: 130,000 - 149,999'),
('245', 'Max', 'von Sydow', NULL, '2400', 'Max.vonSydow@REDSTART.COM', '1960-10-21', 'single', 'M', 'K: 250,000 - 299,999'),
('246', 'Max', 'Schell', NULL, '2400', 'Max.Schell@SANDERLING.COM', '1960-10-21', 'married', 'M', 'F: 110,000 - 129,999'),
('247', 'Cynda', 'Whitcraft', NULL, '2400', 'Cynda.Whitcraft@SANDPIPER.COM', '1960-10-21', 'married', 'M', 'B: 30,000 - 49,999'),
('248', 'Donald', 'Minnelli', NULL, '2400', 'Donald.Minnelli@SCAUP.COM', '1960-10-21', 'single', 'M', 'F: 110,000 - 129,999'),
('249', 'Hannah', 'Broderick', NULL, '2400', 'Hannah.Broderick@SHRIKE.COM', '1960-10-21', 'married', 'M', 'D: 70,000 - 89,999'),
('250', 'Dan', 'Williams', NULL, '2400', 'Dan.Williams@SISKIN.COM', '1960-10-21', 'single', 'M', 'A: Below 30,000'),
('251', 'Raul', 'Wilder', NULL, '2500', 'Raul.Wilder@STILT.COM', '1960-10-21', 'married', 'M', 'E: 90,000 - 109,999'),
('252', 'Shah Rukh', 'Field', NULL, '2500', 'ShahRukh.Field@WHIMBREL.COM', '1960-10-21', 'single', 'M', 'I: 170,000 - 189,999'),
('253', 'Sally', 'Bogart', NULL, '2500', 'Sally.Bogart@WILLET.COM', '1960-10-21', 'married', 'M', 'H: 150,000 - 169,999'),
('254', 'Bruce', 'Bates', NULL, '3500', 'Bruce.Bates@COWBIRD.COM', '1960-10-21', 'single', 'M', 'D: 70,000 - 89,999'),
('255', 'Brooke', 'Shepherd', NULL, '3500', 'Brooke.Shepherd@KILLDEER.COM', '1960-10-21', 'married', 'M', 'C: 50,000 - 69,999'),
('256', 'Ben', 'de Niro', NULL, '3500', 'Ben.deNiro@KINGLET.COM', '1960-10-21', 'single', 'M', 'I: 170,000 - 189,999'),
('257', 'Emmet', 'Walken', NULL, '3600', 'Emmet.Walken@LIMPKIN.COM', '1960-10-21', 'married', 'M', 'B: 30,000 - 49,999'),
('258', 'Ellen', 'Palin', NULL, '3600', 'Ellen.Palin@LONGSPUR.COM', '1960-10-21', 'married', 'M', 'H: 150,000 - 169,999'),
('259', 'Denholm', 'von Sydow', NULL, '3600', 'Denholm.vonSydow@MERGANSER.COM', '1960-10-21', 'single', 'F', 'D: 70,000 - 89,999'),
('260', 'Ellen', 'Khan', NULL, '3600', 'Ellen.Khan@VERDIN.COM', '1960-10-21', 'married', 'M', 'F: 110,000 - 129,999'),
('261', 'Emmet', 'Garcia', NULL, '3600', 'Emmet.Garcia@VIREO.COM', '1960-10-21', 'married', 'M', 'H: 150,000 - 169,999'),
('262', 'Fred', 'Reynolds', NULL, '3600', 'Fred.Reynolds@WATERTHRUSH.COM', '1960-10-21', 'married', 'M', 'F: 110,000 - 129,999'),
('263', 'Fred', 'Lithgow', NULL, '3600', 'Fred.Lithgow@WHIMBREL.COM', '1960-10-21', 'single', 'M', 'D: 70,000 - 89,999'),
('264', 'George', 'Adjani', NULL, '3600', 'George.Adjani@WILLET.COM', '1960-10-21', 'married', 'F', 'F: 110,000 - 129,999'),
('265', 'Irene', 'Laughton', NULL, '3600', 'Irene.Laughton@ANHINGA.COM', '1960-10-21', 'single', 'F', 'J: 190,000 - 249,999'),
('266', 'Prem', 'Cardinale', NULL, '3700', 'Prem.Cardinale@BITTERN.COM', '1960-10-21', 'single', 'M', 'L: 300,000 and above'),
('267', 'Prem', 'Walken', NULL, '3700', 'Prem.Walken@BRANT.COM', '1960-10-21', 'married', 'F', 'G: 130,000 - 149,999'),
('268', 'Kyle', 'Schneider', NULL, '3700', 'Kyle.Schneider@DUNLIN.COM', '1960-10-21', 'single', 'F', 'G: 130,000 - 149,999'),
('269', 'Kyle', 'Martin', NULL, '3700', 'Kyle.Martin@EIDER.COM', '1960-10-21', 'married', 'F', 'D: 70,000 - 89,999'),
('270', 'Meg', 'Derek', NULL, '3700', 'Meg.Derek@FLICKER.COM', '1960-10-21', 'married', 'M', 'F: 110,000 - 129,999'),
('271', 'Shelley', 'Peckinpah', NULL, '3700', 'Shelley.Peckinpah@GODWIT.COM', '1960-10-21', 'single', 'F', 'D: 70,000 - 89,999'),
('272', 'Prem', 'Garcia', NULL, '3700', 'Prem.Garcia@JACANA.COM', '1960-10-21', 'married', 'M', 'I: 170,000 - 189,999'),
('273', 'Bo', 'Hitchcock', NULL, '5000', 'Bo.Hitchcock@ANHINGA.COM', '1960-10-21', 'married', 'M', 'E: 90,000 - 109,999'),
('274', 'Bob', 'McCarthy', NULL, '5000', 'Bob.McCarthy@ANI.COM', '1960-10-21', 'single', 'M', 'A: Below 30,000'),
('275', 'Dom', 'McQueen', NULL, '5000', 'Dom.McQueen@AUKLET.COM', '1960-10-21', 'married', 'F', 'G: 130,000 - 149,999'),
('276', 'Dom', 'Hoskins', NULL, '5000', 'Dom.Hoskins@AVOCET.COM', '1960-10-21', 'married', 'M', 'E: 90,000 - 109,999'),
('277', 'Don', 'Siegel', NULL, '5000', 'Don.Siegel@BITTERN.COM', '1960-10-21', 'single', 'M', 'B: 30,000 - 49,999'),
('278', 'Gvtz', 'Bradford', NULL, '5000', 'Gvtz.Bradford@BULBUL.COM', '1960-10-21', 'married', 'M', 'K: 250,000 - 299,999'),
('279', 'Holly', 'Kurosawa', NULL, '5000', 'Holly.Kurosawa@CARACARA.COM', '1960-10-21', 'single', 'M', 'I: 170,000 - 189,999'),
('280', 'Rob', 'MacLaine', NULL, '5000', 'Rob.MacLaine@COOT.COM', '1960-10-21', 'married', 'M', 'B: 30,000 - 49,999'),
('281', 'Don', 'Barkin', NULL, '5000', 'Don.Barkin@CORMORANT.COM', '1960-10-21', 'single', 'M', 'I: 170,000 - 189,999'),
('282', 'Kurt', 'Danson', NULL, '5000', 'Kurt.Danson@COWBIRD.COM', '1960-10-21', 'married', 'M', 'H: 150,000 - 169,999'),
('283', 'Kurt', 'Heard', NULL, '5000', 'Kurt.Heard@CURLEW.COM', '1960-10-21', 'single', 'M', 'H: 150,000 - 169,999'),
('308', 'Glenda', 'Dunaway', NULL, '1200', 'Glenda.Dunaway@DOWITCHER.COM', '1960-10-21', 'married', 'M', 'C: 50,000 - 69,999'),
('309', 'Glenda', 'Bates', NULL, '1200', 'Glenda.Bates@DIPPER.COM', '1960-10-21', 'single', 'M', 'F: 110,000 - 129,999'),
('323', 'Goetz', 'Falk', NULL, '5000', 'Goetz.Falk@VEERY.COM', '1960-10-21', 'married', 'F', 'G: 130,000 - 149,999'),
('326', 'Hal', 'Olin', NULL, '2400', 'Hal.Olin@FLICKER.COM', '1960-10-21', 'married', 'F', 'H: 150,000 - 169,999'),
('327', 'Hannah', 'Kanth', NULL, '2400', 'Hannah.Kanth@GADWALL.COM', '1960-10-21', 'single', 'M', 'F: 110,000 - 129,999'),
('328', 'Hannah', 'Field', NULL, '2400', 'Hannah.Field@GALLINULE.COM', '1960-10-21', 'married', 'F', 'G: 130,000 - 149,999'),
('333', 'Margret', 'Powell', NULL, '1200', 'Margret.Powell@ANI.COM', '1960-10-21', 'single', 'M', 'G: 130,000 - 149,999'),
('334', 'Harry Mean', 'Taylor', NULL, '1200', 'HarryMean.Taylor@REDPOLL.COM', '1960-10-21', 'single', 'M', 'I: 170,000 - 189,999'),
('335', 'Margrit', 'Garner', NULL, '500', 'Margrit.Garner@STILT.COM', '1960-10-21', 'married', 'F', 'H: 150,000 - 169,999'),
('337', 'Maria', 'Warden', NULL, '500', 'Maria.Warden@TANAGER.COM', '1960-10-21', 'married', 'F', 'B: 30,000 - 49,999'),
('339', 'Marilou', 'Landis', NULL, '500', 'Marilou.Landis@TATTLER.COM', '1960-10-21', 'single', 'M', 'A: Below 30,000'),
('341', 'Keir', 'George', NULL, '700', 'Keir.George@VIREO.COM', '1960-10-21', 'married', 'F', 'E: 90,000 - 109,999'),
('342', 'Marlon', 'Laughton', NULL, '2400', 'Marlon.Laughton@CORMORANT.COM', '1960-10-21', 'single', 'F', 'F: 110,000 - 129,999'),
('343', 'Keir', 'Chandar', NULL, '700', 'Keir.Chandar@WATERTHRUSH.COM', '1960-10-21', 'married', 'M', 'G: 130,000 - 149,999'),
('344', 'Marlon', 'Godard', NULL, '2400', 'Marlon.Godard@MOORHEN.COM', '1960-10-21', 'single', 'M', 'H: 150,000 - 169,999'),
('345', 'Keir', 'Weaver', NULL, '700', 'Keir.Weaver@WHIMBREL.COM', '1960-10-21', 'married', 'M', 'H: 150,000 - 169,999'),
('346', 'Marlon', 'Clapton', NULL, '2400', 'Marlon.Clapton@COWBIRD.COM', '1960-10-21', 'married', 'M', 'K: 250,000 - 299,999'),
('347', 'Kelly', 'Quinlan', NULL, '3600', 'Kelly.Quinlan@PYRRHULOXIA.COM', '1960-10-21', 'married', 'F', 'A: Below 30,000'),
('348', 'Kelly', 'Lange', NULL, '3600', 'Kelly.Lange@SANDPIPER.COM', '1960-10-21', 'single', 'M', 'F: 110,000 - 129,999'),
('349', 'Ken', 'Glenn', NULL, '3600', 'Ken.Glenn@SAW-WHET.COM', '1960-10-21', 'married', 'M', 'K: 250,000 - 299,999'),
('350', 'Ken', 'Chopra', NULL, '3600', 'Ken.Chopra@SCAUP.COM', '1960-10-21', 'single', 'F', 'F: 110,000 - 129,999'),
('351', 'Ken', 'Wenders', NULL, '3600', 'Ken.Wenders@REDPOLL.COM', '1960-10-21', 'married', 'F', 'F: 110,000 - 129,999'),
('352', 'Kenneth', 'Redford', NULL, '3600', 'Kenneth.Redford@REDSTART.COM', '1960-10-21', 'single', 'F', 'B: 30,000 - 49,999'),
('360', 'Helmut', 'Capshaw', NULL, '3600', 'Helmut.Capshaw@TROGON.COM', '1960-10-21', 'married', 'M', 'J: 190,000 - 249,999'),
('361', 'Marilou', 'Chapman', NULL, '500', 'Marilou.Chapman@TEAL.COM', '1960-10-21', 'single', 'F', 'D: 70,000 - 89,999'),
('363', 'Kathy', 'Lambert', NULL, '2400', 'Kathy.Lambert@COOT.COM', '1960-10-21', 'married', 'M', 'C: 50,000 - 69,999'),
('378', 'Meg', 'Sen', NULL, '3700', 'Meg.Sen@COWBIRD.COM', '1960-10-21', 'married', 'M', 'C: 50,000 - 69,999'),
('380', 'Meryl', 'Holden', NULL, '3700', 'Meryl.Holden@DIPPER.COM', '1960-10-21', 'single', 'F', 'H: 150,000 - 169,999'),
('447', 'Richard', 'Coppola', NULL, '500', 'Richard.Coppola@SISKIN.COM', '1960-10-21', 'married', 'F', 'C: 50,000 - 69,999'),
('448', 'Richard', 'Winters', NULL, '500', 'Richard.Winters@SNIPE.COM', '1960-10-21', 'married', 'M', 'F: 110,000 - 129,999'),
('449', 'Rick', 'Romero', NULL, '1500', 'Rick.Romero@LONGSPUR.COM', '1960-10-21', 'single', 'F', 'B: 30,000 - 49,999'),
('450', 'Rick', 'Lyon', NULL, '1500', 'Rick.Lyon@MERGANSER.COM', '1960-10-21', 'married', 'F', 'F: 110,000 - 129,999'),
('451', 'Ridley', 'Hackman', NULL, '700', 'Ridley.Hackman@ANHINGA.COM', '1960-10-21', 'single', 'F', 'H: 150,000 - 169,999'),
('452', 'Ridley', 'Coyote', NULL, '700', 'Ridley.Coyote@ANI.COM', '1960-10-21', 'married', 'M', 'F: 110,000 - 129,999'),
('453', 'Ridley', 'Young', NULL, '700', 'Ridley.Young@CHUKAR.COM', '1960-10-21', 'single', 'M', 'F: 110,000 - 129,999'),
('454', 'Rob', 'Russell', NULL, '5000', 'Rob.Russell@VERDIN.COM', '1960-10-21', 'married', 'M', 'E: 90,000 - 109,999'),
('458', 'Robert', 'de Niro', NULL, '3700', 'Robert.deNiro@DOWITCHER.COM', '1960-10-21', 'single', 'F', 'H: 150,000 - 169,999'),
('463', 'Robin', 'Adjani', NULL, '1500', 'Robin.Adjani@MOORHEN.COM', '1960-10-21', 'married', 'F', 'C: 50,000 - 69,999'),
('466', 'Rodolfo', 'Hershey', NULL, '5000', 'Rodolfo.Hershey@VIREO.COM', '1960-10-21', 'single', 'M', 'F: 110,000 - 129,999'),
('467', 'Rodolfo', 'Dench', NULL, '5000', 'Rodolfo.Dench@SCOTER.COM', '1960-10-21', 'married', 'F', 'F: 110,000 - 129,999'),
('468', 'Rodolfo', 'Altman', NULL, '5000', 'Rodolfo.Altman@SHRIKE.COM', '1960-10-21', 'single', 'F', 'F: 110,000 - 129,999'),
('470', 'Roger', 'Mastroianni', NULL, '3700', 'Roger.Mastroianni@CREEPER.COM', '1960-10-21', 'married', 'M', 'L: 300,000 and above'),
('473', 'Rolf', 'Ashby', NULL, '5000', 'Rolf.Ashby@WATERTHRUSH.COM', '1960-10-21', 'single', 'M', 'G: 130,000 - 149,999'),
('474', 'Romy', 'Sharif', NULL, '5000', 'Romy.Sharif@SNIPE.COM', '1960-10-21', 'married', 'M', 'F: 110,000 - 129,999'),
('475', 'Romy', 'McCarthy', NULL, '5000', 'Romy.McCarthy@STILT.COM', '1960-10-21', 'single', 'F', 'D: 70,000 - 89,999'),
('476', 'Rosanne', 'Hopkins', NULL, '300', 'Rosanne.Hopkins@ANI.COM', '1960-10-21', 'married', 'M', 'D: 70,000 - 89,999'),
('477', 'Rosanne', 'Douglas', NULL, '300', 'Rosanne.Douglas@ANHINGA.COM', '1960-10-21', 'single', 'F', 'F: 110,000 - 129,999'),
('478', 'Rosanne', 'Baldwin', NULL, '300', 'Rosanne.Baldwin@AUKLET.COM', '1960-10-21', 'married', 'F', 'A: Below 30,000'),
('479', 'Roxanne', 'Shepherd', NULL, '1200', 'Roxanne.Shepherd@DUNLIN.COM', '1960-10-21', 'single', 'F', 'I: 170,000 - 189,999'),
('480', 'Roxanne', 'Michalkow', NULL, '1200', 'Roxanne.Michalkow@EIDER.COM', '1960-10-21', 'single', 'M', 'L: 300,000 and above'),
('481', 'Roy', 'Hulce', NULL, '5000', 'Roy.Hulce@SISKIN.COM', '1960-10-21', 'married', 'F', 'E: 90,000 - 109,999'),
('482', 'Roy', 'Dunaway', NULL, '5000', 'Roy.Dunaway@WHIMBREL.COM', '1960-10-21', 'married', 'F', 'F: 110,000 - 129,999'),
('483', 'Roy', 'Bates', NULL, '5000', 'Roy.Bates@WIGEON.COM', '1960-10-21', 'single', 'M', 'G: 130,000 - 149,999'),
('487', 'Rufus', 'Dvrrie', NULL, '1900', 'Rufus.Dvrrie@PLOVER.COM', '1960-10-21', 'married', 'M', 'J: 190,000 - 249,999'),
('488', 'Rufus', 'Belushi', NULL, '1900', 'Rufus.Belushi@PUFFIN.COM', '1960-10-21', 'married', 'M', 'G: 130,000 - 149,999'),
('492', 'Sally', 'Edwards', NULL, '2500', 'Sally.Edwards@TURNSTONE.COM', '1960-10-21', 'married', 'F', 'K: 250,000 - 299,999'),
('496', 'Scott', 'Jordan', NULL, '5000', 'Scott.Jordan@WILLET.COM', '1960-10-21', 'married', 'F', 'G: 130,000 - 149,999'),
('605', 'Shammi', 'Pacino', NULL, '500', 'Shammi.Pacino@BITTERN.COM', '1960-10-21', 'single', 'F', 'B: 30,000 - 49,999'),
('606', 'Sharmila', 'Kazan', NULL, '500', 'Sharmila.Kazan@BRANT.COM', '1960-10-21', 'married', 'F', 'D: 70,000 - 89,999'),
('607', 'Sharmila', 'Fonda', NULL, '500', 'Sharmila.Fonda@BUFFLEHEAD.COM', '1960-10-21', 'single', 'F', 'H: 150,000 - 169,999'),
('609', 'Shelley', 'Taylor', NULL, '3700', 'Shelley.Taylor@CURLEW.COM', '1960-10-21', 'married', 'F', 'I: 170,000 - 189,999'),
('615', 'Shyam', 'Plummer', NULL, '2500', 'Shyam.Plummer@VEERY.COM', '1960-10-21', 'married', 'M', 'J: 190,000 - 249,999'),
('621', 'Silk', 'Kurosawa', NULL, '1500', 'Silk.Kurosawa@NUTHATCH.COM', '1960-10-21', 'single', 'F', 'G: 130,000 - 149,999'),
('627', 'Sivaji', 'Gielgud', NULL, '500', 'Sivaji.Gielgud@BULBUL.COM', '1960-10-21', 'married', 'F', 'D: 70,000 - 89,999'),
('712', 'M. Emmet', 'Stockwell', NULL, '3700', 'M.Emmet.Stockwell@COOT.COM', '1960-10-21', 'single', 'M', 'H: 150,000 - 169,999'),
('713', 'M. Emmet', 'Olin', NULL, '3700', 'M.Emmet.Olin@CORMORANT.COM', '1960-10-21', 'married', 'F', 'F: 110,000 - 129,999'),
('715', 'Malcolm', 'Field', NULL, '2400', 'Malcolm.Field@DOWITCHER.COM', '1960-10-21', 'single', 'F', 'G: 130,000 - 149,999'),
('717', 'Mammutti', 'Sutherland', NULL, '500', 'Mammutti.Sutherland@TOWHEE.COM', '1960-10-21', 'married', 'M', 'D: 70,000 - 89,999'),
('719', 'Mani', 'Kazan', NULL, '500', 'Mani.Kazan@TROGON.COM', '1960-10-21', 'single', 'M', 'I: 170,000 - 189,999'),
('721', 'Mani', 'Buckley', NULL, '500', 'Mani.Buckley@TURNSTONE.COM', '1960-10-21', 'married', 'M', 'E: 90,000 - 109,999'),
('727', 'Margaret', 'Ustinov', NULL, '1200', 'Margaret.Ustinov@ANHINGA.COM', '1960-10-21', 'single', 'M', 'H: 150,000 - 169,999'),
('729', 'Margaux', 'Krige', NULL, '2400', 'Margaux.Krige@DUNLIN.COM', '1960-10-21', 'married', 'M', 'F: 110,000 - 129,999'),
('731', 'Margaux', 'Capshaw', NULL, '2400', 'Margaux.Capshaw@EIDER.COM', '1960-10-21', 'single', 'M', 'B: 30,000 - 49,999'),
('754', 'Kevin', 'Goodman', NULL, '700', 'Kevin.Goodman@WIGEON.COM', '1960-10-21', 'married', 'M', 'E: 90,000 - 109,999'),
('755', 'Kevin', 'Cleveland', NULL, '700', 'Kevin.Cleveland@WILLET.COM', '1960-10-21', 'married', 'M', 'H: 150,000 - 169,999'),
('756', 'Kevin', 'Wilder', NULL, '700', 'Kevin.Wilder@AUKLET.COM', '1960-10-21', 'single', 'M', 'G: 130,000 - 149,999'),
('757', 'Kiefer', 'Reynolds', NULL, '700', 'Kiefer.Reynolds@AVOCET.COM', '1960-10-21', 'married', 'M', 'F: 110,000 - 129,999'),
('766', 'Klaus', 'Young', NULL, '600', 'Klaus.Young@OVENBIRD.COM', '1960-10-21', 'single', 'M', 'H: 150,000 - 169,999'),
('767', 'Klaus Maria', 'Russell', NULL, '100', 'KlausMaria.Russell@COOT.COM', '1960-10-21', 'married', 'M', 'C: 50,000 - 69,999'),
('768', 'Klaus Maria', 'MacLaine', NULL, '100', 'KlausMaria.MacLaine@CHUKAR.COM', '1960-10-21', 'single', 'M', 'A: Below 30,000'),
('769', 'Kris', 'Harris', NULL, '400', 'Kris.Harris@DIPPER.COM', '1960-10-21', 'married', 'M', 'G: 130,000 - 149,999'),
('770', 'Kris', 'Curtis', NULL, '400', 'Kris.Curtis@DOWITCHER.COM', '1960-10-21', 'single', 'M', 'K: 250,000 - 299,999'),
('771', 'Kris', 'de Niro', NULL, '400', 'Kris.deNiro@DUNLIN.COM', '1960-10-21', 'married', 'M', 'E: 90,000 - 109,999'),
('772', 'Kristin', 'Savage', NULL, '400', 'Kristin.Savage@CURLEW.COM', '1960-10-21', 'single', 'F', 'F: 110,000 - 129,999'),
('782', 'Laurence', 'Seignier', NULL, '1200', 'Laurence.Seignier@CREEPER.COM', '1960-10-21', 'married', 'M', 'F: 110,000 - 129,999'),
('825', 'Alain', 'Dreyfuss', NULL, '500', 'Alain.Dreyfuss@VEERY.COM', '1960-10-21', 'single', 'M', 'J: 190,000 - 249,999'),
('826', 'Alain', 'Barkin', NULL, '500', 'Alain.Barkin@VERDIN.COM', '1960-10-21', 'married', 'M', 'A: Below 30,000'),
('827', 'Alain', 'Siegel', NULL, '500', 'Alain.Siegel@VIREO.COM', '1960-10-21', 'married', 'F', 'I: 170,000 - 189,999'),
('828', 'Alan', 'Minnelli', NULL, '2300', 'Alan.Minnelli@TANAGER.COM', '1960-10-21', 'married', 'M', 'D: 70,000 - 89,999'),
('829', 'Alan', 'Hunter', NULL, '2300', 'Alan.Hunter@TATTLER.COM', '1960-10-21', 'married', 'M', 'I: 170,000 - 189,999'),
('830', 'Albert', 'Dutt', NULL, '3500', 'Albert.Dutt@CURLEW.COM', '1960-10-21', 'single', 'M', 'F: 110,000 - 129,999'),
('831', 'Albert', 'Bel Geddes', NULL, '3500', 'Albert.BelGeddes@DIPPER.COM', '1960-10-21', 'married', 'M', 'E: 90,000 - 109,999'),
('832', 'Albert', 'Spacek', NULL, '3500', 'Albert.Spacek@DOWITCHER.COM', '1960-10-21', 'single', 'M', 'F: 110,000 - 129,999'),
('833', 'Alec', 'Moranis', NULL, '3500', 'Alec.Moranis@DUNLIN.COM', '1960-10-21', 'married', 'M', 'D: 70,000 - 89,999'),
('834', 'Alec', 'Idle', NULL, '3500', 'Alec.Idle@EIDER.COM', '1960-10-21', 'single', 'M', 'F: 110,000 - 129,999'),
('835', 'Alexander', 'Eastwood', NULL, '1200', 'Alexander.Eastwood@AVOCET.COM', '1960-10-21', 'married', 'F', 'E: 90,000 - 109,999'),
('836', 'Alexander', 'Berenger', NULL, '1200', 'Alexander.Berenger@BECARD.COM', '1960-10-21', 'married', 'F', 'C: 50,000 - 69,999'),
('837', 'Alexander', 'Stanton', NULL, '1200', 'Alexander.Stanton@AUKLET.COM', '1960-10-21', 'married', 'F', 'D: 70,000 - 89,999'),
('838', 'Alfred', 'Nicholson', NULL, '3500', 'Alfred.Nicholson@CREEPER.COM', '1960-10-21', 'single', 'M', 'F: 110,000 - 129,999'),
('839', 'Alfred', 'Johnson', NULL, '3500', 'Alfred.Johnson@FLICKER.COM', '1960-10-21', 'married', 'M', 'J: 190,000 - 249,999'),
('840', 'Ali', 'Elliott', NULL, '1400', 'Ali.Elliott@ANHINGA.COM', '1960-10-21', 'married', 'M', 'G: 130,000 - 149,999'),
('841', 'Ali', 'Boyer', NULL, '1400', 'Ali.Boyer@WILLET.COM', '1960-10-21', 'single', 'M', 'F: 110,000 - 129,999'),
('842', 'Ali', 'Stern', NULL, '1400', 'Ali.Stern@YELLOWTHROAT.COM', '1960-10-21', 'married', 'M', 'E: 90,000 - 109,999'),
('843', 'Alice', 'Oates', NULL, '700', 'Alice.Oates@BECARD.COM', '1960-10-21', 'single', 'F', 'D: 70,000 - 89,999'),
('844', 'Alice', 'Julius', NULL, '700', 'Alice.Julius@BITTERN.COM', '1960-10-21', 'married', 'F', 'D: 70,000 - 89,999'),
('845', 'Ally', 'Fawcett', NULL, '5000', 'Ally.Fawcett@PLOVER.COM', '1960-10-21', 'single', 'F', 'A: Below 30,000'),
('846', 'Ally', 'Brando', NULL, '5000', 'Ally.Brando@PINTAIL.COM', '1960-10-21', 'married', 'F', 'L: 300,000 and above'),
('847', 'Ally', 'Streep', NULL, '5000', 'Ally.Streep@PIPIT.COM', '1960-10-21', 'married', 'M', 'A: Below 30,000'),
('848', 'Alonso', 'Olmos', NULL, '1800', 'Alonso.Olmos@PHALAROPE.COM', '1960-10-21', 'single', 'F', 'F: 110,000 - 129,999'),
('849', 'Alonso', 'Kaurusmdki', NULL, '1800', 'Alonso.Kaurusmdki@PHOEBE.COM', '1960-10-21', 'married', 'F', 'E: 90,000 - 109,999'),
('850', 'Amanda', 'Finney', NULL, '2300', 'Amanda.Finney@STILT.COM', '1960-10-21', 'single', 'M', 'J: 190,000 - 249,999'),
('851', 'Amanda', 'Brown', NULL, '2300', 'Amanda.Brown@THRASHER.COM', '1960-10-21', 'married', 'F', 'B: 30,000 - 49,999'),
('852', 'Amanda', 'Tanner', NULL, '2300', 'Amanda.Tanner@TEAL.COM', '1960-10-21', 'single', 'F', 'G: 130,000 - 149,999'),
('853', 'Amrish', 'Palin', NULL, '400', 'Amrish.Palin@EIDER.COM', '1960-10-21', 'married', 'F', 'I: 170,000 - 189,999'),
('905', 'Billy', 'Hershey', NULL, '1400', 'Billy.Hershey@BULBUL.COM', '1960-10-21', 'single', 'F', 'G: 130,000 - 149,999'),
('906', 'Billy', 'Dench', NULL, '1400', 'Billy.Dench@CARACARA.COM', '1960-10-21', 'married', 'M', 'I: 170,000 - 189,999'),
('909', 'Blake', 'Mastroianni', NULL, '1200', 'Blake.Mastroianni@FLICKER.COM', '1960-10-21', 'single', 'M', 'D: 70,000 - 89,999'),
('911', 'Bo', 'Dickinson', NULL, '5000', 'Bo.Dickinson@TANAGER.COM', '1960-10-21', 'married', 'M', 'H: 150,000 - 169,999'),
('912', 'Bo', 'Ashby', NULL, '5000', 'Bo.Ashby@TATTLER.COM', '1960-10-21', 'single', 'M', 'I: 170,000 - 189,999'),
('913', 'Bob', 'Sharif', NULL, '5000', 'Bob.Sharif@TEAL.COM', '1960-10-21', 'married', 'M', 'F: 110,000 - 129,999'),
('916', 'Brian', 'Douglas', NULL, '500', 'Brian.Douglas@AVOCET.COM', '1960-10-21', 'single', 'M', 'J: 190,000 - 249,999'),
('917', 'Brian', 'Baldwin', NULL, '500', 'Brian.Baldwin@BECARD.COM', '1960-10-21', 'married', 'M', 'E: 90,000 - 109,999'),
('919', 'Brooke', 'Michalkow', NULL, '3500', 'Brooke.Michalkow@GROSBEAK.COM', '1960-10-21', 'single', 'M', 'D: 70,000 - 89,999'),
('920', 'Bruce', 'Hulce', NULL, '3500', 'Bruce.Hulce@JACANA.COM', '1960-10-21', 'married', 'M', 'F: 110,000 - 129,999'),
('921', 'Bruce', 'Dunaway', NULL, '3500', 'Bruce.Dunaway@JUNCO.COM', '1960-10-21', 'single', 'F', 'F: 110,000 - 129,999'),
('923', 'Bruno', 'Slater', NULL, '5000', 'Bruno.Slater@THRASHER.COM', '1960-10-21', 'married', 'F', 'G: 130,000 - 149,999'),
('924', 'Bruno', 'Montand', NULL, '5000', 'Bruno.Montand@TOWHEE.COM', '1960-10-21', 'single', 'F', 'D: 70,000 - 89,999'),
('927', 'Bryan', 'Belushi', NULL, '2300', 'Bryan.Belushi@TOWHEE.COM', '1960-10-21', 'married', 'M', 'I: 170,000 - 189,999'),
('928', 'Burt', 'Spielberg', NULL, '5000', 'Burt.Spielberg@TROGON.COM', '1960-10-21', 'married', 'M', 'E: 90,000 - 109,999'),
('929', 'Burt', 'Neeson', NULL, '5000', 'Burt.Neeson@TURNSTONE.COM', '1960-10-21', 'single', 'M', 'F: 110,000 - 129,999'),
('930', 'Buster', 'Jackson', NULL, '900', 'Buster.Jackson@KILLDEER.COM', '1960-10-21', 'married', 'M', 'A: Below 30,000'),
('931', 'Buster', 'Edwards', NULL, '900', 'Buster.Edwards@KINGLET.COM', '1960-10-21', 'married', 'M', 'F: 110,000 - 129,999'),
('932', 'Buster', 'Bogart', NULL, '900', 'Buster.Bogart@KISKADEE.COM', '1960-10-21', 'single', 'M', 'H: 150,000 - 169,999'),
('934', 'C. Thomas', 'Nolte', NULL, '600', 'C.Thomas.Nolte@PHOEBE.COM', '1960-10-21', 'married', 'M', 'H: 150,000 - 169,999'),
('980', 'Daniel', 'Loren', NULL, '200', 'Daniel.Loren@REDSTART.COM', '1960-10-21', 'single', 'M', 'F: 110,000 - 129,999'),
('981', 'Daniel', 'Gueney', NULL, '200', 'Daniel.Gueney@REDPOLL.COM', '1960-10-21', 'married', 'M', 'K: 250,000 - 299,999');*/

-- --------------------------------------------------------

--
-- Структура таблицы `COMENZI`
--

CREATE TABLE `COMENZI` (
  `NR_COMANDA` decimal(10,0) NOT NULL,
  `DATA` date DEFAULT NULL,
  `MODALITATE` varchar(8) DEFAULT NULL,
  `ID_CLIENT` decimal(10,0) DEFAULT NULL,
  `STARE_COMANDA` decimal(10,0) DEFAULT NULL,
  `ID_ANGAJAT` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `COMENZI`
--

/*INSERT INTO `COMENZI` (`NR_COMANDA`, `DATA`, `MODALITATE`, `ID_CLIENT`, `STARE_COMANDA`, `ID_ANGAJAT`) VALUES
('2354', '1999-08-17', 'direct', '104', '0', '155'),
('2355', '1999-08-17', 'online', '104', '8', NULL),
('2356', '1999-08-17', 'online', '105', '5', NULL),
('2357', '1999-08-17', 'direct', '108', '5', '158'),
('2358', '1999-08-17', 'direct', '105', '2', '155'),
('2359', '1999-08-17', 'online', '106', '9', NULL),
('2360', '1999-08-17', 'online', '107', '4', NULL),
('2361', '1999-08-17', 'online', '108', '8', NULL),
('2362', '2000-08-17', 'online', '109', '4', NULL),
('2363', '1999-08-17', 'online', '144', '0', NULL),
('2364', '2000-07-17', 'online', '145', '4', NULL),
('2365', '1999-08-17', 'online', '146', '9', NULL),
('2366', '1999-08-17', 'online', '147', '5', NULL),
('2367', '1999-08-17', 'online', '148', '10', NULL),
('2368', '1999-08-17', 'online', '149', '10', NULL),
('2369', '1999-08-17', 'online', '116', '0', NULL),
('2370', '1999-08-17', 'online', '117', '4', NULL),
('2371', '1999-08-17', 'online', '118', '6', NULL),
('2372', '1999-08-17', 'online', '119', '9', NULL),
('2373', '1999-08-17', 'online', '120', '4', NULL),
('2374', '1999-08-17', 'online', '121', '0', NULL),
('2375', '1999-08-17', 'online', '122', '2', NULL),
('2376', '1999-08-17', 'online', '123', '6', NULL),
('2377', '1999-08-17', 'online', '141', '5', NULL),
('2378', '1999-08-17', 'online', '142', '5', NULL),
('2379', '1999-08-17', 'direct', '146', '8', '161'),
('2380', '1999-08-17', 'online', '143', '3', NULL),
('2381', '1999-08-17', 'direct', '106', '3', '156'),
('2382', '2000-08-17', 'online', '144', '8', NULL),
('2383', '1999-08-17', 'online', '145', '8', NULL),
('2384', '1999-08-17', 'online', '146', '3', NULL),
('2385', '1999-08-17', 'online', '147', '4', NULL),
('2386', '1999-08-17', 'online', '148', '10', NULL),
('2387', '1999-08-17', 'online', '149', '5', NULL),
('2388', '1999-08-17', 'online', '150', '4', NULL),
('2389', '1999-08-17', 'online', '151', '4', NULL),
('2390', '1999-08-17', 'online', '152', '9', NULL),
('2391', '1999-08-17', 'direct', '153', '2', '156'),
('2392', '1999-08-17', 'direct', '154', '9', '161'),
('2393', '1999-08-17', 'direct', '155', '4', '161'),
('2394', '1999-08-17', 'direct', '109', '5', '158'),
('2395', '1999-11-17', 'direct', '156', '3', '163'),
('2396', '1999-08-17', 'direct', '147', '8', '161'),
('2397', '1999-08-17', 'direct', '102', '1', '154'),
('2398', '1999-11-17', 'direct', '157', '9', '163'),
('2399', '1999-08-17', 'direct', '158', '0', '161'),
('2400', '1999-08-17', 'direct', '159', '2', '161'),
('2401', '1999-08-17', 'direct', '160', '3', '163'),
('2402', '1999-08-17', 'direct', '161', '8', '154'),
('2403', '1999-08-17', 'direct', '162', '0', '154'),
('2404', '1999-08-17', 'direct', '163', '6', '158'),
('2405', '1999-08-17', 'direct', '164', '5', '159'),
('2406', '1999-08-17', 'direct', '148', '8', '161'),
('2407', '1999-08-17', 'direct', '165', '9', '155'),
('2408', '1999-08-17', 'direct', '166', '1', '158'),
('2409', '1999-08-17', 'direct', '167', '2', '154'),
('2410', '1999-08-17', 'direct', '168', '6', '156'),
('2411', '1999-08-17', 'direct', '169', '8', '156'),
('2412', '1999-08-17', 'direct', '170', '9', '158'),
('2413', '1999-08-17', 'direct', '101', '5', '161'),
('2414', '1999-08-17', 'direct', '102', '8', '153'),
('2415', '1999-08-17', 'direct', '103', '6', '161'),
('2416', '1999-08-17', 'direct', '104', '6', '160'),
('2417', '1999-08-17', 'direct', '105', '5', '163'),
('2418', '1999-08-17', 'direct', '106', '4', '163'),
('2419', '1999-08-17', 'direct', '107', '3', '160'),
('2420', '1999-08-17', 'direct', '108', '2', '160'),
('2421', '1999-08-17', 'direct', '109', '1', NULL),
('2422', '1999-08-17', 'direct', '144', '2', '153'),
('2423', '1999-08-17', 'direct', '145', '3', '160'),
('2424', '1999-08-17', 'direct', '146', '4', '153'),
('2425', '1999-08-17', 'direct', '147', '5', '163'),
('2426', '1999-08-17', 'direct', '148', '6', NULL),
('2427', '1999-08-17', 'direct', '149', '7', '163'),
('2428', '1999-08-17', 'direct', '116', '8', NULL),
('2429', '1999-08-17', 'direct', '117', '9', '154'),
('2430', '1999-08-17', 'direct', '101', '8', '159'),
('2431', '1999-08-17', 'direct', '102', '1', '163'),
('2432', '1999-08-17', 'direct', '102', '10', '163'),
('2433', '1999-08-17', 'direct', '103', '10', '163'),
('2434', '1999-08-17', 'direct', '149', '8', '161'),
('2435', '1999-08-17', 'direct', '144', '6', '159'),
('2436', '1999-08-17', 'direct', '116', '8', '161'),
('2437', '1999-08-17', 'direct', '103', '4', '163'),
('2438', '1999-08-17', 'direct', '104', '0', '154'),
('2439', '1999-08-17', 'direct', '105', '1', '159'),
('2440', '1999-08-17', 'direct', '107', '3', '156'),
('2441', '1999-08-17', 'direct', '106', '5', '160'),
('2442', '1999-08-17', 'direct', '107', '9', '154'),
('2443', '1999-08-17', 'direct', '108', '0', '154'),
('2444', '1999-08-17', 'direct', '109', '1', '155'),
('2445', '1999-08-17', 'direct', '144', '8', '158'),
('2446', '1999-08-17', 'direct', '117', '8', '161'),
('2447', '1999-08-17', 'direct', '101', '8', '161'),
('2448', '1999-08-17', 'direct', '145', '5', '158'),
('2449', '1999-08-17', 'direct', '146', '6', '155'),
('2450', '1999-08-17', 'direct', '147', '3', '159'),
('2451', '1999-08-17', 'direct', '148', '7', '154'),
('2452', '1999-08-17', 'direct', '149', '5', '159'),
('2453', '1999-08-17', 'direct', '116', '0', '153'),
('2454', '1999-08-17', 'direct', '103', '1', '154'),
('2455', '1999-08-17', 'direct', '145', '7', '160'),
('2456', '1999-08-17', 'direct', '117', '0', '163'),
('2457', '1999-08-17', 'direct', '118', '5', '159'),
('2458', '1999-08-17', 'direct', '101', '0', '153');*/

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `d`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `d` (
`salariul` decimal(10,0)
);

-- --------------------------------------------------------

--
-- Структура таблицы `DEPARTAMENTE`
--

CREATE TABLE `DEPARTAMENTE` (
  `ID_DEPARTAMENT` decimal(10,0) NOT NULL,
  `DENUMIRE_DEPARTAMENT` varchar(30) DEFAULT NULL,
  `ID_MANAGER` decimal(10,0) DEFAULT NULL,
  `ID_LOCATIE` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `DEPARTAMENTE`
--

/*INSERT INTO `DEPARTAMENTE` (`ID_DEPARTAMENT`, `DENUMIRE_DEPARTAMENT`, `ID_MANAGER`, `ID_LOCATIE`) VALUES
('10', 'Administration', '200', '1700'),
('20', 'Marketing', '201', '1800'),
('30', 'Purchasing', '114', '1700'),
('40', 'Human Resources', '203', '2400'),
('50', 'Shipping', '121', '1500'),
('60', 'IT', '103', '1400'),
('70', 'Public Relations', '204', '2700'),
('80', 'Sales', '145', '2500'),
('90', 'Executive', '100', '1700'),
('100', 'Finance', '108', '1700'),
('110', 'Accounting', '205', '1700'),
('120', 'Treasury', NULL, '1700'),
('130', 'Corporate Tax', NULL, '1700'),
('140', 'Control And Credit', NULL, '1700'),
('150', 'Shareholder Services', NULL, '1700'),
('160', 'Benefits', NULL, '1700'),
('170', 'Manufacturing', NULL, '1700'),
('180', 'Construction', NULL, '1700'),
('190', 'Contracting', NULL, '1700'),
('200', 'Operations', NULL, '1700'),
('210', 'IT Support', NULL, '1700'),
('220', 'NOC', NULL, '1700'),
('230', 'IT Helpdesk', NULL, '1700'),
('240', 'Government Sales', NULL, '1700'),
('250', 'Retail Sales', NULL, '1700'),
('260', 'Recruiting', NULL, '1700'),
('270', 'Payroll', NULL, '1700');*/

-- --------------------------------------------------------

--
-- Структура таблицы `FUNCTII`
--

CREATE TABLE `FUNCTII` (
  `ID_FUNCTIE` varchar(10) NOT NULL,
  `DENUMIRE_FUNCTIE` varchar(35) DEFAULT NULL,
  `SALARIU_MIN` decimal(10,0) DEFAULT NULL,
  `SALARIU_MAX` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `FUNCTII`
--

/*INSERT INTO `FUNCTII` (`ID_FUNCTIE`, `DENUMIRE_FUNCTIE`, `SALARIU_MIN`, `SALARIU_MAX`) VALUES
('AC_ACCOUNT', 'Public Accountant', '4200', '9000'),
('AC_MGR', 'Accounting Manager', '8200', '16000'),
('AD_ASST', 'Administration Assistant', '3000', '6000'),
('AD_PRES', 'President', '20000', '40000'),
('AD_VP', 'Administration Vice President', '15000', '30000'),
('FI_ACCOUNT', 'Accountant', '4200', '9000'),
('FI_MGR', 'Finance Manager', '8200', '16000'),
('HR_REP', 'Human Resources Representative', '4000', '9000'),
('IT_PROG', 'Programmer', '4000', '10000'),
('MK_MAN', 'Marketing Manager', '9000', '15000'),
('MK_REP', 'Marketing Representative', '4000', '9000'),
('PR_REP', 'Public Relations Representative', '4500', '10500'),
('PU_CLERK', 'Purchasing Clerk', '2500', '5500'),
('PU_MAN', 'Purchasing Manager', '8000', '15000'),
('SA_MAN', 'Sales Manager', '10000', '20000'),
('SA_REP', 'Sales Representative', '6000', '12000'),
('SH_CLERK', 'Shipping Clerk', '2500', '5500'),
('ST_CLERK', 'Stock Clerk', '2000', '5000'),
('ST_MAN', 'Stock Manager', '5500', '8500');*/

-- --------------------------------------------------------

--
-- Структура таблицы `ISTORIC_FUNCTII`
--

CREATE TABLE `ISTORIC_FUNCTII` (
  `ID_ANGAJAT` decimal(10,0) NOT NULL,
  `DATA_INCEPUT` date NOT NULL,
  `DATA_SFARSIT` date DEFAULT NULL,
  `ID_FUNCTIE` varchar(10) DEFAULT NULL,
  `ID_DEPARTAMENT` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ISTORIC_FUNCTII`
--

/*INSERT INTO `ISTORIC_FUNCTII` (`ID_ANGAJAT`, `DATA_INCEPUT`, `DATA_SFARSIT`, `ID_FUNCTIE`, `ID_DEPARTAMENT`) VALUES
('102', '1987-06-01', '1987-07-30', 'IT_PROG', '60'),
('101', '1981-04-12', '1981-04-12', 'AC_ACCOUNT', '110'),
('101', '1981-04-12', '1981-04-12', 'AC_MGR', '110'),
('201', '1981-04-12', '1981-04-12', 'MK_REP', '20'),
('114', '1987-06-04', '1987-07-28', 'ST_CLERK', '50'),
('122', '1981-04-12', '1981-04-12', 'ST_CLERK', '50'),
('200', '1981-04-12', '1981-04-12', 'AD_ASST', '90'),
('176', '1981-04-12', '1981-04-12', 'SA_REP', '80'),
('176', '1981-04-12', '1981-04-12', 'SA_MAN', '80'),
('200', '1981-04-12', '1981-04-12', 'AC_ACCOUNT', '90');*/

-- --------------------------------------------------------

--
-- Структура таблицы `LOCATII`
--

CREATE TABLE `LOCATII` (
  `ID_LOCATIE` decimal(10,0) NOT NULL,
  `ADRESA` varchar(40) DEFAULT NULL,
  `COD_POSTAL` varchar(12) DEFAULT NULL,
  `ORAS` varchar(30) DEFAULT NULL,
  `ZONA` varchar(25) DEFAULT NULL,
  `ID_TARA` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `LOCATII`
--

/*INSERT INTO `LOCATII` (`ID_LOCATIE`, `ADRESA`, `COD_POSTAL`, `ORAS`, `ZONA`, `ID_TARA`) VALUES
('1300', '9450 Kamiya-cho', '6823', 'Hiroshima', NULL, 'JP'),
('1400', '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US'),
('1500', '2011 Interiors Blvd', '99236', 'South San Francisco', 'California', 'US'),
('1600', '2007 Zagora St', '50090', 'South Brunswick', 'New Jersey', 'US'),
('1700', '2004 Charade Rd', '98199', 'Seattle', 'Washington', 'US'),
('1800', '147 Spadina Ave', 'M5V 2L7', 'Toronto', 'Ontario', 'CA'),
('1900', '6092 Boxwood St', 'YSW 9T2', 'Whitehorse', 'Yukon', 'CA'),
('2000', '40-5-12 Laogianggen', '190518', 'Beijing', NULL, 'CN'),
('1000', '1297 Via Cola di Rie', '00989', 'Roma', NULL, 'IT'),
('1100', '93091 Calle della Testa', '10934', 'Venice', NULL, 'IT'),
('1200', '2017 Shinjuku-ku', '1689', 'Tokyo', 'Tokyo Prefecture', 'JP'),
('1300', '9450 Kamiya-cho', '6823', 'Hiroshima', NULL, 'JP'),
('1400', '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US'),
('1500', '2011 Interiors Blvd', '99236', 'South San Francisco', 'California', 'US'),
('1600', '2007 Zagora St', '50090', 'South Brunswick', 'New Jersey', 'US'),
('1700', '2004 Charade Rd', '98199', 'Seattle', 'Washington', 'US'),
('1800', '147 Spadina Ave', 'M5V 2L7', 'Toronto', 'Ontario', 'CA'),
('1900', '6092 Boxwood St', 'YSW 9T2', 'Whitehorse', 'Yukon', 'CA'),
('2000', '40-5-12 Laogianggen', '190518', 'Beijing', NULL, 'CN'),
('2100', '1298 Vileparle (E)', '490231', 'Bombay', 'Maharashtra', 'IN'),
('2200', '12-98 Victoria Street', '2901', 'Sydney', 'New South Wales', 'AU'),
('2300', '198 Clementi North', '540198', 'Singapore', NULL, 'SG'),
('2400', '8204 Arthur St', NULL, 'London', NULL, 'UK'),
('2500', 'Magdalen Centre, The Oxford Science Park', 'OX9 9ZB', 'Oxford', 'Oxford', 'UK'),
('2600', '9702 Chester Road', '09629850293', 'Stretford', 'Manchester', 'UK'),
('2700', 'Schwanthalerstr. 7031', '80925', 'Munich', 'Bavaria', 'DE'),
('2800', 'Rua Frei Caneca 1360 ', '01307-002', 'Sao Paulo', 'Sao Paulo', 'BR'),
('2900', '20 Rue des Corps-Saints', '1730', 'Geneva', 'Geneve', 'CH'),
('3000', 'Murtenstrasse 921', '3095', 'Bern', 'BE', 'CH'),
('3100', 'Pieter Breughelstraat 837', '3029SK', 'Utrecht', 'Utrecht', 'NL'),
('3200', 'Mariano Escobedo 9991', '11932', 'Mexico City', 'Distrito Federal,', 'MX');*/

-- --------------------------------------------------------

--
-- Структура таблицы `PRODUSE`
--

CREATE TABLE `PRODUSE` (
  `ID_PRODUS` decimal(10,0) NOT NULL,
  `DENUMIRE_PRODUS` varchar(50) DEFAULT NULL,
  `DESCRIERE` varchar(2000) DEFAULT NULL,
  `CATEGORIE` varchar(40) DEFAULT NULL,
  `PRET_LISTA` decimal(10,0) DEFAULT NULL,
  `PRET_MIN` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `PRODUSE`
--

/*INSERT INTO `PRODUSE` (`ID_PRODUS`, `DENUMIRE_PRODUS`, `DESCRIERE`, `CATEGORIE`, `PRET_LISTA`, `PRET_MIN`) VALUES
('1726', 'LCD Monitor 11/PM', 'Liquid Cristal Display 11 inch passive monitor. The virtually-flat, high-resolution screen delivers outstanding image quality with reduced glare.', 'hardware1', '259', '208'),
('1729', 'Chemicals - RCP', 'Cleaning Chemicals - 3500 roller clean pads', 'office4', '80', '66'),
('1733', 'PS 220V /UK', '220V Power supply type - United Kingdom', 'hardware8', '89', '76'),
('1734', 'Cable RS232 10/AM', '10 ft RS232 cable with M/M and 9M/25M adapters', 'hardware8', '6', '5'),
('1737', 'Cable SCSI 10/FW/ADS', '10ft SCSI2 F/W Adapt to DSxx0 Cable', 'hardware8', '8', '6'),
('1738', 'PS 110V /US', '110 V Power Supply - US compatible', 'hardware8', '86', '70'),
('1739', 'SDRAM - 128 MB', 'SDRAM memory, 128 MB capacity. SDRAM can access data at speeds up to 100 MHz, which is up to four times as fast as standard DRAMs. The advantages of SDRAM can be fully realized, however, only by computers designed to support SDRAM. SDRAM is available on 5 and 3.3 volt DIMMs.', 'hardware4', '299', '248'),
('1740', 'TD 12GB/DAT', 'Tape drive - 12 gigabyte capacity, DAT format.', 'hardware7', '134', '111'),
('1742', 'CD-ROM 500/16x', 'CD drive, read only, speed 16x, maximum capacity 500 MB.', 'hardware7', '101', '81'),
('1743', 'HD 18.2GB @10000 /E', 'External hard drive disk - 18.2 GB, rated up to 10,000 RPM. These drives are intended for use in today\'s demanding, data-critical enterprise environments and are ideal for use in RAID applications.', 'hardware3', '800', '661'),
('1745', 'Cable SCSI 20/WD->D', '20ft SCSI2 Wide Disk Store to Disk Store Cable', 'hardware8', '9', '7'),
('1748', 'PS 220V /EUR', '220 Volt Power supply type - Europe', 'hardware8', '83', '70'),
('1749', 'DIMM - 256MB', 'Memory DIMM: RAM 256 MB. (100-MHz Registered SDRAM)', 'hardware4', '337', '300'),
('1750', 'DIMM - 2GB', 'Memory DIMM: RAM, 2 GB capacity.', 'hardware4', '699', '560'),
('1755', '32MB Cache /NM', '32MB Non-Mirrored cache memory', 'hardware4', '121', '99'),
('1761', 'CD-ROM 600/I/32x', '600 MB Internal CD-ROM Drive, speed 32x (read only).', 'hardware7', '134', '119'),
('1763', 'DIMM - 64MB', 'Memory DIMM: RAM, 64MB (100-MHz Unregistered ECC SDRAM)', 'hardware4', '247', '202'),
('1768', 'HD 8.2GB @5400', 'Hard drive disk - 8.2 GB, rated up to 5,400 RPM. Supra drives eliminate the risk of firmware incompatibility. Standard serial RS-232 interface.', 'hardware3', '345', '306'),
('1769', 'GP 800x600', 'Graphics processor, resolution 800 x 600 pixels. Remarkable value for users requiring great 2D capabilities or general 3D support for advanced applications. Drives incredible performance in highly complex models and frees the customer to focus on the design, instead of the rendering process.', 'hardware5', '48', NULL),
('1770', '8MB Cache /NM', '8MB Non-Mirrored Cache Memory (100-MHz Registered SDRAM)', 'hardware4', NULL, '73'),
('1772', 'HD 9.1GB @10000', 'Hard disk drive - 9.1 GB, rated up to 10,000 RPM. These drives are intended for use in data-critical enterprise environments. Ease of doing business: you can easily select the drives you need regardless of the application in which they will be deployed.', 'hardware3', '456', '393'),
('1774', 'Base ISO CP - BL', 'Base ISO Communication Package - Base License', 'software6', '110', '93'),
('1775', 'Client ISO CP - S', 'ISO Communication Package add-on license for additional SPNIX V3.3 client.', 'software6', '27', '22'),
('1778', 'C for SPNIX3.3 - 1 Seat', 'C programming software for SPNIX V3.3 - single user', 'software5', '62', '52'),
('1779', 'C for SPNIX3.3 - Doc', 'C programming language documentation', 'software5', '128', '112'),
('1780', 'C for SPNIX3.3 - Sys', 'C programming software for SPNIX V3.3 - system compiler, libraries, linker', 'software5', '450', '385'),
('1781', 'CDW 20/48/E', 'CD Writer, read 48x, write 20x', 'hardware7', '233', '206'),
('1782', 'Compact 400/DQ', '400 characters per second high-speed draft printer. Dimensions (HxWxD): 17.34 x 24.26 x 26.32 inch. Interface: RS-232 serial (9-pin), no expansion slots. Paper size: A4, US Letter.', 'hardware2', '125', '108'),
('1787', 'CPU D300', 'Dual CPU @ 300Mhz. For light personal processing only, or file servers with less than 5 concurrent users. This product will probably become obsolete soon.', 'hardware5', '101', '90'),
('1788', 'CPU D600', 'Dual CPU @ 600Mhz. State of the art, high clock speed; for heavy load WAN servers (up to 200 concurrent users).', 'hardware5', '178', '149'),
('1791', 'Industrial 700/HD', '700 characters per second dot-matrix printer with harder body and dust protection for industrial uses. Interface: Centronics parallel, IEEE 1284 compliant. Paper size: 3x5 inch to 11x17 inch full bleed wide format. Memory: 4MB. Dimensions (HxWxD): 9.3 x 16.5 x 13 inch.', 'hardware2', '275', '239'),
('1792', 'Industrial 600/DQ', 'Wide carriage color capability 600 characters per second high-speed draft printer. Dimensions (HxWxD): 22.31 x 25.73 x 20.12 inch. Paper size: 3x5 inch to 11x17 inch full bleed wide format.', 'hardware2', '225', '180'),
('1794', 'OSI 8-16/IL', 'OSI Layer 8 to 16 - Incremental License', 'software6', '128', '112'),
('1797', 'Inkjet C/8/HQ', 'Inkjet printer, color, 8 pages per minute, high resolution (photo quality). Memory: 16MB. Dimensions (HxWxD): 7.3 x 17.5 x 14 inch. Paper size: A4, US Letter, envelopes. Interface: Centronics parallel, IEEE 1284 compliant.', 'hardware2', '349', '288'),
('1799', 'SPNIX3.3 - SL', 'Operating System Software: SPNIX V3.3 - Base Server License. Includes 10 general licenses for system administration, developers, or users. No network user licensing. ', 'software4', '1000', '874'),
('1801', 'SPNIX3.3 - AL', 'Operating System Software: SPNIX V3.3 - Additional system administrator license, including network access.', 'software4', '100', '88'),
('1803', 'SPNIX3.3 - DL', 'Operating System Software: SPNIX V3.3 - Additional developer license.', 'software4', '60', '51'),
('1804', 'SPNIX3.3 - UL/N', 'Operating System Software: SPNIX V3.3 - Additional user license with network access.', 'software4', '65', '56'),
('1805', 'SPNIX3.3 - UL/A', 'Operating System Software: SPNIX V3.3 - Additional user license class A.', 'software4', '50', '42'),
('1806', 'SPNIX3.3 - UL/C', 'Operating System Software: SPNIX V3.3 - Additional user license class C.', 'software4', '50', '42'),
('1808', 'SPNIX3.3 - UL/D', 'Operating System Software: SPNIX V3.3 - Additional user license class D.', 'software4', '55', '46'),
('1820', 'SPNIX3.3 - NL', 'Operating System Software: SPNIX V3.3 - Additional network access license.', 'software4', '55', '45'),
('1822', 'SPNIX4.0 - SL', 'Operating System Software: SPNIX V4.0 - Base Server License. Includes 10 general licenses for system administration, developers, or users. No network user licensing. ', 'software4', '1500', '1303'),
('1825', 'X25 - 1 Line License', 'X25 network access control system, single user', 'software6', '25', '21'),
('1910', 'FG Stock - H', 'Fiberglass Stock - heavy duty, 1 thick', 'office4', '14', '11'),
('1912', 'SS Stock - 3mm', 'Stainless steel stock - 3mm. Can be predrilled for standard power supplies, motherboard holders, and hard drives. Please use appropriate template to identify model number, placement, and size of finished sheet when placing order for drilled sheet.', 'office4', '15', '12'),
('1940', 'ESD Bracelet/Clip', 'Electro static discharge bracelet with alligator clip for easy connection to computer chassis or other ground.', 'office4', '18', '14'),
('1948', 'Envoy IC/58', 'Internet computer with built-in 58K modem', 'hardware8', '498', '428'),
('2004', 'IC Browser - S', 'IC Web Browser for SPNIX. Browser with network mail capability.', 'software6', '90', '80'),
('2005', 'IC Browser Doc - S', 'Documentation set for IC Web Browser for SPNIX. Includes Installation Manual, Mail Server Administration Guide, and User Quick Reference.', 'software6', '115', '100'),
('2030', 'Latex Gloves', 'Latex Gloves for assemblers, chemical handlers, fitters. Heavy duty, safety orange, with textured grip on fingers and thumb. Waterproof and shock-proof up to 220 volts/2 amps, 110 volts/5 amps. Acid proof for up to 5 minutes.', 'office4', '12', '10'),
('2049', 'MB - S300', 'PC type motherboard, 300 Series.', 'hardware5', '55', '47'),
('2056', 'Mouse Pad /CL', 'Standard mouse pad, with corporate logo', 'hardware6', '8', '6'),
('2058', 'Mouse +WP', 'Combination of a mouse and a wrist pad for more comfortable typing and mouse operation.', 'hardware6', '23', '19'),
('2091', 'Paper Tablet LW 8 1/2 x 11', 'Paper tablet, lined, white, size 8 1/2 x 11 inch', 'office2', '1', '0'),
('2093', 'Pens - 10/FP', 'Permanent ink pen dries quickly and is smear resistant. Provides smooth, skip-free writing. Fine point. Single color boxes (black, blue, red) or assorted box (6 black, 3 blue, and 1 red).', 'office2', '8', '7'),
('2144', 'Card Organizer Cover', 'Replacement cover for desk top style business card holder. Smoke grey (original color) or clear plastic.', 'office2', '18', '14'),
('2152', 'Router - DTMF4', 'DTMF 4 port router', 'hardware8', '231', '191'),
('2211', 'Wrist Pad', 'A foam strip to support your wrists when using a keyboard', 'hardware6', '4', '3'),
('2231', 'Desk - S/V', 'Standard-sized desk; capitalizable, taxable item. Final finish is from veneer in stock at time of order, including oak, ash, cherry, and mahogany.', 'office1', '2510', '2114'),
('2236', 'Plasma Monitor 10/TFT/XGA', '10 inch TFT XGA flatscreen monitor for laptop computers', 'hardware1', '964', '863'),
('2243', 'Monitor 17/HR/F', 'Monitor 17 inch (16 viewable) high resolution, flat screen. High density photon gun with Enhanced Elliptical Correction System for more consistent, accurate focus across the screen, even in the corners.', 'hardware1', '350', '302'),
('2245', 'Monitor 19/SD/M', 'Monitor 19 (18 Viewable) short depth, Monochrome. Outstanding image performance in a compact design. A simple, on-screen dislay menu helps you easily adjust screen dimensions, colors and image attributes. Just plug your monitor into your PC and you are ready to go.', 'hardware1', '512', '420'),
('2252', 'Monitor 21/HR/M', 'Monitor 21 inch (20 viewable) high resolution, monochrome. Unit size: 35.6 x 29.6 x 33.3 cm (14.6 kg) Package: 40.53 x 31.24 x 35.39 cm (16.5 kg). Horizontal frequency 31.5 - 54 kHz, Vertical frequency 50 - 120 Hz. Universal power supply 90 - 132 V, 50 - 60 Hz.', 'hardware1', '889', '717'),
('2253', 'HD 10GB @5400 /SE', '10GB capacity hard disk drive (external) SCSI interface, 5400 RPM. Universal option kits are configured and pre-mounted in the appropriate hot plug tray for immediate installation into your corporate server or storage system. Supra drives eliminate the risk of firmware incompatibility.', 'hardware3', '399', '322'),
('2254', 'HD 10GB /I', '10GB capacity hard disk drive (internal). These drives are intended for use in today\'s demanding, data-critical enterprise environments and are ideal for use in RAID applications. Universal option kits are configured and pre-mounted in the appropriate hot plug tray for immediate installation into your corporate server or storage system.', 'hardware3', '453', '371'),
('2255', 'HD 12GB @7200 /SE', '12GB capacity hard disk drive (external) SCSI, 7200 RPM. These drives are intended for use in today\'s demanding, data-critical enterprise environments and can be used in RAID applications. Universal option kits are configured and pre-mounted in the appropriate hot plug tray for immediate installation into your corporate server or storage system.', 'hardware3', '775', '628'),
('2257', 'HD 8GB /I', '8GB capacity hard disk drive (internal). Supra9 hot pluggable hard disk drives provide the ability to install or remove drives on-line. Backward compatibility: You can mix Supra2 and Supra3 devices for optimized solutions and future growth.', 'hardware3', '399', '338'),
('2259', 'FD 1.44/3.5', 'Floppy Drive - 1.44 MB High Density capacity - 3.5 inch chassis', 'hardware7', '39', '32'),
('2260', 'DFD 1.44/3.5', 'Dual Floppy Drive - 1.44 MB - 3.5', 'hardware7', '67', '54'),
('2261', 'FD 1.44/3.5/E', 'Floppy disk drive - 1.44 MB (high density) capacity - 3.5 inch (external)', 'hardware7', '42', '37'),
('2262', 'ZIP 100', 'ZIP Drive, 100 MB capacity (external) plus cable for parallel port connection', 'hardware7', '98', '81'),
('2264', 'CDW 20/48/I', 'CD-ROM drive: read 20x, write 48x (internal)', 'hardware7', '223', '181'),
('2266', 'DVD 12x', 'DVD-ROM drive: speed 12x', 'hardware7', '333', '270'),
('2268', 'Modem - 56/H/E', 'Standard Hayes compatible modem - 56kb per second, external. Power supply: 220V.', 'hardware7', '77', '67'),
('2270', 'Modem - 56/90/I', 'Modem - 56kb per second, v.90 PCI Global compliant. Internal, for standard chassis (3.5 inch).', 'hardware7', '66', '56'),
('2272', 'RAM - 16 MB', 'Memory SIMM: RAM - 16 MB capacity.', 'hardware4', '135', '110'),
('2274', 'RAM - 32 MB', 'Memory SIMM: RAM - 32 MB capacity.', 'hardware4', '161', '135'),
('2276', 'SDRAM - 48 MB', 'Memory SIMM: RAM - 48 MB. SDRAM can operate in burst mode. In burst mode, when a single data address is accessed, an entire block of data is retrieved rather than just the one piece. The assumption is that the next piece of data that will be requested will be sequential to the previous. Since this is usually the case, data is held readily available.', 'hardware4', '269', '215'),
('2278', 'Battery - NiHM', 'Rechargeable NiHM battery for laptop computers', 'hardware8', '55', '48'),
('2289', 'KB 101/ES', 'Standard PC/AT Enhanced Keyboard (101/102-Key). Input locale: Spanish.', 'hardware6', '48', '38'),
('2293', 'MB - S600', 'Motherboard, 600 Series.', 'hardware5', '99', '87'),
('2299', 'PS 12V /P', 'Power Supply - 12v portable', 'hardware8', '76', '64'),
('2302', 'Inkjet B/6', 'Inkjet Printer, black and white, 6 pages per minute, resolution 600x300 dpi. Interface: Centronics parallel, IEEE 1284 compliant. Dimensions (HxWxD): 7.3 x 17.5 x 14 inch. Paper size: A3, A4, US legal. No expansion slots.', 'hardware2', '150', '121'),
('2308', 'Video Card /E32', '3-D ELSA Video Card, with 32 MB memory.', 'hardware5', '58', '48'),
('2311', 'PS 220V /L', 'Power supply for laptop computers, 220V', 'hardware8', '95', '79'),
('2316', 'Screws <S.32.S>', 'Screws: Steel, size 32mm, straight. Plastic box, contents 500.', 'hardware8', '22', '19'),
('2319', 'Screws <Z.24.S>', 'Screws: Zinc, size 24mm, straight. Carton box, contents 500.', 'hardware8', '25', '21'),
('2322', 'Screws <Z.28.P>', 'Screws: Zinc, size 28 mm, Phillips head. Carton box, contents 850.', 'hardware8', '23', '18'),
('2323', 'Screws <B.32.P>', 'Screws: Brass, size 32mm, Phillips head. Plastic box, contents 400.', 'hardware8', '18', '14'),
('2326', 'Plastic Stock - Y', 'Plastic Stock - Yellow, standard quality.', 'office4', '2', '1'),
('2330', 'Plastic Stock - R', 'Plastic Stock - Red, standard quality.', 'office4', '2', '1'),
('2334', 'Resin', 'General purpose synthetic resin.', 'office4', '4', '3'),
('2335', 'Mobile phone', 'Dual band mobile phone with low battery consumption. Lightweight, foldable, with socket for single earphone and spare battery compartment.', 'office1', '100', '83'),
('2336', 'Business Cards Box - 250', 'Business cards box, capacity 250. Use form BC110-2, Rev. 3/2000 (hardcopy or online) when ordering and complete all fields marked with an asterisk.', 'office2', '55', '49'),
('2337', 'Business Cards - 1000/2L', 'Business cards box, capacity 1000, 2-sided with different language on each side. Use form BC111-2, Rev. 12/1999 (hardcopy or online) when ordering - complete all fields marked with an asterisk and check box for second language (English is always on side 1).', 'office2', '300', '246'),
('2339', 'Paper - Std Printer', '20 lb. 8.5x11 inch white laser printer paper (recycled), ten 500-sheet reams', 'office2', '25', '21'),
('2340', 'Chemicals - SW', 'Cleaning Chemicals - 3500 staticide wipes', 'office4', '72', '59'),
('2350', 'Desk - W/48', 'Desk - 48 inch white laminate without return; capitalizable, taxable item.', 'office1', '2500', '2129'),
('2351', 'Desk - W/48/R', 'Desk - 60 inch white laminate with 48 inch return; capitalizable, taxable item.', 'office1', '2900', '2386'),
('2359', 'LCD Monitor 9/PM', 'Liquid Cristal Display 9 inch passive monitor. Enjoy the productivity that a small monitor can bring via more workspace on your desk. Easy setup with plug-and-play compatibility.', 'hardware1', '249', '206'),
('2365', 'Chemicals - TCS', 'Cleaning Chemical - 2500 transport cleaning sheets', 'office4', '78', '69'),
('2370', 'PS 220V /HS/FR', '220V hot swappable power supply, for France.', 'hardware8', '91', '75'),
('2371', 'C for SPNIX4.0 - Doc', 'C programming language documentation, SPNIX V4.0', 'software5', '146', '119'),
('2373', 'Cable RS232 10/AF', '10 ft RS232 cable with F/F and 9F/25F adapters', 'hardware8', '6', '4'),
('2374', 'Modem - C/100', 'DOCSIS/EURODOCSIS 1.0/1.1-compliant external cable modem', 'hardware7', '65', '54'),
('2375', 'GP 1024x768', 'Graphics Processor, resolution 1024 X 768 pixels. Outstanding price/performance for 2D and 3D applications under SPNIX v3.3 and v4.0. Double your viewing power by running two monitors from this single card. Two 17 inch monitors have more screen area than one 21 inch monitor. Excellent option for users that multi-task frequently or access data from multiple sources often.', 'hardware5', '78', '69'),
('2377', 'PS 110V HS/US', '110 V hot swappable power supply - US compatible', 'hardware8', '97', '82'),
('2378', 'DIMM - 128 MB', '128 MB DIMM memory. The main reason for the change from SIMMs to DIMMs is to support the higher bus widths of 64-bit processors. DIMMs are 64- or 72-bits wide; SIMMs are only 32- or 36-bits wide (with parity).', 'hardware4', '305', '247'),
('2380', 'Cable PR/15/P', '15 foot parallel printer cable', 'hardware8', '6', '5'),
('2381', 'CD-ROM 8x', 'CD Writer, read only, speed 8x', 'hardware7', '99', '82'),
('2382', 'HD 18.2GB@10000 /I', '18.2 GB SCSI hard disk @ 10000 RPM (internal). Supra7 Universal disk drives provide an unequaled level of investment protection and simplification for customers by enabling drive compatibility across many enterprise platforms.', 'hardware3', '850', '731'),
('2384', 'DIMM - 1GB', 'Memory DIMM: RAM - 1 GB capacity.', 'hardware4', '599', '479'),
('2387', 'PS 220V /FR', '220V Power supply type - France', 'hardware8', '83', '66'),
('2394', 'DIMM - 32MB', '32 MB DIMM Memory upgrade', 'hardware4', '128', '106'),
('2395', '32MB Cache /M', '32MB Mirrored cache memory (100-MHz Registered SDRAM)', 'hardware4', '123', '109'),
('2396', 'EDO - 32MB', 'Memory EDO SIM: RAM, 32 MB (100-MHz Unregistered ECC SDRAM). Like FPM, EDO is available on SIMMs and DIMMs, in 3.3 and 5 volt varieties If EDO memory is installed in a computer that was not designed to support it, the memory may not work.', 'hardware4', '179', '149'),
('2400', 'DIMM - 512 MB', '512 MB DIMM memory. Improved memory upgrade granularity: Fewer DIMMs are required to upgrade a system than it would require if using SIMMs in the same system. Increased maximum memory ceilings: Given the same number of memory slots, the maximum memory of a system using DIMMs is more than one using SIMMs. DIMMs have separate contacts on each side of the board, which provide two times the data rate as one SIMM.', 'hardware4', '448', '380'),
('2402', 'CD-ROM 600/E/24x', '600 MB external 24x speed CD-ROM drive (read only).', 'hardware7', '127', '113'),
('2403', 'CD-ROM 600/I/24x', '600 MB internal read only CD-ROM drive, reading speed 24x', 'hardware7', '117', '103'),
('2404', '64MB Cache /NM', '64 MB Non-mirrored cache memory. FPM memory chips are implemented on 5 volt SIMMs, but are also available on 3.3 volt DIMMs.', 'hardware4', '221', '180'),
('2406', '64MB Cache /M', '64MB Mirrored cache memory', 'hardware4', '223', '178'),
('2408', 'Cable PR/P/6', 'Standard Centronics 6ft printer cable, parallel port', 'hardware8', '4', '3'),
('2409', 'TD 7GB/8', 'Tape drive, 7GB capacity, 8mm cartridge tape.', 'hardware7', '210', '177'),
('2410', 'HD 8.4GB @5400', '8.4 GB hard disk @ 5400 RPM. Reduced cost of ownership: Drives can be utilized across enterprise platforms. This hot pluggable hard disk drive is required to meet your rigorous standards for reliability and performance.', 'hardware3', '357', '319'),
('2411', 'GP 1280x1024', 'Graphics Processor, resolution 1280 X 1024 pixels. High end 3D performance at a mid range price: 15 million Gouraud shaded triangles per second, Optimized 3D drivers for MCAD and DCC applications, with user-customizable settings. 64MB DDR SDRAM unified frame buffer supporting true color at all supported standard resolutions.', 'hardware5', '98', '78'),
('2412', '8MB EDO Memory', '8 MB 8x32 EDO SIM memory. Extended Data Out memory differs from FPM in a small, but significant design change. Unlike FPM, the data output drivers for EDO remain on when the memory controller removes the column address to begin the next cycle. Therefore, a new data cycle can begin before the previous cycle has completed. EDO is available on SIMMs and DIMMs, in 3.3 and 5 volt varieties.', 'hardware4', '98', '83'),
('2414', 'HD 9.1GB @10000 /I', '9.1 GB SCSI hard disk @ 10000 RPM (internal). Supra7 disk drives are available in 10,000 RPM spindle speeds and capacities of 18GB and 9.1 GB. SCSI and RS-232 interfaces.', 'hardware3', '454', '399'),
('2415', 'HD 9.1GB @7200', '9.1 GB hard disk @ 7200 RPM. Universal option kits are configured and pre-mounted in the appropriate hot plug tray for immediate installation into your corporate server or storage system.', 'hardware3', '359', '309'),
('2416', 'Client ISO CP - S', 'ISO Communication Package add-on license for additional SPNIX V4.0 client.', 'software6', '41', '36'),
('2417', 'Client ISO CP - V', 'ISO Communication Package add-on license for additional Vision client.', 'software6', '33', '27'),
('2418', 'Battery Backup (DA-130)', 'Single-battery charger with LED indicators', 'hardware8', '61', '52'),
('2419', 'Battery Backup (DA-290)', 'Two-battery charger with LED indicators', 'hardware8', '72', '60'),
('2422', 'SPNIX4.0 - SAL', 'Operating System Software: SPNIX V4.0 - Additional system administrator license, including network access.', 'software4', '150', '130'),
('2423', 'C for SPNIX4.0 - 1 Seat', 'C programming software for SPNIX V4.0 - single user', 'software5', '84', '73'),
('2424', 'CDW 12/24', 'CD Writer, speed 12x write, 24x read. Warning: will become obsolete very soon; this speed is not high enough anymore, and better alternatives are available for a reasonable price.', 'hardware7', '221', '198'),
('2430', 'Compact 400/LQ', '400 characters per second high-speed letter-quality printer. Dimensions (HxWxD): 12.37 x 27.96 x 23.92 inch. Interface: RS-232 serial (25-pin), 3 expansion slots. Paper size: A2, A3, A4.', 'hardware2', '175', '143'),
('2439', 'CPU D400', 'Dual CPU @ 400Mhz. Good price/performance ratio; for mid-size LAN file servers (up to 100 concurrent users).', 'hardware5', '123', '105'),
('2449', 'OSI 1-4/IL', 'OSI Layer 1 to 4 - Incremental License', 'software6', '83', '72'),
('2452', 'SPNIX4.0 - DL', 'Operating System Software: SPNIX V4.0 - Additional developer license.', 'software4', '100', '88'),
('2453', 'Inkjet C/4', 'Inkjet Printer, color (with two separate ink cartridges), 6 pages per minute black and white, 4 pages per minute color, resolution 600x300 dpi. Interface: Biodirectional IEEE 1284 compliant parallel interface and RS-232 serial (9-pin) interface 2 open EIO expansion slots. Memory: 8MB 96KB receiver buffer.', 'hardware2', '195', '174'),
('2457', 'Cable PR/S/6', 'Standard RS232 serial printer cable, 6 feet', 'hardware8', '5', '4'),
('2459', 'LaserPro 1200/8/BW', 'Professional black and white laserprinter, resolution 1200 dpi, 8 pages per second. Dimensions (HxWxD): 22.37 x 19.86 x 21.92 inch. Software: Enhanced driver support for SPNIX v4.0; MS-DOS Built-in printer drivers: ZoomSmart scaling technology, billboard, handout, mirror, watermark, print preview, quick sets, emulate laserprinter margins.', 'hardware2', '699', '568'),
('2462', 'SPNIX4.0 - UL/N', 'Operating System Software: SPNIX V4.0 - Additional user license with network access.', 'software4', '80', '71'),
('2464', 'SPNIX4.0 - UL/A', 'Operating System Software: SPNIX V4.0 - Additional user license class A.', 'software4', '70', '62'),
('2467', 'SPNIX4.0 - UL/D', 'Operating System Software: SPNIX V4.0 - Additional user license class D.', 'software4', '80', '64'),
('2468', 'SPNIX4.0 - UL/C', 'Operating System Software: SPNIX V4.0 - Additional user license class C.', 'software4', '75', '67'),
('2470', 'SPNIX4.0 - NL', 'Operating System Software: SPNIX V4.0 - Additional network access license.', 'software4', '80', '70'),
('2471', 'SPNIX3.3 SU', 'Operating System Software: SPNIX V3.3 - Base Server License Upgrade to V4.0.', 'software4', '500', '439'),
('2492', 'SPNIX3.3 AU', 'Operating System Software: SPNIX V3.3 - V4.0 upgrade; class A user.', 'software4', '45', '38'),
('2493', 'SPNIX3.3 C/DU', 'Operating System Software: SPNIX V3.3 - V4.0 upgrade; class C or D user.', 'software4', '25', '22'),
('2494', 'SPNIX3.3 NU', 'Operating System Software: SPNIX V3.3 - V4.0 upgrade; network access license.', 'software4', '25', '20'),
('2496', 'WSP DA-130', 'Wide storage processor DA-130 for storage subunits.', 'hardware5', '299', '244'),
('2497', 'WSP DA-290', 'Wide storage processor (model DA-290).', 'hardware5', '399', '355'),
('2522', 'Battery - EL', 'Extended life battery, for laptop computers', 'hardware8', '44', '39'),
('2536', 'Business Cards - 250/2L', 'Business cards box, capacity 250, 2-sided with different language on each side. Use form BC111-2, Rev. 12/1999 (hardcopy or online) when ordering - complete all fields marked with an asterisk and check box for second language (English is always on side 1).', 'office2', '80', '68'),
('2537', 'Business Cards Box - 1000', 'Business cards box, capacity 1000. Use form BC110-3, Rev. 3/2000 (hardcopy or online) when ordering and complete all fields marked with an asterisk.', 'office2', '200', '176'),
('2594', 'FG Stock - L', 'Fiberglass Stock - light weight for internal heat shielding, 1/4 thick', 'office4', '9', '7'),
('2596', 'SS Stock - 1mm', 'Stainless steel stock - 3mm. Can be predrilled for standard model motherboard and battery holders. Please use appropriate template to identify model number, placement, and size of finished sheet when placing order for drilled sheet.', 'office4', '12', '10'),
('2631', 'ESD Bracelet/QR', 'Electro Static Discharge Bracelet: 2 piece lead with quick release connector. One piece stays permanently attached to computer chassis with screw, the other is attached to the bracelet. Additional permanent ends available.', 'office4', '15', '12'),
('2638', 'Envoy DS/E', 'Enhanced Envoy Docking Station', 'hardware8', '137', '111'),
('2721', 'PC Bag - L/S', 'Black Leather Computer Case - single laptop capacity with pockets for manuals, additional hardware, and work papers. Adjustable protective straps and removable pocket for power supply and cables.', 'office4', '87', '70'),
('2722', 'PC Bag - L/D', 'Black Leather Computer Case - double laptop capacity with pockets for additional hardware or manuals and work papers. Adjustable protective straps and removable pockets for power supplies and cables. Double wide shoulder strap for comfort.', 'office4', '112', '99'),
('2725', 'Machine Oil', 'Machine Oil for Lubrication of CD-ROM drive doors and slides. Self-cleaning adjustable nozzle for fine to medium flow.', 'office4', '4', '3'),
('2751', 'MB - S450', 'PC type motherboard, 450 Series.', 'hardware5', '66', '54'),
('2752', 'MB - S550', 'PC type motherboard for the 550 Series.', 'hardware5', '88', '76'),
('2761', 'Mouse +WP/CL', 'Set consisting of a mouse and wrist pad, with corporate logo', 'hardware6', '27', '23'),
('2779', 'Desk - OS/O/F', 'Executive-style oversized oak desk with file drawers. Final finish is customizable when ordered, light or dark oak stain, or natural hand rubbed clear.', 'office1', '3980', '3347'),
('2782', 'PC Bag - C/S', 'Canvas Computer Case - single laptop capacity with pockets for manuals, additional hardware, and work papers. Adjustable protective straps and removable pocket for power supply and cables. Outside pocket with snap closure for easy access while travelling.', 'office4', '62', '50'),
('2783', 'Clips - Paper', 'World brand paper clips set the standard for quality.10 boxes with 100 clips each. #1 regular or jumbo, smooth or non-skid.', 'office2', '10', '8'),
('2808', 'Paper Tablet LY 8 1/2 x 11', 'Paper Tablet, Lined, Yellow, size 8 1/2 x 11 inch', 'office2', '1', '0'),
('2810', 'Inkvisible Pens', 'Rollerball pen is equipped with a smooth precision tip. See-through rubber grip allows for a visible ink supply and comfortable writing. 4-pack with 1 each, black, blue, red, green.', 'office2', '6', '4'),
('2870', 'Pencil - Mech', 'Ergonomically designed mechanical pencil for improved writing comfort. Refillable erasers and leads. Available in three lead sizes: .5mm (fine); .7mm (medium); and .9mm (thick).', 'office2', '5', '4'),
('2878', 'Router - ASR/2W', 'Special ALS Router - Approved Supplier required item with 2-way match', 'hardware8', '345', '305'),
('2879', 'Router - ASR/3W', 'Special ALS Router - Approved Supplier required item with 3-way match', 'hardware8', '456', '384'),
('2944', 'Wrist Pad /CL', 'Wrist Pad with corporate logo', 'hardware6', '3', '2'),
('2976', 'Drive Mount - D', 'Drive Mount for desktop PC', 'hardware8', '52', '44'),
('2982', 'Drive Mount - A', 'Drive Mount assembly kit', 'hardware8', '44', '35'),
('2986', 'Manual - Vision OS/2x +', 'Manuals for Vision Operating System V 2.x and Vision Office Suite', 'office3', '125', '111'),
('2995', 'SPNIX3.3 SAU', 'Operating System Software: SPNIX V3.3 - V4.0 upgrade; system administrator license.', 'software4', '70', '62'),
('2999', 'Laptop 16/8/110', 'Envoy Laptop, 16MB memory, 8GB hard disk, 110V power supply (US only).', 'hardware8', '999', '800'),
('3000', 'Laptop 32/10/56', 'Envoy Laptop, 32MB memory, 10GB hard disk, 56K Modem, universal power supply (switchable).', 'hardware8', '1749', '1542'),
('3001', 'Laptop 48/10/56/110', 'Envoy Laptop, 48MB memory, 10GB hard disk, 56K modem, 110V power supply.', 'hardware8', '2556', '2073'),
('3003', 'Laptop 128/12/56/v90/110', 'Envoy Laptop, 128MB memory, 12GB hard disk, v90 modem, 110V power supply.', 'hardware8', '3219', '2606'),
('3004', 'Laptop 64/10/56/220', 'Envoy Laptop, 64MB memory, 10GB hard disk, 56K modem, 220V power supply.', 'hardware8', '2768', '2275'),
('3020', 'Envoy IC', 'Envoy Internet Computer, Plug&Play', 'hardware8', '449', '366'),
('3051', 'Pens - 10/MP', 'Permanent ink pen dries quickly and is smear resistant. Provides smooth, skip-free writing. Medium point. Single color boxes (black, blue, red) or assorted box (6 black, 3 blue, and 1 red).', 'office2', '12', '10'),
('3054', 'Plasma Monitor 10/XGA', '10 inch standard plasma monitor, XGA resolution. This virtually-flat, high-resolution screen delivers outstanding image quality with reduced glare.', 'hardware1', '600', '519'),
('3057', 'Monitor 17/SD', 'CRT Monitor 17 inch (16 viewable) short depth. Delivers outstanding image clarity and precision. Gives professional color, technical engineering, and visualization/animation users the color fidelity they demand, plus a large desktop for enhanced productivity.', 'hardware1', '369', '320'),
('3060', 'Monitor 17/HR', 'CRT Monitor 17 inch (16 viewable) high resolution. Exceptional image performance and the benefit of additional screen space. This monitor offers sharp, color-rich monitor performance at an incredible value. With a host of leading features, including on-screen display controls.', 'hardware1', '299', '250'),
('3061', 'Monitor 19/SD', 'CRT Monitor 19 inch (18 viewable) short depth. High-contrast black screen coating: produces superior contrast and grayscale performance. The newly designed, amplified professional speakers with dynamic bass response bring all of your multimedia audio experiences to life with crisp, true-to-life sound and rich, deep bass tones. Plus, color-coded cables, simple plug-and-play setup and digital on-screen controls mean you are ready to set your sights on outrageous multimedia and the incredible Internet in just minutes.', 'hardware1', '499', '437'),
('3064', 'Monitor 21/SD', 'Monitor 21 inch (20 viewable) short depth. Features include a 0.25-0.28 Aperture Grille Pitch, resolution support up to 1920 x 1200 at 76Hz, on-screen displays, and a conductive anti-reflective film coating.', 'hardware1', '1023', '909'),
('3065', 'Monitor 21/D', 'CRT Monitor 21 inch (20 viewable). Digital OptiScan technology: supports resolutions up to 1600 x 1200 at 75Hz. Dimensions (HxWxD): 8.3 x 18.5 x 15 inch. The detachable or attachable monitor-powered Platinum Series speakers offer crisp sound and the convenience of a digital audio player jack. Just plug in your digital audio player and listen to tunes without powering up your PC.', 'hardware1', '999', '875'),
('3069', 'HD 10GB /S', '10GB hard disk drive for Standard Mount. Backward compatible with Supra5 systems, users are free to deploy and re-deploy these drives to quickly deliver increased storage capacity. Supra drives eliminate the risk of firmware incompatibility.', 'hardware3', '436', '350'),
('3071', 'HD 12GB /S', '12GB hard disk drive for Standard Mount. Supra9 hot pluggable hard disk drives provide the ability to install or remove drives on-line. Our hot pluggable hard disk drives are required to meet our rigorous standards for reliability and performance.', 'hardware3', '633', '553'),
('3072', 'HD 12GB /N', '12GB hard disk drive for Narrow Mount. Supra9 hot pluggable hard disk drives provide the ability to install or remove drives on-line. Our hot pluggable hard disk drives are required to meet our rigorous standards for reliability and performance.', 'hardware3', '567', '507'),
('3073', 'HD 6GB /I', '6GB capacity hard disk drive (internal). Supra drives eliminate the risk of firmware incompatibility.', 'hardware3', '224', '197'),
('3077', 'DVD 8x', 'DVD - ROM drive, 8x speed. Will probably become obsolete pretty soon...', 'hardware7', '274', '237'),
('3082', 'Modem - 56/90/E', 'Modem - 56kb per second, v.90 PCI Global compliant. External; for power supply 110V.', 'hardware7', '81', '72'),
('3083', 'Modem - 56/H/I', 'Standard Hayes modem - 56kb per second, internal, for  standard 3.5 inch chassis.', 'hardware7', '67', '56'),
('3086', 'VRAM - 16 MB', 'Citrus Video RAM module - 16 MB capacity. VRAM is used by the video system in a computer to store video information and is reserved exclusively for video operations. It was developed to provide continuous streams of serial data for refreshing video screens.', 'hardware4', '211', '186'),
('3087', 'DIMM - 16 MB', 'Citrus OLX DIMM - 16 MB capacity.', 'hardware4', '124', '99'),
('3088', 'SDRAM - 32 MB', 'SDRAM module with ECC - 32 MB capacity. SDRAM has multiple memory banks that can work simultaneously. Switching between banks allows for a continuous data flow.', 'hardware4', '258', '220'),
('3090', 'RAM - 48 MB', 'Random Access Memory, SIMM - 48 MB capacity.', 'hardware4', '193', '170'),
('3091', 'VRAM - 64 MB', 'Citrus Video RAM memory module - 64 MB capacity. Physically, VRAM looks just like DRAM with added hardware called a shift register. The special feature of VRAM is that it can transfer one entire row of data (up to 256 bits) into this shift register in a single clock cycle. This ability significantly reduces retrieval time, since the number of fetches is reduced from a possible 256 to a single fetch. The main benefit of having a shift register available for data dumps is that it frees the CPU to refresh the screen rather than retrieve data, thereby doubling the data bandwidth. For this reason, VRAM is often referred to as being dual-ported. However, the shift register will only be used when the VRAM chip is given special instructions to do so. The command to use the shift register is built into the graphics controller.', 'hardware4', '279', '243'),
('3097', 'Cable Connector - 32R', 'Cable Connector - 32 pin ribbon', 'hardware8', '3', '2'),
('3099', 'Cable Harness', 'Cable harness to organize and bundle computer wiring', 'hardware8', '4', '3'),
('3101', 'IC Browser - V', 'IC Web Browser for Vision with manual. Browser with network mail capability.', 'software6', '75', '67'),
('3106', 'KB 101/EN', 'Standard PC/AT Enhanced Keyboard (101/102-Key). Input locale: English (US).', 'hardware6', '48', '41'),
('3108', 'KB E/EN', 'Ergonomic Keyboard with two separate key areas, detachable numeric pad. Key layout: English (US).', 'hardware6', '78', '63'),
('3110', 'KB 101/FR', 'Standard PC/AT Enhanced Keyboard (101/102-Key). Input locale: French.', 'hardware6', '48', '39'),
('3112', 'MB - S500', 'PC type motherboard, 500 Series.', 'hardware5', '77', '66'),
('3114', 'MB - S900/650+', 'PC motherboard, 900 Series; standard motherboard for all models 650 and up.', 'hardware5', '101', '88'),
('3117', 'Mouse C/E', 'Ergonomic, cordless mouse. With track-ball for maximum comfort and ease of use.', 'hardware6', '41', '35'),
('3123', 'PS 220V /D', 'Standard power supply, 220V, for desktop computers.', 'hardware8', '81', '65'),
('3124', 'PS 110V /T', 'Power supply for tower PC, 110V', 'hardware8', '84', '70'),
('3127', 'LaserPro 600/6/BW', 'Standard black and white laserprinter, resolution 600 dpi, 6 pages per second. Interface: Centronics parallel, IEEE 1284 compliant. Memory: 8MB 96KB receiver buffer. MS-DOS ToolBox utilities for SPNIX AutoCAM v.17 compatible driver.', 'hardware2', '498', '444'),
('3129', 'Sound Card STD', 'Sound Card - standard version, with MIDI interface, line in/out, low impedance microphone input.', 'hardware5', '46', '39'),
('3133', 'Video Card /32', 'Video Card, with 32MB cache memory.', 'hardware5', '48', '41'),
('3134', 'Screws <B.32.S>', 'Screws: Brass, size 32mm, straight. Plastic box, contents 400.', 'hardware8', '18', '15'),
('3139', 'Screws <S.16.S>', 'Screws: Steel, size 16 mm, straight. Carton box, contents 750.', 'hardware8', '21', '17'),
('3140', 'Screws <Z.16.S>', 'Screws: Zinc, length 16mm, straight. Carton box, contents 750.', 'hardware8', '24', '19'),
('3143', 'Screws <B.28.S>', 'Screws: Brass, size 28mm, straight. Plastic box, contents 500.', 'hardware8', '16', '13'),
('3150', 'Card Holder - 25', 'Card Holder; heavy plastic business card holder with embossed corporate logo. Holds about 25 of your business cards, depending on card thickness.', 'office2', '18', '15'),
('3155', 'Monitor Hinge - HD', 'Monitor Hinge, heavy duty, maximum monitor weight 30 kg', 'hardware1', '49', '42'),
('3163', 'Manual - Vision Net6.3/US', 'Vision Networking V6.3 Reference Manual. US version with advanced encryption.', 'office3', '35', '29'),
('3165', 'Manual - Vision Tools2.0', 'Vision Business Tools Suite V2.0 Reference Manual. Includes installation, configuration, and user guide.', 'office3', '40', '34'),
('3167', 'Manual - Vision OS/2.x', 'Vision Operating System V2.0/2.1/2/3 Reference Manual. Complete installation, configuration, management, and tuning information for Vision system administration. Note that this manual replaces the individual Version 2.0 and 2.1 manuals.', 'office3', '55', '47'),
('3170', 'Smart Suite - V/SP', 'Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) for Vision. Spanish language software and user manuals.', 'software6', '161', '132'),
('3171', 'Smart Suite - S3.3/EN', 'Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) for SPNIX Version 3.3. English language software and user manuals.', 'software6', '148', '120'),
('3172', 'Graphics - DIK+', 'Software Kit Graphics: Draw-It Kwik-Plus. Includes extensive clip art files and advanced drawing tools for 3-D object manipulation, variable shading, and extended character fonts.', 'software6', '42', '34'),
('3173', 'Graphics - SA', 'Software Kit Graphics: SmartArt. Professional graphics package for SPNIX with multiple line styles, textures, built-in shapes and common symbols.', 'software6', '86', '72'),
('3175', 'Project Management - S4.0', 'Project Management Software, for SPNIX V4.0. Software includes command line and graphical interface with text, graphic, spreadsheet, and customizable report formats.', 'software6', '37', '32'),
('3176', 'Smart Suite - V/EN', 'Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) for Vision. English language software and user manuals.', 'software6', '120', '103'),
('3177', 'Smart Suite - V/FR', 'Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) for Vision. French language software and user manuals.', 'software6', '120', '102'),
('3178', 'Spreadsheet - SSP/V 2.0', 'SmartSpread Spreadsheet, Professional Edition Version 2.0, for Vision Release 11.1 and 11.2. Shrink wrap includes CD-ROM containing advanced software and online documentation, plus printed manual, tutorial, and license registration.', 'software1', '45', '37'),
('3179', 'Spreadsheet - SSS/S 2.1', 'SmartSpread Spreadsheet, Standard Edition Version 2.1, for SPNIX Release 4.0. Shrink wrap includes CD-ROM containing software and online documentation, plus printed manual and license registration.', 'software1', '50', '44'),
('3182', 'Word Processing - SWP/V 4.5', 'SmartWord Word Processor, Professional Edition Version 4.5, for Vision Release 11.x. Shrink wrap includes CD-ROM, containing advanced software, printed manual, and license registration.', 'software2', '65', '54'),
('3183', 'Word Processing - SWS/V 4.5', 'SmartWord Word Processor, Standard Edition Version 4.5, for Vision Release 11.x. Shrink wrap includes CD-ROM and license registration.', 'software2', '50', '40'),
('3187', 'Plastic Stock - B/HD', 'Plastic Stock - Blue, high density.', 'office4', '3', '2'),
('3189', 'Plastic Stock - G', 'Plastic Stock - Green, standard density.', 'office4', '2', '1'),
('3191', 'Plastic Stock - O', 'Plastic Stock - Orange, standard density.', 'office4', '2', '1'),
('3193', 'Plastic Stock - W/HD', 'Plastic Stock - White, high density.', 'office4', '3', '2'),
('3197', 'Spreadsheet - SSS/V 2.1', 'SmartSpread Spreadsheet, Standard Edition Version 2.1, for Vision Release 11.1 and 11.2. Shrink wrap includes CD-ROM containing software and online documentation, plus printed manual, tutorial, and license registration.', 'software1', '45', '36'),
('3204', 'Envoy DS', 'Envoy Docking Station', 'hardware8', '126', '107'),
('3208', 'Pencils - Wood', 'Box of 2 dozen wooden pencils. Specify lead type when ordering: 2H (double hard), H (hard), HB (hard black), B (soft black).', 'office2', '2', '1'),
('3209', 'Sharpener - Pencil', 'Electric Pencil Sharpener Rugged steel cutters for long life. PencilSaver helps prevent over-sharpening. Non-skid rubber feet. Built-in pencil holder.', 'office2', '13', '11'),
('3216', 'Manual - Vision Net6.3', 'Vision Networking V6.3 Reference Manual. Non-US version with basic encryption.', 'office3', '30', '26'),
('3220', 'Manual - Vision OS/1.2', 'Vision Operating System V1.2 Reference Manual. Complete installation, configuration, management, and tuning information for Vision system administration.', 'office3', '45', '36'),
('3224', 'Card Organizer - 250', 'Portable holder for organizing business cards, capacity 250. Booklet style with slip in, transparent pockets for business cards. Optional alphabet tabs. Specify cover color when ordering (dark brown, beige, burgundy, black, and light grey).', 'office2', '32', '28'),
('3225', 'Card Organizer - 1000', 'Holder for organizing business cards with alphabet dividers; capacity 1000. Desk top style with smoke grey cover and black base. Lid is removable for storing inside drawer.', 'office2', '47', '39'),
('3234', 'Monitor Hinge - STD', 'Standard Monitor Hinge, maximum monitor weight 10 kg', 'hardware1', '39', '34'),
('3245', 'Smart Suite - S4.0/FR', 'Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) for SPNIX V4.0. French language software and user manuals.', 'software6', '222', '195'),
('3246', 'Smart Suite - S4.0/SP', 'Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) for SPNIX V4.0. Spanish language software and user manuals.', 'software6', '222', '193'),
('3247', 'Smart Suite - V/DE', 'Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) for Vision. German language software and user manuals.', 'software6', '120', '96'),
('3248', 'Smart Suite - S4.0/DE', 'Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) for SPNIX V4.0. German language software and user manuals.', 'software6', '222', '193'),
('3250', 'Graphics - DIK', 'Software Kit Graphics: Draw-It Kwik. Simple graphics package for Vision systems, with options to save in GIF, JPG, and BMP formats.', 'software6', '28', '24'),
('3251', 'Project Management - V', 'Project Management Software, for Vision. Software includes command line and graphical interface with text, graphic, spreadsheet, and customizable report formats.', 'software6', '31', '26'),
('3252', 'Project Management - S3.3', 'Project Management Software, for SPNIX V3.3. Software includes command line and graphical interface with text, graphic, spreadsheet, and customizable report formats.', 'software6', '26', '23'),
('3253', 'Smart Suite - S4.0/EN', 'Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) for SPNIX V4.0. English language software and user manuals.', 'software6', '222', '188'),
('3255', 'Spreadsheet - SSS/CD 2.2B', 'SmartSpread Spreadsheet, Standard Edition, Beta Version 2.2, for SPNIX Release 4.1. CD-ROM only.', 'software1', '35', '30'),
('3256', 'Spreadsheet - SSS/V 2.0', 'SmartSpread Spreadsheet, Standard Edition Version 2.0, for Vision Release 11.0. Shrink wrap includes CD-ROM containing software and online documentation, plus printed manual, tutorial, and license registration.', 'software1', '40', '34'),
('3257', 'Web Browser - SB/S 2.1', 'Software Kit Web Browser: SmartBrowse V2.1 for SPNIX V3.3. Includes context sensitive help files and online documentation.', 'software6', '66', '58'),
('3258', 'Web Browser - SB/V 1.0', 'Software Kit Web Browser: SmartBrowse V2.1 for Vision. Includes context sensitive help files and online documentation.', 'software6', '80', '70'),
('3260', 'Word Processing - SWP/S 4.4', 'SmartSpread Spreadsheet, Standard Edition Version 2.2, for SPNIX Release 4.x. Shrink wrap includes CD-ROM, containing software, plus printed manual and license registration.', 'software2', '50', '41'),
('3262', 'Spreadsheet - SSS/S 2.2', 'SmartSpread Spreadsheet, Standard Edition Version 2.2, for SPNIX Release 4.1. Shrink wrap includes CD-ROM containing software and online documentation, plus printed manual and license registration.', 'software1', '50', '41'),
('3277', 'Drive Mount - A/T', 'Drive Mount assembly kit for tower PC', 'hardware8', '36', '29'),
('3290', 'SPNIX3.3 DU', 'Operating System Software: SPNIX V3.3 - V4.0 upgrade; developer license.', 'software4', '65', '55'),
('3300', 'Screws <S.32.P>', 'Screws: Steel, size 32mm, Phillips head. Plastic box, contents 400.', 'hardware8', '23', '19'),
('3301', 'Screws <B.28.P>', 'Screws: Brass, size 28mm, Phillips head. Plastic box, contents 500.', 'hardware8', '15', '12'),
('3331', 'Monitor 21/HR', '21 inch monitor (20 inch viewable) high resolution. This monitor is ideal for business, desktop publishing, and graphics-intensive applications. Enjoy the productivity that a large monitor can bring via more workspace for running applications.', 'hardware1', '879', '785'),
('3334', 'HD 12GB /R', '12GB Removable hard disk drive. With compatibility across many enterprise platforms, you are free to deploy and re-deploy this drive to quickly deliver increased storage capacity. Supra7 Universal disk drives are the second generation of high performance hot plug drives sharing compatibility across corporate servers and external storage enclosures.', 'hardware3', '612', '512'),
('3337', 'Mobile Web Phone', 'Mobile phone including monthly fee for Web access. Slimline shape with leather-look carrying case and belt clip.', 'office1', '800', '666'),
('3350', 'Plasma Monitor 10/LE/VGA', '10 inch low energy plasma monitor, VGA resolution', 'hardware1', '740', '630'),
('3353', 'HD 10GB /R', '10GB Removable hard disk drive for 10GB Removable HD drive. Supra7 disk drives provide the latest technology to improve enterprise performance, increasing the maximum data transfer rate up to 160MB/s.', 'hardware3', '489', '413'),
('3354', 'HD 12GB /I', '12GB capacity harddisk drive (internal). Supra drives eliminate the risk of firmware incompatibility. Backward compatibility: You can mix or match Supra2 and Supra3 devices for optimized solutions and future growth.', 'hardware3', '543', '478'),
('3355', 'HD 8GB /SI', '8GB SCSI hard disk drive, internal. With compatibility across many enterprise platforms, you are free to deploy and re-deploy this drive to quickly deliver increased storage capacity. ', 'hardware3', NULL, NULL),
('3359', 'SDRAM - 16 MB', 'SDRAM memory upgrade module, 16 MB. Synchronous Dynamic Random Access Memory was introduced after EDO. Its architecture and operation are based on those of the standard DRAM, but SDRAM provides a revolutionary change to main memory that further reduces data retrieval times. SDRAM is synchronized to the system clock that controls the CPU. This means that the system clock controlling the functions of the microprocessor also controls the SDRAM functions. This enables the memory controller to know on which clock cycle a data request will be ready, and therefore eliminates timing delays.', 'hardware4', '111', '99'),
('3361', 'Spreadsheet - SSP/S 1.5', 'SmartSpread Spreadsheet, Standard Edition Version 1.5, for SPNIX Release 3.3. Shrink wrap includes CD-ROM containing advanced software and online documentation, plus printed manual, tutorial, and license registration.', 'software1', '40', '34'),
('3362', 'Web Browser - SB/S 4.0', 'Software Kit Web Browser: SmartBrowse V4.0 for SPNIX V4.0. Includes context sensitive help files and online documentation.', 'software6', '99', '81'),
('3391', 'PS 110/220', 'Power Supply - switchable, 110V/220V', 'hardware8', '85', '75');
INSERT INTO `PRODUSE` (`ID_PRODUS`, `DENUMIRE_PRODUS`, `DESCRIERE`, `CATEGORIE`, `PRET_LISTA`, `PRET_MIN`) VALUES
('3399', 'HD 18GB /SE', '18GB SCSI external hard disk drive. Supra5 Universal hard disk drives provide the ability to hot plug between various servers, RAID arrays, and external storage shelves.', 'hardware3', '815', '706'),
('3400', 'HD 8GB /SE', '8GB capacity SCSI hard disk drive (external). Supra7 disk drives provide the latest technology to improve enterprise performance, increasing the maximum data transfer rate up to 255MB/s.', 'hardware3', '389', '337'),
('3501', 'C for SPNIX4.0 - Sys', 'C programming software for SPNIX V4.0 - system compiler, libraries, linker', 'software5', '555', '448'),
('3502', 'C for SPNIX3.3 -Sys/U', 'C programming software for SPNIX V3.3 - 4.0 Upgrade; system compiler, libraries, linker', 'software5', '105', '88'),
('3503', 'C for SPNIX3.3 - Seat/U', 'C programming software for SPNIX V3.3 - 4.0 Upgrade - single user', 'software5', '22', '18'),
('3511', 'Paper - HQ Printer', 'Quality paper for inkjet and laser printers tested to resist printer jams. Acid free for archival purposes. 22lb. weight with brightness of 92. Size: 8 1/2 x 11. Single 500-sheet ream.', 'office2', '9', '7'),
('3515', 'Lead Replacement', 'Refill leads for mechanical pencils. Each pack contains 25 leads and a replacement eraser. Available in three lead sizes: .5mm (fine); .7mm (medium); and .9mm (thick).', 'office2', '2', '1');*/

-- --------------------------------------------------------

--
-- Структура таблицы `RAND_COMENZI`
--

CREATE TABLE `RAND_COMENZI` (
  `NR_COMANDA` decimal(10,0) NOT NULL,
  `ID_PRODUS` decimal(10,0) NOT NULL,
  `PRET` decimal(10,0) DEFAULT NULL,
  `CANTITATE` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `RAND_COMENZI`
--

/*INSERT INTO `RAND_COMENZI` (`NR_COMANDA`, `ID_PRODUS`, `PRET`, `CANTITATE`) VALUES
('2392', '3124', '77', '63'),
('2393', '3082', '78', '10'),
('2394', '3134', '18', '45'),
('2399', '2311', '87', '20'),
('2400', '2999', '880', '16'),
('2411', '3106', '45', '11'),
('2412', '3139', '20', '79'),
('2418', '3110', '45', '20'),
('2419', '3129', '43', '57'),
('2421', '3129', '43', '172'),
('2422', '3133', '46', '11'),
('2423', '3245', '215', '13'),
('2427', '2464', '66', '6'),
('2428', '3127', '498', '12'),
('2429', '3133', '46', '52'),
('2431', '3129', '44', '11'),
('2434', '2236', '949', '84'),
('2435', '2316', '21', '10'),
('2440', '2311', '87', '7'),
('2442', '2439', '116', '30'),
('2444', '3143', '15', '97'),
('2445', '2293', '97', '11'),
('2448', '3133', '42', '11'),
('2452', '3139', '20', '10'),
('2354', '3150', '17', '58'),
('2355', '2322', '19', '188'),
('2356', '2308', '58', '47'),
('2357', '2245', '462', '26'),
('2358', '1808', '55', '14'),
('2362', '2326', '1', '173'),
('2363', '2299', '74', '25'),
('2365', '2319', '24', '38'),
('2366', '2395', '120', '12'),
('2368', '3129', '42', '72'),
('2372', '3134', '17', '17'),
('2375', '3143', '15', '93'),
('2376', '2302', '133', '21'),
('2379', '3127', '488', '23'),
('2380', '3143', '15', '31'),
('2382', '3129', '42', '76'),
('2383', '2439', '116', '54'),
('2384', '2322', '22', '59'),
('2387', '2243', '332', '20'),
('2391', '1822', '1433', '23'),
('2392', '3133', '45', '66'),
('2393', '3086', '211', '13'),
('2394', '3140', '19', '48'),
('2395', '2243', '332', '27'),
('2397', '2999', '880', '16'),
('2399', '2316', '22', '24'),
('2400', '3003', '2867', '19'),
('2412', '3143', '16', '80'),
('2414', '3246', '212', '18'),
('2419', '3133', '45', '61'),
('2420', '3133', '48', '29'),
('2423', '3246', '212', '14'),
('2427', '2470', '76', '6'),
('2428', '3133', '48', '12'),
('2429', '3139', '21', '54'),
('2432', '2999', '880', '11'),
('2434', '2245', '462', '86'),
('2435', '2323', '18', '12'),
('2436', '3245', '215', '16'),
('2437', '2457', '4', '17'),
('2440', '2322', '23', '10'),
('2443', '3139', '20', '12'),
('2444', '3150', '17', '100'),
('2445', '2299', '72', '14'),
('2448', '3134', '17', '14'),
('2450', '3216', '29', '11'),
('2452', '3143', '15', '12'),
('2454', '2308', '55', '12'),
('2455', '2496', '268', '32'),
('2456', '2537', '194', '19'),
('2354', '3163', '30', '61'),
('2355', '2323', '17', '190'),
('2356', '2311', '95', '51'),
('2357', '2252', '789', '26'),
('2361', '2326', '1', '194'),
('2362', '2334', '3', '177'),
('2363', '2308', '57', '26'),
('2365', '2322', '19', '43'),
('2366', '2400', '418', '16'),
('2369', '3170', '145', '24'),
('2372', '3143', '15', '21'),
('2374', '2467', '79', '21'),
('2375', '3150', '17', '93'),
('2376', '2311', '95', '25'),
('2380', '3150', '17', '33'),
('2382', '3139', '21', '79'),
('2384', '2330', '1', '61'),
('2385', '2311', '87', '96'),
('2387', '2245', '462', '22'),
('2389', '3143', '15', '30'),
('2390', '1948', '471', '16'),
('2392', '3139', '21', '68'),
('2393', '3087', '109', '14'),
('2395', '2252', '789', '30'),
('2397', '3000', '1696', '16'),
('2399', '2326', '1', '27'),
('2407', '2752', '86', '18'),
('2411', '3112', '72', '17'),
('2414', '3253', '207', '23'),
('2420', '3140', '19', '34'),
('2423', '3251', '26', '16'),
('2426', '3234', '34', '18'),
('2428', '3143', '16', '13'),
('2434', '2252', '789', '87'),
('2435', '2334', '3', '14'),
('2436', '3250', '27', '18'),
('2437', '2462', '76', '19'),
('2440', '2330', '1', '13'),
('2443', '3143', '15', '17'),
('2444', '3155', '43', '104'),
('2448', '3139', '20', '15'),
('2450', '3220', '41', '14'),
('2451', '1948', '471', '22'),
('2452', '3150', '17', '13'),
('2454', '2316', '21', '13'),
('2457', '3150', '17', '27'),
('2458', '3143', '15', '129'),
('2354', '3165', '37', '64'),
('2355', '2326', '1', '192'),
('2356', '2316', '22', '55'),
('2357', '2257', '372', '29'),
('2360', '2093', '8', '42'),
('2361', '2334', '3', '198'),
('2362', '2339', '25', '179'),
('2363', '2311', '87', '29'),
('2364', '1948', '471', '20'),
('2365', '2326', '1', '44'),
('2366', '2406', '196', '20'),
('2367', '2322', '22', '45'),
('2369', '3176', '113', '24'),
('2371', '2316', '21', '21'),
('2375', '3155', '45', '98'),
('2376', '2316', '21', '27'),
('2377', '2319', '25', '131'),
('2380', '3155', '45', '33'),
('2381', '3163', '35', '55'),
('2382', '3143', '15', '82'),
('2385', '2319', '25', '97'),
('2386', '2365', '77', '27'),
('2387', '2252', '789', '27'),
('2389', '3155', '46', '33'),
('2392', '3150', '18', '72'),
('2393', '3091', '278', '19'),
('2396', '3140', '19', '93'),
('2399', '2330', '1', '28'),
('2406', '2761', '26', '19'),
('2407', '2761', '26', '21'),
('2410', '3003', '2867', '15'),
('2411', '3123', '75', '17'),
('2414', '3260', '50', '24'),
('2420', '3143', '15', '39'),
('2422', '3150', '17', '25'),
('2423', '3258', '78', '21'),
('2428', '3150', '17', '16'),
('2429', '3150', '17', '55'),
('2434', '2254', '408', '92'),
('2435', '2339', '25', '19'),
('2436', '3256', '36', '18'),
('2437', '2464', '64', '21'),
('2440', '2334', '3', '15'),
('2442', '2459', '625', '40'),
('2443', '3150', '18', '17'),
('2447', '2293', '97', '34'),
('2448', '3143', '16', '16'),
('2450', '3224', '32', '16'),
('2452', '3155', '44', '13'),
('2454', '2323', '18', '16'),
('2457', '3155', '44', '32'),
('2354', '3167', '51', '68'),
('2355', '2330', '1', '197'),
('2356', '2323', '18', '55'),
('2357', '2262', '95', '29'),
('2359', '2370', '91', '17'),
('2363', '2319', '24', '31'),
('2365', '2335', '97', '45'),
('2366', '2409', '195', '22'),
('2367', '2326', '1', '48'),
('2368', '3143', '16', '75'),
('2369', '3187', '2', '24'),
('2371', '2323', '17', '24'),
('2375', '3163', '30', '99'),
('2376', '2319', '25', '32'),
('2377', '2326', '1', '132'),
('2379', '3139', '21', '34'),
('2380', '3163', '32', '36'),
('2383', '2457', '4', '62'),
('2386', '2370', '90', '28'),
('2387', '2253', '354', '32'),
('2388', '2330', '1', '105'),
('2392', '3155', '49', '77'),
('2393', '3099', '3', '19'),
('2394', '3155', '49', '61'),
('2395', '2255', '691', '34'),
('2396', '3150', '17', '93'),
('2399', '2335', '100', '33'),
('2411', '3124', '84', '17'),
('2419', '3150', '17', '69'),
('2421', '3143', '15', '176'),
('2422', '3155', '43', '29'),
('2434', '2257', '372', '94'),
('2435', '2350', '2342', '24'),
('2440', '2337', '271', '19'),
('2442', '2467', '80', '44'),
('2443', '3155', '43', '21'),
('2445', '2311', '95', '24'),
('2446', '2326', '1', '34'),
('2447', '2299', '76', '35'),
('2452', '3165', '34', '18'),
('2454', '2334', '3', '18'),
('2354', '3170', '145', '70'),
('2355', '2339', '25', '199'),
('2357', '2268', '75', '32'),
('2359', '2373', '6', '17'),
('2363', '2323', '18', '34'),
('2365', '2339', '25', '50'),
('2366', '2415', '340', '24'),
('2367', '2330', '1', '52'),
('2368', '3155', '45', '75'),
('2369', '3193', '2', '28'),
('2371', '2334', '3', '26'),
('2372', '3163', '30', '30'),
('2375', '3165', '36', '103'),
('2376', '2326', '1', '33'),
('2377', '2330', '1', '136'),
('2379', '3140', '19', '35'),
('2380', '3167', '52', '37'),
('2383', '2462', '75', '63'),
('2386', '2375', '73', '32'),
('2395', '2264', '199', '34'),
('2396', '3155', '47', '98'),
('2398', '2537', '194', '23'),
('2411', '3127', '488', '18'),
('2413', '3155', '47', '62'),
('2418', '3140', '20', '31'),
('2419', '3155', '47', '72'),
('2421', '3150', '17', '176'),
('2440', '2339', '25', '23'),
('2444', '3165', '37', '112'),
('2445', '2319', '25', '27'),
('2446', '2330', '1', '36'),
('2447', '2302', '133', '37'),
('2452', '3170', '145', '20'),
('2354', '3176', '113', '72'),
('2359', '2377', '96', '17'),
('2363', '2326', '1', '37'),
('2365', '2340', '72', '54'),
('2366', '2419', '69', '24'),
('2367', '2335', '91', '54'),
('2371', '2339', '25', '29'),
('2372', '3167', '54', '32'),
('2375', '3171', '132', '107'),
('2376', '2334', '3', '36'),
('2378', '2457', '4', '25'),
('2380', '3176', '113', '40'),
('2381', '3176', '113', '62'),
('2382', '3163', '29', '89'),
('2385', '2335', '91', '106'),
('2386', '2378', '272', '33'),
('2389', '3165', '34', '43'),
('2395', '2268', '71', '37'),
('2396', '3163', '29', '100'),
('2398', '2594', '9', '27'),
('2410', '3051', '12', '21'),
('2411', '3133', '43', '23'),
('2412', '3163', '30', '92'),
('2413', '3163', '30', '66'),
('2419', '3165', '35', '76'),
('2420', '3163', '30', '45'),
('2422', '3163', '30', '35'),
('2426', '3248', '212', '26'),
('2427', '2496', '268', '19'),
('2428', '3170', '145', '24'),
('2429', '3163', '30', '63'),
('2440', '2350', '2342', '24'),
('2444', '3172', '37', '112'),
('2445', '2326', '1', '28'),
('2446', '2337', '271', '37'),
('2447', '2308', '54', '40'),
('2452', '3172', '37', '20'),
('2457', '3170', '145', '42'),
('2354', '3182', '61', '77'),
('2357', '2276', '237', '38'),
('2359', '2380', '6', '17'),
('2361', '2359', '248', '208'),
('2362', '2359', '248', '189'),
('2363', '2334', '3', '42'),
('2367', '2350', '2342', '54'),
('2369', '3204', '123', '34'),
('2371', '2350', '2342', '32'),
('2372', '3170', '145', '36'),
('2375', '3176', '120', '109'),
('2378', '2459', '625', '25'),
('2380', '3187', '2', '40'),
('2381', '3183', '47', '63'),
('2382', '3165', '37', '92'),
('2384', '2359', '249', '77'),
('2385', '2350', '2342', '109'),
('2386', '2394', '117', '36'),
('2387', '2268', '75', '42'),
('2388', '2350', '2342', '112'),
('2389', '3167', '52', '47'),
('2392', '3165', '40', '81'),
('2393', '3108', '69', '30'),
('2394', '3167', '52', '68'),
('2395', '2270', '64', '41'),
('2399', '2359', '227', '38'),
('2404', '2808', '0', '37'),
('2406', '2782', '62', '31'),
('2411', '3143', '15', '24'),
('2412', '3167', '54', '94'),
('2417', '2976', '51', '37'),
('2418', '3150', '17', '37'),
('2419', '3167', '54', '81'),
('2420', '3171', '132', '47'),
('2421', '3155', '43', '185'),
('2422', '3167', '54', '39'),
('2423', '3290', '65', '33'),
('2426', '3252', '25', '29'),
('2427', '2522', '40', '22'),
('2428', '3173', '86', '28'),
('2429', '3165', '36', '67'),
('2430', '3501', '493', '43'),
('2434', '2268', '75', '104'),
('2435', '2365', '75', '33'),
('2436', '3290', '63', '24'),
('2437', '2496', '268', '35'),
('2440', '2359', '227', '28'),
('2443', '3165', '36', '31'),
('2444', '3182', '63', '115'),
('2446', '2350', '2342', '39'),
('2447', '2311', '93', '44'),
('2452', '3173', '80', '23'),
('2455', '2536', '75', '54'),
('2457', '3172', '36', '45'),
('2458', '3163', '32', '142'),
('2355', '2359', '227', '204'),
('2357', '2289', '48', '41'),
('2359', '2381', '97', '17'),
('2361', '2365', '76', '209'),
('2355', '2289', '46', '200'),
('2356', '2264', '199', '38'),
('2357', '2211', '3', '140'),
('2358', '1781', '227', '9'),
('2359', '2337', '271', '1'),
('2360', '2058', '23', '29'),
('2361', '2289', '46', '180'),
('2362', '2289', '48', '200'),
('2363', '2264', '199', '9'),
('2364', '1910', '14', '6'),
('2365', '2289', '48', '92'),
('2366', '2359', '227', '8'),
('2367', '2289', '48', '99'),
('2354', '3106', '48', '61'),
('2368', '3106', '48', '150'),
('2369', '3150', '18', '3'),
('2370', '1910', '14', '9'),
('2371', '2274', '157', '6'),
('2372', '3106', '48', '6'),
('2373', '1820', '49', '8'),
('2374', '2422', '150', '10'),
('2375', '3106', '42', '140'),
('2376', '2270', '60', '14'),
('2377', '2289', '42', '130'),
('2378', '2403', '113', '20'),
('2379', '3106', '42', '92'),
('2380', '3106', '42', '26'),
('2381', '3117', '38', '110'),
('2382', '3106', '42', '160'),
('2383', '2409', '195', '37'),
('2384', '2289', '43', '95'),
('2385', '2289', '43', '200'),
('2386', '2330', '1', '7'),
('2387', '2211', '3', '52'),
('2388', '2289', '43', '150'),
('2389', '3106', '43', '180'),
('2390', '1910', '14', '4'),
('2391', '1787', '101', '5'),
('2392', '3106', '43', '63'),
('2393', '3051', '12', '10'),
('2394', '3117', '41', '90'),
('2395', '2211', '3', '110'),
('2396', '3106', '44', '150'),
('2397', '2976', '52', '2'),
('2398', '2471', '483', '5'),
('2399', '2289', '44', '120'),
('2400', '2976', '52', '4'),
('2401', '2492', '41', '4'),
('2402', '2536', '75', '8'),
('2403', '2522', '44', '5'),
('2404', '2721', '85', '6'),
('2405', '2638', '137', '9'),
('2406', '2721', '85', '5'),
('2407', '2721', '85', '5'),
('2408', '2751', '61', '3'),
('2409', '2810', '6', '8'),
('2410', '2976', '46', '10'),
('2411', '3082', '81', '2'),
('2412', '3106', '46', '170'),
('2413', '3108', '77', '200'),
('2414', '3208', '1', '8'),
('2415', '2751', '62', '5'),
('2416', '2870', '4', '10'),
('2417', '2870', '4', '9'),
('2418', '3082', '75', '15'),
('2419', '3106', '46', '150'),
('2420', '3106', '46', '110'),
('2421', '3106', '46', '160'),
('2422', '3106', '46', '18'),
('2423', '3220', '39', '8'),
('2424', '3350', '693', '11'),
('2425', '3501', '493', '3'),
('2426', '3193', '2', '6'),
('2427', '2430', '173', '12'),
('2428', '3106', '42', '7'),
('2429', '3106', '42', '200'),
('2430', '3350', '693', '6'),
('2431', '3097', '2', '3'),
('2432', '2976', '49', '3'),
('2433', '1910', '13', '6'),
('2434', '2211', '3', '81'),
('2435', '2289', '48', '35'),
('2436', '3208', '1', '8'),
('2437', '2423', '83', '8'),
('2438', '2995', '69', '3'),
('2439', '1797', '317', '9'),
('2440', '2289', '48', '19'),
('2441', '2536', '80', '9'),
('2442', '2402', '127', '26'),
('2443', '3106', '44', '3'),
('2444', '3117', '36', '110'),
('2445', '2270', '66', '5'),
('2446', '2289', '48', '47'),
('2447', '2264', '199', '29'),
('2448', '3106', '44', '3'),
('2449', '2522', '43', '2'),
('2450', '3191', '1', '4'),
('2451', '1910', '13', '9'),
('2452', '3117', '38', '140'),
('2453', '2492', '43', '3'),
('2454', '2289', '43', '120'),
('2455', '2471', '483', '3'),
('2456', '2522', '40', '5'),
('2457', '3108', '72', '36'),
('2458', '3117', '38', '140'),
('2354', '3114', '97', '43'),
('2356', '2274', '149', '34'),
('2358', '1782', '125', '4'),
('2361', '2299', '76', '180'),
('2362', '2299', '76', '160'),
('2363', '2272', '129', '7'),
('2365', '2293', '99', '28'),
('2368', '3110', '42', '60'),
('2369', '3155', '43', '1'),
('2372', '3108', '74', '2'),
('2373', '1825', '24', '1'),
('2374', '2423', '78', '6'),
('2375', '3112', '71', '84'),
('2376', '2276', '237', '4'),
('2378', '2412', '95', '2'),
('2380', '3108', '75', '18'),
('2381', '3124', '77', '44'),
('2382', '3110', '43', '64'),
('2384', '2299', '71', '48'),
('2386', '2334', '3', '5'),
('2388', '2293', '94', '90'),
('2389', '3112', '73', '18'),
('2390', '1912', '14', '2'),
('2391', '1791', '263', '3'),
('2392', '3112', '73', '57'),
('2393', '3060', '295', '2'),
('2394', '3123', '77', '36'),
('2396', '3108', '76', '75'),
('2399', '2293', '94', '12'),
('2400', '2982', '41', '1'),
('2401', '2496', '268', '3'),
('2406', '2725', '3', '4'),
('2408', '2761', '26', '1'),
('2411', '3086', '208', '2'),
('2412', '3114', '98', '68'),
('2413', '3112', '75', '40'),
('2414', '3216', '30', '7'),
('2416', '2878', '340', '1'),
('2418', '3090', '187', '12'),
('2419', '3114', '99', '45'),
('2420', '3110', '46', '11'),
('2421', '3108', '78', '160'),
('2422', '3117', '41', '5'),
('2423', '3224', '32', '3'),
('2424', '3354', '541', '9'),
('2425', '3511', '9', '2'),
('2427', '2439', '121', '1'),
('2428', '3108', '76', '1'),
('2429', '3108', '76', '40'),
('2430', '3353', '454', '5'),
('2431', '3106', '48', '1'),
('2432', '2982', '43', '2'),
('2435', '2299', '75', '4'),
('2436', '3209', '13', '2'),
('2437', '2430', '157', '4'),
('2438', '3000', '1748', '3'),
('2439', '1806', '45', '4'),
('2440', '2293', '98', '2'),
('2441', '2537', '194', '7'),
('2442', '2410', '351', '21'),
('2443', '3114', '101', '2'),
('2444', '3127', '488', '88'),
('2445', '2278', '49', '3'),
('2447', '2266', '297', '23'),
('2448', '3114', '99', '0'),
('2450', '3193', '2', '3'),
('2454', '2293', '99', '0'),
('2457', '3123', '79', '14'),
('2458', '3123', '79', '112'),
('2354', '3123', '79', '47'),
('2361', '2308', '53', '182'),
('2362', '2311', '93', '164'),
('2365', '2302', '133', '29'),
('2368', '3117', '38', '62'),
('2369', '3163', '32', '5'),
('2372', '3110', '42', '7'),
('2375', '3117', '38', '85'),
('2378', '2414', '439', '7'),
('2380', '3117', '38', '23'),
('2381', '3133', '44', '44'),
('2382', '3114', '100', '65'),
('2389', '3123', '80', '21'),
('2391', '1797', '348', '7'),
('2392', '3117', '38', '58'),
('2393', '3064', '1017', '5'),
('2394', '3124', '82', '39'),
('2396', '3110', '44', '79'),
('2399', '2299', '76', '15'),
('2400', '2986', '123', '4'),
('2410', '2982', '40', '5'),
('2411', '3097', '2', '6'),
('2412', '3123', '72', '68'),
('2413', '3117', '35', '44'),
('2414', '3220', '41', '9'),
('2418', '3097', '2', '13'),
('2419', '3123', '72', '48'),
('2420', '3114', '101', '15'),
('2421', '3112', '72', '164'),
('2422', '3123', '72', '5'),
('2424', '3359', '111', '12'),
('2425', '3515', '1', '4'),
('2428', '3114', '101', '5'),
('2429', '3110', '45', '43'),
('2430', '3359', '111', '10'),
('2431', '3114', '101', '3'),
('2436', '3216', '30', '3'),
('2439', '1820', '54', '9'),
('2440', '2302', '150', '2'),
('2442', '2418', '60', '23'),
('2444', '3133', '43', '90'),
('2450', '3197', '44', '5'),
('2454', '2299', '71', '3'),
('2457', '3127', '488', '17'),
('2458', '3127', '488', '114'),
('2354', '3129', '41', '47'),
('2361', '2311', '87', '185'),
('2362', '2316', '22', '168'),
('2365', '2308', '56', '29'),
('2366', '2373', '6', '7'),
('2367', '2302', '147', '32'),
('2369', '3165', '34', '10'),
('2371', '2293', '96', '8'),
('2375', '3127', '488', '86'),
('2377', '2302', '147', '119'),
('2378', '2417', '27', '11'),
('2379', '3114', '98', '14'),
('2380', '3127', '488', '24'),
('2381', '3139', '20', '45'),
('2382', '3117', '35', '66'),
('2383', '2418', '56', '45'),
('2386', '2340', '71', '14'),
('2389', '3129', '46', '22'),
('2391', '1799', '961', '10'),
('2393', '3069', '385', '8'),
('2394', '3129', '46', '41'),
('2396', '3114', '100', '83'),
('2397', '2986', '120', '8'),
('2399', '2302', '149', '17'),
('2410', '2986', '120', '6'),
('2411', '3099', '3', '7'),
('2412', '3127', '492', '72'),
('2413', '3127', '492', '44'),
('2414', '3234', '39', '11'),
('2420', '3123', '79', '20'),
('2421', '3117', '41', '165'),
('2426', '3216', '30', '11'),
('2428', '3117', '41', '6'),
('2429', '3123', '79', '46'),
('2430', '3362', '94', '10'),
('2431', '3117', '41', '7'),
('2432', '2986', '122', '5'),
('2436', '3224', '32', '6'),
('2439', '1822', '1433', '13'),
('2442', '2422', '144', '25'),
('2443', '3124', '82', '6'),
('2444', '3139', '21', '93'),
('2447', '2272', '121', '24'),
('2458', '3134', '17', '115'),
('2354', '3139', '21', '48'),
('2355', '2308', '57', '185'),
('2356', '2293', '98', '40'),
('2358', '1797', '317', '12'),
('2359', '2359', '249', '1'),
('2361', '2316', '22', '187'),
('2365', '2311', '95', '29'),
('2366', '2382', '804', '10'),
('2368', '3123', '81', '70'),
('2372', '3123', '81', '10'),
('2374', '2449', '78', '15'),
('2375', '3133', '45', '88'),
('2376', '2293', '99', '13'),
('2377', '2311', '95', '121'),
('2378', '2423', '79', '11'),
('2380', '3133', '46', '28'),
('2381', '3143', '15', '48'),
('2382', '3123', '79', '71'),
('2383', '2422', '146', '46'),
('2385', '2302', '133', '87'),
('2388', '2308', '56', '96'),
('2391', '1808', '55', '15'),
('2393', '3077', '261', '8'),
('2394', '3133', '46', '45'),
('2399', '2308', '56', '17'),
('2408', '2783', '10', '10'),
('2410', '2995', '68', '8'),
('2411', '3101', '73', '8'),
('2412', '3134', '18', '75'),
('2413', '3129', '46', '45'),
('2420', '3127', '496', '22'),
('2421', '3123', '80', '168'),
('2422', '3127', '496', '9'),
('2427', '2457', '4', '6'),
('2428', '3123', '80', '8'),
('2429', '3127', '497', '49'),
('2431', '3127', '498', '9'),
('2435', '2311', '87', '8'),
('2442', '2430', '173', '28'),
('2444', '3140', '19', '95'),
('2447', '2278', '50', '25'),
('2354', '3143', '16', '53'),
('2355', '2311', '87', '188'),
('2356', '2299', '72', '44'),
('2358', '1803', '55', '13'),
('2365', '2316', '22', '34'),
('2366', '2394', '117', '11'),
('2367', '2308', '54', '39'),
('2368', '3127', '496', '70'),
('2371', '2299', '73', '15'),
('2372', '3127', '496', '13'),
('2375', '3134', '17', '90'),
('2376', '2299', '73', '17'),
('2378', '2424', '218', '15'),
('2380', '3140', '20', '30'),
('2382', '3127', '496', '71'),
('2383', '2430', '174', '50'),
('2384', '2316', '21', '58'),
('2391', '1820', '52', '18');*/

-- --------------------------------------------------------

--
-- Структура таблицы `REGIUNI`
--

CREATE TABLE `REGIUNI` (
  `ID_REGIUNE` decimal(10,0) NOT NULL,
  `DENUMIRE_REGIUNE` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `REGIUNI`
--

/*INSERT INTO `REGIUNI` (`ID_REGIUNE`, `DENUMIRE_REGIUNE`) VALUES
('1', 'Europe'),
('2', 'Americas'),
('3', 'Asia'),
('4', 'Middle East and Africa');*/

-- --------------------------------------------------------

--
-- Структура таблицы `SALARIATI`
--

CREATE TABLE `SALARIATI` (
  `ID_ANGAJAT` decimal(10,0) NOT NULL,
  `PRENUME` varchar(20) DEFAULT NULL,
  `NUME` varchar(25) DEFAULT NULL,
  `EMAIL` varchar(25) DEFAULT NULL,
  `TELEFON` varchar(20) DEFAULT NULL,
  `DATA_ANGAJARE` date DEFAULT NULL,
  `ID_FUNCTIE` varchar(10) DEFAULT NULL,
  `SALARIUL` decimal(10,0) DEFAULT NULL,
  `COMISION` decimal(10,0) DEFAULT NULL,
  `ID_MANAGER` decimal(10,0) DEFAULT NULL,
  `ID_DEPARTAMENT` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `SALARIATI`
--

/*INSERT INTO `SALARIATI` (`ID_ANGAJAT`, `PRENUME`, `NUME`, `EMAIL`, `TELEFON`, `DATA_ANGAJARE`, `ID_FUNCTIE`, `SALARIUL`, `COMISION`, `ID_MANAGER`, `ID_DEPARTAMENT`) VALUES
('565', 'Alexander', 'Khoo', 'AKHOO', '515.127.4562', '1995-05-18', 'PU_CLERK', '3100', NULL, '101', '30'),
('566', 'Shelli', 'Baida', 'SBAIDA', '515.127.4563', '1997-12-24', 'PU_CLERK', '3000', NULL, '103', '30'),
('567', 'Sigal', 'Tobias', 'STOBIAS', '515.127.4564', '1997-07-24', 'PU_CLERK', '2900', NULL, '103', '30'),
('568', 'Guy', 'Himuro', 'GHIMURO', '515.127.4565', '1998-11-15', 'PU_CLERK', '2700', NULL, '103', '30'),
('569', 'Karen', 'Colmenares', 'KCOLMENA', '515.127.4566', '1999-08-10', 'PU_CLERK', '2600', NULL, '103', '30'),
('570', 'Matthew', 'Weiss', 'MWEISS', '650.123.1234', '1996-07-18', 'ST_MAN', '8000', NULL, '103', '50'),
('571', 'Adam', 'Fripp', 'AFRIPP', '650.123.2234', '1997-04-10', 'ST_MAN', '8200', NULL, '103', '50'),
('572', 'Payam', 'Kaufling', 'PKAUFLIN', '650.123.3234', '1995-05-01', 'ST_MAN', '7900', NULL, '103', '50'),
('573', 'Shanta', 'Vollman', 'SVOLLMAN', '650.123.4234', '1997-10-10', 'ST_MAN', '6500', '30', '103', '50'),
('574', 'Kevin', 'Mourgos', 'KMOURGOS', '650.123.5234', '1999-11-16', 'ST_MAN', '5800', NULL, '103', '50'),
('575', 'Julia', 'Nayer', 'JNAYER', '650.124.1214', '1997-07-16', 'ST_CLERK', '3200', '25', '103', '50'),
('576', 'Irene', 'Mikkilineni', 'IMIKKILI', '650.124.1224', '1998-09-28', 'ST_CLERK', '2800', NULL, '103', '50'),
('577', 'James', 'Landry', 'JLANDRY', '650.124.1334', '1999-01-14', 'ST_CLERK', '2500', NULL, '103', '50'),
('578', 'Steven', 'Markle', 'SMARKLE', '650.124.1434', '2000-03-08', 'ST_CLERK', '2300', NULL, '103', '50'),
('579', 'Laura', 'Bissot', 'LBISSOT', '650.124.5234', '1997-08-20', 'ST_CLERK', '3300', NULL, '103', '50'),
('580', 'Mozhe', 'Atkinson', 'MATKINSO', '650.124.6234', '1997-10-30', 'ST_CLERK', '2900', NULL, '103', '50'),
('581', 'James', 'Marlow', 'JAMRLOW', '650.124.7234', '1997-02-16', 'ST_CLERK', '2600', NULL, '103', '50'),
('582', 'TJ', 'Olson', 'TJOLSON', '650.124.8234', '1999-04-10', 'ST_CLERK', '2200', NULL, '103', '50'),
('583', 'Jason', 'Mallin', 'JMALLIN', '650.127.1934', '1996-06-14', 'ST_CLERK', '3300', NULL, '103', '50'),
('584', 'Michael', 'Rogers', 'MROGERS', '650.127.1834', '1998-08-26', 'ST_CLERK', '3000', NULL, '103', '50'),
('585', 'Ki', 'Gee', 'KGEE', '650.127.1734', '1999-12-12', 'ST_CLERK', '2500', NULL, '103', '50'),
('586', 'Hazel', 'Philtanker', 'HPHILTAN', '650.127.1634', '2000-02-06', 'ST_CLERK', '2300', NULL, '103', '50'),
('587', 'Renske', 'Ladwig', 'RLADWIG', '650.121.1234', '1995-07-14', 'ST_CLERK', '3600', NULL, '103', '50'),
('588', 'Stephen', 'Stiles', 'SSTILES', '650.121.2034', '1997-10-26', 'ST_CLERK', '3200', NULL, '103', '50'),
('589', 'John', 'Seo', 'JSEO', '650.121.2019', '1998-02-12', 'ST_CLERK', '2800', NULL, '103', '50'),
('590', 'Joshua', 'Patel', 'JPATEL', '650.121.1834', '1998-04-06', 'ST_CLERK', '2600', NULL, '103', '50'),
('630', 'Winston', 'Taylor', 'WTAYLOR', '650.507.9876', '1998-01-24', 'SH_CLERK', '3200', NULL, '103', '50'),
('631', 'Jean', 'Fleaur', 'JFLEAUR', '650.507.9877', '1998-02-23', 'SH_CLERK', '3100', NULL, '103', '50'),
('632', 'Martha', 'Sullivan', 'MSULLIVA', '650.507.9878', '1999-06-21', 'SH_CLERK', '2600', NULL, '103', '50'),
('633', 'Girard', 'Geoni', 'GGEONI', '650.507.9879', '2000-02-03', 'SH_CLERK', '2900', NULL, '103', '50'),
('634', 'Nandita', 'Sarchand', 'NSARCHAN', '650.509.1876', '1996-01-27', 'SH_CLERK', '4200', NULL, '103', '50'),
('635', 'Alexis', 'Bull', 'ABULL', '650.509.2876', '1997-02-20', 'SH_CLERK', '4100', NULL, '103', '50'),
('636', 'Julia', 'Dellinger', 'JDELLING', '650.509.3876', '1998-06-24', 'SH_CLERK', '3400', NULL, '103', '50'),
('637', 'Anthony', 'Cabrio', 'ACABRIO', '650.509.4876', '1999-02-07', 'SH_CLERK', '3000', NULL, '103', '50'),
('638', 'Kelly', 'Chung', 'KCHUNG', '650.505.1876', '1997-06-14', 'SH_CLERK', '3800', NULL, '103', '50'),
('639', 'Jennifer', 'Dilly', 'JDILLY', '650.505.2876', '1997-08-13', 'SH_CLERK', '3600', NULL, '103', '50'),
('640', 'Timothy', 'Gatesa', 'TGATES', '650.505.3876', '1998-07-11', 'SH_CLERK', '3000', NULL, '103', '50'),
('641', 'Randall', 'Perkins', 'RPERKINS', '650.505.4876', '1999-12-19', 'SH_CLERK', '2600', NULL, '103', '50'),
('642', 'Sarah', 'Bell', 'SBELL', '650.501.1876', '1996-02-04', 'SH_CLERK', '4000', NULL, '103', '50'),
('643', 'Britney', 'Everett', 'BEVERETT', '650.501.2876', '1997-03-03', 'SH_CLERK', '3900', NULL, '103', '50'),
('644', 'Samuel', 'McCain', 'SMCCAIN', '650.501.3876', '1998-07-01', 'SH_CLERK', '3200', NULL, '103', '50'),
('645', 'Vance', 'Jones', 'VJONES', '650.501.4876', '1999-03-17', 'SH_CLERK', '2900', NULL, '103', '50'),
('646', 'Alana', 'Walsh', 'AWALSH', '650.507.9811', '1998-04-24', 'SH_CLERK', '3100', NULL, '103', '50'),
('647', 'Kevin', 'Feeney', 'KFEENEY', '650.507.9822', '1998-05-23', 'SH_CLERK', '3000', NULL, '103', '50'),
('658', 'Donald', 'OConnell', 'DOCONNEL', '650.507.9833', '1999-06-21', 'SH_CLERK', '2700', NULL, '103', '50'),
('659', 'Douglas', 'Grant', 'DGRANT', '650.507.9844', '2000-01-13', 'SH_CLERK', '2700', NULL, '103', '50'),
('661', 'Michael', 'Hartstein', 'MHARTSTE', '515.123.5555', '1996-02-17', 'MK_MAN', '13000', NULL, '103', '20'),
('662', 'Pat', 'Fay', 'PFAY', '603.123.6666', '1997-08-17', 'MK_REP', '6000', NULL, '103', '20');*/

-- --------------------------------------------------------

--
-- Структура таблицы `salariati_1`
--

CREATE TABLE `salariati_1` (
  `ID_ANGAJAT` decimal(10,0) NOT NULL,
  `PRENUME` varchar(20) DEFAULT NULL,
  `NUME` varchar(25) DEFAULT NULL,
  `EMAIL` varchar(25) DEFAULT NULL,
  `TELEFON` varchar(20) DEFAULT NULL,
  `DATA_ANGAJARE` date DEFAULT NULL,
  `ID_FUNCTIE` varchar(10) DEFAULT NULL,
  `SALARIUL` decimal(10,0) DEFAULT NULL,
  `COMISION` decimal(10,0) DEFAULT NULL,
  `ID_MANAGER` decimal(10,0) DEFAULT NULL,
  `ID_DEPARTAMENT` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `salariati_1`
--

/*INSERT INTO `salariati_1` (`ID_ANGAJAT`, `PRENUME`, `NUME`, `EMAIL`, `TELEFON`, `DATA_ANGAJARE`, `ID_FUNCTIE`, `SALARIUL`, `COMISION`, `ID_MANAGER`, `ID_DEPARTAMENT`) VALUES
('659', 'Douglas', 'Grant', 'DGRANT', '650.507.9844', '2018-01-13', 'SH_CLERK', '2600', NULL, '103', '50');*/

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `sal_mediu`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `sal_mediu` (
`ID_DEPARTAMENT` decimal(10,0)
,`SAL_MEDIU_DEPART` decimal(14,4)
);

-- --------------------------------------------------------

--
-- Структура таблицы `TARI`
--

CREATE TABLE `TARI` (
  `ID_TARA` char(2) NOT NULL,
  `DENUMIRE_TARA` varchar(40) DEFAULT NULL,
  `ID_REGIUNE` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `TARI`
--

/*INSERT INTO `TARI` (`ID_TARA`, `DENUMIRE_TARA`, `ID_REGIUNE`) VALUES
('AR', 'Argentina', '2'),
('AU', 'Australia', '3'),
('BE', 'Belgium', '1'),
('BR', 'Brazil', '2'),
('CA', 'Canada', '2'),
('CH', 'Switzerland', '1'),
('CN', 'China', '3'),
('DE', 'Germany', '1'),
('DK', 'Denmark', '1'),
('EG', 'Egypt', '4'),
('FR', 'France', '1'),
('HK', 'HongKong', '3'),
('IL', 'Israel', '4'),
('IN', 'India', '3'),
('IT', 'Italy', '1'),
('JP', 'Japan', '3'),
('KW', 'Kuwait', '4'),
('MX', 'Mexico', '2'),
('NG', 'Nigeria', '4'),
('NL', 'Netherlands', '1'),
('SG', 'Singapore', '3'),
('UK', 'United Kingdom', '1'),
('US', 'United States of America', '2'),
('ZM', 'Zambia', '4'),
('ZW', 'Zimbabwe', '4');*/

-- --------------------------------------------------------

--
-- Структура для представления `a`
--
DROP TABLE IF EXISTS `a`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `companie`.`a`  AS  select `companie`.`angajati`.`SALARIUL` AS `salariul` from `companie`.`angajati` where (`companie`.`angajati`.`ID_ANGAJAT` = 167) ;

-- --------------------------------------------------------

--
-- Структура для представления `d`
--
DROP TABLE IF EXISTS `d`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `companie`.`d`  AS  select `companie`.`angajati`.`SALARIUL` AS `salariul` from `companie`.`angajati` where (`companie`.`angajati`.`ID_ANGAJAT` = 173) ;

-- --------------------------------------------------------

--
-- Структура для представления `sal_mediu`
--
DROP TABLE IF EXISTS `sal_mediu`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `companie`.`sal_mediu`  AS  select `companie`.`angajati`.`ID_DEPARTAMENT` AS `ID_DEPARTAMENT`,avg(`companie`.`angajati`.`SALARIUL`) AS `SAL_MEDIU_DEPART` from `companie`.`angajati` where (`companie`.`angajati`.`ID_DEPARTAMENT` is not null) group by `companie`.`angajati`.`ID_DEPARTAMENT` ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `ANGAJATI`
--
ALTER TABLE `ANGAJATI`
  ADD PRIMARY KEY (`ID_ANGAJAT`),
  ADD KEY `IDX_Departament` (`ID_DEPARTAMENT`);

--
-- Индексы таблицы `COMENZI`
--
ALTER TABLE `COMENZI`
  ADD PRIMARY KEY (`NR_COMANDA`),
  ADD KEY `FK_COMENZI_ANGAJATI` (`ID_ANGAJAT`);

--
-- Индексы таблицы `DEPARTAMENTE`
--
ALTER TABLE `DEPARTAMENTE`
  ADD PRIMARY KEY (`ID_DEPARTAMENT`);

--
-- Индексы таблицы `FUNCTII`
--
ALTER TABLE `FUNCTII`
  ADD PRIMARY KEY (`ID_FUNCTIE`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `COMENZI`
--
ALTER TABLE `COMENZI`
  ADD CONSTRAINT `FK_COMENZI_ANGAJATI` FOREIGN KEY (`ID_ANGAJAT`) REFERENCES `ANGAJATI` (`ID_ANGAJAT`);
--
-- База данных: `Filmari`
--
CREATE DATABASE IF NOT EXISTS `Filmari` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `Filmari`;

-- --------------------------------------------------------

--
-- Структура таблицы `ACTORI`
--

CREATE TABLE `ACTORI` (
  `idActor` tinyint(4) NOT NULL,
  `Numele` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ACTORI`
--

/*INSERT INTO `ACTORI` (`idActor`, `Numele`) VALUES
(1, 'Johnny Deep'),
(2, 'Al Pacino'),
(3, 'Suraj Sharma'),
(4, 'Brad Pitt'),
(5, 'Edward Norton');*/

-- --------------------------------------------------------

--
-- Структура таблицы `FILM`
--

CREATE TABLE `FILM` (
  `idFilm` tinyint(4) NOT NULL,
  `Titlul` varchar(25) DEFAULT NULL,
  `Regizor` varchar(25) DEFAULT NULL,
  `Anul` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `FILM`
--

/*INSERT INTO `FILM` (`idFilm`, `Titlul`, `Regizor`, `Anul`) VALUES
(1, 'Les evades', 'Darabont', 1994),
(2, 'Rango', 'Verbinski', 2015),
(3, 'Le parrain', 'Coppola', 1972),
(4, 'Le parrain 2', 'Coppola', 1974),
(5, 'Chocolat', 'Hallstrom', 2013),
(6, 'Scarface', 'De palma', 1983),
(7, 'L\'odyssee de Pi', 'Ang Lee', 2011),
(8, 'BLACK', 'COPPOLA', 2012);*/

-- --------------------------------------------------------

--
-- Структура таблицы `FILMOGRAFIE`
--

CREATE TABLE `FILMOGRAFIE` (
  `IdActor` tinyint(4) NOT NULL,
  `IdFilm` tinyint(4) NOT NULL,
  `Rolul` varchar(50) DEFAULT NULL,
  `Salariul` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `FILMOGRAFIE`
--

/*INSERT INTO `FILMOGRAFIE` (`IdActor`, `IdFilm`, `Rolul`, `Salariul`) VALUES
(1, 3, 'Rango', 10000),
(1, 5, 'Roux', 5000),
(2, 2, 'Michael Corleone', 10000),
(2, 3, 'Tony Montana', 15000),
(2, 7, 'Michael Corleone', 20000),
(3, 4, 'Pi', 20000);*/

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `ACTORI`
--
ALTER TABLE `ACTORI`
  ADD PRIMARY KEY (`idActor`);

--
-- Индексы таблицы `FILM`
--
ALTER TABLE `FILM`
  ADD PRIMARY KEY (`idFilm`);

--
-- Индексы таблицы `FILMOGRAFIE`
--
ALTER TABLE `FILMOGRAFIE`
  ADD PRIMARY KEY (`IdActor`,`IdFilm`),
  ADD KEY `FK_FILMOGRAFIE_FILM` (`IdFilm`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `FILMOGRAFIE`
--
ALTER TABLE `FILMOGRAFIE`
  ADD CONSTRAINT `FK_FILMOGRAFIE_ACTORI` FOREIGN KEY (`IdActor`) REFERENCES `ACTORI` (`idActor`),
  ADD CONSTRAINT `FK_FILMOGRAFIE_FILM` FOREIGN KEY (`IdFilm`) REFERENCES `FILM` (`idFilm`);
--
-- База данных: `IP_PRPJECT`
--
CREATE DATABASE IF NOT EXISTS `IP_PRPJECT` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `IP_PRPJECT`;

-- --------------------------------------------------------

--
-- Структура таблицы `Firme`
--

CREATE TABLE `Firme` (
  `Cod_firma` tinyint(4) NOT NULL,
  `Denumire_firma` varchar(25) NOT NULL,
  `Adresa` varchar(25) NOT NULL,
  `Zona` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Firme`
--

/*INSERT INTO `Firme` (`Cod_firma`, `Denumire_firma`, `Adresa`, `Zona`) VALUES
(10, 'Franzeluta', 'Chisinau', 'Est'),
(11, 'Incomlac', 'Balti', 'Nord');*/

-- --------------------------------------------------------

--
-- Структура таблицы `PERSONAL`
--

CREATE TABLE `PERSONAL` (
  `Cod_agent` tinyint(4) NOT NULL,
  `nume_agent` varchar(25) NOT NULL,
  `data_angalare` date DEFAULT NULL,
  `data_nasterii` date DEFAULT NULL,
  `functia` varchar(25) DEFAULT NULL,
  `Cod_firma` tinyint(4) DEFAULT NULL,
  `VIRSTA` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Firme`
--
ALTER TABLE `Firme`
  ADD PRIMARY KEY (`Cod_firma`);

--
-- Индексы таблицы `PERSONAL`
--
ALTER TABLE `PERSONAL`
  ADD PRIMARY KEY (`Cod_agent`),
  ADD KEY `FK_Agenti_Firme` (`Cod_firma`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `PERSONAL`
--
ALTER TABLE `PERSONAL`
  ADD CONSTRAINT `FK_Agenti_Firme` FOREIGN KEY (`Cod_firma`) REFERENCES `Firme` (`Cod_firma`);
--
-- База данных: `Laborator2`
--
CREATE DATABASE IF NOT EXISTS `Laborator2` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `Laborator2`;

-- --------------------------------------------------------

--
-- Структура таблицы `Amici`
--

CREATE TABLE `Amici` (
  `idPersoana1` int(11) NOT NULL,
  `idPersoana2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Amici`
--

/*INSERT INTO `Amici` (`idPersoana1`, `idPersoana2`) VALUES
(16, 1),
(17, 1),
(18, 1),
(20, 1),
(21, 1),
(1, 2),
(1, 3),
(7, 5),
(2, 6),
(7, 6),
(8, 7),
(5, 8),
(3, 9),
(12, 9),
(6, 10),
(9, 11),
(12, 11),
(10, 15),
(12, 15),
(7, 19);*/

--
-- Триггеры `Amici`
--
DELIMITER $$
CREATE TRIGGER `VERIFICARE_EXISTENTA_PERSOANE` BEFORE INSERT ON `Amici` FOR EACH ROW BEGIN
IF NOT EXISTS(SELECT * FROM Persoane
	WHERE Persoane.idPersoana = NEW.idPersoana1 OR 
			Persoane.idPersoana = NEW.idPersoana2)
	THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =
		'ATENTE! ACEASTA PERSONA NU EXISTA';
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `CLIENTI`
--

CREATE TABLE `CLIENTI` (
  `ID_CLIENT` decimal(10,0) NOT NULL,
  `PRENUME_CLIENT` varchar(20) DEFAULT NULL,
  `NUME_CLIENT` varchar(20) DEFAULT NULL,
  `TELEFON` varchar(20) DEFAULT NULL,
  `LIMITA_CREDIT` decimal(10,0) DEFAULT NULL,
  `EMAIL_CLIENT` varchar(30) DEFAULT NULL,
  `DATA_NASTERE` date DEFAULT NULL,
  `STAREA_CIVILA` varchar(20) DEFAULT NULL,
  `SEX` varchar(1) DEFAULT NULL,
  `NIVEL_VENITURI` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Persoane`
--

CREATE TABLE `Persoane` (
  `idPersoana` int(11) NOT NULL,
  `numele` varchar(50) DEFAULT NULL,
  `vârsta` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Persoane`
--

/*INSERT INTO `Persoane` (`idPersoana`, `numele`, `vârsta`) VALUES
(1, 'Elvi', 19),
(2, 'Farouk', 19),
(3, 'Sam', 19),
(5, 'Nadia', 14),
(6, 'Chris', 12),
(7, 'Kris', 12),
(8, 'Bethany', 16),
(9, 'Louis', 17),
(10, 'Austin', 22),
(11, 'Gabriel', 21),
(12, 'Jessica', 20),
(14, 'Alfred', 19),
(15, 'Samantha', 17),
(16, 'Craig', 17),
(17, 'ADELA', 21),
(18, 'ADA', 22),
(19, 'Renata', 21),
(20, 'Maxim', 23),
(21, 'Eric', 22);*/

--
-- Триггеры `Persoane`
--
DELIMITER $$
CREATE TRIGGER `MODIFICARE_DATE` BEFORE UPDATE ON `Persoane` FOR EACH ROW BEGIN
UPDATE Amici SET Amici.idPersoana1 = NEW.idPersoana
		WHERE Amici.idPersoana1 = OLD.idPersoana;
-- UPDATE Amici SET Amici.idPersoana2 = NEW.idPersoana
--		WHERE Amici.idPersoana2 = OLD.idPersoana;	
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `STERGERE_CASCADA_DATE` BEFORE DELETE ON `Persoane` FOR EACH ROW BEGIN
DELETE FROM AMICI WHERE Amici.idPersoana1 = OLD.idPersoana
	OR Amici.idPersoana2 = OLD.idPersoana;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `Rude`
--

CREATE TABLE `Rude` (
  `idPersoana1` int(11) NOT NULL,
  `idPersoana2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Rude`
--

INSERT INTO `Rude` (`idPersoana1`, `idPersoana2`) VALUES
(7, 8);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Amici`
--
ALTER TABLE `Amici`
  ADD PRIMARY KEY (`idPersoana1`,`idPersoana2`),
  ADD KEY `FK_Amici_Persoane_2` (`idPersoana2`);

--
-- Индексы таблицы `Persoane`
--
ALTER TABLE `Persoane`
  ADD PRIMARY KEY (`idPersoana`);

--
-- Индексы таблицы `Rude`
--
ALTER TABLE `Rude`
  ADD PRIMARY KEY (`idPersoana1`,`idPersoana2`),
  ADD KEY `FK_Rude_Persoane2` (`idPersoana2`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Persoane`
--
ALTER TABLE `Persoane`
  MODIFY `idPersoana` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Amici`
--
ALTER TABLE `Amici`
  ADD CONSTRAINT `FK_Amici_Persoane` FOREIGN KEY (`idPersoana1`) REFERENCES `Persoane` (`idPersoana`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Amici_Persoane_2` FOREIGN KEY (`idPersoana2`) REFERENCES `Persoane` (`idPersoana`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Rude`
--
ALTER TABLE `Rude`
  ADD CONSTRAINT `FK_Rude_Persoane` FOREIGN KEY (`idPersoana1`) REFERENCES `Persoane` (`idPersoana`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Rude_Persoane2` FOREIGN KEY (`idPersoana2`) REFERENCES `Persoane` (`idPersoana`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- База данных: `products`
--
CREATE DATABASE IF NOT EXISTS `products` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `products`;

-- --------------------------------------------------------

--
-- Структура таблицы `Product`
--

CREATE TABLE `Product` (
  `ID` int(11) NOT NULL,
  `Name` char(50) DEFAULT NULL,
  `Price` tinyint(4) DEFAULT NULL,
  `Qwy` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Product`
--

/*INSERT INTO `Product` (`ID`, `Name`, `Price`, `Qwy`) VALUES
(2, 'Caise', 65, 47),
(5, 'Ceai', 123, 66);*/

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Product`
--
ALTER TABLE `Product`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- База данных: `SLAVENA`
--
CREATE DATABASE IF NOT EXISTS `SLAVENA` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `SLAVENA`;

-- --------------------------------------------------------

--
-- Структура таблицы `FIRME`
--

CREATE TABLE `FIRME` (
  `CODFIRME` tinyint(4) NOT NULL,
  `DEN_FIRME` varchar(30) NOT NULL,
  `LOC` varchar(20) DEFAULT NULL,
  `ZONA` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `FIRME`
--

/*INSERT INTO `FIRME` (`CODFIRME`, `DEN_FIRME`, `LOC`, `ZONA`) VALUES
(10, 'FRANZELUTA', 'CHISINAU', 'CENTRU'),
(11, 'PANILINO', 'CAHUL', 'SUD'),
(12, 'CP_BALTI', 'BALTI', 'NORD');*/

-- --------------------------------------------------------

--
-- Структура таблицы `PERSONAL`
--

CREATE TABLE `PERSONAL` (
  `Cod_acent` tinyint(4) NOT NULL,
  `Nume_agent` varchar(20) NOT NULL,
  `Data_angajare` date DEFAULT NULL,
  `Data_nasterii` date DEFAULT NULL,
  `Functia` varchar(20) DEFAULT NULL,
  `Codfirme` tinyint(4) DEFAULT NULL,
  `VIRSTA` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `PERSONAL`
--

/*INSERT INTO `PERSONAL` (`Cod_acent`, `Nume_agent`, `Data_angajare`, `Data_nasterii`, `Functia`, `Codfirme`, `VIRSTA`) VALUES
(100, 'MACOVEI', '2010-02-12', '1990-10-22', 'AGENT', 10, 20),
(101, 'MACOVEI', '2010-02-12', '1990-10-22', 'AGENT', 11, 20),
(105, 'MACOVEI', '2010-02-12', '1990-10-22', 'AGENT', 10, 20),
(106, 'MACOVEI', '2010-02-12', '1990-10-22', 'AGENT', 10, 20);*/

-- --------------------------------------------------------

--
-- Структура таблицы `salariati`
--

CREATE TABLE `salariati` (
  `Cod_acent` tinyint(4) NOT NULL,
  `Nume_agent` varchar(20) NOT NULL,
  `Data_angajare` date DEFAULT NULL,
  `Data_nasterii` date DEFAULT NULL,
  `Functia` varchar(20) DEFAULT NULL,
  `Codfirme` tinyint(4) DEFAULT NULL,
  `VIRSTA` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `salariati`
--

/*INSERT INTO `salariati` (`Cod_acent`, `Nume_agent`, `Data_angajare`, `Data_nasterii`, `Functia`, `Codfirme`, `VIRSTA`) VALUES
(100, 'MACOVEI', '2010-02-12', '1990-10-22', 'AGENT', 10, 20),
(101, 'MACOVEI', '2010-02-12', '1990-10-22', 'AGENT', 11, 20);*/

-- --------------------------------------------------------

--
-- Структура таблицы `salariati_1`
--

CREATE TABLE `salariati_1` (
  `Cod_acent` tinyint(4) NOT NULL,
  `Nume_agent` varchar(20) NOT NULL,
  `Data_angajare` date DEFAULT NULL,
  `Data_nasterii` date DEFAULT NULL,
  `Functia` varchar(20) DEFAULT NULL,
  `Codfirme` tinyint(4) DEFAULT NULL,
  `VIRSTA` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `salariati_1`
--

/*INSERT INTO `salariati_1` (`Cod_acent`, `Nume_agent`, `Data_angajare`, `Data_nasterii`, `Functia`, `Codfirme`, `VIRSTA`) VALUES
(100, 'MACOVEI', '2010-02-12', '1990-10-22', 'AGENT', 10, 20),
(105, 'MACOVEI', '2010-02-12', '1990-10-22', 'AGENT', 10, 20),
(106, 'MACOVEI', '2010-02-12', '1990-10-22', 'AGENT', 10, 20);*/

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `FIRME`
--
ALTER TABLE `FIRME`
  ADD PRIMARY KEY (`CODFIRME`);

--
-- Индексы таблицы `PERSONAL`
--
ALTER TABLE `PERSONAL`
  ADD PRIMARY KEY (`Cod_acent`),
  ADD KEY `Codfirme` (`Codfirme`);

--
-- Индексы таблицы `salariati_1`
--
ALTER TABLE `salariati_1`
  ADD PRIMARY KEY (`Cod_acent`),
  ADD KEY `Codfirme` (`Codfirme`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `PERSONAL`
--
ALTER TABLE `PERSONAL`
  ADD CONSTRAINT `personal_ibfk_1` FOREIGN KEY (`Codfirme`) REFERENCES `FIRME` (`CODFIRME`);
--
-- База данных: `SPECIALITATEA_IS`
--
CREATE DATABASE IF NOT EXISTS `SPECIALITATEA_IS` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `SPECIALITATEA_IS`;

-- --------------------------------------------------------

--
-- Структура таблицы `STUDENT`
--

CREATE TABLE `STUDENT` (
  `ID_ST` int(11) NOT NULL,
  `NUME` varchar(25) DEFAULT NULL,
  `PRENUME` varchar(25) DEFAULT NULL,
  `VIRSTA` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `STUDENT`
--

/*INSERT INTO `STUDENT` (`ID_ST`, `NUME`, `PRENUME`, `VIRSTA`) VALUES
(1, 'TRIPADUS', 'VADIM', 20),
(2, 'BAZAOCHI', 'DUMITRU', 20),
(3, 'PRISACARI', 'ELENA', 19),
(4, 'POGOR', 'VADIM', 19),
(5, 'COZMA', 'DENIS', 20);*/

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `STUDENT`
--
ALTER TABLE `STUDENT`
  ADD PRIMARY KEY (`ID_ST`);
--
-- База данных: `Specialitatea_MI`
--
CREATE DATABASE IF NOT EXISTS `Specialitatea_MI` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `Specialitatea_MI`;
--
-- База данных: `Student`
--
CREATE DATABASE IF NOT EXISTS `Student` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `Student`;

-- --------------------------------------------------------

--
-- Структура таблицы `CURS`
--

CREATE TABLE `CURS` (
  `CURS_ID` smallint(3) NOT NULL,
  `CURS_DEN` varchar(50) NOT NULL,
  `ORE` smallint(3) DEFAULT NULL,
  `SEMESTRU` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `CURS`
--

/*INSERT INTO `CURS` (`CURS_ID`, `CURS_DEN`, `ORE`, `SEMESTRU`) VALUES
(10, 'Informatica', 56, 1),
(22, 'Fizica', 34, 1),
(43, 'Matematica', 56, 2),
(56, 'Istoria', 34, 4),
(73, 'Educaţia fizică', 34, 5),
(94, 'Limba Engleză', 56, 3);*/

-- --------------------------------------------------------

--
-- Структура таблицы `CURS_PROF`
--

CREATE TABLE `CURS_PROF` (
  `PR_ID` smallint(3) DEFAULT NULL,
  `CURS_ID` smallint(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `CURS_PROF`
--

/*INSERT INTO `CURS_PROF` (`PR_ID`, `CURS_ID`) VALUES
(24, 10),
(46, 22),
(74, 43),
(108, 56),
(276, 94),
(328, 73);*/

-- --------------------------------------------------------

--
-- Структура таблицы `NOTE_EXAM`
--

CREATE TABLE `NOTE_EXAM` (
  `EXAM_ID` smallint(3) NOT NULL,
  `ST_ID` smallint(6) DEFAULT NULL,
  `CURS_ID` smallint(3) DEFAULT NULL,
  `NOTA` tinyint(2) DEFAULT NULL,
  `DATA_EXAM` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `NOTE_EXAM`
--

/*INSERT INTO `NOTE_EXAM` (`EXAM_ID`, `ST_ID`, `CURS_ID`, `NOTA`, `DATA_EXAM`) VALUES
(34, 32, 10, 9, '2000-01-23'),
(43, 6, 22, 5, '2000-01-18'),
(75, 55, 10, 9, '2000-01-05'),
(145, 12, 10, 10, '2000-01-12'),
(238, 12, 22, 6, '1999-06-17'),
(639, 55, 22, NULL, '1999-06-22');*/

-- --------------------------------------------------------

--
-- Структура таблицы `PROFESOR`
--

CREATE TABLE `PROFESOR` (
  `PR_ID` smallint(3) NOT NULL,
  `NUME` varchar(25) NOT NULL,
  `PRENUME` varchar(25) NOT NULL,
  `ORAS` varchar(15) DEFAULT NULL,
  `UNIV_ID` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `PROFESOR`
--

/*INSERT INTO `PROFESOR` (`PR_ID`, `NUME`, `PRENUME`, `ORAS`, `UNIV_ID`) VALUES
(24, 'Iordachi', 'Boris', 'Bălţi', 10),
(46, 'Nuca', 'Ion', 'Bălţi', 10),
(74, 'Lăsescu', 'Pavel', 'Chişinău', 22),
(108, 'Stănescu', 'Nicolai', 'Chişinău', 22),
(276, 'Negrescu', 'Victor', 'Bălţi', 10),
(328, 'Sorescu', 'Andrei', 'Orhei', 10);*/

-- --------------------------------------------------------

--
-- Структура таблицы `STUDENT`
--

CREATE TABLE `STUDENT` (
  `ST_ID` smallint(6) NOT NULL,
  `NUME` varchar(25) NOT NULL,
  `PRENUME` varchar(25) NOT NULL,
  `BURSA` smallint(6) NOT NULL,
  `ANUL` tinyint(2) NOT NULL,
  `ORAS` varchar(15) DEFAULT NULL,
  `DATA_N` date DEFAULT NULL,
  `UNIV_ID` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `STUDENT`
--

/*INSERT INTO `STUDENT` (`ST_ID`, `NUME`, `PRENUME`, `BURSA`, `ANUL`, `ORAS`, `DATA_N`, `UNIV_ID`) VALUES
(1, 'Popescu', 'Ion', 150, 1, 'Orhei', '1982-12-03', 10),
(3, 'Ionescu', 'Petru', 200, 3, 'Cahul', '1980-12-01', 10),
(6, 'Sima', 'Vadim', 150, 4, 'Chișinău', '1979-06-07', 22),
(10, 'Osman', 'Nicolai', 0, 2, 'Briceni', '1981-12-08', 10),
(12, 'Casta', 'Olga', 250, 2, 'Lipcani', '1981-05-01', 10),
(32, 'Colesnic', 'Petru', 150, 5, 'Drochia', NULL, 10),
(55, 'Bănescu', 'Vlad', 250, 5, 'Bălți', '1980-01-07', 10),
(265, 'Mantes', 'Andrei', 0, 3, 'Bălți', '1979-11-05', 10),
(276, 'Petrescu', 'Elena', 200, 4, NULL, '1981-08-05', 22),
(654, 'Luca', 'Artur', 200, 3, 'Bălți', '1981-12-01', 14);*/

-- --------------------------------------------------------

--
-- Структура таблицы `UNIVERSITATE`
--

CREATE TABLE `UNIVERSITATE` (
  `UNIV_ID` tinyint(2) NOT NULL,
  `UNIV_DEN` varchar(100) NOT NULL,
  `RATING` smallint(6) DEFAULT NULL,
  `ORAS` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `UNIVERSITATE`
--

/*INSERT INTO `UNIVERSITATE` (`UNIV_ID`, `UNIV_DEN`, `RATING`, `ORAS`) VALUES
(10, 'USB', 296, 'Bălţi'),
(11, 'ULIM', 345, 'Chişinău'),
(14, 'USD', 326, 'Drochia'),
(15, 'USC', 368, 'Chişinău'),
(18, 'ВГМА', 327, 'Bălţi'),
(22, 'USM', 606, 'Chişinău'),
(32, 'USC', 416, 'Cahul');*/

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `CURS`
--
ALTER TABLE `CURS`
  ADD PRIMARY KEY (`CURS_ID`);

--
-- Индексы таблицы `CURS_PROF`
--
ALTER TABLE `CURS_PROF`
  ADD KEY `PR_ID` (`PR_ID`),
  ADD KEY `CURS_ID` (`CURS_ID`);

--
-- Индексы таблицы `NOTE_EXAM`
--
ALTER TABLE `NOTE_EXAM`
  ADD PRIMARY KEY (`EXAM_ID`),
  ADD KEY `ST_ID` (`ST_ID`),
  ADD KEY `CURS_ID` (`CURS_ID`);

--
-- Индексы таблицы `PROFESOR`
--
ALTER TABLE `PROFESOR`
  ADD PRIMARY KEY (`PR_ID`);

--
-- Индексы таблицы `STUDENT`
--
ALTER TABLE `STUDENT`
  ADD PRIMARY KEY (`ST_ID`),
  ADD KEY `UNIV_ID` (`UNIV_ID`),
  ADD KEY `studenti` (`ANUL`),
  ADD KEY `idx_studenti` (`ANUL`);

--
-- Индексы таблицы `UNIVERSITATE`
--
ALTER TABLE `UNIVERSITATE`
  ADD PRIMARY KEY (`UNIV_ID`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `CURS_PROF`
--
ALTER TABLE `CURS_PROF`
  ADD CONSTRAINT `curs_prof_ibfk_1` FOREIGN KEY (`PR_ID`) REFERENCES `profesor` (`PR_ID`),
  ADD CONSTRAINT `curs_prof_ibfk_2` FOREIGN KEY (`CURS_ID`) REFERENCES `curs` (`CURS_ID`);

--
-- Ограничения внешнего ключа таблицы `NOTE_EXAM`
--
ALTER TABLE `NOTE_EXAM`
  ADD CONSTRAINT `note_exam_ibfk_1` FOREIGN KEY (`ST_ID`) REFERENCES `student` (`ST_ID`),
  ADD CONSTRAINT `note_exam_ibfk_2` FOREIGN KEY (`CURS_ID`) REFERENCES `curs` (`CURS_ID`);

--
-- Ограничения внешнего ключа таблицы `STUDENT`
--
ALTER TABLE `STUDENT`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`UNIV_ID`) REFERENCES `universitate` (`UNIV_ID`);
--
-- База данных: `STUDENTS`
--
CREATE DATABASE IF NOT EXISTS `STUDENTS` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `STUDENTS`;

-- --------------------------------------------------------

--
-- Структура таблицы `STUDENT`
--

CREATE TABLE `STUDENT` (
  `ID_ST` int(11) NOT NULL,
  `NUME` varchar(50) DEFAULT NULL,
  `PRENUME` varchar(50) DEFAULT NULL,
  `VIRSTA` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `STUDENT`
--

/*INSERT INTO `STUDENT` (`ID_ST`, `NUME`, `PRENUME`, `VIRSTA`) VALUES
(101, 'STATI', 'IGOR', 21),
(102, 'SCRIPNIC', 'ANDREI', 23),
(103, 'SPINU', 'TATIANA', 21);*/

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `STUDENT`
--
ALTER TABLE `STUDENT`
  ADD PRIMARY KEY (`ID_ST`);
--
-- База данных: `User`
--
CREATE DATABASE IF NOT EXISTS `User` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `User`;

-- --------------------------------------------------------

--
-- Структура таблицы `user_emp`
--

CREATE TABLE `user_emp` (
  `Id` tinyint(4) NOT NULL,
  `name` char(50) DEFAULT NULL,
  `address` char(50) DEFAULT NULL,
  `age` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `user_emp`
--
ALTER TABLE `user_emp`
  ADD PRIMARY KEY (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
