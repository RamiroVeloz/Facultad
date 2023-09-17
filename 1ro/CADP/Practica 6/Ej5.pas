{
5. Realizar un programa que lea y almacene la información de productos de un supermercado. De cada
producto se lee: código, descripción, stock actual, stock mínimo y precio. La lectura finaliza cuando se ingresa
el código -1, que no debe procesarse. Una vez leída y almacenada toda la información, calcular e informar:
a. Porcentaje de productos con stock actual por debajo de su stock mínimo.
b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.
c. Código de los dos productos más económicos.
}

program ej5;

const
    limitestr = 30;

type

    str = string[limitestr];

    producto = record
        cod:integer;
        desc: str;
        sact:integer;
        smin:integer;
        precio:real;
    end;

    lista = ^nodo;
    nodo = record
        dato:producto;
        sig:lista;
    end;

    procedure cargaDatos ();
        procedure lectura (var p:producto);
        begin
            write('Ingrese el codigo del producto: ');readln(p.cod);
            if ( p.cod <> -1 ) then begin
                write('Ingrese la descripcion: ');readln (p.desc);
                write('Ingrese el stock actual: ');readln(p.sact);
                write('Ingrese el stock minimo: ');readln (p.smin);
                write('Ingrese el precio del producto: ');readln(p.precio);
            end;
        end;

        procedure agregarFinal (var l,ult:lista; p:producto);
        var
            nue:lista;
        begin
            new(nue);
            nue^.dato:= p;
            nue^.sig:= nil;
            if( l = nil ) then
                l:= nue
            else
                ult^.sig:= nue;
            ult := nue;
        end;

        procedure carga (var l:lista);
        var
            p:producto;
            ult:lista;
        begin
            lectura(p);
            l:= nil;
            while (p.cod <> -1) do begin
                if (p.cod <> -1) then
                    agregarFinal(l,ult,p);
                lectura(p);
            end;
        end;

        procedure mostrarLista (l:lista);
        begin
            while (l <> nil) do begin
                writeln('-----------------------------');
                writeln('Codigo: ', l^.dato.cod);
                writeln('Descripcion: ', l^.dato.desc);
                writeln('Stock Actual: ', l^.dato.sact);
                writeln('Stock minimo: ', l^.dato.smin);
                writeln('Precio: ', l^.dato.precio);
                writeln ('-----------------------------');
                l:= l^.sig;
            end;
        end;

        function descomponer (num: integer):boolean;
        var
            digito : integer;
            cant:integer;
        begin
            descomponer:= false;
            cant:= 0;
            while (num <> 0) or (cant = 3) do begin
                digito:= num mod 10;
                if (digito mod 2 = 0) then
                    cant:= cant + 1;
                num := num div 10;
            end;
            if (cant = 3) then
                descomponer:= true;
        end;
        procedure calcularMin (var min1,min2:integer; var p1,p2:real; cod:integer; precio:real);
        begin
            if (precio < p1) and (min1 <> cod) then begin
                p2:= p1;
                min2:= min1;
                p1:= precio;
                min1:= cod;
            end
            else if (precio < p2) and (min2 <> cod) then begin
                p2:= precio;
                min2:= cod;
            end;
        end;
        {
            a. Porcentaje de productos con stock actual por debajo de su stock mínimo.
            b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.
            c. Código de los dos productos más económicos.
        }


        procedure procesarLista (l:lista);
        var
            cant,min1,min2,cs: integer;
            porc,p1,p2: real;
        begin
            cant:= 0;
            p1:= 9999;
            p2:= 9999;
            while (l <> nil) do begin
                cant := cant + 1 ;
                if (l^.dato.sact < l^.dato.smin ) then
                    cs:= cs + 1;
                if ( descomponer (l^.dato.cod) = true) then 
                    writeln ('El producto ', l^.dato.cod, ' de descripcion ', l^.dato.desc , ' tiene al menos 3 digitos pares en su codigo.');
                calcularMin (min1,min2,p1,p2,l^.dato.cod, l^.dato.precio);
                l:= l^.sig;
            end;
            porc := (cs / 100) * cant;
            writeln ('El porcentaje de productos con una cantidad de stock actual por debajo de la minima es: ', porc:4:2);
            writeln ('Los dos productos mas economicos son: ');
            writeln ('El producto ', min1 , '  con un precio de ', p1:4:2);
            writeln ('El producto ', min2 , ' con un precio de ', p2:4:2);

        end;


    var
        l:lista;
    begin
        carga(l);
        mostrarLista(l);
    end;
begin
    cargaDatos();
end.