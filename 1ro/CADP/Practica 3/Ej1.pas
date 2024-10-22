{a. Completar el programa principal para que lea información de alumnos (código, nombre, promedio) e informe
la cantidad de alumnos leídos. La lectura finaliza cuando ingresa un alumno con código 0, que no debe
procesarse. Nota: utilizar el módulo leer.
b. Modificar al programa anterior para que, al finalizar la lectura de todos los alumnos, se informe también el
nombre del alumno con mejor promedio.}


program Registros;

type

    str20 = string[20];
    alumno = record
        codigo : integer;
        nombre : str20;
        promedio : real;
    end;

    procedure cargaYAnalisisDatos();

        procedure leer(var alu : alumno);
        begin
        write('Ingrese el codigo del alumno: ');readln(alu.codigo);
            if (alu.codigo <> 0) then begin
                write('Ingrese el nombre del alumno: ');readln(alu.nombre);
                write('Ingrese el promedio del alumno: ');readln(alu.promedio);
        end;
        end;

        procedure calcularMax (var nomMax:string; var promMax:real; prom:real; nom:string);
        begin
            if (prom> promMax) then 
            begin
                promMax := prom;
                nomMax := nom;
            end;
        end;

    var
        contador: integer;
        a:alumno;
        nomMax:string;
        promMax: real;
    begin
        contador:=0;
        leer(a);
        while (a.codigo <> 0) do begin
            contador := contador +1;
            calcularMax (nomMax, promMax, a.promedio, a.nombre);
            leer(a);
        end;
        writeln('La cantidad de alumnos leidos es: ', contador);
        writeln ('El alumno ', nomMax , ' es quien tiene el mayor promedio, el cual es: ', promMax:4:1);
    end;

    { declaración de variables del programa principal }

begin
    cargaYAnalisisDatos();
end.    