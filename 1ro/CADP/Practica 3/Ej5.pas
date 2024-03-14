{
5. Realizar un programa que lea información de autos que están a la venta en una concesionaria.
De cada auto se lee:
marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” 
que no debe procesarse. La
información se ingresa ordenada por marca. Se pide calcular e informar:
a. El precio promedio por marca.
b. Marca y modelo del auto más caro.
}


program ej5;

const
    limitestr = 20;

type

    str = string[limitestr];

    auto = record
        marca: str;
        modelo:str;
        precio:real;
    end;
    procedure corte ();

        procedure calcularMax(var precioMax:real; var marcaMax,modeloMax:str; precio:real; marca,modelo:str );
        begin
            if (precio > precioMax) and (marcaMax <> marca) then begin
                precioMax := precio;
                marcaMax:= marca;
                modeloMax := modelo;
            end;
        end;

        procedure corteDeControl ();
        var
            a:auto;
            dec:char;
            act: boolean;
            cant:integer;
            prom,totalAct,precioMax:real;
            marcaMax, modeloMax: str;
        begin
            precioMax:= 0;
            marcaMax := '';
            modeloMax := '';
            write ('Ingrese la marca del auto: '); readln(a.marca);
            while (a.marca <> 'ZZZ') do begin
                act:= true;
                prom:= 0;
                cant:= 0;
                totalAct:= 0;
                while (act = true) and (a.marca <> 'ZZZ') do begin
                    write('Ingrese el modelo: ');readln(a.modelo);
                    write('Ingrese el precio: ');readln(a.precio);
                    cant:= cant + 1;
                    totalAct := totalAct + a.precio;
                    calcularMax(precioMax,marcaMax,modeloMax,a.precio, a.marca, a.modelo);
                    write('Desea cambiar de marca? S/N: ');readln(dec);
                    if (dec ='s') then
                        act:= not act;
                end;
                prom := totalAct / cant;
                writeln('El precio promedio de los autos de la marca ', a.marca , ' es de: ', prom:4:2);
                write('Ingrese la marca del auto: ');readln(a.marca);
            end;
            writeln('La marca ', marcaMax , ' es la que tiene el modelo mas caro ( ', modeloMax , ' ) con un precio de : ', precioMax:4:2);
        end;
    begin
        corteDeControl();
    end;
begin
    corte();
end.

