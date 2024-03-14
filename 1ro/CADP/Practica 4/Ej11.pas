{
El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en las redes sociales. Para
ello, para cada una de las 200 fotos publicadas en su página de Facebook, cuenta con la siguiente
información: título de la foto, el autor de la foto, cantidad de Me gusta, cantidad de clics y cantidad de
comentarios de usuarios. Realizar un programa que lea y almacene esta información. Una vez finalizada la
lectura, el programa debe procesar los datos e informar:
a) Título de la foto más vista (la que posee mayor cantidad de clics).
b) Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.
c) Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.
}

program practica;

const 
    publicadas = 5;
    limitestr = 20;

type
    str = string[limitestr];
    rango = 1..publicadas;

    foto = record
        titulo:str;
        autor:str;
        cantmg:integer;
        cantclick:integer;
        cantcom:integer;
    end;

    vector = array [rango] of foto;
    contador = array [rango] of integer;

    procedure carga (var v:vector);
        procedure lectura (var f:foto);
        begin
            write('Ingrese el titulo de la foto: ');readln(f.titulo);
            write('ingrese el autor: ');readln(f.autor);
            write('Ingrese la cantidad de "Me gusta" que posee: ');readln(f.cantmg);
            write('Ingrese la cantidad de "Click" que posee: ');readln(f.cantclick);
            write('Ingrese la cantidad de comentarios: ');readln(f.cantcom);
        end;

        procedure cargaEnVector;
        var
            i:integer;
            f:foto;
        begin
            for i:=1 to publicadas do begin
                lectura(f);
                v[i] := f;
            end;
        end;
    begin
        cargaEnVector;
    end;

    procedure inicializarVector (var c:contador);
    var 
        i:integer;
    begin
        for i:= 1 to publicadas do  
            v[i]:= 0;
    end;

    procedure analisis (v:vector);
        {
            a) Título de la foto más vista (la que posee mayor cantidad de clics).
            b) Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.
            c) Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.
        }
        procedure calcularMaxVista (var max:str; var cv:integer; titulo:str; cant:integer);
        begin
            if (cant > max) then begin
                max := titulo;
                cv:=cant;
            end;
        end;
        
    var
        cantart,cv:integer;
        c:contador;
        max:str;
    begin
        cantart := 0;
        for i:= 1 to publicadas do begin
            calcularMax (max,cv,v[i].titulo, v[i].cantclick);
            if (v[i].autor = 'Art Vandelay') then
                cantart:= cantart + v[i].cantmg;
            c[i]:= v[i].cantcom;
        end;
        writeln('La pagina con mas vistas es ', max , ' con un total de ', cv, ' clicks.');
        writeln('La cantidad total de MG de las fotos del autor "Art Vandelay" es: ', cantart);
        for i:=1 to publicadas do
            writeln ('La cantiadad de comentarios de la publicacion ', i , ' es: ', c[i]);
    end;

var
    v:vector;
    c:contador
begin
    carga(v);
    inicializarVector(c);
    analisis(v);
end.