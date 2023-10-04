{
1.- Implementar un programa que procese la información de los alumnos de la Facultad de 
Informática. 
a) Implementar un módulo que lea y retorne, en una estructura adecuada, la información de 
todos los alumnos. De cada alumno se lee su apellido, número de alumno, año de ingreso, 
cantidad de materias aprobadas (a lo sumo 36) y nota obtenida (sin contar los aplazos) en cada 
una de las materias aprobadas. La lectura finaliza cuando se ingresa el número de alumno 
11111, el cual no debe procesarse.
b) Implementar un módulo que reciba la estructura generada en el inciso a) y retorne número 
de alumno y promedio de cada alumno.
c) Analizar: ¿qué cambios requieren los puntos a y b, si no se sabe de antemano la cantidad de 
materias aprobadas de cada alumno, y si además se desean registrar los aplazos? ¿cómo 
puede diseñarse una solución modularizada que requiera la menor cantidad de cambios?
}

program ej1;

type
    str = string[20];

    vector = array [1..5] of real;

    alumno = record
        ape:str;
        num:integer;
        anioIng:integer;
        cantApro:integer;
        notas: vector;
    end;

    lista = ^nodo;
    nodo = record
        dato:alumno;
        sig:lista;
    end;

    procedure cargarLista (var l:lista);
        procedure inicializarVector (var v:vector; var diml:integer);
        var
            i:integer;
        begin
            for i:=1 to diml do begin
                v[i]:= 0;
            end;
        end;

        procedure agregarNodo (var l:lista; a:alumno);
        var
            ant,act,nue:lista;
        begin
            new(nue);
            nue^.dato:= a;
            nue^.sig:= nil;
            if (l = nil) then
                l:= nue
            else begin
                ant:= l; act:= l; 
                while (act <> nil) do begin
                    ant:= act;
                    act:= act^.sig;
                end;
                ant^.sig:= nue;
            end;
        end;

        procedure lectura (var a:alumno);
        var
            i:integer;
            nota:real;
        begin
            write('Ingrese el numero del alumno: ');readln(a.num);
            if (a.num <> 11111) then begin
                write('Ingrese el apellido del alumno: ');readln(a.ape);
                write('Ingrese el anio de ingreso: ');readln(a.anioIng);
                write('Ingrese la cantidad de materias aprobadas: ');readln(a.cantApro);
                inicializarVector(a.notas, a.cantApro);
                for i := 1 to a.cantApro do begin
                    write('Ingrese la nota ', i , ' :');readln(nota);
                    a.notas[i]:= nota;
                end;
            end;
        end;

    var
        a:alumno;
    begin
        l:= nil;
        lectura(a);
        while (a.num <> 11111) do begin
            agregarNodo(l,a);
            lectura(a);
        end;
    end;

    procedure mostrarLista(l:lista);
    var
        i:integer;
    begin
        while (l <> nil) do begin
            writeln('----------------------------------------------------------');
            writeln('Numero de alumno: ', l^.dato.num);
            writeln('Apellido: ', l^.dato.ape);
            writeln('Anio de ingreso: ', l^.dato.anioIng);
            writeln('Cantidad de materias aprobadas: ', l^.dato.cantApro);
            writeln('Notas: ');
            for i:=1 to l^.dato.cantApro do begin
                writeln ('Materia ', i , ' : ', (l^.dato.notas[i]):4:2);
            end;
            l:= l^.sig;
            writeln('----------------------------------------------------------');
        end;
    end;

    procedure incisoB (l:lista);
    var
        prom,total:real;
        i:integer;
    begin
        while (l<> nil) do begin
            total:= 0;
            prom:= 0;
            for i:=1 to l^.dato.cantApro do begin
                total := total + l^.dato.notas[i];
            end;
            prom := total / l^.dato.cantApro;
            writeln('----------------------------------------------------------');
            writeln('Numero de alumno: ', l^.dato.num);
            writeln('Promedio de notas: ', prom:4:2);
            writeln('----------------------------------------------------------');
            l:= l^.sig;
        end;
    end;

var
    l:lista;
begin
    cargarLista(l);
    mostrarLista(l);
    incisoB(l);
    {
    c) Analizar: ¿qué cambios requieren los puntos a y b, si no se sabe de antemano la cantidad de 
        materias aprobadas de cada alumno, y si además se desean registrar los aplazos? ¿cómo 
        puede diseñarse una solución modularizada que requiera la menor cantidad de cambios?
        Eliminar el vector y anadir una lista para guardar las notas y a la hora de sacar promedios se ve reflejado 
        el progreso de forma correcta del alumno.
    }
end.



