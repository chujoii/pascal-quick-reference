program modelir;

const
	dim = 100;
	num_of_cycles = 10000;
	
var
	arr	: array [1..dim, 1..dim] of double;
	i, j	:integer;
	k	:integer;
	


procedure border; 
var
	i, j : integer;

begin	
	{
	update border of model image (array)
	
	-----------------   100 V
	|	
	|
	|         -------   0 V
	|         |
	|         |
	
	}

	for i := 1 to dim do
		for j := 1 to dim do begin
			if (i=1) then arr[i, j] := 100.0;
			if (j=1) then arr[i, j] := 100.0;
			if ((i>round(dim/8)) and (j>round(dim/2))) then arr[i, j] := 0.0;
			{if (sqr(i-dim/4) + sqr(j-dim/3) < sqr(5)) then arr[i, j] := 50.0;}
		end;
	
end;



procedure calc_field; 
var
	i, j : integer;

begin
	// calculate electrical field
	for i := 2 to dim-1 do
		for j := 2 to dim-1 do
			arr[i,j] := (arr[i+1,j]+arr[i-1,j]+arr[i,j+1]+arr[i,j-1])/4.0; // simple average of near element
	
	for i := 1 to dim do begin
		// care for element near border
		arr[i,1] := arr[i, 2];
		arr[i,dim] := arr[i, dim-1];
		arr[1,i] := arr[2, i];
		arr[dim,i] := arr[dim-1, i];
	end;
end;



procedure writefile;
var
	i,j	: integer;
	f	: file of double;

begin
	assign(f, 'model.dat');
	rewrite(f);
	for i := 1 to dim do
		for j := 1 to dim do
			write(f, arr[i,j]);

	close(f);
end;



begin


	border;

	for k:=1 to num_of_cycles do begin
		border;
		calc_field;
	end;
	
	border;

	for i := 1 to dim do begin
		for j := 1 to dim do
			write(arr[i,j]:7:3, ' ');
		writeln;
	end;
	
	
	{writefile;}

	{
use:	

	fpc modelir.pas
	./modelir > model.dat
	gnuplot -e "plot 'model.dat'  matrix with image ; pause -1 \"press enter\""


	}
end.
