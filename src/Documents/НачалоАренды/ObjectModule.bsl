//@strict-types


Процедура ОбработкаПроведения(Отказ, РежимПроведения)
	ТоварОбъект = Товар.ПолучитьОбъект();
	ТоварОбъект.Станция = Справочники.Станции.ПустаяСсылка();
	ТоварОбъект.Записать();
КонецПроцедуры
