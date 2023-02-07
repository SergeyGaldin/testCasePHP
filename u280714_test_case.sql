-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Дек 02 2022 г., 21:08
-- Версия сервера: 10.3.37-MariaDB-cll-lve
-- Версия PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `u280714_test_case`
--

-- --------------------------------------------------------

--
-- Структура таблицы `deposits`
--

CREATE TABLE `deposits` (
  `id_deposit` int(11) NOT NULL,
  `name_deposit` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `deposits`
--

INSERT INTO `deposits` (`id_deposit`, `name_deposit`) VALUES
(1, 'Альметьевск'),
(2, 'Казань'),
(3, 'Акташ');

-- --------------------------------------------------------

--
-- Структура таблицы `organizations`
--

CREATE TABLE `organizations` (
  `id_organization` int(11) NOT NULL,
  `name_organization` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `organizations`
--

INSERT INTO `organizations` (`id_organization`, `name_organization`) VALUES
(1, 'Организация 1'),
(2, 'Организация 2'),
(3, 'Организация 3');

-- --------------------------------------------------------

--
-- Структура таблицы `priorities`
--

CREATE TABLE `priorities` (
  `id_priority` int(11) NOT NULL,
  `name_priority` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `priorities`
--

INSERT INTO `priorities` (`id_priority`, `name_priority`) VALUES
(1, 'Низкий'),
(2, 'Средний'),
(3, 'Высокий');

-- --------------------------------------------------------

--
-- Структура таблицы `requests`
--

CREATE TABLE `requests` (
  `id_request` int(11) NOT NULL,
  `name_request` text NOT NULL,
  `deposit` int(11) NOT NULL,
  `service` int(11) NOT NULL,
  `executor` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `priority` int(11) NOT NULL,
  `date_creation` text NOT NULL,
  `date_begine` text NOT NULL,
  `date_end` text NOT NULL DEFAULT 'Не определено',
  `author` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `requests`
--

INSERT INTO `requests` (`id_request`, `name_request`, `deposit`, `service`, `executor`, `status`, `priority`, `date_creation`, `date_begine`, `date_end`, `author`) VALUES
(77, 'Request 2', 2, 1, 10, 1, 1, '27.11.2022 14:43', '12.12.5833', 'Не определено', 'Галдин Сергей Дмитриевич / Организация 1'),
(84, 'Check', 1, 1, 1, 2, 1, '27.11.2022 14:49', '11.52.1233', 'Не определено', 'Галдин Сергей Дмитриевич / Организация 1'),
(85, 'Request 4', 1, 1, 1, 1, 1, '27.11.2022 15:01', '65.34.2344', 'Не определено', 'Галдин Сергей Дмитриевич / Организация 1'),
(86, 'Request 5', 2, 3, 11, 2, 3, '27.11.2022 15:02', '13.41.1232', 'Не определено', 'Галдин Сергей Дмитриевич / Организация 1'),
(87, 'Request 6', 1, 3, 9, 1, 3, '27.11.2022 15:07', '12.12.1222', 'Не определено', 'Галдин Сергей Дмитриевич / Организация 1'),
(88, 'Request 7', 3, 1, 10, 1, 2, '27.11.2022 15:14', '12.45.3422', 'Не определено', 'Галдин Сергей Дмитриевич / Организация 1'),
(89, 'Request 10', 1, 3, 9, 1, 3, '02.12.2022 18:01', '21.12.2022', 'Не определено', 'Галдин Сергей Дмитриевич / Организация 1');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id_role` int(11) NOT NULL,
  `name_role` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id_role`, `name_role`) VALUES
(1, 'Системный администратор'),
(2, 'Инженер'),
(3, 'Сварщик'),
(4, 'Механик');

-- --------------------------------------------------------

--
-- Структура таблицы `services`
--

CREATE TABLE `services` (
  `id_service` int(11) NOT NULL,
  `name_service` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `services`
--

INSERT INTO `services` (`id_service`, `name_service`) VALUES
(1, 'Нефтепромысловые работы'),
(2, 'Энергетика'),
(3, 'Сварочные работы'),
(4, 'Подземный ремонт скважин');

-- --------------------------------------------------------

--
-- Структура таблицы `statuses`
--

CREATE TABLE `statuses` (
  `id_status` int(11) NOT NULL,
  `name_status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `statuses`
--

INSERT INTO `statuses` (`id_status`, `name_status`) VALUES
(1, 'Принята'),
(2, 'Отказано'),
(3, 'Исполнена');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` text NOT NULL,
  `password` text NOT NULL,
  `user_name` text NOT NULL,
  `organization` int(11) NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `user_name`, `organization`, `role`) VALUES
(1, 'oiwfhfow', 'gergeg', 'gerge', 1, 2),
(9, 'sergey', '123123', 'Галдин Сергей Дмитриевич', 1, 1),
(10, 'leva', '123123', 'Лев', 2, 4),
(11, 'max', '123123', 'Максим', 1, 3);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `deposits`
--
ALTER TABLE `deposits`
  ADD UNIQUE KEY `id_deposit_2` (`id_deposit`),
  ADD KEY `id_deposit` (`id_deposit`);

--
-- Индексы таблицы `organizations`
--
ALTER TABLE `organizations`
  ADD UNIQUE KEY `id_organization_2` (`id_organization`),
  ADD KEY `id_organization` (`id_organization`);

--
-- Индексы таблицы `priorities`
--
ALTER TABLE `priorities`
  ADD UNIQUE KEY `id_priority_2` (`id_priority`),
  ADD KEY `id_priority` (`id_priority`);

--
-- Индексы таблицы `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id_request`),
  ADD KEY `deposit` (`deposit`),
  ADD KEY `priority` (`priority`),
  ADD KEY `service` (`service`),
  ADD KEY `status` (`status`),
  ADD KEY `executor` (`executor`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD UNIQUE KEY `id_role_2` (`id_role`),
  ADD KEY `id_role` (`id_role`);

--
-- Индексы таблицы `services`
--
ALTER TABLE `services`
  ADD UNIQUE KEY `id_service_2` (`id_service`),
  ADD KEY `id_service` (`id_service`);

--
-- Индексы таблицы `statuses`
--
ALTER TABLE `statuses`
  ADD UNIQUE KEY `id_status_2` (`id_status`),
  ADD KEY `id_status` (`id_status`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organization` (`organization`),
  ADD KEY `role` (`role`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `requests`
--
ALTER TABLE `requests`
  MODIFY `id_request` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `requests`
--
ALTER TABLE `requests`
  ADD CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`deposit`) REFERENCES `deposits` (`id_deposit`),
  ADD CONSTRAINT `requests_ibfk_2` FOREIGN KEY (`priority`) REFERENCES `priorities` (`id_priority`),
  ADD CONSTRAINT `requests_ibfk_3` FOREIGN KEY (`service`) REFERENCES `services` (`id_service`),
  ADD CONSTRAINT `requests_ibfk_4` FOREIGN KEY (`status`) REFERENCES `statuses` (`id_status`),
  ADD CONSTRAINT `requests_ibfk_5` FOREIGN KEY (`executor`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`organization`) REFERENCES `organizations` (`id_organization`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`role`) REFERENCES `roles` (`id_role`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
