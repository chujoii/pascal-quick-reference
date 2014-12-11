program abc4;
var a,b,c,n : integer;
begin
	
	n:=5;
	
	writeln ('цикл с предусловием');
	a:=1;
	while (a <= n) do begin
		writeln('a=', a);
		a := a+1;
	end;
	writeln	();
	
	
	writeln ('итерационный цикл');
	for b := 1 to 5 do begin
		writeln('b=', b);
	end;
	writeln	();


	writeln ('цикл с постусловием');
	c:=1;
	repeat
		writeln('c=', c);
		c := c + 1;
	until (c > 5);
	writeln	();
	
	
end.
