program abc5;

uses math;

const
        step : real = 1.0e-3;
        start : real = 0.0;
        finish : real = 30.0;

var 
        current : real;



begin
        current := start + step;
        repeat
                writeln(current, ', ', sin(current*current)/current);
                current := current + step;
        until (current > finish);
end.
