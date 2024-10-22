program ej5;

const 
    dimF = 100;

type

    rango = 1..dimF;
    vector = array [ rango ] of integer;

    procedure trabajandoVector ();

        procedure inicializarVector (var v:vector);
        var
            i:integer;
        begin
            for i := 1 to dimF do 
                v[i] := 0;
        end;

        procedure lectura (var v:vector; var dimL:integer);
        var
            num:integer;
        begin
            dimL := 0;
            write('Ingrese un numero: ');readln (num);
            while (num <> 0 ) and (dimL <= dimF) do
            begin
                
                if  ( num <> 0 ) and (dimL < dimF) then
                begin
                    dimL := dimL + 1;
                    v[dimL] := num;
                end
                else
                    writeln('No hay mas espacio...');
                write('Ingrese un numero: ');readln (num);
            end;
        end;

        procedure imprimirVector (v:vector; dimL :integer);
        var
            i:integer;
        begin
            for i := 1 to dimL do
                writeln ('Posicion ', i , ' : ', v[i]);
        end;

        procedure calcularMaxMin (v:vector; dimL:integer;var max,min:integer;var posmax,posmin:integer);
        var
            i:integer;
        begin
            max:= -1;
            min := 9999;
            for i:= 1 to dimL do begin
                if (v[i] > max) then
                begin
                    max := v[i];
                    posmax := i;
                end 
                else if (v[i] < min ) then
                begin
                    min := v[i];
                    posmin:= i;
                end;
            end;
            writeln('El valor minimo del vector es ', max , ' y se encuentra en la posicion ', posmax);
            writeln('El valor minimo del vector es ', min , ' y se encuentra en la posicion ', posmin);
        end;

        procedure intercambiarPosicion (var v:vector; dimL:integer);
        var
            x , y , v1 , v2: integer;
        begin
            calcularMaxMin(v,dimL,v1,v2,x,y);
            v[x]:= v2;
            v[y]:= v1;
            writeln('Cambio realizado.');
            writeln('El elemento maximo ' ,v1, ' que se encontraba en la posicion ' ,x,' fue intercambiado con el elemento minimo ' ,v2,' que se encontraba en la posicion ' ,y);
            imprimirVector(v,dimL);
        end;

    
    var
        dimL:integer;
        v:vector;
    begin
        lectura (v,dimL);
        imprimirVector(v,dimL);
        intercambiarPosicion(v,dimL);
    end;

begin
    trabajandoVector();
end.