// @strict-types

&НаКлиенте
Процедура ТоварИлиНаименованиеПриИзменении(Элемент)
	Если ТипЗнч(ТоварИлиНаименование) = Тип("СправочникСсылка.Номенклатура") Тогда
		Если Не ТоварИлиНаименование.Пустая() Тогда
			ЗаписатьТоварИлиНаименованиеВОбъект();
		КонецЕсли;
	Иначе
		ЗаписатьНовыйОбъект();
	КонецЕсли;
КонецПроцедуры

&НаСервере
Процедура ЗаписатьТоварИлиНаименованиеВОбъект()
	ПолученныйОбъект = ТоварИлиНаименование.ПолучитьОбъект();
	Если ПолученныйОбъект = Неопределено Или ПолученныйОбъект.Заблокирован() Тогда
		СообщенияКлиентСервер.СообщитьСоСвойствами("Выбранный товар заблокирован.", "ТоварИлиНаименование", ЭтотОбъект);
		Возврат;
	КонецЕсли;
	ЗначениеВДанныеФормы(ПолученныйОбъект, ТоварОбъект);
КонецПроцедуры

&НаСервере
Процедура ЗаписатьНовыйОбъект()
	ПолученныйОбъект = ДанныеФормыВЗначение(ТоварОбъект, Тип("СправочникОбъект.Номенклатура")); // СправочникОбъект -
	Если ПолученныйОбъект.ЭтоНовый() Тогда
		Возврат;
	КонецЕсли;
	ПолученныйОбъект = Справочники.Номенклатура.СоздатьЭлемент();
	ЗначениеВДанныеФормы(ПолученныйОбъект, ТоварОбъект);
КонецПроцедуры

&НаСервере
Процедура ПередЗаписьюНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)
	Если ТипЗнч(ТоварИлиНаименование) = Тип("Строка") Тогда
		ТоварОбъект.Наименование = ТоварИлиНаименование;
	КонецЕсли;

	ОбъектЗначение = ДанныеФормыВЗначение(ТоварОбъект, Тип("СправочникОбъект.Номенклатура")); // СправочникОбъект.Номенклатура -
	Если Не ЗначениеЗаполнено(ТекущийОбъект.Товар) Тогда
		ОбъектЗначение.Записать();
		ТекущийОбъект.Товар = ОбъектЗначение.Ссылка;
	Иначе
		ПолученныйОбъект = ТекущийОбъект.Товар.ПолучитьОбъект();
		Если ПолученныйОбъект = Неопределено Или ПолученныйОбъект.Заблокирован() Тогда
			СообщенияКлиентСервер.СообщитьСоСвойствами("Выбранный товар заблокирован.", "ТоварИлиНаименование",
				ЭтотОбъект);
			Отказ = Истина;
			Возврат;
		КонецЕсли;
		ЗаполнитьЗначенияСвойств(ПолученныйОбъект, ОбъектЗначение,,"Родитель,Владелец");
		ПолученныйОбъект.Записать();
	КонецЕсли;
КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Если ЗначениеЗаполнено(Объект.Товар) Тогда
		ТоварИлиНаименование = Объект.Товар;
		ЗаписатьТоварИлиНаименованиеВОбъект();
	КонецЕсли;
КонецПроцедуры