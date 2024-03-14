{
4. Una cátedra dispone de información de sus alumnos (a lo sumo 1000). De cada alumno se conoce nro de
alumno, apellido y nombre y cantidad de asistencias a clase. Dicha información se encuentra ordenada por
nro de alumno de manera ascendente. Se pide:
a. Un módulo que retorne la posición del alumno con un nro de alumno recibido por parámetro. El
alumno seguro existe.
b. Un módulo que reciba un alumno y lo inserte en el vector.
c. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine.
d. Un módulo que reciba un nro de alumno y elimine dicho alumno del vector
e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.
Nota: Realizar el programa principal que invoque los módulos desarrollados en los incisos previos con datos
leídos de teclado.
}

program ej4;

const
    dimf = 5;
    limitestr = 20;
type
    
    str = string[limitestr];
    rango = 1..dimf;

    alumno = record
        nro:integer;
        ape: str;
        nom:str;
        cantas : integer;
    end;

    vector = array [rango] of alumno;

    procedure calculoYAnalisis ();
        procedure lectura (var a:alumno);
        begin
            write ('Ingrese el numero del alumno :'); readln (a.nro);
            write ('Ingrese el apellido: '); readln (a.ape);
            write ('Ingrese el nombre: '); readln (a.ape);
            write ('Ingrese la cantidad de asistencias: ');readln (a.cantas);
        end;

        procedure cargarDatos (var v:vector; var diml:integer);
        var
            a:alumno;
        begin
            diml := 0;
            lectura (a);
            while (diml < dimF) and (a.nro <> 0) do begin
                if (a.nro <> 0 ) and (diml <= dimf) then begin
                    diml:= diml + 1;
                    v[diml]:= a;
                end;
                lectura (a);
            end;
        end;

        procedure ordenarVector (var v:vector; diml:integer);
        var
            i,j:integer;
            aux : alumno;
        begin
            writeln ('Ordenando vector....');
            for i := 1 to diml do
                for j := 1 to diml -1 do begin
                    if (v[j].nro > v[j+1].nro) then begin
                        aux := v[j+1];
                        v[j+1]:= v[j];
                        v[j] := aux;
                    end;
                end;
            writeln ('Vector ordenado por nro. de alumno.');
        end;

        procedure mostrarVector (v:vector; diml:integer);
        var
            i:integer;
        begin
            for i:=1 to diml do begin
                writeln('------------------------------------------');
                writeln('Nro. del alumno: ', v[i].nro);
                writeln('Apellido del alumno: ', v[i].ape);
                writeln('Nombre del alumno: ', v[i].nom);
                writeln('Cantidad de asistencias: ', v[i].cantas);
                writeln('------------------------------------------');
            end;
        end;

        procedure agregarAlumno (var v:vector ; diml:integer);
        var
            a:alumno;
        begin
            lectura(a);
            if (diml < dimf) and  (a.nro <> 0) then begin
                diml:= diml + 1;
                v[diml] := a;
            end; 
        end;

        procedure buscarYEliminarPorPosicion (var v:vector; var diml:integer);
        var 
            i,pos:integer;
        begin
            write('Ingrese la posicion del alumno para buscar: ');readln(pos);
                if ( pos < diml ) then begin
                    for i:=pos to diml do 
                        v[i] := v[i+1];
                end;
        end;

        procedure buscarYEliminarPorNumero (var v:vector; var diml:integer);
        var 
            pos,num,i,j:integer;
        begin
            write('Ingrese un numero de alumno para buscar: ');readln(num);
            for i:= 1 to diml do begin
                pos := i;
                if ( pos < diml ) and (v[i].nro = num ) then begin
                    for j:= pos to diml do 
                        v[i] := v[i+1];
                end;
            end;
        end;

        procedure buscarYEliminarPorAsistencia (var v:vector; var diml:integer);
        var 
            i,pos:integer;
        begin
            writeln('Se eliminaran del vector los alumnos con 0 asistencias.');
                for i:= 1  to diml do begin
                    pos := i;
                    if (pos < diml) and (v[i].cantas = 0) then
                        v[pos] := v[pos+1];
                end;
        end;


        var
            v:vector;
            diml:integer;
        begin
            cargarDatos(v,diml);
            ordenarVector(v,diml);
            mostrarVector(v,diml);
            buscarYEliminarPorPosicion(v,diml);
            mostrarVector(v,diml);
            buscarYEliminarPorNumero(v,diml);
            mostrarVector(v,diml);
            buscarYEliminarPorAsistencia(v,diml);
            mostrarVector(v,diml);
        end;

begin
    calculoYAnalisis();
end.