

Процедура ЗаписьЗаказаПоставщикуПриЗаписи(Источник, Отказ) Экспорт
	
	ДатаНачала = НачалоНедели(Источник.Дата);
	ДатаОкончания = КонецНедели(Источник.Дата);
	
	Запрос = Новый Запрос;
	Запрос.Текст =
		"ВЫБРАТЬ
		|	СУММА(1) КАК Поле1
		|ИЗ
		|	Документ.ЗаказыПоставщикам КАК ЗаказыПоставщикам
		|ГДЕ
		|	ЗаказыПоставщикам.Поставщик = &Поставщик
		|	И ЗаказыПоставщикам.Дата МЕЖДУ &ДатаНачала И &ДатаОкончания";
	
	Запрос.УстановитьПараметр("ДатаОкончания", 	ДатаОкончания);
	Запрос.УстановитьПараметр("ДатаНачала", 	ДатаНачала);
	Запрос.УстановитьПараметр("Поставщик", 		Источник.Поставщик);
	
	РезультатЗапроса = Запрос.Выполнить();
	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
	
	ВыборкаДетальныеЗаписи.Следующий();
	Сообщить("Всего заказов за эту неделю от этого поставщика " + ВыборкаДетальныеЗаписи.Поле1);
	
КонецПроцедуры
