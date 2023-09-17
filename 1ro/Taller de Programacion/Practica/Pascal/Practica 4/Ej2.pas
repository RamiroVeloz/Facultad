{
2. Una biblioteca nos ha encargado procesar la información de los préstamos realizados
durante el año 2021. De cada préstamo se conoce el ISBN del libro, el número de socio, día
y mes del préstamo y cantidad de días prestados. Implementar un programa con:
a. Un módulo que lea préstamos y retorne 2 estructuras de datos con la información de
los préstamos. La lectura de los préstamos finaliza con ISBN -1. Las estructuras deben
ser eficientes para buscar por ISBN.

i. En una estructura cada préstamo debe estar en un nodo.

ii. En otra estructura, cada nodo debe contener todos los préstamos realizados al ISBN.
(prestar atención sobre los datos que se almacenan).


}
program ej2;


type
    /// punto A ///
    prestamo = record
        isbn:integer;
        num:integer;
        dia:integer;
        mes:integer;
        cant:integer;
    end;

    arbolP = ^nodoP;
    nodoP = record
        data:prestamo;
        hi:arbolP;
        hd:arbolP;
    end;

    /// punto B ///
    lista = ^nodoL;
    nodoL = record
        data:prestamo;
        sig:lista;
    end;

    total = record
        isbn:integer;
        prestamos:lista;
    end;

    

    arbolI = ^nodoI;
    nodoI = record
        data:total;
        hi:arbolI;
        hd:arbolI;
    end;

    /// punto F ///
    cant = record
        isbn:integer;
        totalPrestamos:integer;
    end;
    
    arbolT = ^nodoT;
    nodoT = record
        data : cant;
        hi:arbolT;
        hd:arbolT;
    end;

    /// punto G ///
    arbolIT = ^nodoIT;
    nodoIT = record
        data: cant;
        hi: arbolIT;
        hd:arbolIT;
    end;

    procedure cargarPrestamos (var ap:arbolP; var ai : arbolI);
        procedure agregarEnLista (var l:lista; p:prestamo);
        var
            ant,act,nue:lista;
        begin
            new(nue);
            nue^.data:= p;
            nue^.sig:= nil;
            if (l = nil) then
                l:= nue
            else begin
                ant:= l; act:= l;
                while (act <> nil) and (act^.data.isbn < nue^.data.isbn) do begin
                    ant:= act;
                    act:= act^.sig;
                end;
                if (ant = act) then begin
                    nue^.sig:= l;
                    l := nue;
                end
                else begin
                    ant^.sig:= nue;
                    nue^.sig:= act;
                end;
            end;
        end;
        procedure agregarPrestamo (var ap:arbolP; p:prestamo);
        begin
            if (ap = nil) then begin
                new(ap);
                ap^.data := p;
                ap^.hi:= nil; ap^.hi:= nil;
            end
            else if (ap^.data.isbn > p.isbn) then 
                agregarPrestamo(ap^.hi, p)
            else 
                agregarPrestamo(ap^.hd,p);
        end;

        procedure agregarISBN (var ai:arbolI; p:prestamo);
        begin
            if (ai = nil) then begin
                new(ai);
                ai^.data.isbn := p.isbn;
                ai^.data.prestamos := nil;
                ai^.hi := nil ; ai^.hd:= nil;
                agregarEnLista (ai^.data.prestamos, p)
            end
            else if (ai^.data.isbn = p.isbn) then
                agregarEnLista (ai^.data.prestamos, p)
            else if (ai^.data.isbn > p.isbn) then 
                agregarISBN (ai^.hi, p)
            else
                agregarISBN(ai^.hd, p);
        end;

        procedure leerPrestamo ( var p:prestamo);
        begin
            write('Ingrese el ISBN: ');readln(p.isbn);
            if (p.isbn <> -1) then begin
                write('Ingrese el numero de socio: ');readln(p.num);
                write('Ingrese el dia del prestamo: ');readln(p.dia);
                write('Ingrese el mes del prestamo: ');readln(p.mes);
                write('Ingrese la cantidad de dias prestados: ');readln(p.cant);
            end;
        end;
    var
        p:prestamo;
    begin
        leerPrestamo (p);
        if (p.isbn <> -1) then begin
            agregarPrestamo(ap,p);
            agregarISBN(ai,p);
            cargarPrestamos(ap,ai);
        end;
    end;

    procedure mostrarArbolPrestamos (ap:arbolP);
    begin
        if (ap <> nil) then begin
            mostrarArbolPrestamos(ap^.hi);
            writeln('---------------------------------------------------------------------------------------');
            writeln('ISBN: ', ap^.data.isbn, ' | ', 'Numero de socio: ', ap^.data.num);
            writeln(' | ','Dia del prestamo: ',ap^.data.dia, ' | ','Mes del prestamo: ',ap^.data.mes, ' | ','Cantidad de dias prestado: ', ap^.data.cant);
            writeln('---------------------------------------------------------------------------------------');
            writeln();
            mostrarArbolPrestamos(ap^.hd);
        end;
    end;

    procedure mostrarArbolISBN (ai:arbolI);
        procedure mostrarListaPrestamos (l:lista);
        begin
            if (l <> nil) then begin
                writeln('---------------------------------------------------------------------------------------');
                writeln('ISBN: ', l^.data.isbn, ' | ', 'Numero de socio: ', l^.data.num);
                writeln(' | ','Dia del prestamo: ',l^.data.dia, ' | ','Mes del prestamo: ',l^.data.mes, ' | ','Cantidad de dias prestado: ', l^.data.cant);
                writeln('---------------------------------------------------------------------------------------');
                writeln();
                mostrarListaPrestamos(l^.sig);
            end;
        end;
    begin
        if (ai <> nil) then begin
            mostrarArbolISBN(ai^.hi);
            writeln('---------------------------------------------------------------------------------------');
            writeln('ISBN: ', ai^.data.isbn, ' | ', 'Prestamos realizados: ');
            mostrarListaPrestamos(ai^.data.prestamos);
            writeln('---------------------------------------------------------------------------------------');
            writeln();
            mostrarArbolISBN(ai^.hd);
        end;
    end;

    {
    b. Un módulo recursivo que reciba la estructura generada en i. y retorne el ISBN más grande.
    }
    
    procedure isbnMax (ap:arbolP);
        function devolverMax (ap:arbolP):integer;
        begin
            if (ap^.hd <> nil) then 
                devolverMax := devolverMax (ap^.hd)
            else
                devolverMax := ap^.data.isbn;

        end;
    begin
        if (ap = nil) then
            writeln('Arbol vacio.')
        else 
            writeln('El ISBN mas grande encontrado en la primer estructura es: ', devolverMax (ap));
    end;

    {
    c. Un módulo recursivo que reciba la estructura generada en ii. y retorne el ISBN más
    pequeño.
    }
    procedure isbnMin (ai:arbolI);
        function devolverMin(ai:arbolI):integer;
        begin
            if (ai^.hi <> nil) then
                devolverMin := devolverMin (ai^.hi)
            else
                devolverMin := ai^.data.isbn;
        end;
    begin
        if (ai = nil) then
            writeln('Arbol vacio.')
        else
            writeln('El isbn mas chico de la segunda estructura es: ', devolverMin(ai));
    end;

    {
    d. Un módulo recursivo que reciba la estructura generada en i. y un número de socio. El
    módulo debe retornar la cantidad de préstamos realizados a dicho socio.
    }
    procedure prestamosASocio (ap:arbolP);
        function contarCant (ap:arbolP; cod:integer):integer;
        begin
            if (ap <> nil) then begin
                if (ap^.data.num = cod) then
                    contarCant := contarCant (ap^.hi,cod) + contarCant (ap^.hd,cod) + 1
                else
                    contarCant := contarCant (ap^.hi,cod) + contarCant (ap^.hd,cod);
            end
            else
                contarCant := 0;
        end;
    var
        cod:integer;
    begin
        write('Ingrese un codigo de socio para contar: ');readln(cod);
        if (ap = nil) then
            writeln('Arbol vacio.')
        else
            writeln('La cantidad de prestamos que realizo el socio ', cod, ' es de: ', contarCant(ap,cod));
    end;

    {
    e. Un módulo recursivo que reciba la estructura generada en ii. y un número de socio. El
    módulo debe retornar la cantidad de préstamos realizados a dicho socio.
    }
    procedure prestamosASocio2 (ai:arbolI);
        function contarCant(l:lista;cod:integer):integer;
        begin
            if (l <> nil) then begin
                if (l^.data.num = cod) then
                    contarCant:= contarCant(l^.sig,cod) + 1
                else
                    contarCant := contarCant (l^.sig,cod);
            end
            else
                contarCant := 0;
        end;
        
        function recorrer (ai:arbolI; cod:integer):integer;
        begin
            if (ai <> nil) then
                recorrer := recorrer(ai^.hi,cod) + recorrer(ai^.hd,cod) + contarCant (ai^.data.prestamos,cod)
            else
                recorrer := 0;
        end;
    var
        cod:integer;
    begin
        write('Ingrese un codigo de socio para contar: ');readln(cod);
        if (ai = nil) then
            writeln('Arbol vacio.')
        else begin
            writeln('La cantidad de prestamos realizados por el socio ', cod);
            writeln(' registrados en la segunda estructura es: ', recorrer(ai,cod));
        end;
    end;

    {
    f. Un módulo que reciba la estructura generada en i. y retorne una nueva estructura
    ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
    que se prestó.
    }

    procedure cargarContador (var at:arbolT; ap:arbolP);
        procedure agregarTotal (var at:arbolT; ap:arbolP);
        begin
            if (at = nil) then begin
                new(at);
                at^.data.isbn := ap^.data.isbn;
                at^.data.totalPrestamos := 1;
                at^.hi := nil ; at^.hd :=nil;
            end
            else if (at^.data.isbn = ap^.data.isbn) then
                at^.data.totalPrestamos := at^.data.totalPrestamos + 1
            else if (at^.data.isbn > ap^.data.isbn) then
                agregarTotal(at^.hi,ap)
            else
                agregarTotal(at^.hd,ap);
        end;
    begin
        if (ap <> nil) then begin
            cargarContador(at,ap^.hi);
            agregarTotal(at, ap);
            cargarContador(at,ap^.hd);
        end;
    end;
    {
        h. Un módulo recursivo que reciba la estructura generada en h. y muestre su contenido.
    }
    procedure mostrarArbolTotales (at:arbolT);
    begin
        if (at <> nil) then begin
            mostrarArbolTotales(at^.hi);
            writeln('---------------------------------------------------------------------------------------');
            writeln('ISBN: ', at^.data.isbn, ' | ', 'Cantidad de prestamos: ', at^.data.totalPrestamos);
            writeln('---------------------------------------------------------------------------------------');
            writeln();
            mostrarArbolTotales(at^.hd);
        end;
    end;

    {
    g. Un módulo que reciba la estructura generada en ii. y retorne una nueva estructura
    ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
    que se prestó.
    }
    procedure cargarSegundoContador (var ait:arbolIT; ai:arbolI);
        function contarElementos(l:lista):integer;
        begin
            if (l <> nil) then
                contarElementos := contarElementos (l^.sig) + 1
            else
                contarElementos := 0;
        end;
        procedure agregarAcumulador (var ait:arbolIT; ai:arbolI);
        begin
            if (ait = nil) then begin
                new(ait);
                ait^.data.isbn := ai^.data.isbn;
                ait^.data.totalPrestamos := contarElementos(ai^.data.prestamos);
                ait^.hi := nil; ait^.hd := nil;
            end
            else if (ait^.data.isbn > ai^.data.isbn) then
                agregarAcumulador(ait^.hi,ai)
            else
                agregarAcumulador(ait^.hd,ai);
        end;
    begin
        if (ai <> nil) then begin
            cargarSegundoContador(ait, ai^.hi);
            agregarAcumulador(ait,ai);
            cargarSegundoContador(ait,ai^.hd);
        end;
    end;
    {
        h. Un módulo recursivo que reciba la estructura generada en h. y muestre su contenido.
    }
    procedure mostrarArbolSegundosTotales (ait:arbolIT);
    begin
        if (ait <> nil) then begin
            mostrarArbolSegundosTotales(ait^.hi);
            writeln('---------------------------------------------------------------------------------------');
            writeln('ISBN: ', ait^.data.isbn, ' | ', 'Cantidad de prestamos: ', ait^.data.totalPrestamos);
            writeln('---------------------------------------------------------------------------------------');
            writeln();
            mostrarArbolSegundosTotales(ait^.hd);
        end;
    end;

    {
    i. Un módulo recursivo que reciba la estructura generada en i. y dos valores de ISBN. El
    módulo debe retornar la cantidad total de préstamos realizados a los ISBN
    comprendidos entre los dos valores recibidos (incluidos).
    }

    procedure encontrarEntreValores1 (ap:arbolp);
        function recorrerArbol (ap:arbolP; cod1, cod2:integer):integer;
        begin
            if (ap <> nil) then begin
                if (ap^.data.isbn >= cod1) then begin
                    if (ap^.data.isbn <= cod2) then
                        recorrerArbol := recorrerArbol(ap^.hi,cod1,cod2) + recorrerArbol(ap^.hd,cod1,cod2) + 1
                    else
                        recorrerArbol := recorrerArbol(ap^.hi,cod1,cod2);
                end
                else
                    recorrerArbol(ap^.hd,cod1,cod2);
            end
            else
                recorrerArbol := 0;
        end;
    var
        cod1,cod2:integer;
    begin
        write('Ingrese un codigo piso: ');readln(cod1);
        write('Ingrese un codigo techo: ');readln(cod2);
        if (ap = nil) then
            writeln('Arbol vacio.')
        else 
            writeln('La cantidad de prestamos comprendidos entre los dos codigos ingresados es:', recorrerArbol(ap,cod1,cod2));
    end;

    {
    j. Un módulo recursivo que reciba la estructura generada en ii. y dos valores de ISBN. El
    módulo debe retornar la cantidad total de préstamos realizados a los ISBN
    comprendidos entre los dos valores recibidos (incluidos).
    }
    procedure encontrarEntreValores2 (ai:arbolI);
        function contarLista (l:lista):integer;
        begin
            if (l <> nil) then
                contarLista := contarLista(l^.sig) + 1
            else
                contarLista := 0;
        end;

        function recorrerArbol2 (ai:arbolI; cod1,cod2:integer):integer;
        begin
            if (ai <> nil) then begin
                if (ai^.data.isbn >= cod1) then begin
                    if (ai^.data.isbn <= cod2) then
                        recorrerArbol2 := recorrerArbol2(ai^.hi,cod1,cod2) + recorrerArbol2(ai^.hd,cod1,cod2) + contarLista(ai^.data.prestamos)
                    else
                        recorrerArbol2:= recorrerArbol2(ai^.hi,cod1,cod2);
                end
                else
                    recorrerArbol2:= recorrerArbol2(ai^.hd,cod1,cod2);
            end
            else
                recorrerArbol2 := 0;
        end;
    var
        cod1,cod2:integer;
    begin
        write('Ingrese un codigo piso: ');readln(cod1);
        write('Ingrese un codigo techo: ');readln(cod2);
        if (ai = nil) then
            writeln('Arbol vacio.')
        else 
            writeln('La cantidad de prestamos comprendidos entre los dos codigos ingresados es:', recorrerArbol2(ai,cod1,cod2));
    end;

var
    ap:arbolP;
    ai:arbolI;
    at:arbolT;
    ait:arbolIT;
begin
    ap := nil ; ai:= nil;
    at := nil ; ait:= nil; 
    cargarPrestamos(ap,ai);
    writeln('-----------------------------------------------------------------------------------------------------------');
    writeln('Prestamos cargados en el arbol: ');
    mostrarArbolPrestamos(ap);
    writeln('-----------------------------------------------------------------------------------------------------------');
    writeln();
    writeln('-----------------------------------------------------------------------------------------------------------');
    writeln('Prestamos de cada ISBN: ');
    mostrarArbolISBN(ai);
    writeln('-----------------------------------------------------------------------------------------------------------');
    writeln();
    isbnMax(ap);
    isbnMin(ai);
    prestamosASocio(ap);
    prestamosASocio2(ai);
    writeln('Estructura punto F');
    cargarContador(at,ap);
    mostrarArbolTotales(at);
    writeln('Estructura punto G');
    cargarSegundoContador(ait, ai);
    mostrarArbolSegundosTotales(ait);
    encontrarEntreValores1(ap);
    encontrarEntreValores2(ai);
end.
