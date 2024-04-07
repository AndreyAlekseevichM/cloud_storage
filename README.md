# [Дипломная работа “Облачное хранилище”]

## Описание проекта

REST-сервис предоставляет интерфейс для возможности загрузки файлов и вывода списка уже загруженных файлов пользователя
по [заранее описанной спецификации](CloudServiceSpecification.yaml).

Все запросы к сервису авторизованы.

Заранее подготовленное веб-приложение (FRONT) подключается к разработанному сервису без доработок,
а также использует функционал FRONT для авторизации, загрузки и вывода списка файлов пользователя.

Изначально FRONT доступен на порту 8080, BACKEND - на порту 5050.


## Описание реализации:

- Приложение разработано с использованием Spring Boot;
- Использован сборщик пакетов Maven;
- Использована база данных MySql;
- Использована система управления миграциями Liquibase;
- Для запуска используется docker, docker-compose;
- Код размещен на github;
- Код покрыт unit тестами с использованием mockito;
- Добавлены интеграционные тесты с использованием testcontainers;
- Информация о пользователях сервиса хранится в базе данных;
- Информация о файлах пользователей сервиса хранится в базе данных.


## Запуск приложения

### Запуск FRONT:

1. Установите nodejs (версия не ниже 19.7.0) на компьютер.
2. Скачайте [FRONT](https://github.com/netology-code/jd-homeworks/tree/master/diploma/netology-diplom-frontend) (JavaScript).
3. Перейдите в папку FRONT приложения и все команды для запуска выполняйте из неё.
4. Нужно задать url для вызова своего backend-сервиса. В файле .env FRONT (находится в корне проекта) приложения нужно изменить url до backend, VUE_APP_BASE_URL=http://localhost:5050
5. Следуя описанию README.md FRONT проекта, запустите nodejs-приложение (npm install, npm run serve).
6. FRONT запускается на порту 8080 и доступен по url в браузере http://localhost:8080.

### Запуск BACKEND:

1. Скачать данный проект, выполнить `maven -> clean -> package`;
2. Запустить `docker-compose.yml`.
   Автоматически создадутся все необходимые в базе данных таблицы (с двумя стартовыми пользователями в таблице users).


## Стартовая страница:

Стандартная форма авторизации для ввода логина (почта) и пароля.

Стартовые пользователи:
1.  USERNAME:user@one.user
    PASSWORD:user_one

2. USERNAME:user@two.user
   PASSWORD:user_two

## Страница после авторизации:

После авторизации будут доступны:
1. Добавление файла в облачное хранилище. После нажатия будет предложено выбрать файл для загрузки и загрузить его;
2. Список загруженных файлов. Изначально пуст;
3. Переименование файла. По нажатию будет сгенерировано случайное новое имя, состоящее из трех цифр;
4. Загрузить (скачать) файл с облачного хранилища;
5. Удалить файл;
6. В правом верхнем углу кнопка "Выйти" для выхода из своей учетной записи. По нажатию будет осуществлен автоматический переход на стратовую страницу.


## Примечание

[Интеграционный тест](src/test/java/ru/netology/CloudStorageApplicationTests.java) и
[JPA тесты](src/test/java/ru/netology/repository) (StorageFileRepositoryTest.java, UserRepositoryTest.java)
изначально закомментированы, так как с ними не получится выполнить maven-package.
