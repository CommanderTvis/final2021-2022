// @strict-types
&НаКлиенте
Процедура ИнициаторПриИзменении(Элемент)
	ОбновитьФИОИнициатора();
КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	ОбновитьФИОИнициатора();
КонецПроцедуры

&НаСервере
Процедура ОбновитьФИОИнициатора()
	Если ЗначениеЗаполнено(Объект.Инициатор) Тогда
		Если ТипЗнч(Объект.Инициатор) = Тип("СправочникСсылка.Клиенты") Тогда
			ФИОИнициатора = Объект.Инициатор.ФИО;
		Иначе
			ФИОИнициатора = Объект.Инициатор.Наименование;
		КонецЕсли;
	КонецЕсли;
КонецПроцедуры