
&НаСервере
Процедура СтанцияПриИзмененииНаСервере()
	Объект.ТоварыДляПеремещения.Очистить();
	
		//{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	Номенклатура.Ссылка КАК Ссылка
		|ИЗ
		|	РегистрСведений.СостояниеНоменклатуры.СрезПоследних(&Период,) КАК СостояниеНоменклатурыСрезПоследних
		|		ЛЕВОЕ СОЕДИНЕНИЕ Справочник.Номенклатура КАК Номенклатура
		|		ПО СостояниеНоменклатурыСрезПоследних.Товар = Номенклатура.Ссылка
		|ГДЕ
		|	СостояниеНоменклатурыСрезПоследних.Станция = &Станция";

	Запрос.УстановитьПараметр("Период", Объект.Дата);	
	Запрос.УстановитьПараметр("Станция", Объект.Станция);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
	
	Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
		НовСтр = Объект.ТоварыДляПеремещения.Добавить();
		НовСтр.ТоварНаСтанции = ВыборкаДетальныеЗаписи.Ссылка;
	КонецЦикла;
	
	//}}КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА

КонецПроцедуры

&НаКлиенте
Процедура СтанцияПриИзменении(Элемент)
	СтанцияПриИзмененииНаСервере();
КонецПроцедуры
