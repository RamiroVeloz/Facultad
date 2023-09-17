{
2. Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la
información de los autos en venta. Implementar un programa que:





}

program ej2;

const
    max = 2018;

type
{
a) Lea la información de los autos (patente, año de fabricación (2010..2018), marca y
modelo) y los almacene en dos estructuras de datos:
}
    rango = 2010..max;
    str = string [25];

    auto = record
        patente:integer;
        anio:rango;
        marca:str;
        modelo:str;
    end;

{
i. Una estructura eficiente para la búsqueda por patente.
}
    arbolP = ^nodoP;
    nodoP = record
        data:auto;
        hi:arbolP;
        hd:arbolP;
    end;

{
ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben
almacenar todos juntos los autos pertenecientes a ella.
}
    lista = ^nodo;
    nodo = record
        data:auto;
        sig:lista;
    end;
    
    arbolM = ^nodoM;
    nodoM = record
        data:lista;
        hi:arbolM;
        hd:arbolM;
    end;

    vector = array [rango] of lista;

    procedure agregarAutoEnLista (var l:lista; a:auto);
    var
        ant,act,nue:lista;
        begin
            new(nue);
            nue^.data := a;
            nue^.sig:= nil;
            if (l = nil) then
                l:= nue
            else begin
                ant:= l; act:= l;
                while (act <> nil) and (act^.data.patente < nue^.data.patente) do begin
                    ant:= act; 
                    act:= act^.sig;
                end;
                if (ant = act) then begin
                    nue^.sig := l;
                    l:= nue;
                end
                else begin
                    ant^.sig:= nue;
                    nue^.sig:= act;
                end;
            end;
        end;

    procedure mostrarLista (l:lista);
        begin
            if (l<> nil) then begin
                writeln('---------------------------------------------');
                writeln('Patente: ', l^.data.patente, ' | ', 'Anio: ', l^.data.anio);
                writeln('Marca: ', l^.data.marca,    ' | ', 'Modelo: ', l^.data.modelo);
                writeln('---------------------------------------------');
                writeln();
                mostrarLista(l^.sig);
            end;
        end;

    procedure cargarAutos (var ap:arbolP; var am:arbolM);
        procedure leerAuto (var a:auto);
        begin
            write('Ingrese la patente: ');readln(a.patente);
            if (a.patente <> 0) then begin
                write('Ingrese el anio de fabricacion: ');readln(a.anio);
                write('Ingrese la marca: ');readln(a.marca);
                write('Ingrese el modelo: ');readln(a.modelo);
                writeln();
            end;
        end;

        procedure agregarMarcaYAuto (var am:arbolM; a:auto);
        begin
            if (am = nil) then begin
                new(am);
                am^.data:= nil;
                agregarAutoEnLista (am^.data,a);
                am^.hi:= nil; am^.hd := nil;
            end
            else if (a.marca = am^.data^.data.marca) then
                agregarAutoEnLista(am^.data, a)
            else if (am^.data^.data.marca > a.marca) then
                agregarMarcaYAuto(am^.hi, a)
            else
                agregarMarcaYAuto(am^.hd,a);
        end;

        procedure agregarAutoEnArbol (var ap:arbolP; a:auto);
        begin
            if (ap = nil) then begin
                new(ap);
                ap^.data:= a;
                ap^.hi := nil; ap^.hd := nil;
            end
            else if (ap^.data.patente > a.patente) then
                agregarAutoEnArbol(ap^.hi, a)
            else
                agregarAutoEnArbol(ap^.hd,a);
        end;
    var
        a:auto;
    begin
        leerAuto(a);
        if (a.patente <> 0) then begin
            agregarAutoEnArbol(ap,a);
            agregarMarcaYAuto(am,a);
            cargarAutos(ap,am);
        end;
    end;

    procedure mostrarAutos (ap:arbolP);
    begin
        if (ap <> nil) then begin
            mostrarAutos(ap^.hi);
            writeln('---------------------------------------------');
            writeln('Patente: ', ap^.data.patente, ' | ', 'Anio: ', ap^.data.anio);
            writeln('Marca: ', ap^.data.marca,    ' | ', 'Modelo: ', ap^.data.modelo);
            writeln('---------------------------------------------');
            writeln();
            mostrarAutos(ap^.hd);
        end;
    end;

    procedure mostrarMarcasYAutos (am:arbolM);
    begin
        if (am <> nil) then begin
            mostrarMarcasYAutos(am^.hi);
            mostrarLista(am^.data);
            mostrarMarcasYAutos(am^.hd);
        end;
    end;

{
b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
cantidad de autos de dicha marca que posee la agencia.
}
    procedure contarMarca1 (ap:arbolP);
        function contar (ap:arbolP; nom:str):integer;
        begin
            if (ap <> nil) then begin
                if (ap^.data.marca = nom) then
                    contar := contar(ap^.hi,nom) + contar(ap^.hd,nom) + 1
                else
                    contar := contar(ap^.hi,nom) + contar(ap^.hd,nom);
            end
            else
                contar := 0;
        end;
    var
        nom:str;
    begin
        write('Ingrese una marca para contar: ');readln(nom);
        if (ap = nil) then
            writeln('Arbol vacio.')
        else
            writeln('La cantidad de autos de la marca ', nom , ' es: ', contar(ap,nom));
    end;

{
c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
la cantidad de autos de dicha marca que posee la agencia.
}
    procedure contarMarca2 (am:arbolM);
        function contarLista (l:lista):integer;
        begin
            if ( l <> nil ) then 
                contarLista := contarLista (l^.sig) + 1
            else
                contarLista := 0;
        end;

        function contar2 (am:arbolM; nom:str):integer;
        begin
            if (am <> nil) then begin
                if (am^.data^.data.marca  = nom) then
                    contar2 := contarLista(am^.data)
                else if (am^.data^.data.marca < nom) then
                    contar2 := contar2(am^.hd,nom)
                else 
                    contar2 := contar2(am^.hi,nom);
            end
            else
                contar2:= 0;
        end;
    var
        nom:str;
    begin
        write('Ingrese una marca para contar: ');readln(nom);
        if (am = nil) then
            writeln('Arbol vacio.')
        else
            writeln('La cantidad de vehiculos de la marca ', nom , ' es: ', contar2(am,nom));
    end;

{
d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
la información de los autos agrupados por año de fabricación.
}
    procedure inicializarVector (var v:vector);
    var
        i:rango;
    begin
        for i:=2010 to max do
            v[i] := nil;
    end;

    procedure retornarEstructura (var v:vector; ap:arbolP);
    begin
        if (ap <> nil ) then begin
            retornarEstructura(v,ap^.hi);
            agregarAutoEnLista(v[ap^.data.anio], ap^.data);
            retornarEstructura(v,ap^.hd);
        end;
    end;

    procedure mostrarVector (v:vector);
        
    var
        i:rango;
    begin
        for i:= 2010 to max do
            if (v[i] <> nil) then begin
                mostrarLista(v[i]);
                writeln();
            end;
    end;

{
e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
modelo del auto con dicha patente.
}
    procedure buscarPatente (ap:arbolP);
        function devolverModelo (ap:arbolP; num:integer):string;
        begin
            if (ap <> nil) then begin
                if (ap^.data.patente = num) then
                    devolverModelo := ap^.data.modelo
                else if (ap^.data.patente < num) then
                    devolverModelo := devolverModelo(ap^.hd,num)
                else
                    devolverModelo := devolverModelo(ap^.hi,num);
            end
            else
                devolverModelo := '#';
        end;
    var
        num:integer;
        modelo:str;
    begin
        write('Ingrese un numero de patente: ');readln(num);
        if(ap = nil) then
            writeln('Arbol vacio.')
        else begin
            modelo:= devolverModelo(ap,num);
            writeln('El modelo de auto correspondiente a la patente es: ', modelo);
        end;
    end;

{
f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
modelo del auto con dicha patente.
}
    procedure buscarPatente2 (am:arbolM);
        function recorrerLista (l:lista;num:integer):string;
        begin
            if ( l <> nil ) then begin
                if (l^.data.patente = num) then
                    recorrerLista := l^.data.modelo
                else
                    recorrerLista := recorrerLista (l^.sig,num);
            end;
        end;

        function encontrar (l:lista;num:integer):boolean;
        begin
            if ( l <> nil ) then begin
                if (l^.data.patente = num) then
                    encontrar := true
                else
                    encontrar := encontrar (l^.sig,num);
            end
            else
                encontrar := false;
        end;

        procedure devolverModelo (am:arbolM; var modelo:str; num:integer);
        var
            aux:boolean;
        begin
            if (am <> nil) then begin
                aux := encontrar(am^.data,num);
                if (aux = true) then
                    modelo := recorrerLista(am^.data,num)````
                else begin
                    devolverModelo (am^.hi,modelo,num);
                    devolverModelo(am^.hd,modelo,num);
                end;
            end;
        end;
    var
        modelo:str;
        num:integer;
    begin
        write('Ingrese un numero de patente para encontrar su modelo: ');readln(num);
        if (am <> nil) then begin
            devolverModelo(am,modelo,num);
            writeln('El modelo de la patente ', num , ' es: ',modelo);
        end
        else
            writeln('Arbol vacio');
    end;

var
    ap:arbolP;
    am:arbolM;
    v:vector;
begin
    ap:=nil;
    am:=nil;
    cargarAutos(ap,am);
    writeln('Arbol de patentes: ');
    mostrarAutos(ap);
    writeln();
    //writeln('Arbol de Marcas: ');
    //mostrarMarcasYAutos(am);
    //contarMarca1(ap);
    //contarMarca2(am);
    inicializarVector(v);
    retornarEstructura(v,ap);
    mostrarVector(v);
    buscarPatente(ap);
    buscarPatente2(am);
end.
