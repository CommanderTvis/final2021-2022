// Простая отправка письма с основного адреса асинхронно.
// 
// Параметры:
//   Кому - Строка - Электронный адрес получателя. Не длиннее 320 символов.
//   Тема - Строка - Тема письма.
//   Текст - Строка - Единственный текст письма.
//   Вложение - ДвоичныеДанные, Неопределено - Единственное вложение письма.
//   ИмяВложения - Строка, Неопределено - Наименование единственного вложения письма.
//
Асинх Процедура ПростаяОтправкаПисьмаАсинх(Кому, Тема, Текст, Вложение, ИмяВложения) Экспорт
	ПосылкаПочтыВызовСервера.ПростаяОтправкаПисьма(Кому, Тема, Текст, Вложение, ИмяВложения);
КонецПроцедуры