INSERT INTO Doc_type(doc_code, doc_name)
VALUES (07, 'Военный билет');
INSERT INTO Doc_type(doc_code, doc_name)
VALUES (08, 'Временное удостоверение, выданное взамен военного билета');
INSERT INTO Doc_type(doc_code, doc_name)
VALUES (10, 'Паспорт иностранного гражданина');
INSERT INTO Doc_type (doc_code, doc_name)
VALUES (21, 'Паспорт гражданина Российской Федерации');
INSERT INTO Doc_type (doc_code, doc_name)
VALUES (91, 'Иные документы');

INSERT INTO Citizenship (country_code, country_name)
VALUES (624, 'Республика Гвинея-Бисау');
INSERT INTO Citizenship (country_code, country_name)
VALUES (626, 'Демократическая Республика Тимор-Лесте');
INSERT INTO Citizenship (country_code, country_name)
VALUES (634, 'Государство Катар');
INSERT INTO Citizenship (country_code, country_name)
VALUES (643, 'Российская Федерация');
INSERT INTO Citizenship (country_code, country_name)
VALUES (646, 'Руандийская Республика');

INSERT INTO Doc (id, version, number, date, code)
VALUES (1, 0, 123456789, 1965 - 12 - 31, 10);
INSERT INTO Doc (id, version, number, date, code)
VALUES (2, 0, 123846789, 1988 - 10 - 15, 21);

INSERT INTO Organisation (id, version, name, full_name, inn, kpp, address, phone, isActive)
VALUES (1, 0, 'Рога и Копыта', 'ООО "Рога и копыта"', '1111111111', '123DF54645', 'г. Москва, Красная площадь',
        '89508846124', 1);
INSERT INTO Organisation (id, version, name, full_name, inn, kpp, address, phone, isActive)
VALUES (2, 0, 'Coca-Cola', 'The Coca-Cola Company', '1111111112', '123DF54646', 'г. Атланта',
        '89508866125', 1);

INSERT INTO Office (id, version, org_id, name, phone, isActive)
VALUES (1, 0, 1, 'Main office', '89508866121', 1);

INSERT INTO Office (id, version, org_id, name, phone, isActive)
VALUES (2, 0, 2, 'Main office', '84508866121', 1);

INSERT INTO User (id, version, office_id, first_name, second_name, last_name, position, phone, doc_id, citizenship_code,
                  isIdentified)
VALUES (1, 0, 1, 'Джон', 'Стит', 'Пембертон', 'ген.дир', 89641655416, 1, 624, 1);
INSERT INTO User (id, version, office_id, first_name, second_name, last_name, position, phone, doc_id, citizenship_code,
                  isIdentified)
VALUES (1, 0, 1, 'Петр', '', 'Сидоров', 'менеджер', 89641656849, 2, 643, 1);