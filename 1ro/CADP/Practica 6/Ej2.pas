program ejercicio2;
type

    lista = ^nodo;
    persona = record
        dni: integer;
        nombre: string;
        apellido: string;
    end;

    nodo = record
        dato: persona;
        sig: lista;
    end;

    procedure leerPersona(p: persona);//si no se pasa por referencia persona, no se puede modificar el registro como tal, por lo que no se puede devolver fuera del programa.
    begin
        read(p.dni);
        if (p.dni <> 0)then begin
            read(p.nombre);
            read(p.apellido);
        end;
    end;
    
{Agrega un nodo a la lista}
    procedure agregarAdelante(l:lista;p:persona);//si no se pasa por referencia lista, no se puede modificar, por lo que todo cambio dentro del procedimiento queda invalido fuera de el.
    var
        aux: lista;
    begin
        //no se hizo new(aux)
        aux^.dato:= p;
        aux^.sig:= l;
        l:= aux;
    end;

{Carga la lista hasta que llega el dni 0}
    procedure generarLista(var l:lista);
    var
        p:nodo;//p deberia ser persona no nodo, por ende al querer agregar un elemento, se le agrega un registro erroneo.
    begin
        leerPersona(p);//no se puede leer este registro ya que el modulo leer persona accede a los campos del registro persona, que nodo no posee
        while (p.dni <> 0) do begin
            agregarAdelante(l,p);
            //se debe ejecutar el procedimiento de lectura para que el programa tenga inicio y fin, de forma contraria, este codigo ejecuta infinitamente.
        end;
    end;

    procedure imprimirInformacion(var l:lista);
    begin
        while (l <> nil) do begin
            writeln('DNI: ', l^.dato.dni, 'Nombre: ',l^.nombre, 'Apellido: ', l^.apellido);//apellido y nombre son accedidos de forma erronea
            l:= l^.sig;
        end;
    end;

{Programa principal}
var
    l:lista;
begin
    generarLista(l);
    imprimirInformacion(l);
end.

