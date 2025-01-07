﻿ 
#Область ОбработчикиСобытий

Процедура ПриЗаписи(Отказ)
	
	Если ДополнительныеСвойства.РежимЗаписи = РежимЗаписиДокумента.Проведение 
		И (ДополнительныеСвойства.ЭтоНовый 
			ИЛИ Не ДополнительныеСвойства.Проведен) Тогда
		
		МенеджерЗаписи = РегистрыСведений.ОчередьИсходящихСообщенийЗаявок.СоздатьМенеджерЗаписи();
		МенеджерЗаписи.Заявка = Ссылка;
		МенеджерЗаписи.Состояние = Перечисления.СостоянияИсходящихСообщений.Новое; 
		
		МенеджерЗаписи.Записать();

	КонецЕсли;
	
КонецПроцедуры

Процедура ПередЗаписью(Отказ, РежимЗаписи, РежимПроведения)
	
	ДополнительныеСвойства.Вставить("РежимЗаписи", РежимЗаписи);
	ДополнительныеСвойства.Вставить("ЭтоНовый", ЭтоНовый());
	ДополнительныеСвойства.Вставить("Проведен", Ссылка.Проведен);
	
КонецПроцедуры

#КонецОбласти
