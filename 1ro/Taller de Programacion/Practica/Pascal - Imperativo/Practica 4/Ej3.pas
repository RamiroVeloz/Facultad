{
3. Una facultad nos ha encargado procesar la información de sus alumnos de la carrera XXX.
Esta carrera tiene 30 materias. Implementar un programa con:

a. Un módulo que lea la información de los finales rendidos por los alumnos y los
almacene en dos estructuras de datos.

i. Una estructura que para cada alumno se almacenen sólo código y nota de las
materias aprobadas (4 a 10). De cada final rendido se lee el código del alumno, el
código de materia y la nota (valor entre 1 y 10). La lectura de los finales finaliza con
nota -1. La estructura debe ser eficiente para buscar por código de alumno.

ii. Otra estructura que almacene para cada materia, su código y todos los finales
rendidos en esa materia (código de alumno y nota).

b. Un módulo que reciba la estructura generada en i. y un código de alumno y retorne los
códigos y promedios de los alumnos cuyos códigos sean mayor al ingresado.

c. Un módulo que reciba la estructura generada en i., dos códigos de alumnos y un valor
entero, y retorne la cantidad de alumnos con cantidad de finales aprobados igual al
valor ingresado para aquellos alumnos cuyos códigos están comprendidos entre los dos
códigos de alumnos ingresados.
}

program ej1;
const 
    dimf = 30;
type
    rangoM = 1..30;

    final = record
        codA:integer;
        codM:integer;
        nota:real;
    end;

    lista = ^nodoF;
    nodoF = record
        data:final;
        sig:lista;
    end;

    alumno = record
        codA:integer;
        finales:lista;
    end;

    arbol = ^nodoA;
    nodoA = record
        data:alumno;
        hi:arbol;
        hd:arbol;
    end;

    vector = array [rangoM] of lista;



    procedure inicializarVector (var v:vector);
    var
        i:integer;
    begin
        for i:=1 to dimf do
            v[i]:= nil;
    end;

    procedure cargarAlumnos (var a:arbol; var v:vector);
        procedure agregarNota (var l:lista; fin:final );
        var
            ant,act,nue:lista;
        begin
            new(nue);
            nue^.data:= fin;
            nue^.sig:= nil;
            if (l = nil) then
                l := nue
            else begin
                ant:= l;
                act:= l;
                while (act <> nil) and (act^.data.nota < nue^.data.nota) do begin
                    ant:= act;
                    act:= act^.sig;
                end;
                if (ant = act) then begin
                    nue^.sig:= l;
                    l:= nue;
                end
                else begin
                    ant^.sig:= nue;
                    nue^.sig:= act;
                end;
            end;
        end;

        procedure agregarAlumno (var a:arbol; f:final);
        begin
            if (a = nil) then begin
                new(a);
                a^.data.codA:= f.codA;
                a^.data.finales := nil;
                a^.hi := nil; a^.hd:= nil;
                if (f.nota >=4) and (f.nota <= 10) then
                    agregarNota(a^.data.finales, f);
            end
            else if (a^.data.codA = f.codA) then begin
                if (f.nota >=4) and (f.nota <= 10) then
                    agregarNota(a^.data.finales, f);
            end
            else if (a^.data.codA > f.codA) then
                agregarAlumno(a^.hi,f)
            else
                agregarAlumno(a^.hd,f);
        end;

        procedure lectura (var fin:final);
        begin
            write('Ingrese el codigo del alumno: ');readln(fin.codA);
            write('Ingrese el codigo de la materia: ');readln(fin.codM);
            write('Ingrese la nota del alumno: ');readln(fin.nota);
            writeln();
        end;

        

    var
        f:final;
    begin
        lectura(f);
        if (f.nota <> -1) then begin
            agregarAlumno(a,f);
            agregarNota (v[f.codM], f);
            cargarAlumnos(a,v);
        end;
    end;

    procedure mostrarLista (l:lista);
    begin
        if (l <> nil) then begin
            writeln ('Codigo de alumno: ', l^.data.codA, ' | ', 'Codigo de materia: ', l^.data.codM, ' | ', 'Nota: ', l^.data.nota:4:2);
            writeln();
            mostrarLista(l^.sig);
        end;
    end;

    procedure mostrarAlumnos (a:arbol);
    begin
        if (a <> nil) then begin
            mostrarAlumnos (a^.hi);
            writeln('Codigo de Alumno: ', a^.data.codA);
            writeln('Notas: ');
            mostrarLista(a^.data.finales);
            writeln();
            mostrarAlumnos (a^.hd);
        end;
    end;
    

    procedure mostrarFinales (v:vector);
    var
        i:integer;
    begin
        for i:=1 to dimf do begin
            if (v[i] <> nil) then begin
                writeln ('Materia: ', i , ' | ', 'Finales:');
                writeln();
                mostrarLista(v[i]);
                writeln();
            end;
        end;
    end;
    
    {
    b. Un módulo que reciba la estructura generada en i. y un código de alumno y retorne los
    códigos y promedios de los alumnos cuyos códigos sean mayor al ingresado.
    }

    procedure retornarCodigos (a:arbol);
        function obtenerCant (l:lista):integer;
        begin
            if (l = nil) then
                obtenerCant:= 0
            else 
                obtenerCant := obtenerCant (l^.sig) + 1;
        end;

        function obtenerSuma (l:lista):real;
        begin
            if (l = nil) then
                obtenerSuma := 0
            else
                obtenerSuma:= l^.data.nota + obtenerSuma (l^.sig);
        end;

        procedure buscar (a:arbol; cod:integer);
        var
            prom,suma:real;
            cant:integer;
        begin
            if (a <> nil) then begin
                if (cod < a^.data.codA) then begin
                    suma := obtenerSuma (a^.data.finales);
                    cant := obtenerCANT (a^.data.finales);
                    if (cant > 0) then 
                        prom := suma / cant
                    else
                        prom:= 0;
                    writeln ('Codigo de alumno : ', a^.data.codA, ' | ', 'Promedio: ', prom:4:2);
                    buscar(a^.hi,cod);
                    buscar(a^.hd,cod);
                end;
                if (cod >= a^.data.codA) then
                	buscar (a^.hd,cod);
            end;
        end;
    var
        cod:integer;
    begin
        write('Ingrese un codigo: ');readln(cod);
        buscar(a,cod);
    end;

    {
    c. Un módulo que reciba la estructura generada en i., dos códigos de alumnos y un valor
    entero, y retorne la cantidad de alumnos con cantidad de finales aprobados igual al
    valor ingresado para aquellos alumnos cuyos códigos están comprendidos entre los dos
    códigos de alumnos ingresados.
    }

    procedure retornarIguales (a:arbol);
        function retornarCant (l:lista):integer;
        begin
            if (l = nil) then
                retornarCant:= 0
            else
                retornarCant := retornarCant(l^.sig) + 1;
        end;

        function encontrarIguales (a:arbol; cod1,cod2:integer; num:integer):integer;
        var
            act : integer;
        begin
            act:= 0;
            if (a = nil) then 
                encontrarIguales := 0
            else begin
                if (a^.data.codA >= cod1) then begin
                    if (a^.data.finales <> nil) then
                            act := retornarCant(a^.data.finales);
                    if (a^.data.codA <= cod2) and (act = num) then begin
                        encontrarIguales := 1 + encontrarIguales(a^.hi,cod1,cod2,num) + encontrarIguales(a^.hd,cod1,cod2,num) ;
                    end
                    else 
                        encontrarIguales:= encontrarIguales (a^.hi,cod1,cod2,num);
                end
                else
                    encontrarIguales := encontrarIguales(a^.hd,cod1,cod2,num);
            end;
        end;

    var
        cod1,cod2:integer;
        num:integer;
        cant:integer;
    begin
        write('Ingrese un numero base: ');readln(cod1);
        write('Ingrese un numero tope: ');readln(cod2);
        write('Ingrese un numero para comparar: ');readln(num);
        if (a = nil) then
            writeln('Arbol vacio.')
        else begin
            if (cod1 > cod2) then
                cant := encontrarIguales (a,cod2,cod1,num)
            else
                cant := encontrarIguales (a,cod1,cod2,num);
            writeln('La cantidad de alumnos cuya cantidad de finales aprobados');
            writeln('es igual al numero ingresado es: ', cant);
        end;
    end;


var
    a:arbol;
    v:vector;
begin
    a:= nil;
    inicializarVector(v);
    cargarAlumnos(a,v);
    mostrarAlumnos(a);
    retornarCodigos(a);
    //mostrarFinales(v);
    retornarIguales(a);
end.

