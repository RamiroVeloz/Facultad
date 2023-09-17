{
    3. El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la provincia de Bs. As,
con el objetivo de evaluar si se cumple la proporción de alumnos por docente calculada por la UNESCO para el año
2015 (1 docente cada 23,435 alumnos). Para ello, se cuenta con información de: CUE (código único de
establecimiento), nombre del establecimiento, cantidad de docentes, cantidad de alumnos, localidad. Se pide
implementar un programa que procese la información y determine:
● Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO.
● CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos.
El programa debe utilizar:
a) Un módulo para la lectura de la información de la escuela.
b) Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente entre la cantidad
de alumnos y la cantidad de docentes).
}

program ej3;

const
    limiteString = 50;
    unesco = 23.435;
type
    rangoString = string [limiteString];

    escuela = record 
        cue:integer;
        establecimiento: rangoString;
        cantDoc: integer;
        cantAl: integer;
        localidad: rangoString;
        relacionAD: real;
    end;

    procedure cargaYAnalisis ();
        
        procedure lectura (var e:escuela);
        begin
            write('Ingrese CUE (Codigo Unico de Establecimiento): ');readln(e.cue);
            if (e.cue <> -1) then 
            begin
                write ('Ingrese el nombre del establecimiento: ');readln(e.establecimiento);
                write('Ingrese la cantidad de docentes: ');readln (e.cantDoc);
                write('Ingrese la cantidad de alumnos: '); readln (e.cantAl);
                write ('Ingrese la localidad: ');readln(e.localidad);
                if (e.cantDoc > 0) then
                    e.relacionAD := e.cantAl div e.cantDoc
                else
                    e.relacionAD := 0;
            end;
        end;

        procedure calcularMax (var cueMax1,cueMax2:integer; var nomMax1,nomMax2:rangoString; var relMax1,relMax2:real; cue:integer; nom:rangoString; rel:real );
        begin
            if (rel > relMax1) and (cue <> cueMax1) then 
            begin
                relMax2:= relMax1;
                cueMax2:= cueMax1;
                nomMax2:= nomMax1;
                nomMax1:= nom;
                cueMax1:= cue;
                relMax1:= rel; 
            end
            else if (rel > relMax2) and (cue <> cueMax2) then
            begin
                relMax2:= rel;
                cueMax2:= cue;
                nomMax2:= nom;
            end; 
        end;

    var
        e:escuela;

        cantlp:integer;

        cueMax1,cueMax2:integer;
        nomMax1,nomMax2:rangoString;
        relMax1,relMax2:real;

    begin

        cantlp:= 0;
        relMax1:= 0;
        relMax2:= 0;
        lectura(e);
        while (e.cue <> -1) do
        begin
            if (e.localidad = 'la plata') and (e.relacionAD > unesco) then
                cantlp:= cantlp +1 ;
            calcularMax (cueMax1,cueMax2,nomMax1,nomMax2,relMax1,relMax2,e.cue,e.establecimiento,e.relacionAD);
            lectura(e);
        end;

        writeln ('La cantidad de escuelas de La Plata que superan el promedio de UNESCO es de: ', cantlp);
        writeln('Las dos escuelas con mejor relacion entre alumnos y docentes es: ', nomMax1 , 'con un promedio de ', relMax1:4:3);writeln ('y la escuela ', nomMax2, ' con un promedio de ', relMax2:4:3);


    end;


begin
    cargaYAnalisis();
end.