{
3.- Netflix ha publicado la lista de películas que estarán disponibles durante el mes de
diciembre de 2022. De cada película se conoce: código de película, código de género (1: acción,
2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8: terror) y puntaje
promedio otorgado por las críticas.

Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:

a. Lea los datos de películas, los almacene por orden de llegada y agrupados por código de
género, y retorne en una estructura de datos adecuada. La lectura finaliza cuando se lee el
código de la película -1.

b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje
obtenido entre todas las críticas, a partir de la estructura generada en a).

c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos
métodos vistos en la teoría.

d. Muestre el código de película con mayor puntaje y el código de película con menor puntaje,
del vector obtenido en el punto c).
}

program ej3;

const
    generos = 8;


type
    rango = 1..generos;


    pelicula = record
        codp:integer;
        codg : rango;
        pprom : real;
    end;

    cyp = record
        cod:integer;
        puntaje: real;
    end;

    lista = ^nodo;
    nodo = record
        dato:pelicula;
        sig:lista;
    end;

    vector = array [rango] of lista;
    codigos = array [rango] of pelicula;

    procedure inicializarVectorPeliculas (var v:vector);
    var
        i:rango;
    begin
        for i:=1 to generos do 
            v[i]:= nil;
    end;

    procedure inicializarVectorCodigos (var c:codigos);
    var
        i:rango;
    begin
        for i:=1 to generos do begin
            c[i].codp:= 0;
            c[i].codg:= 0;
            c[i].pprom:= 0;
        end;
    end;


    
    procedure cargarPeliculas (var v:vector);
        procedure agregarFinal (var l,ult:lista; p:pelicula);
        var
            nue:lista;
        begin
            new(nue);
            nue^.dato:= p;
            nue^.sig:= nil;
            if (l = nil) then
                l:= nue
            else
                ult^.sig:= nue;
            ult:= nue;
        end;

        procedure leerPeliculas (var p:pelicula);
        begin
            write('Codigo: ');readln(p.codp);
            if (p.codp <> -1 ) then begin
                p.codg := random(7)+1;
                writeln('Genero: ', p.codg);
                p.pprom := random (100);
                writeln('Puntuacion de la critica: ',p.pprom:4:2);
            end;
        end;

    var
        p:pelicula;
        ult:lista;
    begin
        Randomize();
        leerPeliculas(p);
        while (p.codp <> -1) do begin
            agregarFinal(v[p.codg],ult, p);
            leerPeliculas(p);
        end;
    end;

    procedure mostrarPeliculas (v:vector);
        procedure mostrarGenero (l:lista);
        begin
            while (l<>nil) do begin
                writeln('--------------------------------------------------------------------------------');
                writeln();
                writeln('Codigo de Pelicula: ', l^.dato.codp, ' | ' ,'Codigo de Genero: ', l^.dato.codg, ' | ' ,' Puntaje promedio de la Critica: ', l^.dato.pprom:4:2);
                writeln();
                writeln('--------------------------------------------------------------------------------');
                l:= l^.sig;
            end;
        end;
    var
        i:rango;
    begin
        for i:= 1 to generos do begin
            writeln('Genero: ', i);
            writeln();
            mostrarGenero(v[i]);
            writeln();
        end;
    end;

{
b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje
obtenido entre todas las críticas, a partir de la estructura generada en a).
}
    procedure mejoresPuntajes (var c:codigos; v:vector);
        procedure recorrerPeliculas (l:lista; var mejorCodigo:integer ;var mejorPuntaje:real);
        begin
            while (l <> nil ) do begin
                if (l^.dato.pprom > mejorPuntaje) then begin

                    mejorCodigo := l^.dato.codp;
                    mejorPuntaje := l^.dato.pprom;
                end;
                l:= l^.sig;
            end;
        end;

    var
        i,genero:rango;
        mejorPuntaje:real; mejorCodigo:integer;
    begin
        for i:=1 to generos do begin
            mejorPuntaje := -1;
            mejorCodigo:= 0;
            genero := i;
            if (v[i] <> nil) then
                recorrerPeliculas (v[i], mejorCodigo, mejorPuntaje);
            
            c[i].codp:= mejorCodigo;
            c[i].codg := genero;
            c[i].pprom:= mejorPuntaje;
        end;
    end;

    procedure mostrarPuntajes (c:codigos);
    var
        i:rango;
    begin
        for i:=1 to generos do
            writeln ('Genero: ', c[i].codg , ' | ', 'Codigo de la pelicula: ', c[i].codp, ' | ', ' Puntaje: ', c[i].pprom:4:2);
    end;

{
    c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos
métodos vistos en la teoría.
}
    procedure ordenarMejoresPuntajes (var c:codigos);
    var
        i,j,p:rango;
        item:pelicula;
    begin
        for i:= 1 to generos-1 do begin
            p:= i;
            for j:= i+1 to generos do 
                if (c[p].pprom > c[j].pprom) then
                    p:= j;
            item := c[i];
            c[i] := c[p];
            c[p]:= item;
        end;
    end;

{
d. Muestre el código de película con mayor puntaje y el código de película con menor puntaje,
del vector obtenido en el punto c).
}

    procedure maxMin (c:codigos);
        function max (c:codigos):integer;
        var
            i:rango;
            maxPuntaje:real;
            maxCod:integer;
        begin
            maxPuntaje := -1;
            maxCod := 0;
            for i:=1 to generos do
                if (c[i].codp <> 0) and (c[i].pprom <> -1) then
                    if (c[i].pprom > maxPuntaje) then begin
                        maxPuntaje := c[i].pprom;
                        maxCod := c[i].codp;
                    end;
            max := maxCod;
        end;

        function min (c:codigos):integer;
        var
            i:rango;
            minPuntaje:real;
            minCod:integer;
        begin
            minPuntaje := 9999;
            minCod := 0;
            for i:=1 to generos do
                if (c[i].codp <> 0) and (c[i].pprom <> -1) then
                    if (c[i].pprom < minPuntaje) then begin
                        minPuntaje := c[i].pprom;
                        minCod := c[i].codp;
                    end;
            min := minCod;
        end;
    var
        codMax,codMin :integer;
    begin
        codMax := max(c);
        codMin := min(c);
        writeln('Codigo de la pelicula con mayor puntaje: ', codMax);
        writeln('Codigo de la pelicula con menor puntaje: ', codMin);
    end;



var
    v:vector; c:codigos;
begin
    inicializarVectorPeliculas(v);
    cargarPeliculas(v);
    inicializarVectorCodigos(c);
    mostrarPeliculas(v);
    writeln('-------------------------------------------------------------');
    writeln('Estas son las peliculas con mejor puntaje de cada genero:');
    mejoresPuntajes(c,v);
    mostrarPuntajes (c);
    writeln('-------------------------------------------------------------');
    writeln('Puntajes Ordenados:');
    ordenarMejoresPuntajes(c);
    mostrarPuntajes (c);
    maxMin(c);
end.



