﻿ 
#Область ОбработчикиСобытий
 
Процедура ОбработкаЗаполнения(ДанныеЗаполнения, ТекстЗаполнения, СтандартнаяОбработка)
	
	Если ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.Заказ") Тогда
		
		ЗаполнитьЗначенияСвойств(ЭтотОбъект, ДанныеЗаполнения); 
		Заказ = ДанныеЗаполнения;
		
		ТоварыКПередаче = ТоварыКПередаче(Заказ);
		
		Для каждого СтрокаТовары Из ТоварыКПередаче Цикл
			НоваяСтрока = Товары.Добавить();
			ЗаполнитьЗначенияСвойств(НоваяСтрока, СтрокаТовары); 
		КонецЦикла;			
		
	КонецЕсли;
	
КонецПроцедуры       

Процедура ОбработкаПроведения(Отказ, РежимПроведения)
	
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
	
КонецПроцедуры

#КонецОбласти

#Область ПрочиеПроцедурыИФункции

Функция ТоварыКПередаче(Заказ)
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
	"ВЫБРАТЬ
	|	ТоварыКПередачеОстатки.Товар КАК Товар,
	|	ТоварыКПередачеОстатки.КоличествоОстаток КАК Количество
	|ИЗ
	|	РегистрНакопления.ТоварыКПередаче.Остатки(, Заказ = &Заказ) КАК ТоварыКПередачеОстатки";
	
	Запрос.УстановитьПараметр("Заказ", Заказ);
	ТоварыКПередаче = Запрос.Выполнить().Выгрузить();
	
    Возврат ТоварыКПередаче;
	
КонецФункции	

#КонецОбласти
