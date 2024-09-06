
CREATE TABLE email (
  id SERIAL PRIMARY KEY,
  email VARCHAR(255) NOT NULL
);

-- Создание таблицы phone
CREATE TABLE phone (
  id SERIAL PRIMARY KEY,
  phone VARCHAR(255) NOT NULL
);

-- Вставка начальных данных в таблицу email
INSERT INTO email (email) VALUES ('123@example.com');

-- Вставка начальных данных в таблицу phone_number
INSERT INTO phone (phone) VALUES ('+1234567890');
