{
4.- Una librería requiere el procesamiento de la información de sus productos. De cada
producto se conoce el código del producto, código de rubro (del 1 al 8) y precio.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Lea los datos de los productos y los almacene ordenados por código de producto y
agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza
cuando se lee el precio 0.

b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.

c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que
puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3
es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto.

d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos
métodos vistos en la teoría.

e. Muestre los precios del vector resultante del punto d).

f. Calcule el promedio de los precios del vector resultante del punto d).
}

{
a. Lea los datos de los productos y los almacene ordenados por código de producto y
agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza
cuando se lee el precio 0.

De cada producto se conoce el código del producto, código de rubro (del 1 al 8) y precio.
}

program ej4;

const
    rubros = 8;

type
    rango = 1..rubros;
    
    prod = record
        codp:integer;
        codr:rango;
        precio:real;
    end;

    lista = ^nodo;
    nodo = record
        dato:prod;
        sig:lista;
    end;

    vector = array [rango] of lista;

    tres = array [1..30] of prod;

    procedure inicializarVector (var v:vector);
    var
        i:rango;
    begin
        for i:=1 to rubros do
            v[i]:= nil;
    end;

    procedure cargarProductos (var v:vector);
        procedure agregarOrdenado (var l:lista; p:prod);
        var
            ant,act,nue:lista;
        begin
            new(nue);
            nue^.dato:= p;
            nue^.sig:= nil;
            if (l = nil) then
                l:=nue
            else begin
                ant:= l; act:= l;
                while (act <> nil) and (act^.dato.codp < nue^.dato.codp) do begin
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

        procedure lectura (var p:prod);
        begin
            p.codp := random (99)+1;
            writeln('Codigo: ', p.codp);
            p.codr := random (8)+1;
            writeln('Rubro: ', p.codr);
            p.precio := random(101);
            writeln('Precio: ', p.precio);
        end;
    var
        p:prod;
    begin
        repeat
            lectura(p);
            agregarOrdenado(v[p.codr], p);
        until (p.precio = 0);
    end;

    procedure mostrarProductos (v:vector);
        procedure mostrarLista (l:lista);
        begin
            while (l<>nil) do begin
                writeln('-----------------------------------------------------');
                writeln();
                write ('Codigo: ', l^.dato.codp, ' | ', ' Rubro: ', l^.dato.codr, ' | ', ' Precio: ', l^.dato.precio:4:2);
                writeln();
                writeln('-----------------------------------------------------');
                l:= l^.sig;
            end;
        end;
    var
        i:rango;
    begin
        for i:=1 to rubros do begin
            writeln('Rubro ', i);
            if (v[i] <> nil) then
                mostrarLista(v[i]);
        end;
    end;

    {
    c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que
    puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3
    es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto.
    }

    procedure rubroTres (var t:tres;var diml:integer; v:vector);
    var
        item:prod;
        act:lista;
    begin
        act:= v[3];
        diml:= 0;
        while (act <> nil) and (diml < 30) do begin
            item:=act^.dato;
            diml := diml+1;
            t[diml]:= item;
            act:= act^.sig;
        end;
    end;

    procedure imprimirRubroTres (t:tres; diml:integer);
    var
        i:integer;
    begin
        for i:= 1 to diml do begin
            writeln('-----------------------------------------------------');
            writeln();
            write ('Codigo: ', t[i].codp, ' | ', ' Rubro: ', t[i].codr, ' | ', ' Precio: ', t[i].precio:4:2);
            writeln();
            writeln('-----------------------------------------------------');
        end;
    end;
    
    procedure ordenarTres (var t:tres; diml:integer);
    var
        i,j,k:integer;
        item:prod;
    begin
        for i:=1 to diml -1 do begin
            k:= i;
            for j:=i+1 to diml do 
                if (t[k].codp < t[j].codp) then
                    k:=j;
            item := t[i];
            t[i] := t[k];
            t[k] := item;
        end;
    end;

    procedure promedioTres (t:tres; diml:integer);
        function prom (total:real; diml:integer):real;
        begin
            prom:= total / diml;
        end;
    var
        i:integer;
        total : real;
    begin
        total:= 0;
        for i:=1 to diml do
            total:= total + t[i].precio;
        writeln('El promedio de precios del rubro 3 es: ', prom(total, diml):4:2);
    end;

var
    v:vector;
    t:tres; diml:integer;
begin
    inicializarVector(v);
    cargarProductos(v);
    mostrarProductos(v);
    rubroTres(t,diml,v);
    writeln('Productos del rubro 3: ');
    imprimirRubroTres(t,diml);
    ordenarTres(t,diml);
    writeln('Productos del rubro 3 ordenados: ');
    imprimirRubroTres(t,diml);
    promedioTres(t,diml);
end.