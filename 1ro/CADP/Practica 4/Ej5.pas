{
5. Utilizando los módulos implementados en el ejercicio 4, realizar un programa que lea números enteros
desde teclado (a lo sumo 100) y los almacene en un vector. La carga finaliza al leer el número 0. Al finalizar
la carga, se debe intercambiar la posición del mayor elemento por la del menor elemento, e informe la
operación realizada de la siguiente manera: “El elemento máximo ... que se encontraba en la posición ...
fue intercambiado con el elemento mínimo ... que se encontraba en la posición ...”.
}


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

        procedure calcularMax (v:vector; dimL:integer;var max:integer;var pos:integer);
        var
            i:integer;
        begin
            max:= -1;
            for i:= 1 to dimL do begin
                if (v[i] > max) then
                begin
                    max := v[i];
                    pos := i;
                end;
            end;
            writeln('El valor minimo del vector es ', max , ' y se encuentra en la posicion ', pos);
        end;

        procedure calcularMin (v:vector; dimL:integer; var min:integer;var pos:integer);
        var
            i:integer;
        begin
            min := 999;
            for i:= 1 to dimL do
            begin
                if (v[i] < min ) then
                begin
                    min := v[i];
                    pos := i;
                end;
            end;
            writeln('El valor minimo del vector es ', min , ' y se encuentra en la posicion ', pos);
        end;

        procedure intercambiarPosicion (var v:vector; dimL:integer);
        var
            x , y , v1 , v2: integer;
        begin
            calcularMax(v,dimL,v1,x);
            calcularMin(v,dimL,v2,y);
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