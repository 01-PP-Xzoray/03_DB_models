-- Vorbereitungen
DROP TABLE IF EXISTS mydb.servants;
DROP TABLE IF EXISTS mydb.cats;

-- Mastertabelle (MT)
-- Mastertabelle (MT): unverändert
CREATE TABLE IF NOT EXISTS `mydb`.`cats` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cat_name` VARCHAR(45) NOT NULL,
  `fur_color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- Struktur: MT
DESCRIBE mydb.cats;

-- Inhalte: MT
INSERT INTO `mydb`.`cats` (`id`, `cat_name`, `fur_color`) VALUES (DEFAULT, "Grizzabella", "white");
INSERT INTO `mydb`.`cats` (`id`, `cat_name`, `fur_color`) VALUES (DEFAULT, "Analonzo", "tricolor");
INSERT INTO `mydb`.`cats` (`id`, `cat_name`, `fur_color`) VALUES (DEFAULT, "Muschilein", "pink");

-- Inhalte: MT
SELECT * FROM mydb.cats;

-- Detailtabelle (DT): Verbindung zur MT über Fremdschlüssel (fk)
CREATE TABLE IF NOT EXISTS `mydb`.`servants` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `servant_name` VARCHAR(45) NOT NULL,
  `yrs_served` INT NOT NULL,
  `cats_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_servants_cats_idx` (`cats_id` ASC),
  UNIQUE INDEX `cats_id_UNIQUE` (`cats_id` ASC),
  CONSTRAINT `fk_servants_cats`
    FOREIGN KEY (`cats_id`)
    REFERENCES `mydb`.`cats` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Struktur: DT
DESCRIBE mydb.servants;

-- Inserts: DT
INSERT INTO `mydb`.`servants` (`id`, `servant_name`, `yrs_served`, `cats_id`) VALUES (DEFAULT, "Tobias", 3, 1);
INSERT INTO `mydb`.`servants` (`id`, `servant_name`, `yrs_served`, `cats_id`) VALUES (DEFAULT, "Yalcin", 4, 3);
INSERT INTO `mydb`.`servants` (`id`, `servant_name`, `yrs_served`, `cats_id`) VALUES (DEFAULT, "Cagri", 5, 2);

-- Inhalte: DT
SELECT * FROM mydb.servants;