Процедура ОбработкаПроведения(Отказ, РежимПроведения)
	КлиентОбъект = Клиент.ПолучитьОбъект();
	Если КлиентОбъект = Неопределено Или КлиентОбъект.Заблокирован() Тогда
		СообщенияКлиентСервер.СообщитьСоСвойствами("Клиент отсутствует или заблокирован.", "Клиент", ЭтотОбъект);
		Отказ = Истина;
		Возврат;
	КонецЕсли;
	КлиентОбъект.Фамилия = Фамилия;
	КлиентОбъект.Имя = Имя;
	КлиентОбъект.Отчество = Отчество;
	КлиентОбъект.Пол = Пол;
	КлиентОбъект.ДопНомерТелефона = РезервныйТелефон;
	КлиентОбъект.ДопЭлектроннаяПочта = РезервнаяПочта;	
	КлиентОбъект.Адрес = Адрес;
	КлиентОбъект.Статус = Справочники.Статусы.Обычный;
	КлиентОбъект.НомерПаспорта = НомерПаспорта;
	КлиентОбъект.Серия = Серия;
	КлиентОбъект.КемВыдан = КемВыдан;
	КлиентОбъект.КогдаВыдан = ДатаВыдачи;
	КлиентОбъект.КодПодразделения = КодПодразделения;
	КлиентОбъект.ДатаРождения = ДатаРождения;
	КлиентОбъект.Записать();
КонецПроцедуры