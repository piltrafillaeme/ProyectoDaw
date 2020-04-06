-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 06-04-2020 a las 12:17:12
-- Versión del servidor: 10.1.35-MariaDB
-- Versión de PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: cristina_proyecto
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla alumna
--

CREATE TABLE alumna (
  idalumna int(11) NOT NULL,
  nombrealumna text COLLATE utf8_bin,
  apellidosalumna text COLLATE utf8_bin,
  passwordalumna text COLLATE utf8_bin,
  curso_idcurso int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla alumnarealizacuestionario
--

CREATE TABLE alumnarealizacuestionario (
  alumna_idalumna int(11) NOT NULL,
  cuestionario_idcuestionario int(11) NOT NULL,
  nota float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla alumnaregistrahabito
--

CREATE TABLE alumnaregistrahabito (
  alumna_idalumna int(11) NOT NULL,
  habito_idhabito int(11) NOT NULL,
  fecharegistro date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla cuestionario
--

CREATE TABLE cuestionario (
  idcuestionario int(11) NOT NULL,
  nombrecuestionario text COLLATE utf8_bin,
  tema_idtema int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla cuestionariotienepregunta
--

CREATE TABLE cuestionariotienepregunta (
  cuestionario_idcuestionario int(11) NOT NULL,
  pregunta_idpregunta int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla curso
--

CREATE TABLE curso (
  idcurso int(11) NOT NULL,
  nombrecurso text COLLATE utf8_bin,
  profesor_idprofesor int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla habito
--

CREATE TABLE habito (
  idhabito int(11) NOT NULL,
  nombrehabito text COLLATE utf8_bin,
  profesor_idprofesor int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla pregunta
--

CREATE TABLE pregunta (
  idpregunta int(11) NOT NULL,
  enunciadopregunta text COLLATE utf8_bin NOT NULL,
  tipopregunta enum('0','1') COLLATE utf8_bin NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla profesor
--

CREATE TABLE profesor (
  idprofesor int(11) NOT NULL,
  nombreprofesor text COLLATE utf8_bin,
  passwordprofesor text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla respuesta
--

CREATE TABLE respuesta (
  pregunta_idpregunta int(11) NOT NULL,
  idrespuesta int(11) NOT NULL,
  enunciadorespuesta text COLLATE utf8_bin,
  correcta enum('S','N') COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla tema
--

CREATE TABLE tema (
  idtema int(11) NOT NULL,
  nombretema text COLLATE utf8_bin,
  profesor_idprofesor int(11) NOT NULL,
  curso_idcurso int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla alumna
--
ALTER TABLE alumna
  ADD PRIMARY KEY (idalumna),
  ADD KEY alumna_curso_fk (curso_idcurso);

--
-- Indices de la tabla alumnarealizacuestionario
--
ALTER TABLE alumnarealizacuestionario
  ADD PRIMARY KEY (alumna_idalumna,cuestionario_idcuestionario),
  ADD KEY alumnarealizacuestionario_cuestionario_fk (cuestionario_idcuestionario);

--
-- Indices de la tabla alumnaregistrahabito
--
ALTER TABLE alumnaregistrahabito
  ADD PRIMARY KEY (alumna_idalumna,habito_idhabito),
  ADD KEY alumnaregistrahabito_habito_fk (habito_idhabito);

--
-- Indices de la tabla cuestionario
--
ALTER TABLE cuestionario
  ADD PRIMARY KEY (idcuestionario),
  ADD KEY cuestionario_tema_fk (tema_idtema);

--
-- Indices de la tabla cuestionariotienepregunta
--
ALTER TABLE cuestionariotienepregunta
  ADD PRIMARY KEY (cuestionario_idcuestionario,pregunta_idpregunta),
  ADD KEY cuestionariotienepregunta_pregunta_fk (pregunta_idpregunta);

--
-- Indices de la tabla curso
--
ALTER TABLE curso
  ADD PRIMARY KEY (idcurso),
  ADD KEY curso_profesor_fk (profesor_idprofesor);

--
-- Indices de la tabla habito
--
ALTER TABLE habito
  ADD PRIMARY KEY (idhabito),
  ADD KEY habito_profesor_fk (profesor_idprofesor);

--
-- Indices de la tabla pregunta
--
ALTER TABLE pregunta
  ADD PRIMARY KEY (idpregunta);

--
-- Indices de la tabla profesor
--
ALTER TABLE profesor
  ADD PRIMARY KEY (idprofesor);

--
-- Indices de la tabla respuesta
--
ALTER TABLE respuesta
  ADD PRIMARY KEY (idrespuesta,pregunta_idpregunta),
  ADD KEY fk_respuesta_pregunta1_idx (pregunta_idpregunta);

--
-- Indices de la tabla tema
--
ALTER TABLE tema
  ADD PRIMARY KEY (idtema),
  ADD KEY tema_profesor_fk (profesor_idprofesor),
  ADD KEY tema_curso_fk (curso_idcurso);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla alumna
--
ALTER TABLE alumna
  ADD CONSTRAINT alumna_curso_fk FOREIGN KEY (curso_idcurso) REFERENCES curso (idcurso);

--
-- Filtros para la tabla alumnarealizacuestionario
--
ALTER TABLE alumnarealizacuestionario
  ADD CONSTRAINT alumnarealizacuestionario_alumna_fk FOREIGN KEY (alumna_idalumna) REFERENCES alumna (idalumna),
  ADD CONSTRAINT alumnarealizacuestionario_cuestionario_fk FOREIGN KEY (cuestionario_idcuestionario) REFERENCES cuestionario (idcuestionario);

--
-- Filtros para la tabla alumnaregistrahabito
--
ALTER TABLE alumnaregistrahabito
  ADD CONSTRAINT alumnaregistrahabito_alumna_fk FOREIGN KEY (alumna_idalumna) REFERENCES alumna (idalumna),
  ADD CONSTRAINT alumnaregistrahabito_habito_fk FOREIGN KEY (habito_idhabito) REFERENCES habito (idhabito);

--
-- Filtros para la tabla cuestionario
--
ALTER TABLE cuestionario
  ADD CONSTRAINT cuestionario_tema_fk FOREIGN KEY (tema_idtema) REFERENCES tema (idtema);

--
-- Filtros para la tabla cuestionariotienepregunta
--
ALTER TABLE cuestionariotienepregunta
  ADD CONSTRAINT cuestionariotienepregunta_cuestionario_fk FOREIGN KEY (cuestionario_idcuestionario) REFERENCES cuestionario (idcuestionario),
  ADD CONSTRAINT cuestionariotienepregunta_pregunta_fk FOREIGN KEY (pregunta_idpregunta) REFERENCES pregunta (idpregunta);

--
-- Filtros para la tabla curso
--
ALTER TABLE curso
  ADD CONSTRAINT curso_profesor_fk FOREIGN KEY (profesor_idprofesor) REFERENCES profesor (idprofesor);

--
-- Filtros para la tabla habito
--
ALTER TABLE habito
  ADD CONSTRAINT habito_profesor_fk FOREIGN KEY (profesor_idprofesor) REFERENCES profesor (idprofesor);

--
-- Filtros para la tabla respuesta
--
ALTER TABLE respuesta
  ADD CONSTRAINT fk_respuesta_pregunta1 FOREIGN KEY (pregunta_idpregunta) REFERENCES pregunta (idpregunta) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla tema
--
ALTER TABLE tema
  ADD CONSTRAINT tema_profesor_fk FOREIGN KEY (profesor_idprofesor) REFERENCES profesor (idprofesor),
  ADD CONSTRAINT tema_curso_fk FOREIGN KEY (curso_idcurso) REFERENCES curso (idcurso);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
