{2. El registro civil de La Plata ha solicitado un programa para analizar la distribución de casamientos durante el año
2019. Para ello, cuenta con información de las fechas de todos los casamientos realizados durante ese año.
a) Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada casamiento.
b) Implementar un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo es el definido
en el inciso a).
c) Implementar un programa que lea la fecha de todos los casamientos realizados en 2019. La lectura finaliza al
ingresar el año 2020, que no debe procesarse, e informe la cantidad de casamientos realizados durante los meses de verano (enero, febrero y marzo) 
y la cantidad de casamientos realizados en los primeros 10 días de
cada mes. Nota: utilizar el módulo realizado en b) para la lectura de fecha.}


program ej2 ;

type
    //A
    fechasCasamiento = record
        dia: integer;
        mes: integer;
        anio: integer;
    end;

    procedure cargaYAnalisis ();
        //B
        procedure lecturaFechas (var fc:fechasCasamiento);
        begin
            write('Ingrese el anio del casamiento: '); readln(fc.anio);
            if (fc.anio < 2020) then
            begin
                write ('Ingrese el dia del casamiento: ');readln(fc.dia);
                write ('Ingrese el mes del casamiento: ');readln(fc.mes);
            end;
        end;

        //C
        procedure carga ();
        var
            fc:fechasCasamiento;
            contadorVerano:integer;
            contadorDiez: integer;
        begin
            contadorVerano:=0;
            contadorDiez:=0;
            lecturaFechas (fc);
            while (fc.anio < 2020) do 
            begin
                if (fc.mes = 1) or (fc.mes = 2) or (fc.mes = 3) then    
                    contadorVerano:= contadorVerano + 1;
                if (fc.dia < 11 ) then
                    contadorDiez:= contadorDiez + 1;
                lecturaFechas(fc);
            end;
            writeln('La cantidad de casamientos que se realizaron en verano es de: ', contadorVerano);
            writeln('La cantidad de casamientos que se realizaron en los primeros diez dias del mes es de: ', contadorDiez);
        end;

    begin
        carga()
    end;

begin
    cargaYAnalisis();
end.

