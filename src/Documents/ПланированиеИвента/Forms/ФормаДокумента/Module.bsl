// @strict-types

&НаСервере
Процедура ПередЗаписьюНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)
	ОбъектЗначение = ДанныеФормыВЗначение(ИвентОбъект, Тип("СправочникОбъект.Ивенты"));
	Сообщить(ЗначениеВСтрокуВнутр(ОбъектЗначение));
	
	Если Не ЗначениеЗаполнено(ТекущийОбъект.Ивент) Тогда
		ОбъектЗначение.Записать();
		ТекущийОбъект.Ивент = ОбъектЗначение.Ссылка;
	Иначе
		ПолученныйОбъект = ТекущийОбъект.Ивент.ПолучитьОбъект();
		Если ПолученныйОбъект = Неопределено Или ПолученныйОбъект.Заблокирован() Тогда
			СообщенияКлиентСервер.СообщитьСоСвойствами("Выбранный ивент заблокирован.", "Наименование",
				ЭтотОбъект);
			Отказ = Истина;
			Возврат;
		КонецЕсли;
		
		ЗаполнитьЗначенияСвойств(ПолученныйОбъект, ОбъектЗначение);
		ПолученныйОбъект.Записать();
	КонецЕсли;
КонецПроцедуры


&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Если Не Объект.Ивент.Пустая() Тогда
			ПолученныйОбъект = Объект.Ивент.ПолучитьОбъект();
		ЗначениеВДанныеФормы(ПолученныйОбъект,ИвентОбъект);
		Если ПолученныйОбъект = Неопределено Или ПолученныйОбъект.Заблокирован() Тогда
			Отказ = Истина;
			Возврат;
		КонецЕсли;
	КонецЕсли;		
КонецПроцедуры
	