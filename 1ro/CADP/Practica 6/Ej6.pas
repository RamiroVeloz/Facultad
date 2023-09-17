{
6. La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales lanzadas
al espacio en la última década. De cada sonda se conoce su nombre, duración estimada de la misión
(cantidad de meses que permanecerá activa), el costo de construcción, el costo de mantenimiento mensual y
rango del espectro electromagnético sobre el que realizará estudios. Dicho rango se divide en 7 categorías:
1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta; 6. rayos X; 7. rayos gamma
Realizar un programa que lea y almacene la información de todas las sondas espaciales. La lectura finaliza al
ingresar la sonda llamada “GAIA”, que debe procesarse.
Una vez finalizada la lectura, informar:
a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).
b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.
d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas.
Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse la menor cantidad de veces posible
}


program ej6;

const
    categorias = 7;
    limitestr = 20;

type
    str = string[limitestr];
    rangocat = 1..categorias ;

    sonda = record
        nom:str;
        duracion:integer;
        construccion:real;
        mantenimiento:real;
        espectro:rangocat;
    end;

    lista = ^nodo;
    nodo = record
        dato:sonda;
        sig:lista;
    end;

    vector = array [rangocat] of integer;

    procedure cargaYAnalisis ();

        procedure inicializarVector (var v:vector);
        var
            i:integer;
        begin
            for i:= 1 to categorias do
                v[i]:= 0;
        end;

        procedure lectura (var s:sonda);
        begin
            write('Ingrese el nombre de la sonda: ');readln(s.nom);
            write('Ingrese la duracion (meses): ');readln (s.duracion);
            write('Ingrese el costo de construccion: '); readln(s.construccion);
            write('Ingrese el costo de mantenimiento: ');readln (s.mantenimiento);
            write('Ingrese el rango del espectro magnetico: ');readln(s.espectro);
        end;

        procedure agregarFinal (var l,ult:lista; s:sonda);
        var
            nue:lista;
        begin
            new(nue);
            nue^.dato := s;
            nue^.sig:= nil;
            if (l = nil) then
                l:= nue
            else
                ult^.sig:= nue;
            ult:= nue;
        end;

        procedure carga (var l:lista);
        var
            s:sonda;
            ult:lista;
        begin
            repeat
                lectura (s);
                agregarFinal(l,ult,s);
            until (s.nom = 'gaia');
        end;

        procedure mostrarLista(l:lista);
        begin
            while (l<> nil) do begin
                writeln('Nombre de la sonda: ', l^.dato.nom);
                writeln('Duracion (meses): ',l^.dato.duracion);
                writeln('Costo de construccion: ',l^.dato.construccion);
                writeln('Costo de mantenimiento: ', l^.dato.mantenimiento);
                writeln('Rango del espectro magnetico: ', l^.dato.espectro);
                l:= l^.sig;    
            end;
        end;

        {
            a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).
            b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
            Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse la menor cantidad de veces posible
        }

        procedure calcularMax (var sondaMax:str; var costoTotalMax : real; nom: str; costoc:real; costom:real);
        var
            total:real;
        begin
            total := costoc + costom;
            if (costoTotalMax < total) and (sondaMax <> nom) then begin
                costoTotalMax := total;
                sondaMax := nom;
            end;
        end;

        procedure mostrarCantEspectros (v:vector);
        var
            i:integer;
        begin
            for i:= 1 to categorias do
                writeln('La cantidad de sondas que realizaran estudios en el rango de espectro ', i , ' es : ', v[i]);
        end;

        procedure procesarLista (l:lista);
        var
            sondaMax:str; costoTotalMax:real;
            v:vector;
            prom,cant,cantSondas,totalDuracion:integer;
            costoprom,totalCosto,act:real;
        begin
            costoTotalMax := -1;
            sondaMax := '';
            totalCosto :=0;
            cant := 0;
            cantSondas := 0;
            inicializarVector(v);
            while (l <> nil) do begin
                calcularMax(sondaMax, costoTotalMax , l^.dato.nom, l^.dato.construccion, l^.dato.mantenimiento);
                v[l^.dato.espectro]:= v[l^.dato.espectro] + 1;
                totalDuracion := l^.dato.duracion;
                totalCosto := totalcosto + l^.dato.construccion + l^.dato.mantenimiento;
                cant:= cant +1;
                l:= l^.sig;
            end;
            writeln ('El nombre de la sonda mas costosa es ', sondaMax , ' con un costo de ', costoTotalMax);
            mostrarCantEspectros(v);
            prom := totalDuracion div cant ;
            costoprom:= totalCosto / cant;
            {
            c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.
            d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas.
            }
            while (l <> nil ) do begin
                if ( l^.dato.duracion > prom ) then
                    cantSondas:= cantSondas + 1;
                act := l^.dato.construccion + l^.dato.mantenimiento;
                if ( act > costoProm ) then
                    writeln ('La sonda ', l^.dato.nom , ' supera el costo promedio con un costo total de ', act);
                l:= l^.sig;
            end;
        end;

    var
        l:lista;
    begin
        carga(l);
        mostrarLista(l);
        procesarLista (l);
    end;

begin
    cargaYAnalisis();
end.