{
6.- Realizar un programa que lea números y que utilice un módulo recursivo que escriba el
equivalente en binario de un número decimal. El programa termina cuando el usuario ingresa
el número 0 (cero).


Ayuda: Analizando las posibilidades encontramos que: Binario (N) es N si el valor es menor a 2.
¿Cómo obtenemos los dígitos que componen al número? ¿Cómo achicamos el número para la
próxima llamada recursiva? Ejemplo: si se ingresa 23, el programa debe mostrar: 10111.
}

program ej6;



    procedure decimalBinario ();
        procedure calcularBinario (num:integer);
        begin
            if (num < 2) then
                write(num)
            else begin
                calcularBinario(num div 2);
                write(num mod 2 );
            end;
        end;
    var
        num:integer;
    begin
        write('Ingrese un numero: ');readln(num);
        if (num <> 0) then begin
            calcularBinario(num);
            writeln();
            decimalBinario();
        end;
    end;


begin
    decimalBinario();
end.