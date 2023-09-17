{program punteros;
type
    cadena = string[50];//51bytes
    puntero_cadena = ^cadena;//4bytes
var
    pc: puntero_cadena;//4bytes
begin
    pc^:= 'un nuevo texto';
    new(pc);
    writeln(pc^);//51bytes
end.}
//Error, no imprime nada porque se le asigna un valor a un puntero que todavia no fue creado.

{program punteros;
type
cadena = string[50];//51bytes
puntero_cadena = ^cadena;//4bytes
var
pc: puntero_cadena;//4bytes
begin
new(pc);
pc^:= 'un nuevo nombre';
writeln(sizeof(pc^), ' bytes');//51bytes
writeln(pc^);//imprime un nuevo nombre
dispose(pc);//libera memoria, -51bytes
pc^:= 'otro nuevo nombre';//error
end.}
//Da error, luego de imprimir la cadena de caracteres y hacerse el dispose, se que da intentando acceder a memoria para asignar la nueva cadena, lo que genera un loop infinito.

{program punteros;
type
    cadena = string[50];//51bytes
    puntero_cadena = ^cadena;//4bytes
    procedure cambiarTexto(pun: puntero_cadena);
    begin
        pun^:= 'Otro texto';
    end;
var
    pc: puntero_cadena;
begin
    new(pc);
    pc^:= 'Un texto';
    writeln(pc^);
    cambiarTexto(pc);
    writeln(pc^);
end.}
//Imprime 'Un texto' y 'Otro texto', ya que al ser direcciones de memorias manejadas por un puntero, los datos se sobreescriben.

{program punteros;
type
    cadena = string[50];
    puntero_cadena = ^cadena;
procedure cambiarTexto(pun: puntero_cadena);
begin
    new(pun);
    pun^:= 'Otro texto';
end;
var
    pc: puntero_cadena;
begin
    new(pc);
    pc^:= 'Un texto';
    writeln(pc^);
    cambiarTexto(pc);
    writeln(pc^);
end.}
//Devuelve 'un texto' y 'un texto' ya que el procedimiento pretende cambiar la direccion de memoria, por lo que afecta de forma directa al puntero.
//Por ende crea una copia de la direccion, y afecta de forma no directa al valor.