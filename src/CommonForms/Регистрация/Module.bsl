// @strict-types

&НаКлиенте
Процедура Зарегистрироваться(Команда)
	Если Не Ознакомлен Тогда
		СообщенияКлиентСервер.СообщитьСоСвойствами("Необходимо ознакомиться с правилами пользования.", "Ознакомлен",
			ЭтотОбъект);
		Возврат;
	КонецЕсли;

	Если Не СогласиеНаОбработкуПД Тогда
		СообщенияКлиентСервер.СообщитьСоСвойствами("Необходимо дать согласие на обработку данных.", "Ознакомлен",
			ЭтотОбъект);
		Возврат;
	КонецЕсли;

	Если Не ЗначениеЗаполнено(Объект.Пароль) Или Объект.Пароль <> ПарольПодтверждение Тогда
		СообщенияКлиентСервер.СообщитьСоСвойствами("Необходимо указать одинаковые пароль и потверждение.",
			"ПарольПодтверждение", ЭтотОбъект);
		Возврат;
	КонецЕсли;

	Если Не ЗначениеЗаполнено(Объект.ЭлектроннаяПочта) Тогда
		СообщенияКлиентСервер.СообщитьСоСвойствами("Необходимо указать электронную почту.", "Объект.ЭлектроннаяПочта",
			ЭтотОбъект);
		Возврат;
	КонецЕсли;
	Если Не ЗначениеЗаполнено(Объект.НомерТелефона) Тогда
		СообщенияКлиентСервер.СообщитьСоСвойствами("Необходимо указать номер телефона.", "Объект.ЭлектроннаяПочта",
			ЭтотОбъект);
		Возврат;
	КонецЕсли;

	Если Не ЗначениеЗаполнено(Объект.Наименование) Тогда
		СообщенияКлиентСервер.СообщитьСоСвойствами("Необходимо указать наименование.", "Объект.Наименование",
			ЭтотОбъект);
		Возврат;
	КонецЕсли;

	Элементы.ЭлектроннаяПочта.Видимость = Ложь;
	Элементы.Колонки.ПодчиненныеЭлементы.ЛеваяКолонка.ПодчиненныеЭлементы.Наименование.Видимость = Ложь;
	Элементы.Колонки.ПодчиненныеЭлементы.ЛеваяКолонка.ПодчиненныеЭлементы.НомерТелефона.Видимость = Ложь;
	Элементы.Колонки.ПодчиненныеЭлементы.ПраваяКолонка.Видимость = Ложь;
	Элементы.Зарегистрироваться.Видимость = Ложь;
	Элементы.Ознакомлен.Видимость = Ложь;
	Элементы.СогласиеНаОбработкуПД.Видимость = Ложь;
	Элементы.НаУказанную.Видимость = Истина;
	Элементы.КодПодтверждения.Видимость = Истина;
	Элементы.ИзменитьПочту.Видимость = Истина;
	ОтправитьКод();
КонецПроцедуры

&НаКлиенте
Процедура ИзменитьПочту(Команда)
	Элементы.ЭлектроннаяПочта.Видимость = Истина;
	Элементы.ВыслатьКодПовторно.Видимость = Ложь;
КонецПроцедуры

&НаКлиенте
Процедура ВыслатьКодПовторно(Команда)
	ВыслатьКодПовторноНаСервере();
КонецПроцедуры

&НаСервере
Процедура ВыслатьКодПовторноНаСервере()
	ОтправитьКод();
КонецПроцедуры

&НаСервере
Процедура ПередЗаписьюНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)
	ТекущийОбъект.Статус = Справочники.Статусы.Новый;
КонецПроцедуры


&НаСервере
Процедура ОтправитьКод()
	ГСЧ = Новый ГенераторСлучайныхЧисел(ТекущаяУниверсальнаяДатаВМиллисекундах());

	ПравильныйКод = Формат(ГСЧ.СлучайноеЧисло(1111, 9999), "ЧГ=") + "-" + Формат(ГСЧ.СлучайноеЧисло(1111, 9999), "ЧГ=");
	ПосылкаПочтыВызовСервера.ПростаяОтправкаПисьма(Объект.ЭлектроннаяПочта,
		"Подтверждение регистрации в приложении “Аренда от КОТЭ”", "Вы получили это письмо, т.к. Ваш E-mail "
		+ Объект.ЭлектроннаяПочта + " был указан при регистрации в нашем
									|приложении.
									|Для подтверждения укажите этот код в приложении - " + ПравильныйКод + ".
																										   |В случае, если Вы получили письмо по ошибке, просто проигнорируйте его.
																										   |Ваш КОТЭ.",
		, );
КонецПроцедуры

&НаКлиенте
Асинх Процедура КодПодтвержденияПриИзменении(Элемент)
	Если КодПодтвержденияПриИзмененииНаСервере() Тогда
#Если Не ВебКлиент Тогда
		Ждать ПредупреждениеАсинх("Регистрация окончена. Далее вы можете войти в систему, введя выбранный пароль.");
#Иначе
#КонецЕсли
		ПрекратитьРаботуСистемы(Истина, "/N " + Объект.Наименование);
	КонецЕсли
	;
КонецПроцедуры

&НаСервере
Функция КодПодтвержденияПриИзмененииНаСервере()
	Если ПравильныйКод = КодПотверждения Тогда
		Записать();
		Возврат Истина;
	Иначе
		Элементы.Неверный.Видимость = Истина;
		Элементы.ВыслатьКодПовторно.Видимость = Ложь;
		Возврат Ложь;
	КонецЕсли;
КонецФункции