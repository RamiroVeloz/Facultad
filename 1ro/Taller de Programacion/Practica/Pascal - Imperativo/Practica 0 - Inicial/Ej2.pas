{
2.- Implementar un programa que procese información de propiedades que están a la venta 
en una inmobiliaria. 
Se pide:

a) Implementar un módulo para almacenar en una estructura adecuada, las propiedades 
agrupadas por zona. Las propiedades de una misma zona deben quedar almacenadas 
ordenadas por tipo de propiedad. Para cada propiedad debe almacenarse el código, el tipo de 
propiedad y el precio total. De cada propiedad se lee: zona (1 a 5), código de propiedad, tipo 
de propiedad, cantidad de metros cuadrados y precio del metro cuadrado. La lectura finaliza 
cuando se ingresa el precio del metro cuadrado -1.

b) Implementar un módulo que reciba la estructura generada en a), un número de zona y un tipo de 
propiedad y retorne los códigos de las propiedades de la zona recibida y del tipo recibido. 
}


program ej2;

const
    maxZona = 5;

type
    rangoZonas = 1..maxZona;

    lec = record
        zona:integer;
        cod:integer;
        tipo:integer;
        cuadrados : real;
        precioCuadrados :real;
    end;

    prop = record
        cod:integer;
        tipo:integer;
        precioTotal:real;
    end;

    lista = ^nodo;
    nodo = record
        dato:prop;
        sig:lista;
    end;

    vector = array [rangoZonas] of lista;

    procedure inicializarVector (var v:vector);
    var
        i:integer;
    begin
        for i:=1 to maxZona do 
            v[i]:= nil;
    end;

    procedure cargarVector (var v:vector);
        procedure cargarPropiedad (var l:lista; p:prop);
        var
            ant,act,nue:lista;
        begin
            new(nue);
            nue^.dato:= p;
            nue^.sig:=nil;
            if (l = nil) then
                l:= nue
            else
            begin
                ant:= l;
                act:= l;
                while (act <>nil) and (act^.dato.tipo < nue^.dato.tipo) do begin
                    ant:= act;
                    act:= act^.sig;
                end;
                if (ant = act) then begin
                    nue^.sig:= l;
                    l:= nue;
                end
                else begin
                    ant^.sig:= nue;
                    nue^.sig:= act;
                end;
            end;
        end;

        procedure lectura ( var l:lec; var p:prop);
        begin
            write('Ingrese la zona: ');readln(l.zona);
            write('Ingrese el codigo: ');readln(l.cod);
            write('Ingrese el tipo: ');readln(l.tipo);
            write('Ingrese la cantidad de metros cuadrados: ');readln(l.cuadrados);
            write('Ingrese el precio de los metros cuadrados: ');readln(l.precioCuadrados);

            p.cod:= l.cod;
            p.tipo := l.tipo;
            p.precioTotal := l.cuadrados * l.precioCuadrados;
        end;

    var
        l:lec; p:prop;
    begin
        lectura(l,p);
        while (l.cuadrados <> -1) do begin
            cargarPropiedad(v[l.zona], p);
            lectura(l,p);
        end;
    end;


{
    b) Implementar un módulo que reciba la estructura generada en a), un número de zona y un tipo de 
    propiedad y retorne los códigos de las propiedades de la zona recibida y del tipo recibido. 
}
    procedure filtrarProps (v:vector);
        procedure mostrarLista (l:lista; num:integer);
        begin
            while (l <> nil) and (l^.dato.tipo = num) do begin
                if (l^.dato.tipo = num) then begin
                    writeln('---------------------');
                    writeln('Codigo: ', l^.dato.cod);
                    writeln('Precio: ', l^.dato.precioTotal:4:2);
                    writeln('---------------------');
                end;
                l:= l^.sig;
            end;
        end;
    var
        num:integer;
        tipo:rangoZonas;
    begin
        write('Ingrese el tipo de zona que desea filtrar: ');readln(tipo);
        write('Ingrese el tipo de propiedad que desea buscar: ');readln(num);
        mostrarLista(v[tipo], num);
    end;


var
    v:vector;
begin
    inicializarVector(v);
    cargarVector(v);
    filtrarProps(v);
end.
