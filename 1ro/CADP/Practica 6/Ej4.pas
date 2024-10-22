{
4. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. Máximo: recibe la lista como parámetro y retorna el elemento de valor máximo.
b. Mínimo: recibe la lista como parámetro y retorna el elemento de valor mínimo.
c. Múltiplos: recibe como parámetros la lista L y un valor entero A, y retorna la cantidad de elementos de la
lista que son múltiplos de A.
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

    procedure maximo (num:integer; var max:integer);
    begin
        if (max < num) then 
            max := num;
    end;

    procedure minimo (num:integer; var min:integer);
    begin
        if (min > num) then
            min := num;
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
    valor,n,min,max : integer;
begin
    pri := nil;
    write('Ingrese un numero: ');readln(valor);
    while (valor <> 0) do begin
        armarNodo(pri, valor);
        write('Ingrese un numero: ');readln(valor);
        maximo(pri^.num, max);
        minimo(pri^.num,min);
    end;
    mostrarLista(pri);
    write('Ingrese un numero para incrementar los de la lista: ');readln(n);
    incrementar(pri,n);
end.