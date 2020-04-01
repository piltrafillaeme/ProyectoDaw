-- ENTIDADES
-- TABLA ALUMNA:

CREATE TABLE alumna (
    idalumna         INTEGER NOT NULL,
    nombrealumna     TEXT,
    passwordalumna   TEXT,
    profesor_idprofesor   INTEGER NOT NULL,
    curso_idcurso         INTEGER NOT NULL
);

ALTER TABLE alumna ADD CONSTRAINT alumna_pk PRIMARY KEY ( idalumna );

-- TABLA CUESTIONARIO:

CREATE TABLE cuestionario (
    idcuestionario       INTEGER NOT NULL,
    nombrecuestionario   TEXT,
    profesor_idprofesor   INTEGER NOT NULL,
    tema_idtema           INTEGER NOT NULL
);

ALTER TABLE cuestionario ADD CONSTRAINT cuestionario_pk PRIMARY KEY ( idcuestionario );

-- TABLA CURSO:

CREATE TABLE curso (
    idcurso       INTEGER NOT NULL,
    nombrecurso   TEXT,
    profesor_idprofesor   INTEGER NOT NULL
);

ALTER TABLE curso ADD CONSTRAINT curso_pk PRIMARY KEY ( idcurso );

-- TABLA PREGUNTA:

CREATE TABLE pregunta (
    idpregunta          INTEGER NOT NULL,
    enunciadopregunta   TEXT
);

ALTER TABLE pregunta ADD CONSTRAINT pregunta_pk PRIMARY KEY ( idpregunta );

-- TABLA HABITO:

CREATE TABLE habito (
    idhabito       INTEGER NOT NULL,
    nombrehabito   TEXT,
    profesor_idprofesor   INTEGER NOT NULL
);

ALTER TABLE habito ADD CONSTRAINT habito_pk PRIMARY KEY ( idhabito );

-- TABLA PROFESOR:

CREATE TABLE profesor (
    idprofesor         INTEGER NOT NULL,
    nombreprofesor     TEXT,
    passwordprofesor   TEXT
);

ALTER TABLE profesor ADD CONSTRAINT profesor_pk PRIMARY KEY ( idprofesor );

-- TABLA RESPUESTA:

CREATE TABLE respuesta (
    idrespuesta          INTEGER NOT NULL,
    enunciadorespuesta   TEXT
    -- respuestacorrecta    INTEGER
);

ALTER TABLE respuesta ADD CONSTRAINT respuesta_pk PRIMARY KEY ( idrespuesta );

-- TABLA TEMA:
CREATE TABLE tema (
    idtema       INTEGER NOT NULL,
    nombretema   TEXT,
    profesor_idprofesor   INTEGER NOT NULL
);

ALTER TABLE tema ADD CONSTRAINT tema_pk PRIMARY KEY ( idtema );

-- RELACIONES

CREATE TABLE alumnarealizacuestionario (
    alumna_idalumna               INTEGER NOT NULL,
    cuestionario_idcuestionario   INTEGER NOT NULL,
    nota FLOAT
);

ALTER TABLE alumnarealizacuestionario ADD CONSTRAINT alumnarealizacuestionario_pk PRIMARY KEY ( alumna_idalumna,
                                                            cuestionario_idcuestionario );

CREATE TABLE alumnaregistrahabito (
    alumna_idalumna   INTEGER NOT NULL,
    habito_idhabito   INTEGER NOT NULL,
    fecharegistro DATE NOT NULL
);

ALTER TABLE alumnaregistrahabito ADD CONSTRAINT alumnaregistrahabito_pk PRIMARY KEY ( alumna_idalumna,
                                                              habito_idhabito );

CREATE TABLE cuestionariotienepregunta (
    cuestionario_idcuestionario   INTEGER NOT NULL,
    pregunta_idpregunta           INTEGER NOT NULL
);

ALTER TABLE cuestionariotienepregunta ADD CONSTRAINT cuestionariotienepregunta_pk PRIMARY KEY ( cuestionario_idcuestionario,
                                                            pregunta_idpregunta );

CREATE TABLE preguntatienerespuesta (
    pregunta_idpregunta      INTEGER NOT NULL,
    respuesta_idrespuesta   INTEGER NOT NULL,
    respuestacorrecta        INTEGER NOT NULL
);

ALTER TABLE preguntatienerespuesta ADD CONSTRAINT preguntatienerespuesta_pk PRIMARY KEY ( pregunta_idpregunta,
                                                            respuesta_idrespuesta );

-- CLAVES FORÁNEAS:

ALTER TABLE alumna
    ADD CONSTRAINT alumna_curso_fk FOREIGN KEY ( curso_idcurso )
        REFERENCES curso ( idcurso );

ALTER TABLE alumna
    ADD CONSTRAINT alumna_profesor_fk FOREIGN KEY ( profesor_idprofesor )
        REFERENCES profesor ( idprofesor );


ALTER TABLE cuestionario
    ADD CONSTRAINT cuestionario_profesor_fk FOREIGN KEY ( profesor_idprofesor )
        REFERENCES profesor ( idprofesor );

ALTER TABLE cuestionario
    ADD CONSTRAINT cuestionario_tema_fk FOREIGN KEY ( tema_idtema )
        REFERENCES tema ( idtema );

ALTER TABLE curso
    ADD CONSTRAINT curso_profesor_fk FOREIGN KEY ( profesor_idprofesor )
        REFERENCES profesor ( idprofesor );

ALTER TABLE habito
    ADD CONSTRAINT habito_profesor_fk FOREIGN KEY ( profesor_idprofesor )
        REFERENCES profesor ( idprofesor );

ALTER TABLE alumnarealizacuestionario
    ADD CONSTRAINT alumnarealizacuestionario_alumna_fk FOREIGN KEY ( alumna_idalumna )
        REFERENCES alumna ( idalumna );

ALTER TABLE alumnarealizacuestionario
    ADD CONSTRAINT alumnarealizacuestionario_cuestionario_fk FOREIGN KEY ( cuestionario_idcuestionario )
        REFERENCES cuestionario ( idcuestionario );

ALTER TABLE alumnaregistrahabito
    ADD CONSTRAINT alumnaregistrahabito_alumna_fk FOREIGN KEY ( alumna_idalumna )
        REFERENCES alumna ( idalumna );

ALTER TABLE alumnaregistrahabito
    ADD CONSTRAINT alumnaregistrahabito_habito_fk FOREIGN KEY ( habito_idhabito )
        REFERENCES habito ( idhabito );

ALTER TABLE tema
    ADD CONSTRAINT tema_profesor_fk FOREIGN KEY ( profesor_idprofesor )
        REFERENCES profesor ( idprofesor );

ALTER TABLE cuestionariotienepregunta
    ADD CONSTRAINT cuestionariotienepregunta_cuestionario_fk FOREIGN KEY ( cuestionario_idcuestionario )
        REFERENCES cuestionario ( idcuestionario );

ALTER TABLE cuestionariotienepregunta
    ADD CONSTRAINT cuestionariotienepregunta_pregunta_fk FOREIGN KEY ( pregunta_idpregunta )
        REFERENCES pregunta ( idpregunta );

ALTER TABLE preguntatienerespuesta
    ADD CONSTRAINT preguntatienerespuesta_pregunta_fk FOREIGN KEY ( pregunta_idpregunta )
        REFERENCES pregunta ( idpregunta );

ALTER TABLE preguntatienerespuesta
    ADD CONSTRAINT preguntatienerespuesta_respuesta_fk FOREIGN KEY ( respuesta_idrespuesta )
        REFERENCES respuesta ( idrespuesta );
