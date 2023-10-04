{
3.- Escribir un programa que:
a. Implemente un módulo recursivo que genere una lista de números enteros “random”
mayores a 0 y menores a 100. Finalizar con el número 0.

b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista.

c. Implemente un módulo recursivo que devuelva el máximo valor de la lista.

d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se
encuentra en la lista o falso en caso contrario.
}

program ej4;

type
    lista = ^nodo;
    nodo = record
        dato:integer;
        sig:lista;
    end;

    procedure generarLista (var l:lista);
        procedure agregarAtras(var l,ult:lista; num:integer);
        var
            nue:lista;
        begin
            new(nue);
            nue^.dato:= num;
            nue^.sig:= nil;
            if (l = nil) then
                l:=nue
            else
                ult^.sig:= nue;
            ult:= nue;
        end;

        procedure recursivo (var l,ult:lista; num:integer);
        begin
            if (num <> 0) then begin
                agregarAtras(l,ult,num);
                num := random (20);
                recursivo (l,ult,num);
            end;
        end;
    var
        num:integer;
        ult:lista;
    begin
        l:= nil;
        num := random (20);
        recursivo(l,ult,num);
    end;

    procedure mostrarLista (l:lista);
    begin
        if (l <> nil) then begin
            writeln(l^.dato);
            l:= l^.sig;
            mostrarLista(l);
        end;
    end;

    procedure minimoRecur (l:lista);
        function minimo (l:lista; min:integer):integer;
        begin
            if (l = nil) then
                minimo := min
            else begin
                if (l^.dato < min) then begin
                    min := l^.dato;
                end;
                minimo:= minimo(l^.sig,min);
            end;
        end;
    var
        min :integer;
    begin
        min := 100;
        writeln('El valor minimo de la lista es: ', minimo(l,min));
    end;

    procedure maximoRecur (l:lista);
        function maximo (l:lista; max:integer):integer;
        begin
            if (l = nil) then
                maximo := max
            else begin
                if (l^.dato > max) then begin
                    max := l^.dato;
                end;
                maximo:= maximo(l^.sig,max);
            end;
        end;
    
    var
        max:integer;
    begin
        max := -1;
        writeln('El valor maximo de la lista es: ', maximo(l,max));
    end;

{
d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se
encuentra en la lista o falso en caso contrario.
}
    procedure buscarElemento (l:lista);
        function encontrarElemento (l:lista; num:integer):boolean;
        begin
            if (l = nil) then
                encontrarElemento := false
            else begin
                if (l^.dato = num) then
                    encontrarElemento := true
                else
                    encontrarElemento:= encontrarElemento(l^.sig, num);
            end;
        end;
    var
        num:integer;
    begin
        write('Ingrese un numero para buscarlo: ');readln(num);
        if (encontrarElemento(l,num) = true) then
            writeln('El elemento fue encontrado.')
        else
            writeln('El elemento no esta o la lista esta vacia.')
    end;

var 
    l:lista;
begin
    Randomize();
    generarLista(l);
    mostrarLista(l);
    minimoRecur(l);
    maximoRecur(l);
    buscarElemento(l);
end.