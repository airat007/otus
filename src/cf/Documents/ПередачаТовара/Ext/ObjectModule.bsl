﻿ 
#Область ОбработчикиСобытий
 
Процедура ОбработкаЗаполнения(ДанныеЗаполнения, ТекстЗаполнения, СтандартнаяОбработка)
	
	Если ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.Заказ") Тогда
		
		ЗаполнитьЗначенияСвойств(ЭтотОбъект, ДанныеЗаполнения); 
		Заказ = ДанныеЗаполнения;
		
		Для каждого СтрокаТовары Из ДанныеЗаполнения.Товары Цикл
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
	
КонецПроцедуры

#КонецОбласти
