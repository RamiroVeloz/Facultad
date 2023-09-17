{
    4. Una compañía de telefonía celular debe realizar la facturación mensual de sus 9300 clientes con planes de
consumo ilimitados (clientes que pagan por lo que consumen). Para cada cliente se conoce su código de cliente y
cantidad de líneas a su nombre. De cada línea se tiene el número de teléfono, la cantidad de minutos consumidos
y la cantidad de MB consumidos en el mes. Se pide implementar un programa que lea los datos de los clientes de
la compañía e informe el monto total a facturar para cada uno. Para ello, se requiere:
a. Realizar un módulo que lea la información de una línea de teléfono.
b. Realizar un módulo que reciba los datos de un cliente, lea la información de todas sus líneas (utilizando el
módulo desarrollado en el inciso a. ) y retorne la cantidad total de minutos y la cantidad total de MB a facturar
del cliente.
Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido cuesta $1,35.
}

program ej4;

const

    min = 3.40;
    mbs = 1.35;

type

    dataLinea= record
        numero:integer;
        cantMin:integer;
        cantMB: real;
    end;

    cliente = record
        cod:integer;
        cantLineas:integer;
        lineas: dataLinea;
        totalMin:real;
        totalMB:real;
        totalPago:real;
    end;

    procedure cargaYAnalisis ();
        procedure lecturaDeDatos (var c:cliente);
        var
            i:integer;
        begin
            write('Ingrese el codigo de cliente:');readln(c.cod);
            if (c.cod <> 0) then begin
                write('Ingrese la cantidad de lineas que posee: ');readln(c.cantLineas);
                c.totalMin:= 0;
                c.totalMB:= 0;
                c.totalPago:= 0;
                for i:= 1 to c.cantLineas do
                begin
                    write('Ingrese el numero de la linea ', i , ' : ');readln(c.lineas.numero);
                    write('Ingrese la cantidad de minutos consumidos por el numero: ');readln (c.lineas.cantMin);
                    c.totalMin:= c.totalMin + c.lineas.cantMin;
                    write('Ingrese la cantidad de MB consumidos por el numero: ');readln (c.lineas.cantMB);
                    c.totalMB:= c.totalMB + c.lineas.cantMB;
                end;
                c.totalPago:= (c.totalMin * min) + (c.totalMB * mbs);
                writeln('Total del cliente ', (c.totalMin):4:2 ,' en relacion a los minutos consumidos: ', (c.totalMin * min):4:2);
                writeln('Total del cliente ', (c.totalMB):4:2 ,' en relacion a los minutos consumidos: ', (c.totalMB * mbs):4:2);
                writeln ('El cliente ', c.cod ,' debera abonar un total de: ', c.totalPago:4:2);
            end;
        end;

    var
        c:cliente;
    begin
        
        lecturaDeDatos(c);
        while (c.cod <> 0) do begin
            lecturaDeDatos(c);
        end;
    end;
begin
    cargaYAnalisis ();
end.

