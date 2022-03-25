// @strict-types
#Если Не ВебКлиент Тогда
&НаКлиенте
Асинх Процедура ИзменитьПароль(Команда)
	Текст = Ждать ВвестиСтрокуАсинх(Объект.Пароль,"Введите новый пароль",,Ложь);
	Если ЗначениеЗаполнено(Текст) Тогда
		Объект.Пароль = Текст;
	КонецЕсли;
	Записать();
КонецПроцедуры


&НаКлиенте
Асинх Процедура ИзменитьДанные(Команда)
	Элементы.НомерТелефона.ТолькоПросмотр = Ложь;
	Элементы.ДопНомерТелефона.ТолькоПросмотр = Ложь;
	Элементы.ЭлектроннаяПочта.ТолькоПросмотр = Ложь;
	Элементы.ДопЭлектроннаяПочта.ТолькоПросмотр = Ложь;
	Элементы.Адрес.ТолькоПросмотр = Ложь;
	Элементы.Записать.Видимость = Истина;
КонецПроцедуры


&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
		АрендуетВДанныйМомент.Параметры.УстановитьЗначениеПараметра("Арендатор", Объект.Ссылка);
КонецПроцедуры

#КонецЕсли