-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Авг 06 2018 г., 14:27
-- Версия сервера: 5.7.20
-- Версия PHP: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `yii2EAV`
--

-- --------------------------------------------------------

--
-- Структура таблицы `eav`
--

CREATE TABLE `eav` (
  `id` int(11) NOT NULL,
  `entityName` varchar(255) DEFAULT NULL,
  `entityModel` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `eav`
--

INSERT INTO `eav` (`id`, `entityName`, `entityModel`) VALUES
(13, 'Продукты', 'backend\\models\\Product');

-- --------------------------------------------------------

--
-- Структура таблицы `eav_attribute`
--

CREATE TABLE `eav_attribute` (
  `id` int(11) NOT NULL,
  `entityId` int(11) DEFAULT NULL,
  `typeId` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT '',
  `name` varchar(255) DEFAULT 'NULL',
  `label` varchar(255) DEFAULT 'NULL',
  `defaultValue` varchar(255) DEFAULT 'NULL',
  `defaultOptionId` int(11) DEFAULT '0',
  `description` varchar(255) DEFAULT '',
  `order` int(11) DEFAULT '0',
  `categoryId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `eav_attribute`
--

INSERT INTO `eav_attribute` (`id`, `entityId`, `typeId`, `type`, `name`, `label`, `defaultValue`, `defaultOptionId`, `description`, `order`, `categoryId`) VALUES
(77, 13, 5, 'Radio', 'c1', 'Тип генератора', NULL, NULL, 'Для резервного электроснабжения подойдут генераторы от 2 до 15 кВт (от 19 100 до 260 000 рублей).\n\nДля ежедневного или постоянного использования от 10 до 500 кВт (от 230 000 рублей)', 1, 0),
(78, 13, 3, 'Checkbox', 'c78', 'Категория генератора ', NULL, NULL, '', 1, 0),
(79, 13, 1, 'Text', 'c79', 'Текст', 'fh', NULL, '', 1, 0),
(80, 13, 2, 'DropDownList', 'c80', 'DropDownList', NULL, NULL, '', 1, 0),
(81, 13, 4, 'EncodedTextInput', 'c81', 'EncodedTextInput', NULL, NULL, '', 1, 0),
(90, 13, 6, 'Area', 'с82', 'Textarea', NULL, NULL, '', 0, 0),
(91, 13, 7, 'Num', 'c91', 'Номер', '1', NULL, 'Введите номер', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `eav_attribute_option`
--

CREATE TABLE `eav_attribute_option` (
  `id` int(11) NOT NULL,
  `attributeId` int(11) DEFAULT '0',
  `value` varchar(255) DEFAULT 'NULL',
  `defaultOptionId` smallint(1) DEFAULT '0',
  `order` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `eav_attribute_option`
--

INSERT INTO `eav_attribute_option` (`id`, `attributeId`, `value`, `defaultOptionId`, `order`) VALUES
(385, 77, 'резервный', 0, 3),
(386, 77, 'ежедневный', 1, 2),
(387, 77, 'постоянный', 0, 1),
(388, 78, 'A', 1, 0),
(389, 78, 'C', 0, 0),
(390, 80, 'Опция 1', 1, 0),
(391, 80, 'Опция 2', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `eav_attribute_rules`
--

CREATE TABLE `eav_attribute_rules` (
  `id` int(11) NOT NULL,
  `attributeId` int(11) DEFAULT '0',
  `rules` text,
  `required` smallint(1) DEFAULT '0',
  `visible` smallint(1) DEFAULT '0',
  `locked` smallint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `eav_attribute_rules`
--

INSERT INTO `eav_attribute_rules` (`id`, `attributeId`, `rules`, `required`, `visible`, `locked`) VALUES
(1, 79, NULL, 1, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `eav_attribute_type`
--

CREATE TABLE `eav_attribute_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT 'NULL',
  `handlerClass` varchar(255) DEFAULT 'NULL',
  `storeType` smallint(6) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `eav_attribute_type`
--

INSERT INTO `eav_attribute_type` (`id`, `name`, `handlerClass`, `storeType`) VALUES
(1, 'text', '\\mirocow\\eav\\widgets\\TextInput', 0),
(2, 'option', '\\mirocow\\eav\\widgets\\DropDownList', 1),
(3, 'checkbox', '\\mirocow\\eav\\widgets\\CheckBoxList', 2),
(4, 'array', '\\mirocow\\eav\\widgets\\EncodedTextInput', 3),
(5, 'radio', '\\mirocow\\eav\\widgets\\RadioList', 1),
(6, 'area', '\\mirocow\\eav\\widgets\\Textarea', 0),
(7, 'numiric', '\\mirocow\\eav\\widgets\\NumericInput', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `eav_attribute_value`
--

CREATE TABLE `eav_attribute_value` (
  `id` int(11) NOT NULL,
  `entityId` int(11) DEFAULT '0',
  `attributeId` int(11) DEFAULT '0',
  `value` text,
  `optionId` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `eav_attribute_value`
--

INSERT INTO `eav_attribute_value` (`id`, `entityId`, `attributeId`, `value`, `optionId`) VALUES
(16, 1, 77, NULL, 386),
(18, 1, 79, '', 0),
(19, 1, 80, NULL, 390),
(20, 1, 81, '\"200\"', 0),
(21, 1, 90, '', 0),
(26, 1, 78, NULL, 388),
(41, 1, 91, '100', 0),
(46, 2, 77, NULL, 386),
(47, 2, 79, '', 0),
(48, 2, 80, NULL, 390),
(49, 2, 81, '\"\"', 0),
(50, 2, 90, '', 0),
(51, 2, 91, '', 0),
(52, 2, 78, NULL, 388),
(53, 1, 78, NULL, 389);

-- --------------------------------------------------------

--
-- Структура таблицы `eav_entity`
--

CREATE TABLE `eav_entity` (
  `id` int(11) NOT NULL,
  `entityName` varchar(50) DEFAULT NULL,
  `entityModel` varchar(100) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `eav_entity`
--

INSERT INTO `eav_entity` (`id`, `entityName`, `entityModel`, `categoryId`) VALUES
(13, 'Продукт', 'backend\\models\\Product', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1531224640),
('m150821_133232_init', 1531224647),
('m160501_014209_add_column_order_into_option', 1531224647),
('m160501_124615_create_table_eav_attribute_rules', 1531224893),
('m160501_230535_add_columns_into_attribute_rules', 1531224894),
('m160501_232516_add_new_field_types', 1531224894),
('m160501_234949_remove_column_required_from_attribute', 1531224894),
('m160711_132535_delete_foregin_key_from_values', 1531224894),
('m160711_162535_change_default_value', 1531224894),
('m160731_142546_alter_table_eav_attribute', 1531224894),
('m160807_162635_change_default_value_in_eav_attribute_value', 1531224895),
('m160818_102815_add_entityId_index_in_eav_attribute_value', 1531224895);

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int(254) UNSIGNED NOT NULL,
  `product_name` varchar(254) NOT NULL,
  `visible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `product_name`, `visible`) VALUES
(1, 'Телек', 10),
(2, 'Пылесос', 10);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(2, 'moder', '9_GwVtAEpyeCmdtI3vmuNHlkt_ix_DeB', '$2y$13$nuZjP.Weu7liN6sMvK2f3OrRLjavg4AKFBt0QVINES4wx0AvpjS/e', NULL, 'test@test.test', 10, 1453533053, 1453533053);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `eav`
--
ALTER TABLE `eav`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `eav_attribute`
--
ALTER TABLE `eav_attribute`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Attribute_typeId` (`typeId`),
  ADD KEY `FK_EntityId` (`entityId`);

--
-- Индексы таблицы `eav_attribute_option`
--
ALTER TABLE `eav_attribute_option`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Option_attributeId` (`attributeId`);

--
-- Индексы таблицы `eav_attribute_rules`
--
ALTER TABLE `eav_attribute_rules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Rules_attributeId` (`attributeId`);

--
-- Индексы таблицы `eav_attribute_type`
--
ALTER TABLE `eav_attribute_type`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `eav_attribute_value`
--
ALTER TABLE `eav_attribute_value`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Value_attributeId` (`attributeId`),
  ADD KEY `idx_eav_attribute_value_entityId` (`entityId`);

--
-- Индексы таблицы `eav_entity`
--
ALTER TABLE `eav_entity`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `eav`
--
ALTER TABLE `eav`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `eav_attribute`
--
ALTER TABLE `eav_attribute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT для таблицы `eav_attribute_option`
--
ALTER TABLE `eav_attribute_option`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=392;

--
-- AUTO_INCREMENT для таблицы `eav_attribute_rules`
--
ALTER TABLE `eav_attribute_rules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `eav_attribute_type`
--
ALTER TABLE `eav_attribute_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `eav_attribute_value`
--
ALTER TABLE `eav_attribute_value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT для таблицы `eav_entity`
--
ALTER TABLE `eav_entity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(254) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `eav_attribute`
--
ALTER TABLE `eav_attribute`
  ADD CONSTRAINT `FK_Attribute_typeId` FOREIGN KEY (`typeId`) REFERENCES `eav_attribute_type` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_EntityId` FOREIGN KEY (`entityId`) REFERENCES `eav_entity` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `eav_attribute_option`
--
ALTER TABLE `eav_attribute_option`
  ADD CONSTRAINT `FK_Option_attributeId` FOREIGN KEY (`attributeId`) REFERENCES `eav_attribute` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `eav_attribute_rules`
--
ALTER TABLE `eav_attribute_rules`
  ADD CONSTRAINT `FK_Rules_attributeId` FOREIGN KEY (`attributeId`) REFERENCES `eav_attribute` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `eav_attribute_value`
--
ALTER TABLE `eav_attribute_value`
  ADD CONSTRAINT `FK_Value_attributeId` FOREIGN KEY (`attributeId`) REFERENCES `eav_attribute` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
