﻿
&ИзменениеИКонтроль("ОбработкаПроведения")
Процедура ОП_ОбработкаПроведения(Отказ, РежимПроведения)
	
#Вставка
	ВремяНачалаЗамера = ОценкаПроизводительности.НачатьЗамерВремени();
#КонецВставки

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
	
#Вставка
	ОценкаПроизводительности.ЗакончитьЗамерВремени("Заказ.Проведение", ВремяНачалаЗамера, Товары.Количество(), "Вес по табличной части ""Товары""");
#КонецВставки
	
КонецПроцедуры
