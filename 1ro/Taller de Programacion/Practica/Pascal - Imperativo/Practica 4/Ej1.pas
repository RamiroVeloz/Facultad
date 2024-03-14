{
1. Implementar un programa modularizado para una librería que:





}

program ej1;

{
a. Almacene los productos vendidos en una estructura eficiente para la búsqueda por
código de producto. De cada producto deben quedar almacenados la cantidad total de
unidades vendidas y el monto total. De cada venta se lee código de venta, código del
producto vendido, cantidad de unidades vendidas y precio unitario. El ingreso de las
ventas finaliza cuando se lee el código de venta -1.
}

type
    prod = record
        cod:integer;
        totalVendido:integer;
        montoTotal:real;
    end;

    venta = record
        codV:integer;
        codP:integer;
        cant:integer;
        precioU:real;
    end;

    arbol = ^nodo;
    nodo = record
        data:prod;
        hi:arbol;
        hd:arbol;
    end;

    procedure cargarProductos (var a:arbol);
        procedure leerVenta (var v:venta);
        begin
            write('Ingrese el codigo de venta: ');readln(v.codV);
            if (v.codV <> -1) then begin
                write('Ingrese el codigo del producto: ');readln(v.codP);
                write('Ingrese la cantidad vendida: '); readln(v.cant);
                write('Ingrese el precio unitario: ');readln(v.precioU);
                writeln();
            end;
        end;

        procedure agregarProducto (var a:arbol; v:venta);
        begin
            if (a = nil) then begin
                new(a);
                a^.data.cod := v.codP;
                a^.data.totalVendido := v.cant;
                a^.data.montoTotal := v.cant * v.precioU;
                a^.hi := nil; a^.hd := nil;
            end
            else if (a^.data.cod = v.codP) then begin
                a^.data.totalVendido := a^.data.totalVendido + v.cant;
                a^.data.montoTotal := a^.data.montoTotal + (v.cant * v.precioU);
            end
            else if (a^.data.cod > v.codP) then
                agregarProducto(a^.hi, v)
            else
                agregarProducto(a^.hd,v);
        end;
    var
        v:venta;
    begin
        leerVenta (v);
        if (v.codV <> -1) then begin
            agregarProducto(a,v);
            cargarProductos(a);
        end;
    end;
{
b. Imprima el contenido del árbol ordenado por código de producto.
}
    procedure mostrarArbolProductos(a:arbol);
    begin
        if (a <> nil) then begin
            mostrarArbolProductos(a^.hi);
            writeln('--------------------------------------------------------------------------');
            writeln('Codigo de producto: ', a^.data.cod, ' | ', 'Ventas totales: ', a^.data.totalVendido, ' | ', 'Monto total: ', a^.data.montoTotal:4:2);
            writeln('--------------------------------------------------------------------------');
            writeln();
            mostrarArbolProductos(a^.hd);
        end;
    end;
{
c. Contenga un módulo que reciba la estructura generada en el punto a y retorne el
código de producto con mayor cantidad de unidades vendidas.
}
    procedure buscarCantidadMax (a:arbol);
        procedure buscarMax (a:arbol; var act,cod:integer);
        begin
            if (a <> nil ) then begin
                buscarMax(a^.hi,act,cod);
                if (a^.data.totalVendido > act) then begin
                    act:= a^.data.totalVendido;
                    cod:= a^.data.cod;
                end;
                buscarMax(a^.hd,act,cod);
            end;
        end;
    var
        act,cod:integer;
    begin
        act:= -1;
        buscarMax(a,act,cod);
        if(a = nil) then
            writeln('El arbol esta vacio.')
        else
            writeln('El producto ', cod , ' fue el mas vendido con ventas totales a:',act);
    end;
{
d. Contenga un módulo que reciba la estructura generada en el punto a y un código de
producto y retorne la cantidad de códigos menores que él que hay en la estructura.
}
    procedure cantidadMenor (a:arbol);
        function devolverCant (a:arbol; num:integer):integer;
        begin
            if (a <> nil) then begin
                if (a^.data.cod < num) then
                    devolverCant := devolverCant (a^.hi,num) + devolverCant(a^.hd,num) + 1
                else
                    devolverCant := devolverCant(a^.hi,num);
            end
            else
                devolverCant := 0;
        end;
    var
        num:integer;
    begin
        write('Ingrese un numero: ');readln(num);
        if (a = nil) then
            writeln('Arbol vacio.')
        else 
            writeln('La cantidad de productos menores al numero ingresado es: ',devolverCant(a,num));
    end;

{
e. Contenga un módulo que reciba la estructura generada en el punto a y dos códigos de
producto y retorne el monto total entre todos los códigos de productos comprendidos
entre los dos valores recibidos (sin incluir).
}
    procedure totalEntreCodigos(a:arbol);
        function devolverTotal (a:arbol; cod1,cod2:integer):real;
        begin
            if (a <> nil) then begin
                if (a^.data.cod > cod1) then begin
                    if (a^.data.cod < cod2) then
                        devolverTotal := devolverTotal(a^.hi,cod1,cod2) + devolverTotal(a^.hd,cod1,cod2) + a^.data.montoTotal
                    else
                        devolverTotal := devolverTotal(a^.hi,cod1,cod2);
                end
                else
                    devolverTotal:= devolverTotal(a^.hd,cod1,cod2);
            end
            else
                devolverTotal := 0;
        end;
    var
        cod1,cod2:integer;
    begin
        write('Ingrese un codigo piso: ');readln(cod1);
        write('Ingrese un codigo techo: ');readln(cod2);
        if (a = nil) then
            writeln('Arbol vacio.')
        else
            writeln('El monto total de los productos que se encuentran entre los dos codigos es: ',devolverTotal(a,cod1,cod2):4:2)
    end;

var
    a:arbol;
begin
    a:= nil;
    cargarProductos(a);
    mostrarArbolProductos(a);
    buscarCantidadMax(a);
    cantidadMenor(a);
    totalEntreCodigos(a);
end.
