{
El Grupo Intergubernamental de Expertos sobre el Cambio Climático de la ONU (IPCC) realiza todos los
años mediciones de temperatura en 100 puntos diferentes del planeta y, para cada uno de estos lugares,
obtiene un promedio anual. Este relevamiento se viene realizando desde hace 50 años, y con todos los
datos recolectados, el IPCC se encuentra en condiciones de realizar análisis estadísticos. Realizar un
programa que lea y almacene los datos correspondientes a las mediciones de los últimos 50 años (la
información se ingresa ordenada por año). Una vez finalizada la carga de la información, obtener:
a) el año con mayor temperatura promedio a nivel mundial.
b) el año con la mayor temperatura detectada en algún punto del planeta en los últimos 50 años.
}

program ej13;

const
    puntos = 100;
    anios = 50;

type
    rangoanios = 1..anios;
    rangopuntos = 1..puntos;

    vectorPuntos = array [rangoanios] of real;

    procedure inicializarVector (var v:vectorPuntos);
    var
        i:integer;
    begin
        for i:=1 to anios do
            v[i]:= 0;
    end;

    procedure calcularMax (var max:real; var am:integer; temp:real;anio:integer);
    begin
        if (temp > max) then begin
            max := temp;
            am:=anio;
        end;
    end;

    procedure carga (var v:vectorPuntos);
    var
        i,am:integer;
        total,max,temp,prom:real;
    begin
        for i:= 1 to anios do begin
            total:= 0;
            for j:= 1 to puntos do begin
                write('Ingrese la temperatura del anio', i ,' en el punto ' ,j, ' : ');readln(temp);
                total:= total + temp;
                calcularMax (max,am,temperatura,i);
            end;
            prom:= total / anios;
            v[i]:= prom;
        end;
    end;

    procedure procesarVector (v:vector);
    var
        max:real;
        i,anio:integer;
    begin
        max:= 0;
        for i:= 1 to anios do begin
            if (v[i] > max) then begin
                max:= v[i];
                anio:= i;
            end;
        end;
    end;

var
    v:vectorPuntos;
begin
    inicializarVector(v);
    carga(v);
    procesarVector(v);
end.