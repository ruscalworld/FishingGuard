CREATE TABLE IF NOT EXISTS `ips` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `domain` VARCHAR(50) NOT NULL, `guild_id` VARCHAR(50) NOT NULL, `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP)