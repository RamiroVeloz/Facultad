{
10. Realizar un programa que lea y almacene el salario de los empleados de una empresa de turismo (a lo
sumo 300 empleados). La carga finaliza cuando se lea el salario 0 (que no debe procesarse) o cuando se
completa el vector. Una vez finalizada la carga de datos se pide:
a) Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, implementar un
módulo que reciba como parámetro un valor real X, el vector de valores reales y su dimensión lógica y
retorne el mismo vector en el cual cada elemento fue multiplicado por el valor X.
b) Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa.
}


program ej10;

const
    dimf = 300;

type
    rango = 0..dimF;

    vector = array [rango] of real;

    procedure calculoYAnalisis ();
        procedure lecturaYcarga (var v:vector; var diml : integer);
        var
            salario : real;
        begin
            diml:= 0;
            write('Ingrese el salario del empleado ', diml ,' :');readln(salario);
            while (diml < dimF) and (salario <> 0) do 
            begin
                if (salario <> 0 ) then
                    v[diml] := salario;
                    diml := diml + 1 ; 
                write('Ingrese el salario del empleado ', diml ,' :');readln(salario);
            end;
        end;

        procedure mostrarDatos (v:vector; diml:integer);
        var
            i:integer;
        begin
            for i:= 0 to diml do 
                writeln ('El empleado ', i , ' tiene un salario de $', (v[i]):4:2 ,' .');
        end;

        procedure multiplicarSalarios (var v:vector; diml:integer; n:real);
        var
            i:integer;
            aux:real;
        begin
            for i:=0 to diml do begin
                aux := (n / 100) * v[i] ;
                v[i] :=v[i] + aux ;
            end;
        end;

        procedure aumento (var v:vector; diml:integer);
        var
            n:real;
        begin
            write ('Ingrese el porcentaje para aplicar aumento a los salarios: ');readln(n);
            multiplicarSalarios (v,diml,n);
        end;
        
        procedure sueldoProm (v:vector; diml:integer);
        var
            i:integer;
            suma,prom:real;
        begin
            suma := 0;
            prom := 0;
            for i:=0 to diml do
                suma := suma + v[i];
            prom := suma / diml;
            writeln ('El salario promedio de los empleados es de: $', prom:4:2);
        end;

        var
            v:vector;
            diml:integer;
        begin
            lecturaYcarga(v,diml);
            mostrarDatos(v,diml);
            aumento(v,diml);
            mostrarDatos(v,diml);
            sueldoProm (v,diml);
        end;

begin
    calculoYAnalisis();
end.