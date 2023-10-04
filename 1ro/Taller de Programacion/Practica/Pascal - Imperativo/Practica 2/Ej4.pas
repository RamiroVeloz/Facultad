{
4.- Escribir un programa con:
a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 0 y
menores a 100.
b. Un módulo recursivo que devuelva el máximo valor del vector.
c. Un módulo recursivo que devuelva la suma de los valores contenidos en el vector.
}

program ej4;

const
    dimf = 10;

type
    rango = 1..dimf;

    vector = array [rango] of integer;


    procedure cargarVector (var v:vector);
        procedure guardarNumeros (var v:vector; var diml:integer);
        var
            num:integer;
        begin
            num := random (20);
            if (diml < dimf) and (num <> 0) then begin
                diml := diml +1;
                v[diml]:= num;
                guardarNumeros(v,diml);
            end;
        end;
    var
        diml:integer;
    begin
        diml := 0;
        Randomize();
        guardarNumeros(v,diml);
    end;



    procedure mostrarElementos (v:vector );
        procedure mostrarRecursivo (v:vector;var i:integer);
        begin
            if (i < dimf) then begin
                writeln (v[i]);
                i:= i+1;
                mostrarRecursivo(v,i);
            end;
        end;
    var
        i:integer;
    begin
        i:= 1;
        mostrarRecursivo(v,i);
    end;

    {
        b. Un módulo recursivo que devuelva el máximo valor del vector.
        c. Un módulo recursivo que devuelva la suma de los valores contenidos en el vector.
    }

    procedure calcularMaximo (v:vector);
        function valorMaximo (v:vector; diml:integer;max:integer):integer;
        begin
            if (diml < dimf ) then begin
                max := valorMaximo (v,diml+1,max);
                if (max < v[diml]) then 
                    valorMaximo := v[diml]
                else
                    valorMaximo := max;
                
            end;
        end;
    var
        diml:integer; 
        max:integer;
    begin
        diml := 1;
        max := -1;
        writeln('El valor maximo del vector es: ',valorMaximo(v,diml,max));
    end;

    procedure sumarValores (v:vector);
        function sumar (v:vector; diml:integer;suma:integer):integer;
        begin
            if (diml < dimf) then begin
                suma := v[diml]+ sumar(v,diml+1,suma);
            end;
            sumar := suma;
        end;
    var
        diml,suma:integer;
    begin
        diml := 1;
        suma := 0;
        writeln('La suma de los valores es: ', sumar(v,diml,suma));
    end;


var
    v:vector;

begin
    cargarVector(v);
    mostrarElementos(v);
    calcularMaximo(v);
    sumarValores(v);
end.