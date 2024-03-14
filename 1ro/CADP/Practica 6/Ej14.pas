program ej14;

const
    dias = 31;
    cantalu = 1300;
    limitestr = 50;
    medios = 5;

type
    rangodias = 1..dias;
    rangoalu = 1..cantalu;
    str = string [limitestr];
    rangomedios = 1..medios;

    viaje = record
        cod : integer;
        dia : rangodias;
        fac : str;
        medio: rangomedios;
    end;

    lista = ^nodo;
    nodo = record
        dato:viaje;
        sig:lista;
    end;

    vector = array [rangodias] of lista;
    vectormedios = array [rangomedios] of integer;
    vectorprecios = array [rangomedios] of real;


    procedure cargaYAnalisis ();

        procedure inicializarVectorListas (var v:vector);
        var
            i:integer;
        begin
            for i:= 1 to dias do
                v[i] := nil;
        end;

        procedure inicializarVectorMedios (var vm:vectorMedios);
        var
            i:integer;
        begin
            for i:= 1 to medios do
                vm[i]:= 0;
        end;

        procedure inicializarVectorPrecios (var vp:vectorprecios);
        var
            i:integer;
        begin
            for i:=1 to medios do
                vp[i]:= vp[i] * 10;
        end;

        procedure lectura (var va:viaje);
        begin
            write('Ingrese el codigo del alumno: ');readln (va.cod);
            if (va.cod <> -1 ) then begin
                write('Ingrese el dia: ');readln(va.dia);
                //write('Ingrese la facultad: ');readln(va.fac);
                write('Ingrese el medio de transporte (1. colectivo urbano; 2. colectivo interurbano; 3. tren universitario; 4. tren Roca; 5. bicicleta): ');readln(va.medio);
            end;
        end;

        procedure agregarOrdenado (var l:lista; va:viaje);
        var
            nue,act,ant:lista;
        begin
            new(nue);
            nue^.dato:= va;
            nue^.sig:= nil;
            if (l = nil) then
                l:= nue
            else begin
                act:= l;
                ant:= l;
                while (act <> nil) and (act^.dato.cod < va.cod) do begin
                    ant:= act;
                    act:= act^.sig;
                end;
                if (act = ant) then begin   
                    nue^.sig := l;
                    l:= nue;
                end
                else begin
                    ant^.sig:= nue;
                    nue^.sig:= act;
                end;
            end;
        end;

        procedure cargaDatos (var v:vector);
        var
            va:viaje;
        begin
            lectura(va);
            while (va.cod <> -1) do begin
                if( va.cod <> -1 ) then
                    agregarOrdenado(v[va.dia],va);
                lectura(va);
            end;
        end;

        procedure mostrarVectorLista (v:vector);
        var
            i:integer;
        begin
            for i:= 1 to dias do begin
                if (v[i] <> nil) then begin
                    writeln('----------------------------------------');
                    writeln('Dia: ', i);
                    while (v[i] <> nil) do begin 
                        writeln('Codigo del alumno: ', v[i]^.dato.cod);
                        writeln('Medio utilizado: ', v[i]^.dato.medio);
                        v[i]:= v[i]^.sig;
                    end;
                    writeln('----------------------------------------');
                end;
            end;
        end;

        procedure mediosMax (vm:vectormedios);
        var
            i,m1,m2,c1,c2:integer;
        begin
            m1:= 0;
            m2:= 0;
            c1:= 0;
            c2:= 0;
            for i:= 1 to medios do
                if (vm[i] > m1) then begin
                    m2 := m1;
                    c2 := c1;
                    m1:= i;
                    c1 := vm[i];
                end
                else if (vm[i] > m2) then begin
                    m2:= i;
                    c2 := vm[i];
                end;
            writeln('Los dos medios mas utilizados son: ');
            writeln('El medio ', m1, ' con un total de ', c1, ' viajes en el.');
            writeln('El medio ', m2 , ' con un total de ', c2, ' viajes en el.')
        end;

        procedure analizarVector (v:vector);
        var
            cantvact,cantvtot,cantgastotot,cantcomb,act,i:integer;
            gastoact:real;
            vm: vectormedios;
            vp:vectorprecios;
            chcomb,chbici:boolean;
        begin
            cantvtot:= 0;
            cantgastotot:= 0;
            cantcomb:= 0;
            inicializarVectorPrecios(vp);
            inicializarVectorMedios(vm);
            for i:= 1 to dias do begin
                if (v[i] <> nil ) then begin
                    while (v[i] <> nil  ) do begin
                        act := v[i]^.dato.cod;
                        cantvact:=0;
                        gastoact:= 0;
                        while (v[i] <> nil) and (v[i]^.dato.cod = act) do begin
                            cantvact := cantvact + 1;
                            vm[v[i]^.dato.medio] := vm[v[i]^.dato.medio] + 1;
                            gastoact := gastoact + (vp[v[i]^.dato.medio]);
                            if (v[i]^.dato.medio = 5) then
                                chbici := true;
                            if (v[i]^.dato.medio <> 5) then
                                chcomb := true
                            v[i]:= v[i]^.sig
                        end;
                        if (cantvact > 6) then
                            cantvtot:= cantvtot + 1;
                        if (gastoact > 80) then
                            cantgastotot:= cantgastotot + 1;
                        if (chbici and chcomb) then
                            cantcomb:= cantcomb + 1;
                    end;
                end;
            end;
            writeln('La cantidad de alumnos que realizan mas de 6 viajes por dia son: ', cantvtot);
            writeln('La cantidad de alumnos que gastan mas de $80 por dia son: ', cantgastotot);
            writeln ('La cantidad de alumnos que combinan bici con otros medios de transporte es: ', cantcomb);
            mediosMax (vm);
        end;

    var
        v:vector;
    begin
        inicializarVectorListas(v);
        cargaDatos(v);
        mostrarVectorLista(v);
        analizarVector(v);
    end;

begin
    cargaYAnalisis();
end.
