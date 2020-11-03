CREATE TABLE IF NOT EXISTS Organisation
(
    id        INTEGER AUTO_INCREMENT,
    version   INTEGER      NOT NULL COMMENT 'Служебное поле hibernate',
    name      VARCHAR(128) NOT NULL,
    full_name VARCHAR(256) NOT NULL,
    inn       VARCHAR(10)  NOT NULL,
    kpp       VARCHAR(10)  NOT NULL,
    address   VARCHAR(128) NOT NULL,
    phone     VARCHAR(11)  NOT NULL,
    isActive  TINYINT(1)   NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Office
(
    id       INTEGER AUTO_INCREMENT,
    version  INTEGER      NOT NULL COMMENT 'Служебное поле hibernate',
    org_id   INTEGER,
    name     VARCHAR(128) NOT NULL,
    phone    VARCHAR(11)  NOT NULL,
    isActive TINYINT(1)   NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_organisation_office FOREIGN KEY (org_id) REFERENCES Organisation (id)
);

CREATE TABLE IF NOT EXISTS User
(
    id               INTEGER AUTO_INCREMENT,
    version          INTEGER      NOT NULL COMMENT 'Служебное поле hibernate',
    office_id        INTEGER,
    first_name       VARCHAR(128) NOT NULL,
    second_name      VARCHAR(128),
    last_name        VARCHAR(128) NOT NULL,
    position         VARCHAR(128) NOT NULL,
    phone            VARCHAR(11),
    doc_id           INTEGER,
    citizenship_code TINYINT,
    isIdentified     TINYINT(1),
    PRIMARY KEY (id),
    CONSTRAINT fk_doc_user FOREIGN KEY (doc_id) REFERENCES Doc (id),
    CONSTRAINT fk_citizenship_user FOREIGN KEY (citizenship_code) REFERENCES Citizenship (country_code)
);

CREATE TABLE IF NOT EXISTS Doc
(
    id      INTEGER AUTO_INCREMENT,
    version INTEGER NOT NULL COMMENT 'Служебное поле hibernate',
    number  INTEGER UNIQUE,
    date    DATE,
    code    TINYINT,
    PRIMARY KEY (id),
    CONSTRAINT fk_docType_doc FOREIGN KEY (code) REFERENCES Doc_type (doc_code)
);

CREATE TABLE IF NOT EXISTS Doc_type
(
    doc_code TINYINT UNIQUE,
    doc_name VARCHAR(256) UNIQUE,
    PRIMARY KEY (doc_code)
);

CREATE TABLE IF NOT EXISTS Citizenship
(
    country_code TINYINT UNIQUE,
    country_name VARCHAR(128) UNIQUE,
    PRIMARY KEY (country_code)
);

CREATE INDEX IX_Organisation_inn ON Organisation (inn);
CREATE INDEX IX_Organisation_name ON Organisation (name);
CREATE INDEX IX_Organisation_isActive ON Organisation (isActive);

CREATE INDEX IX_Office_orgId ON Office (org_id);
CREATE INDEX IX_Office_name ON Office (name);
CREATE INDEX IX_Office_phone ON Office (phone);
CREATE INDEX IX_Office_isActive ON Office (isActive);

CREATE INDEX IX_User_officeId ON User (office_id);
CREATE INDEX IX_User_firstName ON User (first_name);
CREATE INDEX IX_User_secondName ON User (second_name);
CREATE INDEX IX_User_lastName ON User (last_name);
CREATE INDEX IX_User_position ON User (position);
CREATE INDEX IX_User_docId ON User (doc_id);
CREATE INDEX IX_User_citizenshipCode ON User (citizenship_code);

CREATE INDEX IX_Doc_code ON Doc (code);