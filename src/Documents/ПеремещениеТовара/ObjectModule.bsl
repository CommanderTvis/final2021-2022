// @strict-types

Процедура ОбработкаПроведения(Отказ, РежимПроведения)
	ТоварОбъект = Товар.ПолучитьОбъект();
	Если Не ЗначениеЗаполнено(ТоварОбъект) Или ТоварОбъект.Заблокирован() Тогда
		Отказ = Истина;
		Возврат;
	КонецЕсли;
	ТоварОбъект.Станция = Станция;
КонецПроцедуры