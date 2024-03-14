program JugamosConListas;
type

    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;

    procedure armarNodo(var L: lista; v: integer);
    var
        aux : lista;
    begin
        new(aux);
        aux^.num := v;
        aux^.sig := L;
        L := aux;
    end;

    procedure mostrarLista (l:lista);
    begin
        while (l <> nil) do begin
            writeln(l^.num);
            l:= l^.sig;
        end;
    end;

    procedure incrementar (var l:lista; n:integer);
    begin
        while (l <> nil) do begin
            l^.num:= l^.num + n;
            l:= l^.sig;
        end;
        mostrarLista(l);
    end;

var
    pri : lista;
    valor,n : integer;
begin
    pri := nil;
    write('Ingrese un numero: ');readln(valor);
    while (valor <> 0) do begin
        armarNodo(pri, valor);
        write('Ingrese un numero: ');readln(valor);
    end;
    mostrarLista(pri);
    write('Ingrese un numero para incrementar los de la lista: ');readln(n);
    incrementar(pri,n);
end.

{
a. Indicar qué hace el programa.
    Lee valores almacenandolos en una lista, cuando se ingresa el valor 0 la lista se cierra y este queda fuera de la lista.
b. Indicar cómo queda conformada la lista si se lee la siguiente secuencia de números: 10 21 13 48 0.
    48,13,21,10
c. Implementar un módulo que imprima los números enteros guardados en la lista generada.
    Listo
d. Implementar un módulo que reciba la lista y un valor, e incremente con ese valor cada dato de la lista.
    Listo
}