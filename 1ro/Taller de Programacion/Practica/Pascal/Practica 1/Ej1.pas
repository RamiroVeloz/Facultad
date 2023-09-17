{
1.- Se desea procesar la información de las ventas de productos de un comercio (como máximo 50).
Implementar un programa que invoque los siguientes módulos:

b. Un módulo que muestre el contenido del vector resultante del punto a).

c. Un módulo que ordene el vector de ventas por código.

d. Un módulo que muestre el contenido del vector resultante del punto c).

e. Un módulo que elimine, del vector ordenado, las ventas con código de producto entre dos
valores que se ingresan como parámetros.

f. Un módulo que muestre el contenido del vector resultante del punto e).

g. Un módulo que retorne la información (ordenada por código de producto de menor a
mayor) de cada código par de producto junto a la cantidad total de productos vendidos.

h. Un módulo que muestre la información obtenida en el punto g).

}

program ej1;

const
    maxV = 50;
    maxC = 15;
    maxU = 99;

type
    rangoV = 1..maxV;
    rangoC = 1.. maxC;
    rangoU = 1.. maxU;

{
    a. Un módulo que retorne la información de las ventas en un vector. De cada venta se conoce el
día de la venta, código del producto (entre 1 y 15) y cantidad vendida (como máximo 99
unidades). El código debe generarse automáticamente (random) y la cantidad se debe leer. El
ingreso de las ventas finaliza con el día de venta 0 (no se procesa).
}

    venta = record
        dia:integer;
        cod:rangoC;
        cant : rangoU;
    end;

    vector = array [rangoV] of venta;

    lista = ^nodo;
    nodo = record
        dato:venta;
        sig:lista;
    end;


    procedure cargarVentas (var v:vector; var diml:rangoV);
        procedure lecturaVenta (var ven:venta);
        begin
            write('Ingrese el dia: ');readln(ven.dia);
            if (ven.dia <> 0) then begin
                ven.cod := random(maxC);
                writeln('Codigo: ',ven.cod);
                //write('Ingrese la cantidad: ');readln(ven.cant);
                ven.cant := random (98)+1;
                writeln('Cantidad: ', ven.cant);
            end;
        end;
    var
        ven:venta;
    begin
        Randomize();
        lecturaVenta(ven);
        while (diml < maxV) and (ven.dia <> 0) do begin
            diml := diml +1;
            v[diml]:= ven;
            lecturaVenta(ven);
        end;
    end;

    procedure mostrarVentas(v:vector; diml:rangoV);
    var
        i:integer;
    begin
        for i:=1 to diml do begin
            writeln ('------------------------------------');
            writeln ('Dia: ', v[i].dia);
            writeln ('Codigo: ', v[i].cod );
            writeln ('Cantidad: ', v[i].cant);
            writeln ('------------------------------------');
        end;
    end;

    procedure ordenarVentas (var v:vector; diml:rangoV);
    var
        i,j,k:rangoV;
        item:venta;
    begin
        for i:= 1 to diml -1 do begin
            k := i;
            for j := i +1 to diml do
                if (v[k].cod > v[j].cod) then
                    k:= j;
            item := v[k];
            v[k]:= v[i];
            v[i]:= item;
        end;
    end;
    procedure eliminarVentas (var v:vector; var diml:rangoV);
        
        function encontrarPosicionInicial (v:vector; diml:rangoV; cod:rangoC):integer;
        var
            pos:rangoV;
        begin
            pos := 1;
            while (cod > v[pos].cod) and (pos <= diml)   do 
                pos:= pos + 1;
            encontrarPosicionInicial := pos;
        end;
        
        function encontrarPosicionFinal (v:vector; diml, pos:integer;cod:rangoC):integer;
        begin
            while (cod >= v[pos].cod) and (pos <= diml) do 
                pos:= pos + 1;
            encontrarPosicionFinal := pos;
        end;

        procedure borrarTramo (var v:vector; var diml:rangoV; a,b:integer);
        var
            i:rangoV;
            saltos:integer;
        begin
            saltos := (b - a) ;
            for i:= a to diml - saltos do begin
                v[i]:= v[i+saltos];
            end;
            diml := diml - saltos;
        end;
    var
        posA,posB:rangoV;
        a,b:integer;
    begin
        write('Ingrese un codigo incial para eliminar: ');readln(a);
        posA := encontrarPosicionInicial(v,diml,a);
        write('Ingrese el codigo final para eliminar: '); readln(b);
        posB:= encontrarPosicionFinal (v,diml,posA,b);
        borrarTramo(v,diml,posA,posB);
        
    end;

    {
        g. Un módulo que retorne la información (ordenada por código de producto de menor a
mayor) de cada código par de producto junto a la cantidad total de productos vendidos.

h. Un módulo que muestre la información obtenida en el punto g).
    }

    procedure cargarPares (var l:lista; v:vector; diml:integer);
        procedure agregarOrdenado (var l:lista; v:venta);
        var
            ant,act,nue:lista;
        begin
            new(nue);
            nue^.dato:= v;
            nue^.sig:=nil;
            if (l = nil) then
                l := nue
            else
            begin
                ant:= l; act:= l;
                while (act <> nil) and (act^.dato.cod < nue^.dato.cod) do begin
                    ant:= act;
                    act:= act^.sig;
                end;
                if (ant = act) then begin
                    nue^.sig:= l;
                    l:= nue;
                end
                else begin
                    ant:= nue;
                    nue^.sig:= act;
                end
            end;
        end;

    var
        i:integer;
    begin
        l:= nil;
        for i:= 1 to diml do begin
            if (v[i].cod mod 2 = 0) then
                agregarOrdenado(l,v[i]);
        end;
    end;

    procedure mostrarListaPares (l:lista);
    begin
        while (l<> nil) do begin
            writeln('----------------------------');
            writeln('Dia: ', l^.dato.dia);
            writeln('Codigo: ', l^.dato.cod);
            writeln('Cantidad: ', l^.dato.cant);
            l:= l^.sig;
            writeln('----------------------------');
        end;
    end;

var
    v:vector;
    diml:rangoV;
    l:lista;
begin
    cargarVentas(v,diml);
    mostrarVentas(v,diml);
    ordenarVentas (v,diml);
    writeln('Ventas ordenadas.');
    writeln();
    writeln();
    mostrarVentas(v,diml);
    eliminarVentas(v,diml);
    mostrarVentas(v,diml);
    cargarPares(l,v,diml);
    mostrarListaPares(l);
end.