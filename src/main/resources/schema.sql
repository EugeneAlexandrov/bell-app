CREATE TABLE IF NOT EXISTS Organisation
(
    id        INTEGER AUTO_INCREMENT COMMENT 'Уникальный идентификатор',
    version   INTEGER      NOT NULL COMMENT 'Служебное поле hibernate',
    name      VARCHAR(128) NOT NULL COMMENT 'название организации',
    full_name VARCHAR(256) NOT NULL COMMENT 'полное название организации',
    inn       VARCHAR(10)  NOT NULL COMMENT 'ИНН организации',
    kpp       VARCHAR(10)  NOT NULL COMMENT 'КПП организации',
    address   VARCHAR(128) NOT NULL COMMENT 'адрес',
    phone     VARCHAR(11)  NOT NULL COMMENT 'телефон',
    isActive  TINYINT(1)   NOT NULL COMMENT 'действающая/недействующая организация',
    PRIMARY KEY (id)
);
COMMENT ON TABLE Organisation IS 'Организация';

CREATE TABLE IF NOT EXISTS Office
(
    id       INTEGER AUTO_INCREMENT COMMENT 'Уникальный идентификатор',
    version  INTEGER      NOT NULL COMMENT 'Служебное поле hibernate',
    org_id   INTEGER COMMENT 'внешний ключ на id организации',
    name     VARCHAR(128) NOT NULL COMMENT 'название офиса',
    phone    VARCHAR(11)  NOT NULL COMMENT 'телефон офиса',
    isActive TINYINT(1)   NOT NULL COMMENT 'действающий/недействующий офис',
    PRIMARY KEY (id),
    CONSTRAINT fk_organisation_office FOREIGN KEY (org_id) REFERENCES Organisation (id)
);
COMMENT ON TABLE Office IS 'Офис';

CREATE TABLE IF NOT EXISTS Citizenship
(
    id           INTEGER AUTO_INCREMENT COMMENT 'Уникальный идентификатор',
    country_code TINYINT UNIQUE COMMENT 'код страны',
    country_name VARCHAR(128) UNIQUE COMMENT 'название страны',
    PRIMARY KEY (id)
);
COMMENT ON TABLE Citizenship IS 'Гражданство';

CREATE TABLE IF NOT EXISTS Doc_type
(
    id       INTEGER AUTO_INCREMENT COMMENT 'Уникальный идентификатор',
    doc_code TINYINT UNIQUE COMMENT 'код документа',
    doc_name VARCHAR(256) UNIQUE COMMENT 'название документа',
    PRIMARY KEY (id)
);
COMMENT ON TABLE Doc_type IS 'тип документа';

CREATE TABLE IF NOT EXISTS Doc
(
    id      INTEGER AUTO_INCREMENT COMMENT 'Уникальный идентификатор',
    version INTEGER NOT NULL COMMENT 'Служебное поле hibernate',
    number  VARCHAR(20) UNIQUE COMMENT 'номер документа',
    date    DATE COMMENT 'дата выдачи',
    docType_id    TINYINT COMMENT 'внешний ключ на тип документа',
    PRIMARY KEY (id),
    CONSTRAINT fk_docType_doc FOREIGN KEY (docType_id) REFERENCES Doc_type (id)
);
COMMENT ON TABLE Doc IS 'документ';

CREATE TABLE IF NOT EXISTS User
(
    id               INTEGER AUTO_INCREMENT COMMENT 'Уникальный идентификатор',
    version          INTEGER      NOT NULL COMMENT 'Служебное поле hibernate',
    office_id        INTEGER COMMENT 'принадлежность к офису',
    first_name       VARCHAR(128) NOT NULL COMMENT 'имя',
    second_name      VARCHAR(128) COMMENT 'второе имя',
    last_name        VARCHAR(128) NOT NULL COMMENT 'фамилия',
    position         VARCHAR(128) NOT NULL COMMENT 'должность',
    phone            VARCHAR(11) COMMENT 'телефон сотрудника',
    doc_id           INTEGER UNIQUE COMMENT 'идентификатор документа',
    citizenship_id TINYINT COMMENT 'идентификатор гражданства',
    isIdentified     TINYINT(1) COMMENT 'Уникальный идентификатор',
    PRIMARY KEY (id),
    CONSTRAINT fk_doc_user FOREIGN KEY (doc_id) REFERENCES Doc (id),
    CONSTRAINT fk_citizenship_user FOREIGN KEY (citizenship_id) REFERENCES Citizenship (id)
);
COMMENT ON TABLE User IS 'сотрудник';

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
CREATE INDEX IX_User_citizenshipCode ON User (citizenship_id);

CREATE INDEX IX_Doc_code ON Doc (docType_id);