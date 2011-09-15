program abc5;
uses math;
const
   h: real = 1.0e-1;
var 
   a,b,c : real;

begin
   a := -10.0;
   b :=  10.0;
   c := a;
   repeat
      writeln(c, ', ', sin(sqr(c)));
      c := c + h;
   until (c>b);
   
end.
