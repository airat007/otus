﻿///////////////////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2024, ООО 1С-Софт
// Все права защищены. Эта программа и сопроводительные материалы предоставляются 
// в соответствии с условиями лицензии Attribution 4.0 International (CC BY 4.0)
// Текст лицензии доступен по ссылке:
// https://creativecommons.org/licenses/by/4.0/legalcode
///////////////////////////////////////////////////////////////////////////////////////////////////////

#Область ПрограммныйИнтерфейс
 
#Область СериализацияJSON

// Преобразует значение в строку JSON при помощи метода глобального контекста ЗаписатьJSON.
// Допускаются не все типы значений, подробности см. в синтакс-помощнике.
// Даты преобразуются в формат ISO (YYYY-MM-DDThh:mm:ssZ).
// 
// Параметры:
//  Значение - Произвольный
//
// Возвращаемое значение:
//  Строка
//
Функция ЗначениеВJSON(Знач Значение) Экспорт
	
	ЗаписьJSON = Новый ЗаписьJSON;
	ЗаписьJSON.УстановитьСтроку();
	ЗаписатьJSON(ЗаписьJSON, Значение);
	
	Возврат ЗаписьJSON.Закрыть();
	
КонецФункции

// Преобразует строку в формате JSON в значение при помощи метода глобального контекста ПрочитатьJSON.
// См. ограничения в синтакс-помощнике.
// Объекты JSON по умолчанию преобразует в значения типа Соответствие. 
// Имена свойств со значением типа Дата необходимо явно указывать, чтобы было выполнено преобразование.
// Ожидаемый формат дат - ISO (YYYY-MM-DDThh:mm:ssZ).
// 
// Параметры:
//   Строка - Строка - значение в формате JSON.
//   ИменаСвойствСоЗначениямиДата - Строка - имя свойства, содержащее значение типа Дата. Допустимо указывать несколько
//                                           свойств через запятую.
//                                - Массив из Строка 
//   ПрочитатьВСоответствие       - Булево - если Ложь, то объекты JSON будут преобразованы в значение типа Структура.
//   
// Возвращаемое значение:
//  Произвольный
//
Функция JSONВЗначение(Знач Строка, Знач ИменаСвойствСоЗначениямиДата = Неопределено, Знач ПрочитатьВСоответствие = Истина) Экспорт
	
	Если ТипЗнч(ИменаСвойствСоЗначениямиДата) = Тип("Строка") Тогда
		ИменаСвойствСоЗначениямиДата = СтрРазделить(ИменаСвойствСоЗначениямиДата, ", " + Символы.ПС, Ложь);
	КонецЕсли;
	
	ЧтениеJSON = Новый ЧтениеJSON;
	ЧтениеJSON.УстановитьСтроку(Строка);
	
	Возврат ПрочитатьJSON(ЧтениеJSON, ПрочитатьВСоответствие, ИменаСвойствСоЗначениямиДата);
	
КонецФункции

#КонецОбласти
  
#Область Прочее

// Выполняет проверки перед выполнением обработчика регламентного задания и прерывает выполнение,
// если его запуск в данный момент невозможен, например:
//  - еще не завершено обновление программы;
//  - запуск через консоль или другим способом, минуя включение функциональной опции 
//    (если регламентное задание зависит от функциональных опций);
//  - попытка выполнения задания, работающего с внешними ресурсами в копии информационной базы.
//
// Параметры:
//  РегламентноеЗадание - ОбъектМетаданныхРегламентноеЗадание - регламентное задание,
//    из которого вызывается данная процедура.
//
// Пример:
// ОбщегоНазначения.ПриНачалеВыполненияРегламентногоЗадания(Метаданные.РегламентныеЗадания.<ИмяРегламентногоЗадания>);
//
Процедура ПриНачалеВыполненияРегламентногоЗадания(РегламентноеЗадание = Неопределено) Экспорт

КонецПроцедуры

#КонецОбласти

#КонецОбласти
