-- MySQL Script generated by MySQL Workbench
-- 04/23/19 23:19:45
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema jmbm
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema jmbm
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `jmbm` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `jmbm` ;

-- -----------------------------------------------------
-- Table `jmbm`.`Tecnica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jmbm`.`Tecnica` (
  `idTecnica` INT NOT NULL,
  `Tecnica` VARCHAR(45) NULL,
  PRIMARY KEY (`idTecnica`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jmbm`.`Accudiente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jmbm`.`Accudiente` (
  `idAccudiente` INT NOT NULL,
  `Nombres` VARCHAR(60) NULL,
  `Apellidos` VARCHAR(60) NULL,
  `Telefono` INT NULL,
  `Numero CC:` INT NULL,
  `Direccion` VARCHAR(80) NULL,
  PRIMARY KEY (`idAccudiente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jmbm`.`Grado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jmbm`.`Grado` (
  `idGrado` INT NOT NULL,
  `Grado` INT NULL,
  PRIMARY KEY (`idGrado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jmbm`.`Jornada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jmbm`.`Jornada` (
  `idJornada` INT NOT NULL,
  `Jornada` VARCHAR(45) NULL,
  PRIMARY KEY (`idJornada`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jmbm`.`Grupo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jmbm`.`Grupo` (
  `idGrupo` INT NOT NULL,
  `Grado_idGrado` INT NOT NULL,
  `Jornada_idJornada` INT NOT NULL,
  PRIMARY KEY (`idGrupo`, `Grado_idGrado`, `Jornada_idJornada`),
  INDEX `fk_Grupo_Grado1_idx` (`Grado_idGrado` ASC),
  INDEX `fk_Grupo_Jornada1_idx` (`Jornada_idJornada` ASC),
  CONSTRAINT `fk_Grupo_Grado1`
    FOREIGN KEY (`Grado_idGrado`)
    REFERENCES `jmbm`.`Grado` (`idGrado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Grupo_Jornada1`
    FOREIGN KEY (`Jornada_idJornada`)
    REFERENCES `jmbm`.`Jornada` (`idJornada`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jmbm`.`Alumno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jmbm`.`Alumno` (
  `idAlumno` INT NOT NULL,
  `Nombres` VARCHAR(60) NULL,
  `Apellidos` VARCHAR(60) NULL,
  `Tipo de Documento:` VARCHAR(45) NULL,
  `N° Documento` INT NULL,
  `Edad` INT NULL,
  `Direccion` VARCHAR(80) NULL,
  `Tecnica_idTecnica` INT NOT NULL,
  `Accudiente_idAccudiente` INT NOT NULL,
  `Grupo_idGrupo` INT NOT NULL,
  PRIMARY KEY (`idAlumno`, `Tecnica_idTecnica`, `Accudiente_idAccudiente`, `Grupo_idGrupo`),
  INDEX `fk_Alumno_Tecnica_idx` (`Tecnica_idTecnica` ASC),
  INDEX `fk_Alumno_Accudiente1_idx` (`Accudiente_idAccudiente` ASC),
  INDEX `fk_Alumno_Grupo1_idx` (`Grupo_idGrupo` ASC),
  CONSTRAINT `fk_Alumno_Tecnica`
    FOREIGN KEY (`Tecnica_idTecnica`)
    REFERENCES `jmbm`.`Tecnica` (`idTecnica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumno_Accudiente1`
    FOREIGN KEY (`Accudiente_idAccudiente`)
    REFERENCES `jmbm`.`Accudiente` (`idAccudiente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumno_Grupo1`
    FOREIGN KEY (`Grupo_idGrupo`)
    REFERENCES `jmbm`.`Grupo` (`idGrupo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jmbm`.`Sede`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jmbm`.`Sede` (
  `idSede` INT NOT NULL,
  `Sede` INT NULL,
  PRIMARY KEY (`idSede`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jmbm`.`Profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jmbm`.`Profesor` (
  `idProfesor` INT NOT NULL,
  `Nombres` VARCHAR(60) NULL,
  `Apellidos` VARCHAR(60) NULL,
  `Numero CC:` INT NULL,
  `Sede_idSede` INT NOT NULL,
  PRIMARY KEY (`idProfesor`, `Sede_idSede`),
  INDEX `fk_Profesor_Sede1_idx` (`Sede_idSede` ASC),
  CONSTRAINT `fk_Profesor_Sede1`
    FOREIGN KEY (`Sede_idSede`)
    REFERENCES `jmbm`.`Sede` (`idSede`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jmbm`.`Materia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jmbm`.`Materia` (
  `idMateria` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Promedio` INT NULL,
  PRIMARY KEY (`idMateria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jmbm`.`Promedio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jmbm`.`Promedio` (
  `idPromedio` INT NOT NULL,
  `N° Semestre` INT NULL,
  `promedio` INT NULL,
  PRIMARY KEY (`idPromedio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jmbm`.`Area`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jmbm`.`Area` (
  `idArea` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Materia_idMateria` INT NOT NULL,
  PRIMARY KEY (`idArea`, `Materia_idMateria`),
  INDEX `fk_Area_Materia1_idx` (`Materia_idMateria` ASC),
  CONSTRAINT `fk_Area_Materia1`
    FOREIGN KEY (`Materia_idMateria`)
    REFERENCES `jmbm`.`Materia` (`idMateria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jmbm`.`Salon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jmbm`.`Salon` (
  `idSalon` INT NOT NULL,
  `Numero` INT NULL,
  PRIMARY KEY (`idSalon`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jmbm`.`Personal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jmbm`.`Personal` (
  `idPersonal` INT NOT NULL,
  `Nombres` VARCHAR(60) NULL,
  `Apellidos` VARCHAR(60) NULL,
  `Cargo` VARCHAR(60) NULL,
  `Numero CC:` INT NULL,
  `Sede_idSede` INT NOT NULL,
  PRIMARY KEY (`idPersonal`, `Sede_idSede`),
  INDEX `fk_Personal_Sede1_idx` (`Sede_idSede` ASC),
  CONSTRAINT `fk_Personal_Sede1`
    FOREIGN KEY (`Sede_idSede`)
    REFERENCES `jmbm`.`Sede` (`idSede`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jmbm`.`Profesor_has_Grado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jmbm`.`Profesor_has_Grado` (
  `Profesor_idProfesor` INT NOT NULL,
  `Grado_idGrado` INT NOT NULL,
  PRIMARY KEY (`Profesor_idProfesor`, `Grado_idGrado`),
  INDEX `fk_Profesor_has_Grado_Grado1_idx` (`Grado_idGrado` ASC),
  INDEX `fk_Profesor_has_Grado_Profesor1_idx` (`Profesor_idProfesor` ASC),
  CONSTRAINT `fk_Profesor_has_Grado_Profesor1`
    FOREIGN KEY (`Profesor_idProfesor`)
    REFERENCES `jmbm`.`Profesor` (`idProfesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Profesor_has_Grado_Grado1`
    FOREIGN KEY (`Grado_idGrado`)
    REFERENCES `jmbm`.`Grado` (`idGrado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jmbm`.`Salon_has_Profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jmbm`.`Salon_has_Profesor` (
  `Salon_idSalon` INT NOT NULL,
  `Profesor_idProfesor` INT NOT NULL,
  PRIMARY KEY (`Salon_idSalon`, `Profesor_idProfesor`),
  INDEX `fk_Salon_has_Profesor_Profesor1_idx` (`Profesor_idProfesor` ASC),
  INDEX `fk_Salon_has_Profesor_Salon1_idx` (`Salon_idSalon` ASC),
  CONSTRAINT `fk_Salon_has_Profesor_Salon1`
    FOREIGN KEY (`Salon_idSalon`)
    REFERENCES `jmbm`.`Salon` (`idSalon`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Salon_has_Profesor_Profesor1`
    FOREIGN KEY (`Profesor_idProfesor`)
    REFERENCES `jmbm`.`Profesor` (`idProfesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jmbm`.`Alumno_has_Promedio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jmbm`.`Alumno_has_Promedio` (
  `Alumno_idAlumno` INT NOT NULL,
  `Alumno_Tecnica_idTecnica` INT NOT NULL,
  `Alumno_Accudiente_idAccudiente` INT NOT NULL,
  `Alumno_Grupo_idGrupo` INT NOT NULL,
  `Promedio_idPromedio` INT NOT NULL,
  PRIMARY KEY (`Alumno_idAlumno`, `Alumno_Tecnica_idTecnica`, `Alumno_Accudiente_idAccudiente`, `Alumno_Grupo_idGrupo`, `Promedio_idPromedio`),
  INDEX `fk_Alumno_has_Promedio_Promedio1_idx` (`Promedio_idPromedio` ASC),
  INDEX `fk_Alumno_has_Promedio_Alumno1_idx` (`Alumno_idAlumno` ASC, `Alumno_Tecnica_idTecnica` ASC, `Alumno_Accudiente_idAccudiente` ASC, `Alumno_Grupo_idGrupo` ASC),
  CONSTRAINT `fk_Alumno_has_Promedio_Alumno1`
    FOREIGN KEY (`Alumno_idAlumno` , `Alumno_Tecnica_idTecnica` , `Alumno_Accudiente_idAccudiente` , `Alumno_Grupo_idGrupo`)
    REFERENCES `jmbm`.`Alumno` (`idAlumno` , `Tecnica_idTecnica` , `Accudiente_idAccudiente` , `Grupo_idGrupo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumno_has_Promedio_Promedio1`
    FOREIGN KEY (`Promedio_idPromedio`)
    REFERENCES `jmbm`.`Promedio` (`idPromedio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jmbm`.`Profesor_has_Promedio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jmbm`.`Profesor_has_Promedio` (
  `Profesor_idProfesor` INT NOT NULL,
  `Promedio_idPromedio` INT NOT NULL,
  PRIMARY KEY (`Profesor_idProfesor`, `Promedio_idPromedio`),
  INDEX `fk_Profesor_has_Promedio_Promedio1_idx` (`Promedio_idPromedio` ASC),
  INDEX `fk_Profesor_has_Promedio_Profesor1_idx` (`Profesor_idProfesor` ASC),
  CONSTRAINT `fk_Profesor_has_Promedio_Profesor1`
    FOREIGN KEY (`Profesor_idProfesor`)
    REFERENCES `jmbm`.`Profesor` (`idProfesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Profesor_has_Promedio_Promedio1`
    FOREIGN KEY (`Promedio_idPromedio`)
    REFERENCES `jmbm`.`Promedio` (`idPromedio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jmbm`.`Promedio_has_Materia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jmbm`.`Promedio_has_Materia` (
  `Promedio_idPromedio` INT NOT NULL,
  `Materia_idMateria` INT NOT NULL,
  PRIMARY KEY (`Promedio_idPromedio`, `Materia_idMateria`),
  INDEX `fk_Promedio_has_Materia_Materia1_idx` (`Materia_idMateria` ASC),
  INDEX `fk_Promedio_has_Materia_Promedio1_idx` (`Promedio_idPromedio` ASC),
  CONSTRAINT `fk_Promedio_has_Materia_Promedio1`
    FOREIGN KEY (`Promedio_idPromedio`)
    REFERENCES `jmbm`.`Promedio` (`idPromedio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Promedio_has_Materia_Materia1`
    FOREIGN KEY (`Materia_idMateria`)
    REFERENCES `jmbm`.`Materia` (`idMateria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
