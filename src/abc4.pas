program abc4;
var a,b,c,n : integer;
begin
   
   n:=5;
   
   a:=1;
   while (a < n+1) do begin // цикл с предусловием
      writeln('a=', a);
      a := a+1;
   end;
   
   
   
   for b := 1 to 5 do begin // итерационный цикл
      writeln('b=', b);
   end;
   
   
   c:=1;
   repeat // цикл с постусловием
      writeln('c=', c);
      c := c + 1;
   until (c > 5);
   
   
end.
