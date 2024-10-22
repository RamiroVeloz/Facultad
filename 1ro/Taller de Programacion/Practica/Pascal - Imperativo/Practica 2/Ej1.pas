{
1.- Implementar un programa que invoque a los siguientes módulos.

a. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto, los
almacene en un vector con dimensión física igual a 10 y retorne el vector.

b. Un módulo que reciba el vector generado en a) e imprima el contenido del vector.

c. Un módulo recursivo que reciba el vector generado en a) e imprima el contenido del vector.

d. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y
retorne la cantidad de caracteres leídos. El programa debe informar el valor retornado.

e. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y
retorne una lista con los caracteres leídos.

f. Un módulo recursivo que reciba la lista generada en e) e imprima los valores de la lista en el
mismo orden que están almacenados.

g. Implemente un módulo recursivo que reciba la lista generada en e) e imprima los valores de
la lista en orden inverso al que están almacenados.
}

program ej1;

const
    dimf = 10;

type
    rango = 1..10;
    vector = array [rango] of char;

    lista = ^nodo;
    nodo = record
        dato:char;
        sig:lista;
    end;


    procedure cargarCadena (var v:vector; var diml:rango);
        procedure cargarCaracter ( var v:vector; var diml:rango; c:char);
        begin
            if (diml < dimf) and (c <> '.') then begin
                diml := diml + 1;
                v[diml]:= c;
                write('Ingrese un caracter: ');readln(c);
                cargarCaracter(v,diml,c);
            end;
        end;
    var
        c:char;
    begin
        diml := 0;
        write('Ingrese un caracter: ');readln(c);
        cargarCaracter(v,diml,c);
    end;

    procedure impresionIterativa (v:vector; diml:rango);
    var
        i:rango;
    begin
        for i:=1 to diml do 
            write(v[i]);
        writeln();
    end;

    procedure impresionRecursiva (v:vector; diml:rango);
        procedure impresion (v:vector; diml,i:rango);
        begin
            if (i <= diml) then begin
                i:= i+1;
                write(v[i]);
                impresion (v,diml,i);
            end;
        end;
    var
        i:rango;
    begin
        i:=0;
        if (diml <> 0) then
            impresion(v,diml,i);
        writeln();
    end;

    procedure contarCaracteresRecursivos (var cant:integer);
        procedure contador (c:char;var cant:integer);
        begin
            if (c <> '.') then begin
                cant:= cant+1;
                write('Ingrese un caracter: ');readln(c);
                contador (c,cant);
            end;
        end;
    var
        c:char;
    begin
        cant:= 0;
        write('Ingrese un caracter: ');readln(c);
        contador(c,cant);
        writeln('Se leyeron ', cant , ' caracteres.');
    end;

    procedure cargarListaRecursiva (var l:lista);
        procedure agregarAtras (var l,ult:lista; c:char);
        var
            nue:lista;
        begin
            new(nue);
            nue^.dato:= c;
            nue^.sig:= nil;
            if (l = nil) then
                l:= nue
            else
                ult^.sig:= nue;
            ult:= nue;
        end;

        procedure cargarCaracteres (var l,ult:lista; c:char);
        begin
            if (c <> '.') then begin
                agregarAtras(l,ult,c);
                write('Ingrese un caracter: ');readln(c);
                cargarCaracteres(l,ult,c);
            end;
        end;
    var
        c:char;
        ult:lista;
    begin
        l:=nil;
        write('Ingrese un caracter: ');readln(c);
        cargarCaracteres(l,ult,c);
    end;

    procedure listaRecursiva (l:lista);
    begin
        if (l <> nil) then begin
            write(l^.dato);
            l:= l^.sig;
            listaRecursiva(l);
        end;
    end;

    procedure listaRecursivaInversa (l:lista);
    begin
        if (l <> nil) then begin
            listaRecursiva(l^.sig);
            write(l^.dato);
        end;
        
    end;


var
    v:vector; diml:rango;
    cant:integer;
    l:lista;
begin
    cargarCadena(v,diml);
    impresionIterativa(v,diml);
    impresionRecursiva(v,diml);
    contarCaracteresRecursivos(cant);
    cargarListaRecursiva(l);
    listaRecursiva(l);
    writeln();
    listaRecursivaInversa(l);
end.