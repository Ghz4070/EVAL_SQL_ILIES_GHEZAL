-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema eval_sql
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema eval_sql
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `eval_sql` DEFAULT CHARACTER SET latin1 ;
USE `eval_sql` ;

-- -----------------------------------------------------
-- Table `eval_sql`.`year`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eval_sql`.`year` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `label` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `eval_sql`.`module`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eval_sql`.`module` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `year_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_module_year1_idx` (`year_id` ASC),
  CONSTRAINT `fk_module_year1`
    FOREIGN KEY (`year_id`)
    REFERENCES `eval_sql`.`year` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `eval_sql`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eval_sql`.`student` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(255) NOT NULL,
  `lastname` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `eval_sql`.`assessment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eval_sql`.`assessment` (
  `student_id` INT(11) NOT NULL,
  `module_id` INT(11) NOT NULL,
  `attempted` DATETIME NOT NULL,
  `passed` DATETIME NULL DEFAULT NULL,
  `grade` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`student_id`, `module_id`, `attempted`),
  UNIQUE INDEX `student_has_modulecol_UNIQUE` (`attempted` ASC),
  INDEX `fk_student_has_module_module1_idx` (`module_id` ASC),
  INDEX `fk_student_has_module_student_idx` (`student_id` ASC),
  CONSTRAINT `fk_student_has_module_module1`
    FOREIGN KEY (`module_id`)
    REFERENCES `eval_sql`.`module` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_module_student`
    FOREIGN KEY (`student_id`)
    REFERENCES `eval_sql`.`student` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `eval_sql`.`enroiment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eval_sql`.`enroiment` (
  `year_id` INT(11) NOT NULL,
  `student_id` INT(11) NOT NULL,
  `from` DATETIME NOT NULL,
  `to` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`year_id`, `student_id`),
  INDEX `fk_year_has_student_student1_idx` (`student_id` ASC),
  INDEX `fk_year_has_student_year1_idx` (`year_id` ASC),
  CONSTRAINT `fk_year_has_student_student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `eval_sql`.`student` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_year_has_student_year1`
    FOREIGN KEY (`year_id`)
    REFERENCES `eval_sql`.`year` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
