﻿
&ИзменениеИКонтроль("ОбработкаПроведения")
Процедура ОП_ОбработкаПроведения(Отказ, РежимПроведения)

#Вставка
	ВремяНачалаЗамера = ОценкаПроизводительности.НачатьЗамерВремени();
#КонецВставки

	// Создание движений в регистре накопления ОстаткиТоваров
	Движения.ОстаткиТоваров.Записывать = Истина;
	Для каждого СтрокаТовары Из Товары Цикл

		Движение = Движения.ОстаткиТоваров.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
		Движение.Период = Дата;
		Движение.Товар = СтрокаТовары.Товар;
		Движение.Склад = Склад;
		Движение.Количество = СтрокаТовары.Количество;

	КонецЦикла;

	// Создание движений в регистре накопления ТоварыКПередаче
	Движения.ТоварыКПередаче.Записывать = Истина;
	Для каждого СтрокаТовары Из Товары Цикл

		Движение = Движения.ТоварыКПередаче.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
		Движение.Период = Дата;
		Движение.Товар = СтрокаТовары.Товар;
		Движение.Заказ = Заказ;
		Движение.Количество = СтрокаТовары.Количество;

	КонецЦикла; 
	
	// Создание движений в регистре накопления ТоварыПереданные
	Движения.ТоварыПереданные.Записывать = Истина;
	Для каждого СтрокаТовары Из Товары Цикл

		Движение = Движения.ТоварыПереданные.Добавить();
		Движение.Период = Дата;
		Движение.Контрагент = Контрагент;
		Движение.Товар = СтрокаТовары.Товар;
		Движение.Количество = СтрокаТовары.Количество;

	КонецЦикла;
	
#Вставка
	ОценкаПроизводительности.ЗакончитьЗамерВремени("ПередачаТовара.Проведение", ВремяНачалаЗамера, Товары.Количество(), "Вес по табличной части ""Товары""");
#КонецВставки

КонецПроцедуры
