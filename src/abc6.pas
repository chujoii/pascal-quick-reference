program abc5;
const epsilon : real = 1.0e-10;
var 
   a,b : real;
begin
   a:=7.0;
   b:=1.0-((1.0/3.0)*(a-1.0)/2.0);
   c:=0.0
   if (b < epsilon) then
      writeln('zero')
   else
      writeln ('no zero');
   writeln(b);
end.
