Суть проекта netflix - упрощенная модель хранения данных сервиса netflix.

17 таблиц. В основном хранение списков фильмов, сериалов.
Всё начинается с самых простых, редко изменяющихся данных: список стран, кинокомпаний, жанров, всевозможных профессий/позиций в производственном процессе и список типов экранных сущностей (так как это могут не только фильмы, но и, например, сериалы, в базе они называются абстрактно titles).

TITLES
Ключевые характеристики:
Название
Оригинальное название (необязательно)
Дополнительные характеристики:
Тип (фильм, сериал, анимация, короткометражка и тд)
Постер
Теглайн
Синопсис
Дата выхода
Возрастное ограничение
Состав съемочной группы
Компания-производитель (может быть несколько)
Страна (может быть несколько)
Жанр (может быть несколько)
USERS
Пользователи Их регистрационные данные (таблица users):

Username
Email
Номер телефона
Пароль
Дополнительная информация, которую пользователь может предоставить, заполнив свой профиль:


Имя
Фамилия
Дата рождения
Детский режим
Страна


ПОЛЬЗОВАТЕЛИ МОГУТ:

Действия со списками:

Добавлять фильмы в список «Буду смотреть»
Подписываться на конкретный жанр (чтобы получать уведомления о выходе нового триллера, например)

Выражать свое мнение:

Выставлять фильму рейтинг
Лайкать/дизлайкать указанный жанр фильма (ведь часто бывает, что заявленный, например, триллер в фильме так и не наступает)

Для демонстрации работы скриптов с помощью сервиса filldb.info были сформированы абсолютно бессмысленные данные.