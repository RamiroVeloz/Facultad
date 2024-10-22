{
4. Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
a) posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector,
o el valor -1 en caso de no encontrarse.
b) intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector
donde se intercambiaron los valores de las posiciones x e y.
c) sumaVector: retorna la suma de todos los elementos del vector.
d) promedio: devuelve el valor promedio de los elementos del vector.
e) elementoMaximo: retorna la posición del mayor elemento del vector
f) elementoMinimo: retorna la posicion del menor elemento del vector
}


program Ej4;

const
    dimF = 100;

type
    rango = 1..dimF;

    vector = array [rango] of integer;

    procedure trabajarVector ();    

        procedure inicializarVector (var v:vector);
        var
            i:integer;
        begin
            for i := 1 to dimF do 
                v[i] := 0;
        end;

        procedure cargaDatos (var v:vector);
        var
            i:integer;
        begin
            Randomize;
            for i := 1 to dimF do begin
                v[i] := Random(dimF);
            end;
        end;

        procedure imprimirVector (v:vector);
        var
            i:integer;
        begin
            for i := 1 to dimF do
                writeln ('Posicion ', i , ' : ', v[i]);
        end;

        procedure buscarPos (v:vector);
        var
            dimL,x,pos:integer;
            check:boolean;
        begin
            dimL := 1;
            check:= false;
            write ('Ingrese el numero que desea buscar: ');readln (x);
            while (dimL <= dimF) and (check = false) do begin
                if (x = v[dimL]) then begin
                    pos := dimL;
                    check := true;
                end;
                dimL := dimL +1;
            end;
            if (check = true) then
                writeln ('El numero ', x , ' se encontro en la posicion ' ,pos, ' del vector.')
            else
                writeln ('Error: ', -1);
        end;

        procedure intercambiarPosicion (var v:vector);
        var
            x , y , v1 , v2: integer;
        begin
            write ('Ingrese la primer posicion para el intercambio ( del 1 al 100 ): '); readln(x);
            write('Ingrese la segunda posicion  para el intercambio ( del 1 al 100 ): '); readln(y);
            v1 := v[x];
            v2:= v[y];
            v[x]:= v2;
            v[y]:= v1;
            writeln('Cambio realizado.');
            imprimirVector(v);
        end;

        function sumaValoresVector (v:vector):integer;
        var
            i:integer;
        begin
            for i := 1 to dimF do
                sumaValoresVector := sumaValoresVector + v[i];
        end;

        procedure promedioValoresVector (v:vector);
        var 
            i,suma:integer;prom:real;
        begin
            suma :=sumaValoresVector(v);
            writeln('La suma de todos los valores del vector es: ',suma);
            prom := suma / dimF;
            writeln ('El promedio de todos los valores del vector es: ', prom:4:2);
        end;

        procedure calcularMax (v:vector);
        var
            i,max,pos:integer;
        begin
            max:= -1;
            for i:= 1 to dimF do begin
                if (v[i] > max) then
                begin
                    max := v[i];
                    pos := i;
                end;
            end;
            writeln('El valor maximo del vector es ', max , ' y se encuentra en la posicion ', pos);
        end;

        procedure calcularMin (v:vector);
        var
            i,min,pos:integer;
        begin
            min := 999;
            for i:= 1 to dimF do
            begin
                if (v[i] < min ) then
                begin
                    min := v[i];
                    pos := i;
                end;
            end;
            writeln('El valor minimo del vector es ', min , ' y se encuentra en la posicion ', pos);
        end;




    var
        v:vector;
    begin
        inicializarVector(v);
        cargaDatos(v);
        imprimirVector(v);
        //buscarPos(v);
        //intercambiarPosicion(v);
        promedioValoresVector(v);
        calcularMax(v);
        calcularMin (v);
    end;

begin
    trabajarVector();
end.
