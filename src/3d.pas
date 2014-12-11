program abc5;

uses math;

const
        step : real = 1.0e-3;
        start : real = -10.0;
        finish : real = 30.0;

var 
        x, y, z : real;
	param : real;


begin
	param := start;
	repeat
		writeln(param*cos(param), ', ', param*sin(param), ', ', param);
                param := param + step;
        until (param > finish);
end.
