program ej6;

const
    categorias = 7;
    limitestr = 20;

type
    rangocat = 1..categorias;
    str = string[limitestr];

    objeto = record
        cod:integer;
        cat:rangocat;
        nom:str;
        distancia:integer;
        nomdesc:str;
        anio:integer;
    end;

    vector = array [rangocat] of integer;

    lista = ^nodo;
    nodo = record
        dato:objeto;
        sig:lista;
    end;

    procedure cargaYanalisis();
        
        procedure inicializarVector (var v:vector);
        var
            i:integer;
        begin
            for i:= 1 to categorias do
                v[i]:= 0;
        end;

        procedure lectura (var o:objeto);
        begin
            write('Ingrese el codigo del objeto: ');readln(o.cod);
            if (o.cod <> -1) then begin
                write('Ingrese la categoria: ');readln(o.cat);
                write('Ingrese el nombre: ');readln(o.nom);
                write('Ingrese la distancia en anios luz: ');readln(o.distancia);
                write('Ingrese el nombre del descubridor: ');readln(o.nomdesc);
                write('Ingrese el anio de descubrimiento: ');readln(o.anio);
            end;
        end;

        procedure agregarFinal (var l,ult:lista ; o:objeto);
        var
            nue:lista;
        begin
            new(nue);
            nue^.dato:= o;
            nue^.sig:= nil;
            if (l = nil) then
                l:= nue
            else
                ult^.sig := nue;
            ult:= nue;
        end;

        procedure carga (var l:lista);
        var
            o:objeto;
            ult:lista;
        begin
            l:= nil;
            lectura(o);
            while (o.cod <> -1) do begin
                if (o.cod <> -1) then
                    agregarFinal (l,ult,o);
                lectura(o);
            end;
        end;

        procedure mostrarLista (l:lista);
        begin
            while (l<> nil) do begin
                writeln('----------------------------------------');
                writeln('Codigo del objeto: ', l^.dato.cod);
                writeln('Categoria: ', l^.dato.cat);
                writeln('Nombre: ', l^.dato.nom);
                writeln('Distancia: ', l^.dato.distancia);
                writeln('Nombre del descubridor: ', l^.dato.nomdesc);
                writeln('Anio del descubrimiento: ', l^.dato.anio);
                writeln('----------------------------------------');
                l:= l^.sig;
            end;
        end;
        procedure calcularMax (var c1,d1,c2,d2:integer; cod,distancia:integer);
        begin
            if (d1 < distancia) and (c1 <> cod) then begin
                d2:= d1;
                c2:= c1;
                d1:= distancia;
                c1:= cod;
            end
            else if (d2 < distancia) and (c2 <> cod) then begin
                d2:=distancia;
                c2:= cod;
            end;
        end;

        function descomponer (num:integer):boolean;
        var
            digito,par,imp:integer;
        begin
            par:= 0;
            imp:= 0;
            while (num <> 0) do begin
                digito := num mod 10;
                if (digito mod 2 = 0 ) then
                    par:= par +1
                else
                    imp := imp +1;
                num := num div 10;
            end;
            if (par > imp) then
                descomponer := true
            else
                descomponer := false;
        end;

        procedure recorrerVector (v:vector);
        var
            i:integer;
        begin
            for i:= 1 to categorias do
                writeln ('La categoria ', i , ' tiene un total de objetos observados de: ',v[i]);
        end;


        procedure recorrerLista (l:lista);
        var
            c1,d1,c2,d2:integer;
            cant:integer;
            v:vector;
        begin
            inicializarVector(v);
            cant:= 0;
            while (l<> nil) do begin
                calcularMax(c1,d1,c2,d2, l^.dato.cod, l^.dato.distancia);
                if (l^.dato.cat = 1) and (descomponer(l^.dato.cod) = true) then
                    writeln ('La estrella de codigo ', l^.dato.cod, ' tiene mas digitos pares que impares.');
                if (l^.dato.cat = 2 ) and (l^.dato.nomdesc = 'galileo' ) and (l^.dato.anio <> 1600) then
                    cant:= cant+1;
                v[l^.dato.cat]:= v[l^.dato.cat] +1;
                l:= l^.sig;
            end;
            writeln('Los objetos mas alejados de la tierra son: ');
            writeln('El objeto ', c1, ' con una distancia de ', d1);
            writeln('El objeto ', c2, ' con una distancia de ', d2);
            writeln('La cantidad de planetas descubiertos por galileo antes del anio 1600 es: ', cant);
            recorrerVector(v);
        end;

    var
        l:lista;
    begin
        carga(l);
        mostrarLista(l);
        recorrerLista(l);
    end;

begin
    cargaYanalisis();
end.
