-- Tabelle anlegen

CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user` VARCHAR(45) NOT NULL,
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `user_UNIQUE` (`user` ASC) )
ENGINE = InnoDB;

-- Struktur
DESCRIBE mydb.users;

-- Inhalte
INSERT INTO `mydb`.`users` (`id`, `user`, `create_time`) VALUES (DEFAULT, "Ingo", DEFAULT);
INSERT INTO `mydb`.`users` (`id`, `user`, `create_time`) VALUES (DEFAULT, "Sohrab", DEFAULT);
INSERT INTO `mydb`.`users` (`id`, `user`, `create_time`) VALUES (DEFAULT, "Jeniffer", DEFAULT);

-- Anzeige
SELECT * FROM mydb.users;


