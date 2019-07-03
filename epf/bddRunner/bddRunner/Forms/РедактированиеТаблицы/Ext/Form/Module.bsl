﻿
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	ЗагрузитьТаблицуСервер()
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура ПометитьВсе(Команда)
	
	Ном = 0;
	Для Каждого Элем Из СписокКолонок Цикл
		Ном          = Ном + 1;
		Элем.Пометка = Истина;
		Элементы["ТаблицаНаФорме_Колонка" + XMLСтрока(Ном)].Видимость = Элем.Пометка;
	КонецЦикла;
	
КонецПроцедуры

&НаКлиенте
Процедура СнятьВсе(Команда)
	
	Ном = 0;
	Для Каждого Элем Из СписокКолонок Цикл
		Ном          = Ном + 1;
		Элем.Пометка = Ложь;
		Элементы["ТаблицаНаФорме_Колонка" + XMLСтрока(Ном)].Видимость = Элем.Пометка;
	КонецЦикла;
	
КонецПроцедуры

&НаКлиенте
Процедура ОК(Команда)
	
	МассивСтрок = ПолучитьМассивСтрокПослеРедактирования();
	Оповестить("РедактированиеТаблицыGherkin",МассивСтрок);
	Закрыть();
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура СписокКолонокПометкаПриИзменении(Элемент)
	
	Значение      = Элемент.Родитель.ТекущиеДанные.Значение;
	ЭлементСписка = СписокКолонок.НайтиПоЗначению(Значение);
	
	ИД = СписокКолонок.Индекс(ЭлементСписка);
	
	Элементы["ТаблицаНаФорме_Колонка" + XMLСтрока(ИД + 1)].Видимость = Элемент.Родитель.ТекущиеДанные.Пометка;
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаСервере
Функция ПолучитьМассивСтрокПослеРедактирования()
	
	Таблица = РеквизитФормыВЗначение("ТаблицаНаФорме");
	
	Массив = Новый Массив;
	
	Для НомерСтроки = 0 По Таблица.Количество()-1 Цикл
		Стр = "| ";
		Для Ккк = 0 По СписокКолонок.Количество()-1 Цикл
			Если НЕ СписокКолонок[Ккк].Пометка Тогда
				Продолжить;
			КонецЕсли;	 
			
			Стр = Стр + Таблица[НомерСтроки][Ккк] + "|";
		КонецЦикла;
		
		Массив.Добавить(Стр);
	КонецЦикла;	
	
	Возврат Массив;
	
КонецФункции	

&НаСервереБезКонтекста
Функция РазложитьСтрокуВМассивПодстрок(Знач Строка, Знач Разделитель = ",", Знач ПропускатьПустыеСтроки = Неопределено) Экспорт
	
	Результат = Новый Массив;
	
	// для обеспечения обратной совместимости
	Если ПропускатьПустыеСтроки = Неопределено Тогда
		ПропускатьПустыеСтроки = ?(Разделитель = " ", Истина, Ложь);
		Если ПустаяСтрока(Строка) Тогда 
			Если Разделитель = " " Тогда
				Результат.Добавить("");
			КонецЕсли;
			Возврат Результат;
		КонецЕсли;
	КонецЕсли;
		
	Позиция = Найти(Строка, Разделитель);
	Пока Позиция > 0 Цикл
		Подстрока = Лев(Строка, Позиция - 1);
		Если Не ПропускатьПустыеСтроки Или Не ПустаяСтрока(Подстрока) Тогда
			Результат.Добавить(Подстрока);
		КонецЕсли;
		Строка = Сред(Строка, Позиция + СтрДлина(Разделитель));
		Позиция = Найти(Строка, Разделитель);
	КонецЦикла;
	
	Если Не ПропускатьПустыеСтроки Или Не ПустаяСтрока(Строка) Тогда
		Результат.Добавить(Строка);
	КонецЕсли;
	
	Возврат Результат;
	
КонецФункции 

&НаСервере
Процедура ЗагрузитьМассивСтрокВТаблицу(Таблица,МассивСтрок)
	
	Таблица.Очистить();
	Таблица.Колонки.Очистить();
	
	Для Каждого Стр Из МассивСтрок Цикл
		СтрокаТаблицы = Таблица.Добавить();
		
		Стр = СтрЗаменить(Стр,"\|","~ЭкранированиеВертикальнойЧерты~");
			
		Стр = СокрЛП(Стр);
		Если Лев(Стр,1) = "|" Тогда
			Стр = Сред(Стр,2);
		КонецЕсли;	 
		
		Если Прав(Стр,1) = "|" Тогда
			Стр = Лев(Стр,СтрДлина(Стр)-1);
		КонецЕсли;	 
		
		МассивЗначений = РазложитьСтрокуВМассивПодстрок(Стр,"|");
		
		Для Ккк = 0 По МассивЗначений.Количество()-1 Цикл
			ИмяКолонки = "Колонка" + (Ккк+1);
			Если Таблица.Колонки.Количество() < Ккк+1 Тогда
				Таблица.Колонки.Добавить(ИмяКолонки,Новый ОписаниеТипов("Строка"));
			КонецЕсли;	
			
			
			МассивЗначений[Ккк] = СтрЗаменить(МассивЗначений[Ккк],"~ЭкранированиеВертикальнойЧерты~","\|");
			СтрокаТаблицы[ИмяКолонки] = МассивЗначений[Ккк];
			
		КонецЦикла;	
		
	КонецЦикла;	
	
КонецПроцедуры

&НаСервере
Процедура ЗагрузитьТаблицуСервер()
	
	МассивСтрокДляРедактирования = Параметры.МассивСтрокДляРедактирования;
	
	ПромТаблица = Новый ТаблицаЗначений;
	ЗагрузитьМассивСтрокВТаблицу(ПромТаблица,МассивСтрокДляРедактирования);
		
	ДобавляемыеРеквизиты  = Новый Массив;
	Для Каждого Колонка Из ПромТаблица.Колонки Цикл 
		НоваяКолонка = Новый РеквизитФормы(Колонка.Имя, Новый ОписаниеТипов("Строка"), "ТаблицаНаФорме", ПромТаблица[0][Колонка.Имя]); 
		ДобавляемыеРеквизиты.Добавить(НоваяКолонка);
		
		ЭлементСпискаКолонок               = СписокКолонок.Добавить();
		ЭлементСпискаКолонок.Значение      = Колонка.Имя;
		ЭлементСпискаКолонок.Пометка       = Истина;
		ЭлементСпискаКолонок.Представление = СокрЛП(ПромТаблица[0][Колонка.Имя]);
		Если Лев(ЭлементСпискаКолонок.Представление,1) = "'" И Прав(ЭлементСпискаКолонок.Представление, 1) = "'" Тогда
			ЭлементСпискаКолонок.Представление = Сред(ЭлементСпискаКолонок.Представление, 2, СтрДлина(ЭлементСпискаКолонок.Представление)-2);
		КонецЕсли;	 
	КонецЦикла; 
	
	ИзменитьРеквизиты(ДобавляемыеРеквизиты);
	
	Для Каждого Колонка Из ПромТаблица.Колонки Цикл 
		НовыйЭлемент = Элементы.Добавить("ТаблицаНаФорме_" + Колонка.Имя, Тип("ПолеФормы"), Элементы.ТаблицаНаФорме);       
		НовыйЭлемент.Вид = ВидПоляФормы.ПолеВвода;
		НовыйЭлемент.ПутьКДанным = "ТаблицаНаФорме." + Колонка.Имя;
		НовыйЭлемент.Ширина = 10;		
	КонецЦикла; 
	
	ЗначениеВРеквизитФормы(ПромТаблица,"ТаблицаНаФорме");
		
КонецПроцедуры

#КонецОбласти
