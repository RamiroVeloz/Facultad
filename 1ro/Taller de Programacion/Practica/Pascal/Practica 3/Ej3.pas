{
3. Implementar un programa que contenga:





f. Un módulo que reciba la estructura generada en a. y un valor entero. Este módulo debe
retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.

}

program ej3;

type

    materia = record
        cod:integer;
        nota:real;
    end;
    
    lista = ^nodo;
    nodo = record
        data:materia;
        sig:lista;
    end;

    alumno = record
        legajo :integer;
        dni:integer;
        ing:integer;
        notas:lista;
    end;

    

    arbol = ^nodoA;
    nodoA = record  
        data:alumno;
        hi:arbol;
        hd:arbol;
    end;


{
a. Un módulo que lea información de alumnos de Taller de Programación y los almacene en
una estructura de datos. De cada alumno se lee legajo, DNI, año de ingreso y los códigos y
notas de los finales rendidos. La estructura generada debe ser eficiente para la búsqueda por
número de legajo. La lectura de los alumnos finaliza con legajo 0 y para cada alumno el ingreso
de las materias finaliza con el código de materia -1.
}
    procedure cargarAlumnos (var a:arbol);
        procedure agregarNota (var l:lista; m:materia);
        var
            ant,act,nue:lista;
        begin
            new(nue);
            nue^.data := m;
            nue^.sig:= nil;
            if (l = nil) then
                l:= nue
            else begin
                ant:= l; act := l;
                while (act <> nil) and (act^.data.cod > nue^.data.cod) do begin
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

        procedure agregarAlumno (var a:arbol; alu:alumno);
        begin
            if (a = nil) then begin
                new(a);
                a^.data := alu;
                a^.hi:=nil; a^.hd := nil;
            end
            else if (a^.data.legajo > alu.legajo) then
                agregarAlumno(a^.hi, alu)
            else
                agregarAlumno (a^.hd,alu);
        end;

        procedure leerNota (var l:lista;var m:materia );
        
        begin
            write('Ingrese el codigo de la materia: ');readln(m.cod);
            if (m.cod <> -1) then begin
                m.nota := random (9)+1;
                agregarNota (l,m);
                leerNota(l,m);
            end;
        end;


        procedure leerAlumno (var alu:alumno; var m:materia);
        begin
            write('Ingrese el legajo del alumno: ');readln(alu.legajo);
            if (alu.legajo <> 0) then begin
                alu.notas := nil;
                alu.dni := random (1000)+1;
                alu.ing := random (2022)+1;
                leerNota (alu.notas,m);
            end;
        end;

    var
        alu:alumno;
        m:materia;
    begin
        leerAlumno (alu,m);
        if (alu.legajo <> 0) then begin
            agregarAlumno(a,alu);
            cargarAlumnos(a);
        end;
    end;

    procedure mostrarAlumnos (a:arbol);
        procedure mostrarNotas (l:lista);
        begin
            if (l <> nil) then begin
                writeln('Codigo de la materia: ', l^.data.cod, ' | ', 'Nota: ', l^.data.nota:4:2);
                mostrarNotas(l^.sig);
            end;
        end;
    begin
        if (a <> nil) then begin
            mostrarAlumnos (a^.hi);
            writeln('----------------------------------------------------------------------------');
            writeln('Legajo: ', a^.data.legajo, ' | ','DNI: ', a^.data.dni, ' | ', 'Ingreso en: ', a^.data.ing);
            writeln('Estas son sus notas: ');
            mostrarNotas (a^.data.notas);
            writeln('----------------------------------------------------------------------------');
            mostrarAlumnos(a^.hd);
        end;
    end;

    {
    b. Un módulo que reciba la estructura generada en a. y retorne los DNI y año de ingreso de
    aquellos alumnos cuyo legajo sea inferior a un valor ingresado como parámetro.
    }
    procedure retornarLegajos (a:arbol);
        procedure mostrarValores (a:arbol; num:integer);
        begin
            if (a <> nil) then begin
                if (num > a^.data.legajo ) then begin
                    writeln('DNI: ', a^.data.dni, ' | ', 'Ingreso en: ', a^.data.ing);
                    mostrarValores (a^.hi,num);
                    mostrarValores (a^.hd,num);
                end
                else if (num <= a^.data.legajo ) then 
                    mostrarValores (a^.hi,num);
            end;
        end;
    var
        num:integer;
    begin
        write('Ingrese un numero de legajo: ');readln(num);
        if (a = nil) then
            writeln('El arbol esta vacio.')
        else begin
            writeln('Estos son los alumnos con legajo menor al numero ingresado: ');
            mostrarValores(a,num);
        end;
    end;

    {
    c. Un módulo que reciba la estructura generada en a. y retorne el legajo más grande.
    }

    procedure legajoMax (a:arbol);
        function devolverLegajoMax (a:arbol):integer;
        begin
            if (a = nil) then
                devolverLegajoMax := 0
            else begin
                if (a^.hd <> nil) then
                    devolverLegajoMax := devolverLegajoMax(a^.hd)
                else
                    devolverLegajoMax:= a^.data.legajo;
            end;
        end;
    var
        max:integer;
    begin
        max := devolverLegajoMax(a);
        if (max = 0) then
            writeln('Arbol vacio.')
        else
            writeln('El legajo maximo cargado en el arbol es: ',max);
    end;

    {
        d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.
    }
    procedure dniMax (a:arbol);
        function devolverDNIMax (a:arbol;act:integer):integer;
        begin
            if (a <> nil) then begin
                devolverDNIMax:= devolverDNIMax(a^.hi,act);
                devolverDNIMax := devolverDNIMax(a^.hd,act);
                if (a^.data.dni > devolverDNIMax) then
                    devolverDNIMax:= a^.data.dni;
            end
            else
                devolverDNIMax := 0;
        end;
    var
        act,max:integer;
    begin
        act:= -1;
        max:= devolverDNIMax(a,act);
        if (max = 0) then
            writeln('Arbol vacio.')
        else
            writeln('El dni maximo encontrado en el arbol es: ', max);
    end;

    {
    e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
    legajo impar.
    }

    procedure legajosImpares (a:arbol);
        function contarImpares (a:arbol):integer;
        begin
            if (a <> nil) then begin
                if (a^.data.legajo mod 2 <> 0) then
                    contarImpares := contarImpares(a^.hi) + contarImpares(a^.hd) + 1
                else
                    contarImpares := contarImpares(a^.hi) + contarImpares(a^.hd);
            end
            else
                contarImpares := 0;
        end;
    var
        cant:integer;
    begin
        cant:= contarImpares(a);
        if (cant = 0 ) then
            writeln('Arbol vacio.')
        else
            writeln('La cantidad de numeros de dni impares es: ', cant);
    end;

    {
    f. Un módulo que reciba la estructura generada en a. y un valor entero. Este módulo debe
    retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.
    }

    procedure legajosYPromedios (a:arbol);
        function sumarNotas (l:lista):real;
        begin
            if (l <> nil) then
                sumarNotas := l^.data.nota + sumarNotas (l^.sig)
            else    
                sumarNotas := 0;
        end;

        function cantNotas (l:lista):integer;
        begin
            if (l <> nil) then
                cantNotas := cantNotas (l^.sig) +1
            else
                cantNotas := 0;
        end;

        procedure mostrarLegajos (a:arbol;num:integer);
        var
            cant:integer;
            suma,prom:real;
        begin
            if (a <> nil) then begin
                mostrarLegajos(a^.hi,num);
                cant := cantNotas(a^.data.notas);
                suma := sumarNotas(a^.data.notas);
                prom := suma / cant;
                if (prom > num) then
                    writeln('Legajo del alumno: ', a^.data.legajo ,' | ', 'Promedio: ', prom:4:2);
                mostrarLegajos(a^.hd,num);
            end;
        end;

    var
        num:integer;
    begin
        write('Ingrese un promedio base: ');readln(num);
        if (a = nil) then
            writeln('Arbol vacio.')
        else begin
            writeln('Estos son los alumnos cuyo promedio supera al numero ingresado: ');
            mostrarLegajos(a,num);
        end;
    end;


var
    a:arbol;
begin
    a:= nil;
    cargarAlumnos(a);
    mostrarAlumnos (a);
    writeln();
    //retornarLegajos(a);
    //legajoMax(a);
    //dniMax(a);
    legajosImpares(a);
    //legajosYPromedios(a);
end.
