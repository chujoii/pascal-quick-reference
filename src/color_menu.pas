program color_menu;
{
лицензия BSD, с одним ограничением:
Вы можете пользоваться программой если узнаете что такое SQL (например SQLite)
}

uses crt; {необходимо для манипуляций с цветом символов
	  и для чтения клавиатуры}

type
	{вводим новый тип: arrstr = массив строк размером 8 элементов}
	arrstr = array [1 .. 8] of string;



const
	{константы - нет необходимости менять их значение}
	size_menu : integer = 8; {меню будет содержать 8 элементов}

        {global_menu будет 'массивом сторк' со следующим содержанием }
	glob_menu    : arrstr = ('1 открыть',
				 '2 напечатать',
				 '3 добавить',
				 '4 удалить',
				 '5 изменить',
				 '6 сохранить',
				 '7 поиск',
				 '8 выход');
	
	{ то же самое можно было сделать так:
	var
	   glob_menu : array [1 .. 8] of string
	...
	и уже в основной программе
	...
	   glob_menu[1] := '1 открыть';
	   glob_menu[2] := '2 напечатать';
	...
	   glob_menu[8] := '8 выход';}
	

var 
	glob_pointer : integer; {это не настоящий указатель:
				glob_pointer содержит номер
				выбранного элемента в меню}



function menu(list : arrstr; list_length:integer ): integer;
{эта функция содержит программу печати меню
ей передаётся:
list - 'массив строк' содержащий пункты меню
list_length - длинна меню

функция возвращает номер выбранного пункта меню}


var     {переменные внутри функции:}
	k	: integer; {код считанной клавиши}
	i	: integer; {счётчик}
	pointer	: integer; {временный 'указатель' на выбранный элемент.
			   это не настоящий указатель}


begin
	pointer := 1; {выставляем временный указатель на первый элемент списка}
	repeat {цикл:
	       повторяем считывание клавиши до тех пор пока
	       не будет нажата клавиша Enter (с кодом 13)}
		
		ClrScr(); {чистим экран}

		{печатаем меню в цикле}
		for i:=1 to list_length do begin
			{можно использовать TextColor(цвет)}
			{выбираем цвет для печати}
			if (i=pointer) then TextBackground(Green)
			else TextBackground(Black);
		      
			writeln(list[i]); {выводим одну строчку меню на экран}
		end;

		{ord преобразуют код символа считанного 'Readkey' в число}
		k:=ord(ReadKey);
		if (k=0) then {если у нас управляющая клавиша}
			k:=ord(ReadKey); {то считаем код ещё раз}
		{else если обычная клавиша - то всё получится с первого раза}
		writeln('код клавиши: ', k);
		
		case k of    {case почти то же самое что несколько if}
			72 : {клавиша вверх}
			     begin   {уменьшаем 'указатель' на 1}
				     pointer := pointer - 1;

				     {необходимо проверить, вдруг мы перескочили и выбранный номер пункта меню стал равен, например '-5'}
				     if (pointer < 1) then pointer := list_length;
			     end;
			80 : {клавиша вниз}
			     begin   {увеличиваем 'указатель' на 1}
				     pointer := pointer + 1;

				     {необходимо проверить, вдруг мы перескочили и выбранный номер пункта меню стал равен, например '50'}
				     if (pointer > list_length) then pointer := 1;
			     end;
			{13 : enter}
		end; {case}
			
	until (k = 13); {проверка на выход из цикла:
			повторять считывание клавиши до тех пор пока
			не будет нажата клавиша Enter (с кодом 13)}
	menu := pointer; {возвращаем выбранный номер пункта меню}
end;


procedure opendb();
begin
	writeln(' база данных открыта');

	{место для программы ...}
	writeln('нажмите Enter...');
	readln();
end;

procedure printdb();
begin
	writeln('печать базы данных');

	{место для программы ...}
	writeln('нажмите Enter...');
	readln();
end;


procedure savedb();
begin
	writeln(' база данных сохранена');

	{место для программы ...}
	writeln('нажмите Enter...');
	readln();
end;


procedure searchdb();
var
	search_menu    : arrstr = ('1 поиск по имени',
				   '2 поиск по номеру курса',
				   '3 поиск по времени бега 100м',
				   'пусто',
				   'пусто',
				   'пусто',
				   'пусто',
				   'пусто');
	search_pointer : integer;
begin
	writeln(' поиск по базе данных');

	{вызываем меню с другим наполнением: search_menu в ктотром 3 элемента}
	search_pointer := menu(search_menu, 3);
	
	case search_pointer of
		1 : begin writeln('место для программы ...'); end;
		2 : begin writeln('место для программы ...'); end;
		3 : begin writeln('место для программы ...'); end;
	end; {case}
	
	writeln('нажмите Enter...');
	readln();
end;







begin {основная программа - простенькая реализация SQL - базы данных}
	repeat
		glob_pointer := menu(glob_menu, size_menu);

		case glob_pointer of
			1 : opendb();
			2 : printdb();
			3 : savedb();
			{...}
			7 : searchdb();
		end; {case}

	until(glob_pointer = 8); {8 в нашем случае выход}
end.
