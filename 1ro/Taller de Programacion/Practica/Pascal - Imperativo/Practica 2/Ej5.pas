{
5.- Implementar un módulo que realice una búsqueda dicotómica en un vector, utilizando el
siguiente encabezado:

Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);

Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
en el vector.
}

program ej;

const 
    dimf = 10;

type
    rango = 1..dimf;
    indice = -1..dimf;
    vector = array [indice] of integer;

    procedure cargarVector (var v:vector);
        procedure ingresoRandom (var v:vector; diml:rango);
        begin
            if (diml <  dimf) then begin
                diml := diml +1;
                v[diml]:= random (50)+1;
                ingresoRandom(v,diml);
            end;
        end;
    var
        diml:rango;
    begin
        diml := 0;
        randomize();
        ingresoRandom (v,diml);
    end;

    procedure mostrarVector (v:vector);
        procedure contenido (v:vector; diml:rango);
        begin
            if (diml < dimf) then begin
                diml := diml +1;
                writeln ('------------------------------');
                writeln (v[diml]);
                writeln ('------------------------------');
                contenido (v,diml);
            end;
        end;
    var
        diml:rango;
    begin
        diml:= 0;
        contenido(v,diml);
    end;

    procedure ordenarVector (var v:vector);
    var
        i,j,k:rango;
        item:integer;
    begin
        for i:= 1 to dimf -1 do begin
            k:= i;
            for j:= i+1 to dimf do 
                if (v[k] > v[j]) then
                    k := j;
            item := v[i];
            v[i]:= v[k];
            v[k]:=item;
        end;
    end;


    procedure buscarElemento (v:vector);
        procedure busquedaDicotomica (v: vector; ini,fin: rango; dato:integer; var pos: indice);
        var
            medio :integer;
        begin
            medio := (ini + fin) div 2;
            if (ini <= fin) and (dato <> v[medio]) then begin
                if (dato < v[medio]) then
                    fin := medio -1
                else
                    ini:= medio + 1;
                busquedaDicotomica(v,ini,fin,dato,pos);
            end;
            if (ini <= fin) and (dato = v[medio]) then
                pos := medio;
        end;
    var
        dato:integer;
        ini,fin:rango;
        pos:indice;
    begin
        ini := 1;
        fin := dimf;
        pos := -1;
        write('Ingrese un valor para buscar en el vector: ');readln(dato);
        busquedaDicotomica (v,ini,fin,dato,pos);
        if (pos <> -1 ) then
            writeln ('El elemento se encuentra en la posicion ', pos, ' del vector.')
        else
            writeln('El elemento no se encuentra en el vector.');
    end;

var
    v:vector;
begin
    cargarVector(v);
    mostrarVector(v);
    ordenarVector(v);
    writeln('--------------------------------------------------');
    writeln('Vector ordenado: ');
    writeln('--------------------------------------------------');
    mostrarVector(v);
    buscarElemento(v);
end.

