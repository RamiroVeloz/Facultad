{
7. Realizar un programa que lea números enteros desde teclado hasta que se ingrese el valor -1 (que no
debe procesarse) e informe:
a. la cantidad de ocurrencias de cada dígito procesado.
b. el dígito más leído.
c. los dígitos que no tuvieron ocurrencias.
Por ejemplo, si la secuencia que se lee es: 63 34 99 94 96 -1, el programa deberá informar:

Número 3: 2 veces
Número 4: 2 veces
Número 6: 2 veces
Número 9: 4 veces

El dígito más leído fue el 9.

Los dígitos que no tuvieron ocurrencias son: 0, 1, 2, 5, 7, 8
}

program ej7;

const 
    dimF = 9;

type
    rango = 0..dimF;

    vector = array [rango] of integer;

    procedure analizarNumeros ();
        
        procedure inicializarVector (var v:vector);
        var
            i:integer;
        begin
            for i:= 0 to dimF do
                v[i]:= 0;
        end;

        procedure descomponer (var v:vector; n:integer);
        var
            digito: integer;
        begin
            while (n <> 0) do begin
                digito:= n mod 10;
                v[digito] := v[digito] + 1;
                n:= n div 10;
            end;

        end;

        procedure leerNumeros (var v:vector);
        var
            n:integer;
        begin
            write('Ingrese un numero: ');readln (n);
            while (n <> -1) do begin
                if (n <> -1) then
                    descomponer (v,n);
                write('Ingrese un numero: ');readln (n);
            end;
        end;

        procedure mostrarVector (v:vector);
        var
            i:integer;
        begin
            for i:= 0 to dimF do
                writeln(i, ' - ' , v[i]);
        end;

        procedure recorrerVector (v:vector);
        var
            max, pos, i:integer;
        begin
            max:= -1;
            pos := 0;
            writeln ('Los numeros que no tuvieron ocurrencias fueron: ');
            for i:= 0 to dimF do begin
                if( v[i] = 0 ) then
                    writeln (i)
                else if (v[i] > max) then
                begin
                    max:= v[i];
                    pos:= i;
                end;
            end;
            writeln('El numero con mayor cantidad de ocurrencias es ', pos , ' con un total de : ', max , ' ocurrencias.');
            end;
        

        var

            v:vector;
        begin
            inicializarVector(v);
            leerNumeros(v);
            mostrarVector(v);
            recorrerVector (v);
        end;
    
begin
    analizarNumeros ();
end.