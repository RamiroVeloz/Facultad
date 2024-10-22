{
15. La cátedra de CADP está organizando la cursada para el año 2019. Para ello, dispone de una lista con
todos los alumnos que cursaron EPA. De cada alumno se conoce su DNI, apellido, nombre y la nota obtenida.
Escribir un programa que procese la información de alumnos disponible y los distribuya en turnos utilizando
los siguientes criterios:
- Los alumnos que obtuvieron al menos 8 en EPA deberán ir a los turnos 1 ó 4.
- Los alumnos que obtuvieron entre 5 y 8 deberán ir a los turnos 2, 3 ó 5.
- Los alumnos que no alcanzaron la nota 5 no se les asignará turno en CADP.
Al finalizar, el programa debe imprimir en pantalla la lista de alumnos para cada turno.
Nota: La distribución de alumnos debe ser lo más equitativa posible.
}

program prac;

const 
    turnos = 5;

type
    str = string[20];
    rango = 1..turnos;

    alumno = record
        dni:integer;
        apellido:str;
        nombre:str;
        nota:integer;
    end;

    listaAlu = ^nodo2;
    nodo2 = record
        dato: alumno;
        sig:listaAlu;
    end;

    lista = ^nodo;
    nodo = record
        dato:alumno;
        sig:lista;
    end;

    lvec = record
        diml:integer;
        l:lista;
    end;

    vector = array [rango] of lvec;

    procedure cargaAlumnos (var la:listaAlu);
        procedure lectura (var a:alumno);
        begin
            write('Ingrese el dni: ');readln(a.dni);
            if (a.dni <> -1) then begin
                write('Ingrese el apellido: ');readln(a.apellido);
                write('Ingrese el nombre: ');readln(a.nombre);
                write('Ingrese la nota: ');readln (a.nota);
            end;
        end;
        procedure agregarFinal (var la:listaAlu; a:alumno);
        var
            nue:listaAlu;
            ant,act:listaAlu;
        begin
            new(nue);
            nue^.dato:=a;
            nue^.sig:=nil;
            if (la = nil) then
                la := nue
            else
            begin
                ant:=la; act:= la;
                while (act <> nil) do begin
                    ant:= act;
                    act := act^.sig;
                end;
                ant^.sig:= nue;
            end;
        end;

    var
        a:alumno;
    begin
        lectura (a);
        while (a.dni <> -1) do begin
            agregarFinal (la, a);
            lectura(a);
        end;
    end;

    procedure inicializarVector (var v:vector);
    var
        i:rango;
    begin
        for i:= 1 to turnos do begin
            v[i].diml:= 0;
            v[i].l:=nil;
        end;
    end;


    procedure analizarLista (var v:vector; la:listaAlu);
    
        procedure agregarFinal2 (var l:lista; a:alumno);
        var
            nue:lista;
            act,ant:lista;
        begin
            new(nue);
            nue^.dato:=a;
            nue^.sig :=nil;
            if (l=nil) then
                l:=nue
            else begin
                ant:= l;
                act:= l;
                while (act<>nil) do begin
                    ant:=act;
                    act:= act^.sig;
                end;
                ant^.sig:= nue;
            end;
        end;
    begin
        while (la <> nil) do begin
            if (la^.dato.nota > 7) then begin
                if (v[1].diml = v[4].diml) then begin
                    agregarFinal2(v[1].l, la^.dato);
                    v[1].diml := v[1].diml + 1;
                end
                else if (v[1].diml > v[4].diml) then begin
                    agregarFinal2(v[4].l,la^.dato);
                    v[4].diml:= v[4].diml + 1;
                end;
            end;
            if (la^.dato.nota <=8) and (la^.dato.nota >=5) then begin
                if (v[2].diml = v[3].diml) and (v[2].diml = v[5].diml) and (v[3].diml = v[5].diml) then begin
                    agregarFinal2 (v[2].l, la^.dato);
                    v[2].diml := v[2].diml +1;
                end
                else if (v[2].diml <> v[3].diml) and (v[2].diml = v[5].diml) then begin
                    agregarFinal2 (v[3].l, la^.dato);
                    v[3].diml:= v[3].diml + 1;
                end
                else if (v[2].diml = v[3].diml) and (v[2].diml <> v[5].diml) then begin
                    agregarFinal2 (v[5].l, la^.dato);
                    v[5].diml:= v[5].diml + 1;
                end;
            end;
            la:= la^.sig;
        end;
    end;
var
    la:listaAlu;
    v:vector;
begin
    cargaAlumnos(la);
    inicializarVector(v);
    analizarLista(v,la);
end.