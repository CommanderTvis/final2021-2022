//@strict-types

// Основной адрес электронной почты, использующейся для отправки писем этим модулем
// Возвращаемое значение:
//   Строка - адрес электронной почты. Не длиннее 320 символов.
//
Функция ОсновнойАдресПочты() Экспорт
	Возврат "academons@mail.ru";
КонецФункции

// Простая отправка письма с основного адреса.
// 
// Параметры:
//   Кому - Строка - Электронный адрес получателя. Не длиннее 320 символов.
//   Тема - Строка - Тема письма.
//   Текст - Строка - Единственный текст письма.
//   Вложение - ДвоичныеДанные, Неопределено - Единственное вложение письма.
//   ИмяВложения - Строка, Неопределено - Наименование единственного вложения письма.
//
Процедура ПростаяОтправкаПисьма(Кому, Тема, Текст, Вложение, ИмяВложения) Экспорт
	Профиль = Новый ИнтернетПочтовыйПрофиль;
	Профиль.АдресСервераSMTP = "smtp.mail.ru";
	Профиль.АдресСервераPOP3 = "pop.mail.ru";
	Профиль.ПортPOP3 = 995;
	Профиль.ПортSMTP = 465;
	Профиль.Пользователь = ОсновнойАдресПочты();
	Профиль.Пароль = "q3UAmq1pGvW5EYatgB30";
	Профиль.ПользовательSMTP = Профиль.Пользователь;
	Профиль.ПарольSMTP = Профиль.Пароль;
	Профиль.ИспользоватьSSLPOP3 = Истина;
	Профиль.ИспользоватьSSLSMTP = Истина;
	Профиль.АутентификацияSMTP = СпособSMTPАутентификации.Login;
	Почта = Новый ИнтернетПочта;

	Письмо = Новый ИнтернетПочтовоеСообщение;
	ТекстСообщения = Письмо.Тексты.Добавить(Текст);
	ТекстСообщения.ТипТекста = ТипТекстаПочтовогоСообщения.ПростойТекст;
	Письмо.Тема = Тема;
	Письмо.Отправитель = "academons@mail.ru";
	Письмо.ИмяОтправителя = "017";
	Письмо.Получатели.Добавить(Кому);
	Если Вложение <> Неопределено Тогда
		Если ИмяВложения <> Неопределено Тогда
			Письмо.Вложения.Добавить(Вложение, ИмяВложения);
		Иначе
			Письмо.Вложения.Добавить(Вложение);
		КонецЕсли;
	КонецЕсли;
	Почта.Подключиться(Профиль);

	Почта.Послать(Письмо);
	Почта.Отключиться();
КонецПроцедуры