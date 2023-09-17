program punteros;
type
numeros = array[1..10000] of integer;//20.000bytes
puntero_numeros = ^numeros;//4bytes
var
n: puntero_numeros;//4bytes
num: numeros;//20.000bytes
i:integer;//2bytes
begin
writeln(sizeof(n), ' bytes');//4bytes
writeln(sizeof(num), ' bytes');//20.000bytes
new(n);
writeln(sizeof(n^), ' bytes');//20.000bytes
for i:= 1 to 5000 do
n^[i]:= i;
writeln(sizeof(n^), ' bytes');//20.000bytes
end.