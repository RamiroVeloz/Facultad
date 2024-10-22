{
Utilizando el programa del ejercicio 1, realizar los siguientes cambios:
a. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron
ingresados (agregar atrás).
b. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron
ingresados, manteniendo un puntero al último ingresado.
}

program JugamosConListas;
type

    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;

    procedure armarNodo(var L: lista; v: integer);
    var
        aux,act,ant : lista;
    begin
        new(aux);
        aux^.num := v;
        aux^.sig := nil;
        if (l = nil) then
            l:= aux;
        else
        begin
            act:= l; ant:= l;
            while (act <> nil) do end
                ant:= act;
                act:= act^.sig;
            end;
            ant^.sig:= aux;   
        end;
    end;

    procedure armarNodo2 (var l,ult:lista; v:integer);
    var
        nue:lista;
    begin
        new(nue);
        nue^.num:=v;
        nue^.sig:= nil;
        if (l = nil) then
            l:=nue
        else
            ult^.sig:=nue;
        ult:= nue;
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