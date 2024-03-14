{
La compañía Canonical Llt. desea obtener estadísticas acerca del uso de Ubuntu Linux en La Plata. Para
ello, debe realizar un programa que lea y almacene información sobre las computadoras con este
sistema operativo (a lo sumo 10.000). De cada computadora se conoce código de computadora, la
versión de Ubuntu que utilizan (18.04, 17.10, 17.04, etc.), la cantidad de paquetes instalados y la
cantidad de cuentas de usuario que poseen. La información debe almacenarse ordenada por código de
computadora de manera ascendente. La lectura finaliza al ingresar el código de computadora -1, que
no debe procesarse. Una vez almacenados todos los datos, se pide:
a. Informar la cantidad de computadoras que utilizan las versiones 18.04 o 16.04.
b. Informar el promedio de cuentas de usuario por computadora.
c. Informar la versión de Ubuntu de la computadora con mayor cantidad de paquetes instalados.
d. Eliminar la información de las computadoras con código entre 0 y 500.
}

program ej5;

const 
    total = 10000;

type
    rango = 1..total;
    computadora = record
        cod:integer;
        version:real;
        cantp:integer;
        cantus:integer;
    end;

    vector= array[rango] of computadora;

    procedure lecturaYCarga (var v:vector; var diml:integer);
        procedure lectura (var c:computadora);
        begin
            write('Ingrese el codigo: ');readln(c.cod);
            if (c.cod <> -1) then begin
                write('Ingrese la version: ');readln(c.version);
                write('Ingrese la cantidad de paquetes instalados: ');readln(c.cantp);
                write('Ingrese la cantidad de usuarios que posee: ');readln(c.cantus);
            end;
        end;

    var
        c:computadora;
    begin
        diml:= 0;
        lectura(c);
        while (c.cod <> -1) do begin
            diml:= diml + 1;
            v[diml]:= c;
            lectura(c);
        end;
    end;

    procedure mostrarVector (v:vector; diml:integer);
    var
        i:integer;
    begin
        for i:=1 to diml do begin
            writeln('----------------------------------------------');
            writeln('Codigo: ', v[i].cod);
            writeln('Version: ',v[i].version);
            writeln('Cantidad de paquetes instalados: ', v[i].cantp);
            writeln('Cantidad de usuarios que posee: ', v[i].cantus);
            writeln('----------------------------------------------');
    end;

    procedure ordenarVector (var v:vector; diml:integer);
    var
        i,j,p:integer;
        item:computadora;
    begin
        for i:= 1 to diml do begin
            p:= i;
            for j:= 1 to diml -1 do 
                if (v[j].cod < v[p].cod) then
                    p:= j;
            item := v[j];
            v[j]:= v[p];
            v[p]:= item;
        end;
    end;

    procedure analizarVector (v:vector; diml:integer);
        procedure calcularMax (var vermax:real; var cantmax:intreger; version:real; cant:integer);
        begin
            if (cant > cantmax) and (version <> vermax) then begin
                vermax:= version;
                cantmax:=cant;
            end;
        end;
    var
        cantv,i,totalu,cantmax:integer;
        prom,vermax:real;
    begin
        cantv:= 0;
        prom:= 0;
        for i:=1 to diml do begin
            if (v[i].version = 18.04 or v[i].version = 16.04) then
                cantv:= cantv +1;
            totalu := totalu + v[i].cantus;
            calcularMax (vermax,cantmax,v[i].version,v[i].cantp);
        end;
    end;

    procedure eliminarElementos (var v:vector; var diml:integer);
    var
        i,pos:integer;
    begin
        for i:= 1 to diml do
            if (v[pos].cod < 500) or (v[pos] >= 0) then begin
                for pos:= i to diml -1 do begin
                    v[pos]:= v[pos+1]; 
                end;
                diml:= diml - 1;
            end;
    end;



var
    diml:integer;
    v:vector;

begin
    lecturaYCarga (v,diml);
    mostrarVector(v,diml);
    ordenarVector(v,diml);
    mostrarVector(v,diml);
    analizarVector(v,diml);
    eliminarElementos(v,diml);
    mostrarVector(v,diml);
end.