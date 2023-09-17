{
    3. Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes. Para ello,
cuenta con información sobre todos los viajes realizados durante el mes de marzo. De cada viaje se cuenta
con la siguiente información: día del mes (de 1 a 31), monto de dinero transportado y distancia recorrida
por el camión (medida en kilómetros).
a. Realizar un programa que lea y almacene la información de los viajes (a lo sumo 200). La lectura finaliza
cuando se ingresa una distancia recorrida igual a 0 km, que no debe procesarse.
b. Realizar un módulo que reciba el vector generado en a) e informe:
- El monto promedio transportado de los viajes realizados
- La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
- La cantidad de viajes realizados cada día del mes.
c. Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia
recorrida sea igual a 100 km.
Nota: para realizar el inciso b, el vector debe recorrerse una única vez.
}

program ej3;

const   
    dias = 31;
    dimf = 200;

type
    rangoDias = 1..dias;
    rangoVec = 1..dimf;

    viajeTransporte = record  
        dia: rangoDias;
        montoTrans : real;
        distanciaRec : real;
    end;

    vector = array [rangoVec] of viajeTransporte;
    vectorContador = array [rangoDias] of integer;

    procedure cargaYAnalisis ();

        procedure inicializarVector (var vc:vectorContador);
        var
            i:integer;
        begin
            for i:= 1 to dias do
                vc[i] := 0;
        end;

        procedure lectura (var vt:viajeTransporte);
        begin
            write ('Ingrese el dia en que se realizo el viaje: '); readln (vt.dia);
            write ('Ingrese el monto que se transfirio: '); readln (vt.montoTrans);
            write ('Ingrese la distancia recorrida: '); readln(vt.distanciaRec);
        end;

        procedure cargarVector (var v:vector; var vc:vectorContador ; var diml:integer);
        var
            vt:viajeTransporte;
        begin
            diml:= 0;
            lectura (vt);
            while (diml < dimf) and (vt.distanciaRec <> 0) do begin
                if (diml <= dimF) and (vt.distanciaRec <> 0) then begin
                    diml:= diml + 1;
                    vc[vt.dia] := vc[vt.dia] +1;
                    v[diml]:= vt;
                end;
                lectura(vt);
            end;
        end;

        procedure mostrarVector (v:vector ; diml:integer);
        var
            i:integer;
        begin
            for i:= 1 to diml do begin 
                writeln ('----------------------------------');
                writeln ('Recorrido ', i , ' : ');
                writeln ('Dia: ', v[i].dia);
                writeln ('Monto trasladado: ', v[i].montoTrans:4:2);
                writeln ('Distancia recorrida: ', v[i].distanciaRec:4:2);
                writeln ('----------------------------------');
            end;
        end;

        procedure mostrarDias (vc:vectorContador);
        var
            i:integer;
        begin
            for i:=1 to dias do
                writeln ('En el dia ', i , ' se realizaron un total de ', vc[i], ' viajes.');
        end;

        procedure calcularMin (var diaMin:rangoDias; var distanciaMin, montoMin:real ; dia:integer; distancia,monto:real);
        begin
            if (montoMin < monto) then begin
                diaMin := dia;
                montoMin := monto;
                distanciaMin := distancia;
            end;
        end;

        procedure procesarVector (v:vector; diml:integer);
        var
            total, prom,distanciaMin, montoMin :real;
            i:integer;
            diaMin: rangoDias;
        begin
            montoMin := 19999;
            distanciaMin := 19999;
            total:= 0;
            for i:= 1 to diml do begin
                total := v[i].montoTrans + total;
                calcularMin(diaMin, distanciaMin, montoMin, v[i].dia, v[i].distanciaRec, v[i].montoTrans);
            end;
            prom:= total / diml;
            writeln ('El precio promedio de los transportes es: ', prom:4:2);
            writeln ('El dia ', diaMin, ' fue el dia con el menor monto transportado ( ', montoMin:4:2 ,' ) y con una distancia recorrida de ', distanciaMin:4:2 , 'km.');
        end;



        procedure eliminarDelVector (var v:vector;  var diml:integer);
        var
            i,pos:integer;
        begin
            for i := 1 to diml -1 do begin
                pos:= i;
                if (v[i].distanciaRec = 100 ) then
                    for pos := i to diml do begin
                        v[pos] := v[pos +1];
                    end;
            end;
            writeln('Los viajes con recorrido menor a 100km estan eliminados del vector. ');
        end;


        var
            v:vector;
            diml:integer;
            vc:vectorContador;
        begin
            inicializarVector(vc);
            cargarVector(v,vc,diml);
            mostrarVector(v,diml);
            mostrarDias(vc);
            procesarVector (v,diml);
            eliminarDelVector(v,diml);
            mostrarVector (v,diml);
        end;

begin
    cargaYAnalisis();
end.