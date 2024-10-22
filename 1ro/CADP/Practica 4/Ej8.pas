{
8. Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad de
Informática de la UNLP en el año 2020. De cada alumno se lee: nro de inscripción, DNI, apellido, nombre y
año de nacimiento. Una vez leída y almacenada toda la información, calcular e informar:
a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
b) Apellido y nombre de los dos alumnos de mayor edad.
}

program ej8;

const
    dimf = 4 ;
    limitestr = 20;
type
    rango = 0..dimf;
    str = string [limitestr];

    alumno = record
        nro:integer;
        dni:integer;
        ape:str;
        nom:str;
        an: integer;
    end;
    vector = array [rango] of alumno;

    procedure cargaYAnalisis ();
        procedure lectura (var a:alumno);
        begin
            write('Ingrese el numero de inscripcion del alumno: ');readln (a.nro);
            write('Ingrese el dni: ');readln (a.dni);
            write('Ingrese el apellido: ');readln (a.ape);
            write('Ingrese el nombre: ');readln (a.nom);
            write('Ingrese el anio de nacimiento: ');readln (a.an);
            write ();
        end;

        procedure carga (var v:vector);
        var
            i:integer;
            a:alumno;
        begin
            for i:= 0 to dimF do begin
                lectura(a);
                v[i]:= a;
            end;
        end;

        procedure descomponer (var cant:integer; num:integer);
        var
            digito:integer;
            check:boolean;
        begin
            check:=true;
            while (check = true ) and (num <> 0) do begin
                digito := num mod 10;
                if (digito mod 2 <> 0) then
                    check := false;
                num := num div 10;
            end;
            cant:= cant + 1
        end;

        procedure calcularMax (var e1,e2:integer; var a1,a2,n1,n2:str; edad:integer; ap,nom:str);
        begin
            if (e1 > edad) then
            begin
                e2:= e1;
                a2:= a1;
                n2:= n1;
                e1:= edad;
                a1:= ap;
                n1:= nom;
            end
            else if (e2 > edad) then
            begin
                e2:= edad;
                a2:= ap;
                n2:= nom;
            end;
        end;

        procedure analisis (v:vector);
        var
            cant,i,e1,e2:integer;
            porcentaje: real;
            a1,a2,n1,n2:str;
        begin
            e1:= 9999;
            e2:= 9999;
            for i:= 0 to dimF do begin
                descomponer (cant, v[i].dni);
                calcularMax (e1,e2,a1,a2,n1,n2,v[i].an,v[i].ape, v[i].nom)
            end;
            porcentaje := (dimF / cant) * 100; 
            writeln('El porcentaje de alumnos con dni solo compuesto por numeros pares es: ', porcentaje:4:2);
            writeln('Los dos alumnos con mayor edad son: ');
            writeln (a1, ' ', n1 , ' nacido en ' , e1);
            writeln (a2, ' ', n2 , ' nacido en ' , e2);

        end;

        var
            v:vector;
        begin
            carga(v);
            analisis(v);
        end;

begin
    cargaYAnalisis();
end.