program punteros;
type

    cadena = string[9];              // 10 bytes
    producto = record               // 20 bytes
        codigo: integer;           // 2 bytes
        descripcion: cadena;      // 10 bytes
        precio: real;            //8bytes
    end;

    puntero_producto = ^producto;   // 4 bytes
var
    p: puntero_producto;           // 4 bytes
    prod: producto;               // 20 bytes
begin
    writeln(sizeof(p), ' bytes');       // 4 bytes
    writeln(sizeof(prod), ' bytes');   // 20 bytes
    new(p);
    writeln(sizeof(p), ' bytes');      // 4 bytes
    p^.codigo := 1;
    p^.descripcion := 'nuevo producto';
    writeln(sizeof(p^), ' bytes');   //  20 bytes
    p^.precio := 200;
    writeln(sizeof(p^), ' bytes');   // 20 bytes
    prod.codigo := 2;
    prod.descripcion := 'otro nuevo producto';
    writeln(sizeof(prod), ' bytes');   // 20 bytes
end.