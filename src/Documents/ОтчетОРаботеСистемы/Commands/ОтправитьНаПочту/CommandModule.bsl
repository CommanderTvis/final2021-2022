// @strict-types
#Если Не ВебКлиент Тогда
// Обработчик команды печати.
//
// Параметры:
//	ПараметрКоманды - Произвольный - содержит ссылку на объект, для которого вызвана команда печати.
//	ПараметрыВыполненияКоманды - ПараметрыВыполненияКоманды - параметры выполнения команды.
&НаКлиенте
Асинх Процедура ОбработкаКоманды(ПараметрКоманды, ПараметрыВыполненияКоманды)
	Отправить(ПараметрКоманды);
КонецПроцедуры

// Параметры:
//	 ТабДок - ТабличныйДокумент - табличный документ для заполнения и печати.
&НаСервере
Процедура Отправить(ПараметрКоманды)
	ТабДок = Новый ТабличныйДокумент;
	Документы.ОтчетОРаботеСистемы.Печать(ТабДок, ПараметрКоманды);

	ТабДок.ОтображатьСетку = Ложь;
	ТабДок.Защита = Ложь;
	ТабДок.ТолькоПросмотр = Ложь;
	ТабДок.ОтображатьЗаголовки = Ложь;
	ТабДок.Защита=Истина;
	Поток = Новый ПотокВПамяти;
	ТабДок.Записать(Поток, ТипФайлаТабличногоДокумента.PDF, );
	Сотрудник = ПользователиВызовСервера.ТекущийСотрудник();
	
	ПосылкаПочтыВызовСервера.ПростаяОтправкаПисьма(Сотрудник.ЭлектроннаяПочта, "Отчет о работе системы",
		"Добрый день, " + Сотрудник.Наименование + "!
												   |Сегодня, " + Формат(ТекущаяДатаСеанса(),
		"ДФ='d MMMM yyyy ''года'''") + ",
									   |вы запросили отчет о работе системы на сегодняшнее число.
									   |Во вложении письмо в формате .pdf.", Поток.ЗакрытьИПолучитьДвоичныеДанные(), "отчет.pdf");
КонецПроцедуры

#КонецЕсли