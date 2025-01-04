﻿
#Область ОбработчикиСобытий
 
Процедура ОбработкаПроведения(Отказ, РежимПроведения)
	
	// Создание движений в регистре накопления ТоварыКПередаче
	Движения.ТоварыКПередаче.Записывать = Истина;
	Для каждого СтрокаТовары Из Товары Цикл

		Движение = Движения.ТоварыКПередаче.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
		Движение.Период = Дата;
		Движение.Товар = СтрокаТовары.Товар;
		Движение.Заказ = Ссылка;
		Движение.Количество = СтрокаТовары.Количество;

	КонецЦикла;
	
КонецПроцедуры

#КонецОбласти
