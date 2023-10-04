{
1. Escribir un programa que:

a. Implemente un módulo que lea información de socios de un club y las almacene en un árbol
binario de búsqueda. De cada socio se lee número de socio, nombre y edad. La lectura finaliza
con el número de socio 0 y el árbol debe quedar ordenado por número de socio.

b. Una vez generado el árbol, realice módulos independientes que reciban el árbol como
parámetro y que :








xi. Informe los números de socio en orden creciente.

x. Informe los números de socio pares en orden decreciente.
}

program ej1;

type
    str = string [20];

    socio = record
        num:integer;
        nombre:str;
        edad:integer;
    end;

    arbol = ^nodo;
    nodo = record
        dato:socio;
        hi:arbol;
        hd:arbol;
    end;


    procedure cargarArbolSocios (var a:arbol);
        procedure lectura (var s:socio);
        begin
            write('Ingrese el numero de socio: ');readln(s.num);
            if (s.num <> 0) then begin
                write('Ingrese el nombre del socio: ');readln(s.nombre);
                s.edad := random (99)+1;
                writeln('Edad: ', s.edad);
            end;
        end;

        procedure agregarSocio (var a:arbol; s:socio);
        begin
            if (a = nil) then begin
                new(a);
                a^.dato:= s;
                a^.hi:= nil; a^.hd := nil;
            end
            else
                if (s.num <= a^.dato.num ) then
                    agregarSocio(a^.hi,s)
                else
                    agregarSocio(a^.hd, s);
        end;
    var
        s:socio;
    begin
        lectura(s);
        if (s.num <> 0) then begin
            agregarSocio(a,s);
            cargarArbolSocios(a);
        end;
    end;

    procedure mostrarArbol (a:arbol);
    begin
        if (a <> nil) then begin
            mostrarArbol(a^.hi);
            writeln('Numero de socio: ', a^.dato.num, ' | ' , 'Nombre: ' , a^.dato.nombre, ' | ' , 'Edad: ', a^.dato.edad);
            mostrarArbol(a^.hd);
        end;
    end;

    {
    i. Informe el número de socio más grande. Debe invocar a un módulo recursivo que
    retorne dicho valor.
    }

    procedure numeroMax (a:arbol);
        function devolverMax (a:arbol):integer;
        begin
            if (a = nil) then
                devolverMax := -1
            else if (a^.hd = nil) then devolverMax := a^.dato.num
            else devolverMax := devolverMax (a^.hd);
        end;
    var
        max :integer;
    begin
        max := devolverMax (a);
        if (max <> -1) then
            writeln('El numero de socio mas grande es: ', max)
        else if (max = -1) then
            writeln('El arbol esta vacio.');
    end;

    {
    ii. Informe los datos del socio con el número de socio más chico. Debe invocar a un módulo
    recursivo que retorne dicho socio.
    }

    procedure numeroMin (a:arbol);
        function devolverMin (a:arbol):arbol;
        begin
            if (a^.hi = nil) and (a^.hd = nil) then
                devolverMin := a
            else
                devolverMin := devolverMin (a^.hi);
        end;
    var
        socioMin : arbol;
    begin
        socioMin := devolverMin (a);
        if (socioMin = nil) then
            writeln ('El arbol esta vacio.')
        else begin
            writeln('Este es el socio con menor numero: ');
            writeln('Numero de socio: ', socioMin^.dato.num, ' | ' , 'Nombre: ' , socioMin^.dato.nombre, ' | ' , 'Edad: ', socioMin^.dato.edad);
        end;
    end;

    {
    iii. Informe el número de socio con mayor edad. Debe invocar a un módulo recursivo que
    retorne dicho valor.
    }

    procedure socioMayorEdad (a:arbol);
        procedure actualizarMax ( edadAct,codAct:integer;var max,cod:integer);
        begin
            if (edadAct >= max) then begin
                cod := codAct;
                max := edadAct;
            end;
        end;
        procedure buscarMayorEdad (a:arbol;  var max,cod:integer);
        begin
            if (a <> nil ) then begin
                actualizarMax(a^.dato.edad, a^.dato.num, max, cod);
                buscarMayorEdad (a^.hi,max,cod);
                buscarMayorEdad (a^.hd,max,cod);
            end;
        end;
    var
        max,cod:integer;
    begin
        cod := -1;
        max := -1;
        if (a <> nil) then
            buscarMayorEdad(a,max,cod)
        else
            writeln('El arbol esta vacio.');
        writeln ('El numero de socio con mayor edad (',max,') es: ', cod);
    end;

    {
    iv. Aumente en 1 la edad de todos los socios.
    }

    procedure aumentarEdad ( a:arbol);
        procedure incrementarUno ( a:arbol);
        begin
            if (a <> nil ) then begin
                a^.dato.edad := a^.dato.edad + 1;
                incrementarUno (a^.hi);
                incrementarUno (a^.hd);
            end;
        end;
    begin
        if (a = nil) then
            writeln('El arbol esta vacio.')
        else begin
            incrementarUno(a);
            writeln('Las edades fueron alteradas de forma correcta.');
        end;
    end;

    {
    v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a
    un módulo recursivo que reciba el valor leído y retorne verdadero o falso.
    }

    procedure encontrarSocio (a:arbol);
        function socioEncontrado (a:arbol;cod:integer):boolean;
        begin
            if (a = nil) then
                socioEncontrado := false
            else begin
                if (a^.dato.num = cod) then
                    socioEncontrado := true
                else if (a^.dato.num > cod) then 
                    socioEncontrado:= socioEncontrado (a^.hi,cod)
                else if (a^.dato.num < cod) then
                    socioEncontrado := socioEncontrado (a^.hd,cod);
            end;
        end;
    var
        cod:integer;
    begin
        write('Ingrese el numero de socio que desea buscar: ');readln(cod);
        if (a = nil) then
            writeln('El arbol esta vacio.')
        else if (socioEncontrado(a,cod) = false) then
            writeln('El socio no fue encontrado')
        else 
            writeln('El socio fue encontrado');
    end;

    {
    vi. Lea un nombre e informe si existe o no existe un socio con ese nombre. Debe invocar a
    un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.
    }

    procedure encontrarNombre (a:arbol);
        function nombreEncontrado (a:arbol; nom:str):boolean;
        begin
            if (a = nil) then
                nombreEncontrado := false
            else if (a^.dato.nombre = nom) then begin
                nombreEncontrado := true;
                nombreEncontrado := nombreEncontrado (a^.hi,nom);
                nombreEncontrado := nombreEncontrado (a^.hd,nom);
            end;
        end;
    var
        nom:str;
    begin
        write('Ingrese el nombre de socio que desea buscar: ');readln(nom);
        if (a = nil) then
            writeln('El arbol esta vacio.')
        else begin
            if (nombreEncontrado(a,nom) = true) then
                writeln('El nombre del socio se encuentra en el arbol.')
            else
                writeln('El nombre del socio no se encuentra en el arbol.');
        end;
    end;

    {
    vii. Informe la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha
    cantidad.
    }

    function contar (a:arbol):integer;
        begin
            if (a <> nil) then
                contar := contar (a^.hi) + contar (a^.hd) + 1
            else
                contar := 0;
        end;

    procedure cantSocios (a:arbol);
    begin
        if (a <> nil) then
            writeln ('La cantidad de socios es: ', contar(a))
        else writeln ('El arbol esta vacio. ')
    end;

    {
        viii. Informe el promedio de edad de los socios. Debe invocar al módulo recursivo del inciso
        vii e invocar a un módulo recursivo que retorne la suma de las edades de los socios.
    }

    procedure edadProm (a:arbol);
        function sumarEdad (a:arbol):integer;
        begin
            if (a <> nil) then
                sumarEdad := sumarEdad (a^.hi) + sumarEdad (a^.hd) + a^.dato.edad
            else
                sumarEdad := 0;
        end;
    var
        prom:real;
        maxEdad:integer;
        cant:integer;
    begin
        maxEdad := sumarEdad (a);
        cant := contar(a);
        prom := maxEdad / cant;
        writeln ('El promedio de edad de los socios es de: ', prom:4:2);
    end;

    {
        xi. Informe los números de socio en orden creciente.
    }

    procedure informeCreciente (a:arbol);
    begin
        if (a <> nil) then begin
            informeCreciente (a^.hi);
            writeln('Numero de socio: ', a^.dato.num);
            informeCreciente(a^.hd);
        end;
    end;

    {
        x. Informe los números de socio pares en orden decreciente.
    }
procedure informeDecreciente (a:arbol);
    begin
        if (a <> nil) then begin
            informeDecreciente(a^.hd);
            if (a^.dato.num mod 2 = 0) then
                writeln('Numero de socio: ', a^.dato.num);
            informeDecreciente (a^.hi);
        end;
    end;

    {
        ix. Informe, a partir de dos valores que se leen, la cantidad de socios en el árbol cuyo
        número de socio se encuentra entre los dos valores ingresados. Debe invocar a un módulo
        recursivo que reciba los dos valores leídos y retorne dicha cantidad.
    }

    procedure contarEntreValores (a:arbol);
        function contarEntre (a:arbol;num1,num2:integer):integer;
        begin
            if (a <> nil) then begin
                if (a^.dato.num >= num1) and (a^.dato.num <= num2) then begin
                    contarEntre := contarEntre (a^.hi,num1,num2) + contarEntre(a^.hd,num1,num2) + 1;
                end
                else if (a^.dato.num > num1) then begin
                        contarEntre := contarEntre (a^.hi,num1,num2);
                end
                else if (a^.dato.num < num1) then begin
                    contarEntre := contarEntre (a^.hd,num1,num2);
                end;
            end
            else
                contarEntre := 0;
        end;
    var
        num1,num2:integer;
    begin
        write('Ingrese un indice inicial: ');readln(num1);
        write('Ingrese un indice final: ');readln (num2);
        if (a = nil) then
            writeln('Arbol vacio.')
        else begin
            if (num1 < num2) then
                writeln('La cantidad de socios entre los dos valores ingresados es: ', contarEntre(a,num1,num2))
            else if (num2 < num1) then
                writeln('La cantidad de socios entre los dos valores ingresados es: ', contarEntre(a,num2,num1));
        end;
    end;

var
    a:arbol;
begin
    a:=nil;
    cargarArbolSocios(a);
    mostrarArbol(a);
    //numeroMax (a);
    //numeroMin (a);
    //socioMayorEdad(a);
    //aumentarEdad(a);
    //mostrarArbol(a);
    //encontrarSocio(a);
    //encontrarNombre(a);
    //cantSocios(a);
    //edadProm(a);
    //informeCreciente(a);
    //writeln ();
    //informeDecreciente (a);
    contarEntreValores(a);
end.

