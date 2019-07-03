﻿
#Область ОписаниеПеременных

&НаКлиенте
Перем Ванесса;

&НаКлиенте
Перем МассивТипов;

&НаКлиенте
Перем МассивВидов;

&НаКлиенте
Перем КешТекущееОкно;

&НаКлиенте
Перем КешТекущийЭлементФормы;

#КонецОбласти

#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Язык = Параметры.Язык;
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
	МассивТипов = Новый Массив;
	МассивВидов = Новый Массив;
	СкрытьДопКолонки();
	Ванесса = ВладелецФормы;
	ЗаполнитьДеревоФормы();
	ПолучатьАктивныйЭлементИзTestClient = Истина;
	ВключитьПоискАктивногоЭлементаФомры();
	
КонецПроцедуры

&НаКлиенте
Процедура ПриЗакрытии(ЗавершениеРаботы)
	ОтключитьОбработчикОжидания("ПроверкаАктивногоЭлементаОткрытойФормы");
КонецПроцедуры

&НаКлиенте
Процедура ОбработкаОповещения(ИмяСобытия, Параметр, Источник)
	Если ИмяСобытия = "ЗапускСценариевVB" Тогда
		ПолучатьАктивныйЭлементИзTestClient = Ложь;
		ВключитьПоискАктивногоЭлементаФомры();
	КонецЕсли;
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура Обновить(Команда)
	
	ЗаполнитьДеревоФормы();
	
КонецПроцедуры

&НаКлиенте
Процедура ПоказатьСкрытьВид(Команда)
	
	Если Не Элементы.ДеревоФормы.ПодчиненныеЭлементы.ДеревоФормыВидСтрока.Видимость  Или Команда = "Показать" Тогда
		Элементы.ДеревоФормы.ПодчиненныеЭлементы.ДеревоФормыВидСтрока.Видимость = Истина;
		Элементы.ПоказатьСкрытьВид.Картинка = БиблиотекаКартинок.УстановитьФлажки;
	Иначе
		Элементы.ДеревоФормы.ПодчиненныеЭлементы.ДеревоФормыВидСтрока.Видимость = Ложь;
		Элементы.ПоказатьСкрытьВид.Картинка = БиблиотекаКартинок.СнятьФлажки;
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ПоказатьСкрытьВидимость(Команда)
	
	Если Не Элементы.ДеревоФормы.ПодчиненныеЭлементы.ДеревоФормыТекущаяВидимость.Видимость  Или Команда = "Показать" Тогда
		Элементы.ДеревоФормы.ПодчиненныеЭлементы.ДеревоФормыТекущаяВидимость.Видимость = Истина;
		Элементы.ПоказатьСкрытьВидимость.Картинка = БиблиотекаКартинок.УстановитьФлажки;
	Иначе
		Элементы.ДеревоФормы.ПодчиненныеЭлементы.ДеревоФормыТекущаяВидимость.Видимость = Ложь;
		Элементы.ПоказатьСкрытьВидимость.Картинка = БиблиотекаКартинок.СнятьФлажки;
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ПоказатьСкрытьВсеКолонки(Команда)

	Если Не Элементы.ДеревоФормы.ПодчиненныеЭлементы.ДеревоФормыТипСтрока.Видимость Или
		 Не Элементы.ДеревоФормы.ПодчиненныеЭлементы.ДеревоФормыВидСтрока.Видимость
		Тогда

		ПоказатьСкрытьТип("Показать");
		ПоказатьСкрытьВид("Показать");
		ПоказатьСкрытьВидимость("Показать");
		ПоказатьСкрытьДоступность("Показать");
		ПоказатьСкрытьТолькоПросмотр("Показать");
		Элементы.ПоказатьСкрытьВсеКолонки.Картинка = БиблиотекаКартинок.СнятьФлажки;

	Иначе
		СкрытьДопКолонки();
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ПоказатьСкрытьДоступность(Команда)
	
	Если Не Элементы.ДеревоФормы.ПодчиненныеЭлементы.ДеревоФормыТекущаяДоступность.Видимость  Или Команда = "Показать" Тогда
		Элементы.ДеревоФормы.ПодчиненныеЭлементы.ДеревоФормыТекущаяДоступность.Видимость = Истина;
		Элементы.ПоказатьСкрытьДоступность.Картинка = БиблиотекаКартинок.УстановитьФлажки;
	Иначе
		Элементы.ДеревоФормы.ПодчиненныеЭлементы.ДеревоФормыТекущаяДоступность.Видимость = Ложь;
		Элементы.ПоказатьСкрытьДоступность.Картинка = БиблиотекаКартинок.СнятьФлажки;
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ПоказатьСкрытьТип(Команда)
	
	Если Не Элементы.ДеревоФормы.ПодчиненныеЭлементы.ДеревоФормыТипСтрока.Видимость  Или Команда = "Показать" Тогда
		Элементы.ДеревоФормы.ПодчиненныеЭлементы.ДеревоФормыТипСтрока.Видимость = Истина;
		Элементы.ПоказатьСкрытьТип.Картинка = БиблиотекаКартинок.УстановитьФлажки;
	Иначе
		Элементы.ДеревоФормы.ПодчиненныеЭлементы.ДеревоФормыТипСтрока.Видимость = Ложь;
		Элементы.ПоказатьСкрытьТип.Картинка = БиблиотекаКартинок.СнятьФлажки;
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ПоказатьСкрытьТолькоПросмотр(Команда)
	
	Если Не Элементы.ДеревоФормы.ПодчиненныеЭлементы.ДеревоФормыТекущееТолькоПросмотр.Видимость  Или Команда = "Показать" Тогда
		Элементы.ДеревоФормы.ПодчиненныеЭлементы.ДеревоФормыТекущееТолькоПросмотр.Видимость = Истина;
		Элементы.ПоказатьСкрытьТолькоПросмотр.Картинка = БиблиотекаКартинок.УстановитьФлажки;
	Иначе
		Элементы.ДеревоФормы.ПодчиненныеЭлементы.ДеревоФормыТекущееТолькоПросмотр.Видимость = Ложь;
		Элементы.ПоказатьСкрытьТолькоПросмотр.Картинка = БиблиотекаКартинок.СнятьФлажки;
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура ПолучитьАктивныйЭлементИзTestClientПриИзменении(Элемент)
	ВключитьПоискАктивногоЭлементаФомры();
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыДеревоФормы

&НаКлиенте
Процедура ДеревоФормыПриАктивизацииСтроки(Элемент)
	Если ПроизошлаСменаСтрокиПриИзмененииТекущегоЭлементаВTestClient Тогда
		//чтобы не было лишнего срабатывания в тестклиенте
		ПроизошлаСменаСтрокиПриИзмененииТекущегоЭлементаВTestClient = Ложь;
		Возврат;
	КонецЕсли;

	Если ЭтаФорма.ТекущийЭлемент.Имя = "ГруппаЗаголовокИмяФормы" Тогда
		//значит происходит сворачнивание/разворачивание группы
		Возврат;
	КонецЕсли;

	АктивизироватьОбъектTestClient(Элементы.ДеревоФормы.ТекущиеДанные);
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Функция ПолучитьИдТипа(Тип)
	ИД = МассивТипов.Найти(Тип);
	Если ИД = Неопределено Тогда
		МассивТипов.Добавить(Тип);
		Возврат МассивТипов.Количество()-1;
	Иначе
		Возврат ИД;
	КонецЕсли;
КонецФункции

&НаКлиенте
Функция ПолучитьИдВида(ВидПоля)
	ИД = МассивВидов.Найти(ВидПоля);
	Если ИД = Неопределено Тогда
		МассивВидов.Добавить(ВидПоля);
		Возврат МассивВидов.Количество()-1;
	Иначе
		Возврат ИД;
	КонецЕсли;
КонецФункции

&НаКлиенте
Процедура ДобавитьКонтролВДерево(ТекущийКонтрол,ЭлементДерева)
	Тип                     = ТипЗнч(ТекущийКонтрол);
	ЭлементДерева.ТипВнутр  = ПолучитьИдТипа(Тип);
	ЭлементДерева.ТипСтрока = Строка(Тип);

	Попытка
		ВидПоля                 = ТекущийКонтрол.Вид;
		ЭлементДерева.ВидВнутр  = ПолучитьИдВида(ВидПоля);
		ЭлементДерева.ВидСтрока = Строка(ВидПоля);
	Исключение
	КонецПопытки;

	Если Тип = Тип("ТестируемоеОкноКлиентскогоПриложения") Тогда
		ЭлементДерева.Синоним = ТекущийКонтрол.Заголовок;
		ЗаголовокОкна         = ТекущийКонтрол.Заголовок;
		Возврат;
	ИначеЕсли Тип = Тип("ТестируемаяФорма") Тогда
		ЭлементДерева.Имя     = ТекущийКонтрол.ИмяФормы;
		ЭлементДерева.Синоним = ТекущийКонтрол.ТекстЗаголовка;

		ИмяТекущейФормы       = ТекущийКонтрол.ИмяФормы;
		ЗаголовокТекущейФормы = ТекущийКонтрол.ТекстЗаголовка;

		Возврат;
	КонецЕсли;

	Попытка
		ЭлементДерева.Имя                   = ТекущийКонтрол.Имя;
		ЭлементДерева.Синоним               = ТекущийКонтрол.ТекстЗаголовка;
		ЭлементДерева.ТекущаяВидимость      = Ложь;
		ЭлементДерева.ТекущаяДоступность    = Ложь;
		ЭлементДерева.ТекущееТолькоПросмотр = Ложь;

		Если Элементы.ДеревоФормыТекущаяВидимость.Видимость Тогда
			ЭлементДерева.ТекущаяВидимость      = ТекущийКонтрол.ТекущаяВидимость();
		КонецЕсли;

		Если Элементы.ДеревоФормыТекущаяДоступность.Видимость Тогда
			ЭлементДерева.ТекущаяДоступность    = ТекущийКонтрол.ТекущаяДоступность();
		КонецЕсли;

		Если Элементы.ДеревоФормыТекущееТолькоПросмотр.Видимость Тогда
			ЭлементДерева.ТекущееТолькоПросмотр = ТекущийКонтрол.ТекущееТолькоПросмотр();
		КонецЕсли;

	Исключение
		Ванесса.Отладка("Не смог прочитать данные контрола. " + ОписаниеОшибки());
	КонецПопытки;
КонецПроцедуры

&НаКлиенте
Процедура ЗаполнитьДанныеФормыРекурсивно(ТекущийКонтрол,ТекЭелементДерева)
	НовыйЭлементДерева = ТекЭелементДерева.ПолучитьЭлементы().Добавить();
	ДобавитьКонтролВДерево(ТекущийКонтрол,НовыйЭлементДерева);

	Попытка
		МассивЭлементов = ТекущийКонтрол.ПолучитьПодчиненныеОбъекты();
	Исключение
		Возврат;
	КонецПопытки;

	Для Каждого Элем Из МассивЭлементов Цикл
		ЗаполнитьДанныеФормыРекурсивно(Элем,НовыйЭлементДерева);
	КонецЦикла;

КонецПроцедуры

&НаКлиенте
Функция НайтиАктивноеОкноTestClient()
	ДопПараметры = Новый Структура;
	ДопПараметры.Вставить("ИскатьМодальныйДиалог",Истина);

	Возврат Ванесса.ПолучитьАктивноеОкноИзТестовоеПриложение(ДопПараметры);
КонецФункции

&НаКлиенте
Процедура ЗаполнитьДеревоФормы()
	ТекстШагов.Очистить();
	ДеревоФормы.ПолучитьЭлементы().Очистить();

	КонтекстСохраняемый = Ванесса.ПолучитьКонтекстСохраняемый();
	Если НЕ КонтекстСохраняемый.Свойство("ТестовоеПриложение") Тогда
		Сообщить("Не подключен TestClient.");
		Возврат;
	КонецЕсли;

	Попытка
		ТекущееОкно = НайтиАктивноеОкноTestClient();
	Исключение
		Сообщить(ОписаниеОшибки());
		Возврат;
	КонецПопытки;

	КешТекущееОкно = ТекущееОкно;
	КешТекущийЭлементФормы = Неопределено;

	ЗаполнитьДанныеФормыРекурсивно(ТекущееОкно,ДеревоФормы);

	Если ПолучатьАктивныйЭлементИзTestClient Тогда
		ПодключитьОбработчикОжидания("ПроверкаАктивногоЭлементаОткрытойФормы",1,Ложь);
	Иначе
		//значит надо получить данные формы только один раз
		ПодключитьОбработчикОжидания("ПроверкаАктивногоЭлементаОткрытойФормы",1,Истина);
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Функция ПолучитьТекущуюФормуTestClient()
	Попытка
		ТекущееОкно = НайтиАктивноеОкноTestClient();
	Исключение
		Возврат Неопределено;
	КонецПопытки;

	Если ТекущееОкно = Неопределено Тогда
		Возврат Неопределено;
	КонецЕсли;

	Если ТекущееОкно <> КешТекущееОкно Тогда
		ЗаполнитьДеревоФормы();
	КонецЕсли;

	ФормыОкна = ТекущееОкно.НайтиОбъекты(Тип("ТестируемаяФорма"));
	Если ФормыОкна.Количество() = 0 Тогда
		Возврат Неопределено;
	КонецЕсли;

	ТекФорма = ФормыОкна[0];
	//если у окна несколько форм - то непонятно как определить активный элемент

	Возврат ТекФорма;
КонецФункции

&НаКлиенте
Процедура НайтиВДеревеАктивныйЭлементЕслиЭтоВозможно()

	ТекФорма = ПолучитьТекущуюФормуTestClient();
	Если ТекФорма = Неопределено Тогда
		Возврат;
	КонецЕсли;

	Попытка
		ТекЭлемент = ТекФорма.ПолучитьТекущийЭлемент();
	Исключение
		Возврат;
	КонецПопытки;

	Если ТекЭлемент = Неопределено Тогда
		Возврат;
	КонецЕсли;


	Если ТипЗнч(ТекЭлемент) = Тип("ТестируемаяТаблицаФормы") Тогда
		Попытка
			ТекЭлемент = ТекЭлемент.ПолучитьТекущийЭлемент();
		Исключение
			Возврат;
		КонецПопытки;
	КонецЕсли;


	Если ТекЭлемент <> КешТекущийЭлементФормы Тогда
		КешТекущийЭлементФормы = ТекЭлемент;

		Попытка
			Имя = ТекЭлемент.Имя;
		Исключение
			Сообщить(ОписаниеОшибки());
			Возврат;
		КонецПопытки;

		СтрокаДерева = НайтиСтрокуДереваСИменемЭлемента(Имя);

		Если СтрокаДерева = Неопределено Тогда
			Возврат;
		КонецЕсли;

		ПроизошлаСменаСтрокиПриИзмененииТекущегоЭлементаВTestClient = Истина;
		Элементы.ДеревоФормы.ТекущаяСтрока = СтрокаДерева.ПолучитьИдентификатор();
		ЗаполнитьТекстШаговПоАктивномуЭлементу();

		Сообщить(Ванесса.ПолучитьТекстСообщенияПользователю("$Найден активный элемент формы$") + " <" + Имя + ">");
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ПроверкаАктивногоЭлементаОткрытойФормы()
	Попытка
		НайтиВДеревеАктивныйЭлементЕслиЭтоВозможно();
	Исключение
		Сообщить(ОписаниеОшибки());
	КонецПопытки;
КонецПроцедуры

&НаКлиенте
Функция НайтиСтрокуДереваСИменемЭлемента(Имя)
	Результат = Неопределено;
	НайтиСтрокуДереваСИменемЭлементаРекурсивно(ДеревоФормы.ПолучитьЭлементы(),Имя,Результат);
	Возврат Результат;
КонецФункции

&НаКлиенте
Процедура НайтиСтрокуДереваСИменемЭлементаРекурсивно(ЭлементыДерева, Имя, Результат)
	Если Результат <> Неопределено Тогда
		Возврат;
	КонецЕсли;

	Для Каждого Элем Из ЭлементыДерева Цикл
		Если Элем.Имя = Имя Тогда
			Результат = Элем;
			Возврат;
		КонецЕсли;

		НайтиСтрокуДереваСИменемЭлементаРекурсивно(Элем.ПолучитьЭлементы(),Имя,Результат)
	КонецЦикла;
КонецПроцедуры

&НаКлиенте
Функция НайтиФормуРекурсивноВДереве(ДанныеЭлемента)
	ТекРодитель = ДанныеЭлемента.ПолучитьРодителя();
	Пока Истина Цикл
		Если ТекРодитель = Неопределено Тогда
			Прервать;
		КонецЕсли;

		Если ТекРодитель.ТипВнутр = ПолучитьИдТипа(Тип("ТестируемаяФорма")) Тогда
			Возврат ТекРодитель;
		КонецЕсли;

		ТекРодитель = ТекРодитель.ПолучитьРодителя();
	КонецЦикла;
КонецФункции

&НаКлиенте
Процедура АктивизироватьОбъектTestClient(ДанныеЭлемента)
	Если ДанныеЭлемента = Неопределено Тогда
		Возврат;
	КонецЕсли;

	Если ДанныеЭлемента.ТипВнутр = ПолучитьИдТипа(Тип("ТестируемоеОкноКлиентскогоПриложения")) Тогда
		Возврат;
	ИначеЕсли ДанныеЭлемента.ТипВнутр = ПолучитьИдТипа(Тип("ТестируемаяФорма")) Тогда
		Возврат;
	КонецЕсли;

	ТекФормаДерево  = НайтиФормуРекурсивноВДереве(ДанныеЭлемента);

	Попытка
		ТекОкноЭлемент = НайтиАктивноеОкноTestClient();
	Исключение
		Сообщить(ОписаниеОшибки());
		Возврат;
	КонецПопытки;

	Если ТекОкноЭлемент = Неопределено Тогда
		Возврат;
	КонецЕсли;

	Попытка
		ВсеФормыОкна = ТекОкноЭлемент.НайтиОбъекты(Тип("ТестируемаяФорма"));
		ТекФормаЭлемент = Неопределено;
		Для Каждого ФормаОкна Из ВсеФормыОкна Цикл
			Если ФормаОкна.ИмяФормы = ТекФормаДерево.Имя Тогда
				ТекФормаЭлемент = ФормаОкна;
				Прервать;
			КонецЕсли;
		КонецЦикла;
	Исключение
		Сообщить(ОписаниеОшибки());
		Возврат;
	КонецПопытки;

	Если ТекФормаЭлемент = Неопределено Тогда
		Возврат;
	КонецЕсли;

	Попытка
		ТекЭлемент = ТекФормаЭлемент.НайтиОбъект(,,ДанныеЭлемента.Имя);
	Исключение
		Сообщить(ОписаниеОшибки());
		Возврат;
	КонецПопытки;

	Если ТекЭлемент = Неопределено Тогда
		Возврат;
	КонецЕсли;

	Попытка
		ТекЭлемент.Активизировать();
		КешТекущийЭлементФормы = ТекЭлемент;
		ЗаполнитьТекстШаговПоАктивномуЭлементу();
	Исключение
		Возврат;
	КонецПопытки;
КонецПроцедуры

&НаКлиенте
Функция НайтиТаблицуДляТекущегоЭлемента()
	ТекущиеДанные = Элементы.ДеревоФормы.ТекущиеДанные;
	Если ТекущиеДанные = Неопределено Тогда
		Возврат Неопределено;
	КонецЕсли;

	ИдТипа = ПолучитьИдТипа(Тип("ТестируемаяТаблицаФормы"));

	ТекРодитель = ТекущиеДанные.ПолучитьРодителя();
	Пока ТекРодитель <> Неопределено Цикл

		Если ТекРодитель.ТипВнутр = ИдТипа Тогда
			//значит это таблица значений
			Возврат ТекРодитель;
		КонецЕсли;

		ТекРодитель = ТекРодитель.ПолучитьРодителя();
	КонецЦикла;

	Возврат Неопределено;
КонецФункции

&НаКлиенте
Процедура ЗаполнитьТекстШаговПоАктивномуЭлементу()
	ТекстШагов = "";

	ТекущиеДанные = Элементы.ДеревоФормы.ТекущиеДанные;
	Если ТекущиеДанные = Неопределено Тогда
		Возврат;
	КонецЕсли;

	ТекФорма = ПолучитьТекущуюФормуTestClient();
	Если ТекФорма = Неопределено Тогда
		Возврат;
	КонецЕсли;

	ЭлементФормы = ТекФорма.НайтиОбъект(,,ТекущиеДанные.Имя);

	Если ЭлементФормы = Неопределено Тогда
		Возврат;
	КонецЕсли;

	МассивШагов = Новый Массив;

	Если ТипЗнч(ЭлементФормы) = Тип("ТестируемоеПолеФормы") Тогда
		Вид = ЭлементФормы.Вид;

		ТаблицаВладелец = НайтиТаблицуДляТекущегоЭлемента();

		ЭлементТаблица  = Неопределено;
		Если ТаблицаВладелец <> Неопределено Тогда
			ЭлементТаблица = ТекФорма.НайтиОбъект(,,ТаблицаВладелец.Имя);
		КонецЕсли;

		Если Вид = ВидПоляФормы.ПолеВвода Тогда
			Если ТаблицаВладелец = Неопределено Тогда
				Попытка
					Если ЭлементФормы.Вид = ВидПоляФормы.ПолеВвода Тогда
						//чтобы синхронизировать работу с шагом
						//И элемент формы "ИмяЭлемента" стал равен "Значение"
						Попытка
							ЗначениеПоля = ЭлементФормы.ПолучитьТекстРедактирования();
						Исключение
							//если поле невидимое - тогда получим представление данных
							ЗначениеПоля = ЭлементФормы.ПолучитьПредставлениеДанных();
						КонецПопытки;
					Иначе
						ЗначениеПоля = ЭлементФормы.ПолучитьПредставлениеДанных();
					КонецЕсли;


					МассивСтрок = Ванесса.РазложитьСтрокуВМассивПодстрокКлиент(ЗначениеПоля,Символы.ПС);
					Если МассивСтрок.Количество() <= 1 Тогда
						МассивШагов.Добавить("И элемент формы """ + ЭлементФормы.ТекстЗаголовка + """ стал равен """ + ЗначениеПоля + """");
						МассивШагов.Добавить("И элемент формы с именем """ + ЭлементФормы.Имя + """ стал равен """ + ЗначениеПоля + """");
					Иначе
						ТекстШага = "И элемент формы """ + ЭлементФормы.ТекстЗаголовка + """ стал равен";
						Для Каждого СтрокаШага Из МассивСтрок Цикл
							ТекстШага = ТекстШага + Символы.ПС + "	| '" + СтрокаШага + "' |";
						КонецЦикла;
						МассивШагов.Добавить(ТекстШага);

						МассивШагов.Добавить("");

						ТекстШага = "И элемент формы с именем """ + ЭлементФормы.ТекстЗаголовка + """ стал равен";
						Для Каждого СтрокаШага Из МассивСтрок Цикл
							ТекстШага = ТекстШага + Символы.ПС + "	| '" + СтрокаШага + "' |";
						КонецЦикла;
						МассивШагов.Добавить(ТекстШага);
					КонецЕсли;

				Исключение
				КонецПопытки;

				ОтображаемыйТекст   = Неопределено;
				Попытка
					МассивШагов.Добавить("");
					ОтображаемыйТекст   = ЭлементФормы.ПолучитьОтображаемыйТекст();
				Исключение
				КонецПопытки;

				Если ОтображаемыйТекст <> Неопределено Тогда
					МассивШагов.Добавить("И представление элемента с именем """ + ЭлементФормы.Имя + """ стало равно """ + ОтображаемыйТекст + """");
				КонецЕсли;

				Попытка
					ТекстРедактирования = ЭлементФормы.ПолучитьТекстРедактирования();
					Если ЗначениеПоля <> ТекстРедактирования Тогда
						МассивШагов.Добавить("И у элемента формы с именем """ + ЭлементФормы.Имя + """ текст редактирования стал равен """ + ТекстРедактирования + """");
					КонецЕсли;
				Исключение
				КонецПопытки;

			Иначе
				Попытка
					ЗначениеПоля = ЭлементТаблица.ПолучитьТекстЯчейки(ЭлементФормы.Имя);
					МассивСтрок  = Ванесса.РазложитьСтрокуВМассивПодстрокКлиент(ЗначениеПоля,Символы.ПС);
					Если МассивСтрок.Количество() <=1 Тогда
						МассивШагов.Добавить("И в таблице """ + ТаблицаВладелец.Имя + """ поле """ + ЭлементФормы.ТекстЗаголовка + """ имеет значение """ + ЗначениеПоля + """");
						МассивШагов.Добавить("И в таблице """ + ТаблицаВладелец.Имя + """ поле с именем """ + ЭлементФормы.Имя + """ имеет значение """ + ЗначениеПоля + """");
					Иначе
						ТекстШага = "И в таблице """ + ТаблицаВладелец.Имя + """ поле """ + ЭлементФормы.ТекстЗаголовка + """ имеет значение";
						Для Каждого СтрокаШага Из МассивСтрок Цикл
							ТекстШага = ТекстШага + Символы.ПС + "	| '" + СтрокаШага + "' |";
						КонецЦикла;
						МассивШагов.Добавить(ТекстШага);

						ТекстШага = "И в таблице """ + ТаблицаВладелец.Имя + """ поле с именем """ + ЭлементФормы.ТекстЗаголовка + """ имеет значение";
						Для Каждого СтрокаШага Из МассивСтрок Цикл
							ТекстШага = ТекстШага + Символы.ПС + "	| '" + СтрокаШага + "' |";
						КонецЦикла;
						МассивШагов.Добавить(ТекстШага);

					КонецЕсли;

				Исключение
				КонецПопытки;
			КонецЕсли;

		ИначеЕсли Вид = ВидПоляФормы.ПолеФлажка Тогда
			Если ТаблицаВладелец = Неопределено Тогда
				ЗначениеПоля        = ЭлементФормы.ПолучитьПредставлениеДанных();
				МассивШагов.Добавить("И я изменяю флаг """ + ЭлементФормы.ТекстЗаголовка + """");
				МассивШагов.Добавить("И я изменяю флаг с именем """ + ЭлементФормы.Имя + """");
				МассивШагов.Добавить("");
				МассивШагов.Добавить("И я снимаю флаг """ + ЭлементФормы.ТекстЗаголовка + """");
				МассивШагов.Добавить("И я снимаю флаг с именем """ + ЭлементФормы.Имя + """");
				МассивШагов.Добавить("");
				МассивШагов.Добавить("И я устанавливаю флаг """ + ЭлементФормы.ТекстЗаголовка + """");
				МассивШагов.Добавить("И я устанавливаю флаг с именем """ + ЭлементФормы.Имя + """");
				МассивШагов.Добавить("");
				МассивШагов.Добавить("И флаг """ + ЭлементФормы.ТекстЗаголовка + """ равен """ + ЗначениеПоля + """");
				МассивШагов.Добавить("И флаг с именем """ + ЭлементФормы.Имя + """ равен """ + ЗначениеПоля + """");

				Попытка
					ТекстРедактирования = ЭлементФормы.ПолучитьТекстРедактирования();
					Если ЗначениеПоля <> ТекстРедактирования Тогда
						МассивШагов.Добавить("И у элемента формы с именем """ + ЭлементФормы.Имя + """ текст редактирования стал равен """ + ТекстРедактирования + """");
					КонецЕсли;
				Исключение
				КонецПопытки;
			Иначе
				Попытка
					МассивШагов.Добавить("");
					ЗначениеПоля        = ЭлементТаблица.ПолучитьТекстЯчейки(ЭлементФормы.Имя);
					МассивШагов.Добавить("И в таблице """ + ТаблицаВладелец.Имя + """ поле """ + ЭлементФормы.ТекстЗаголовка + """ имеет значение """ + ЗначениеПоля + """");
					МассивШагов.Добавить("И в таблице """ + ТаблицаВладелец.Имя + """ поле с именем """ + ЭлементФормы.Имя + """ имеет значение """ + ЗначениеПоля + """");
				Исключение
				КонецПопытки;
			КонецЕсли;
		ИначеЕсли Вид = ВидПоляФормы.ПолеТабличногоДокумента Тогда
			МассивШагов.Добавить("Дано Табличный документ """ + ЭлементФормы.Имя + """ равен макету ""ИмяМакета""");
			МассивШагов.Добавить("Дано Табличный документ """ + ЭлементФормы.Имя + """ равен макету ""ИмяМакета"" по шаблону");
			МассивШагов.Добавить("");
			МассивШагов.Добавить("И область ""R1C1:R10C10"" табличного документа """ + ЭлементФормы.Имя + """ равна макету ""ИмяМакета""");

		ИначеЕсли Вид = ВидПоляФормы.ПолеПереключателя Тогда
			ЗначениеПоля        = ЭлементФормы.ПолучитьПредставлениеДанных();
			ОтображаемыйТекст   = Неопределено;
			ТекстРедактирования = Неопределено;
			Попытка
				ОтображаемыйТекст   = ЭлементФормы.ПолучитьОтображаемыйТекст();
			Исключение
			КонецПопытки;

			Попытка
				ТекстРедактирования = ЭлементФормы.ПолучитьТекстРедактирования();
			Исключение
			КонецПопытки;

			МассивШагов.Добавить("И элемент формы с именем """ + ЭлементФормы.Имя + """ стал равен """ + ЗначениеПоля + """");
			Если ОтображаемыйТекст <> Неопределено Тогда
				МассивШагов.Добавить("И представление элемента с именем """ + ЭлементФормы.Имя + """ стало равно """ + ОтображаемыйТекст + """");
			КонецЕсли;

			Если ТекстРедактирования <> Неопределено Тогда
				Если ЗначениеПоля <> ТекстРедактирования Тогда
					МассивШагов.Добавить("И у элемента формы с именем """ + ЭлементФормы.Имя + """ текст редактирования стал равен """ + ТекстРедактирования + """");
				КонецЕсли;
			КонецЕсли;

			ЗначениеПереключателя = ОтображаемыйТекст;
			Если ЗначениеПереключателя = Неопределено Тогда
				ЗначениеПереключателя = ТекстРедактирования;
			КонецЕсли;

			МассивШагов.Добавить("");
			МассивШагов.Добавить("И я меняю значение переключателя """ + ЭлементФормы.ТекстЗаголовка + """ на '" + ЗначениеПереключателя + "'");
			МассивШагов.Добавить("И я меняю значение переключателя с именем """ + ЭлементФормы.Имя + """ на '" + ЗначениеПереключателя + "'");
		ИначеЕсли Вид = ВидПоляФормы.ПолеНадписи Тогда
			Если ТаблицаВладелец = Неопределено Тогда
				ЗначениеПоля        = ЭлементФормы.ПолучитьПредставлениеДанных();
				ОтображаемыйТекст   = Неопределено;
				ТекстРедактирования = Неопределено;

				Попытка
					ОтображаемыйТекст   = ЭлементФормы.ПолучитьОтображаемыйТекст();
				Исключение
				КонецПопытки;

				Попытка
					ТекстРедактирования = ЭлементФормы.ПолучитьТекстРедактирования();
				Исключение

				КонецПопытки;

				МассивШагов.Добавить("И элемент формы """ + ЭлементФормы.ТекстЗаголовка + """ стал равен """ + ЗначениеПоля + """");
				МассивШагов.Добавить("И элемент формы с именем """ + ЭлементФормы.Имя + """ стал равен """ + ЗначениеПоля + """");
				Если ТекстРедактирования <> Неопределено Тогда
					Если ЗначениеПоля <> ТекстРедактирования Тогда
						МассивШагов.Добавить("И у элемента формы с именем """ + ЭлементФормы.Имя + """ текст редактирования стал равен """ + ТекстРедактирования + """");
					КонецЕсли;
				КонецЕсли;

				МассивШагов.Добавить("");

				Если ОтображаемыйТекст <> Неопределено Тогда
					МассивШагов.Добавить("И представление элемента с именем """ + ЭлементФормы.Имя + """ стало равно """ + ОтображаемыйТекст + """");
				КонецЕсли;


				МассивШагов.Добавить("");
				МассивШагов.Добавить("И я нажимаю на гиперссылку """ + ЭлементФормы.ТекстЗаголовка + """");
				МассивШагов.Добавить("И я нажимаю на гиперссылку с именем """ + ЭлементФормы.Имя + """");

				МассивШагов.Добавить("");

				МассивШагов.Добавить("И у гиперссылки """ + ЗначениеПоля + """ элемента формы """" я нажимаю на ссылку """ + ЗначениеПоля + """ программно");
			Иначе
				Попытка
					ЗначениеПоля        = ЭлементТаблица.ПолучитьТекстЯчейки(ЭлементФормы.Имя);
					//МассивШагов.Добавить("Тогда текст ячейки таблицы """ + ТаблицаВладелец.Имя + """ """ + ЭлементФормы.Имя + """ стал равен """ + ЗначениеПоля + """");
					МассивШагов.Добавить("И в таблице """ + ТаблицаВладелец.Имя + """ поле """ + ЭлементФормы.ТекстЗаголовка + """ имеет значение """ + ЗначениеПоля + """");
					МассивШагов.Добавить("И в таблице """ + ТаблицаВладелец.Имя + """ поле с именем """ + ЭлементФормы.Имя + """ имеет значение """ + ЗначениеПоля + """");
				Исключение
				КонецПопытки;
			КонецЕсли;
		КонецЕсли;

		Если ТаблицаВладелец <> Неопределено Тогда
			МассивШагов.Добавить("");
			МассивШагов.Добавить("И в таблице """ + ТаблицаВладелец.Имя + """ я активизирую поле """ + ЭлементФормы.ТекстЗаголовка + """");
			МассивШагов.Добавить("И в таблице """ + ТаблицаВладелец.Имя + """ я активизирую поле с именем """ + ЭлементФормы.Имя + """");

			МассивШагов.Добавить("");
			МассивШагов.Добавить("И я жду, что в таблице """ + ТаблицаВладелец.Имя + """ количество строк будет ""больше"" 0 в течение 20 секунд");
			МассивШагов.Добавить("");
		КонецЕсли;
	ИначеЕсли ТипЗнч(ЭлементФормы) = Тип("ТестируемаяДекорацияФормы") Тогда
		ЗначениеПоля        = ЭлементФормы.ТекстЗаголовка;
		МассивШагов.Добавить("И элемент формы с именем """ + ЭлементФормы.Имя + """ стал равен """ + ЗначениеПоля + """");
		МассивШагов.Добавить("И у элемента с именем """ + ЭлементФормы.Имя + """ я жду значения """ + ЗначениеПоля + """ в течение 30 секунд");
		МассивШагов.Добавить("");
		МассивШагов.Добавить("И я нажимаю на гиперссылку """ + ЗначениеПоля + """");
		МассивШагов.Добавить("И я нажимаю на гиперссылку с именем """ + ЭлементФормы.Имя + """");
	ИначеЕсли ТипЗнч(ЭлементФормы) = Тип("ТестируемаяКнопкаФормы") Тогда
		МассивШагов.Добавить("И я нажимаю на кнопку """ + ЭлементФормы.ТекстЗаголовка + """");
		МассивШагов.Добавить("И я нажимаю на кнопку с именем """ + ЭлементФормы.Имя + """");
	КонецЕсли;

	МассивШагов.Добавить("");
	МассивШагов.Добавить("И я активизирую поле """ + ЭлементФормы.ТекстЗаголовка + """");
	МассивШагов.Добавить("И я активизирую поле с именем """ + ЭлементФормы.Имя + """");

	Для Каждого ТекстШага Из МассивШагов Цикл
		ТекстШагов.ДобавитьСтроку(ТекстШага);
	КонецЦикла;

	Если Язык <> "ru" и ЗначениеЗаполнено(Язык) Тогда
		Текст = Ванесса.ПеревестиТекст(ТекстШагов.ПолучитьТекст());
		ТекстШагов.УстановитьТекст(Текст);
	КонецЕсли;

КонецПроцедуры

&НаКлиенте
Процедура СкрытьДопКолонки()
	ПоказатьСкрытьТип("");
	ПоказатьСкрытьВид("");
	ПоказатьСкрытьВидимость("");
	ПоказатьСкрытьДоступность("");
	ПоказатьСкрытьТолькоПросмотр("");
	Элементы.ПоказатьСкрытьВсеКолонки.Картинка = БиблиотекаКартинок.УстановитьФлажки;
КонецПроцедуры

&НаКлиенте
Процедура ВключитьПоискАктивногоЭлементаФомры()
	Если Не ПолучатьАктивныйЭлементИзTestClient Тогда
		ОтключитьОбработчикОжидания("ПроверкаАктивногоЭлементаОткрытойФормы");
	Иначе
		ПодключитьОбработчикОжидания("ПроверкаАктивногоЭлементаОткрытойФормы",1,Ложь);
	КонецЕсли;
КонецПроцедуры

#КонецОбласти