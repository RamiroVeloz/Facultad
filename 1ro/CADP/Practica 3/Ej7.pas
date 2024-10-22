program ej7;
const
    limitestr = 50;
type
    str = string [limitestr];
    centro = record
        uni: str;
        nom:str;
        cantInv: integer;
        cantBec:integer;
    end;
    procedure corte ();
        procedure lectura (var c:centro);
        begin
            write('Ingrese el nombre del centro: ');readln(c.nom);
            write('Ingrese el nombre de la universidad: ');readln (c.uni);
            write('Ingrese la cantidad de investigadores: ');readln (c.cantInv);
            write('Ingrese la cantidad de becarios: ');readln (c.cantBec);
        end;
        procedure calcularMax (var maxInv:integer; var unMax:str; cant:integer; nom:str);
        begin
            if (cant > maxInv) and (unMax <> nom) then 
            begin
                maxInv:= cant;
                unMax := nom;
            end;
        end;
        procedure calcularMin (var min1,min2:str; var minBec1, minBec2:integer; nom:str; cant:integer );
        begin
            if (minBec1 > cant) and (min1 <> nom) then
            begin
                minBec2:= minBec1;
                min2:= min1;
                minBec1:= cant;
                min1:= nom;
            end
            else if (minBec2 > cant) and (min2 <> nom) then
            begin
                minBec2:= cant;
                min2:= nom;
            end;
        end;
        procedure carga ();
        var
            c:centro;
            act : str;
            cc:integer;
            maxInv,cantAct: integer;
            unMax:str;
            minBec1,minBec2:integer;
            min1,min2:str;
        begin
            maxInv:= 0;
            lectura(c);
            unMax:= '';
            while (c.cantInv <> 0) do 
            begin
                min1:= '';
                min2:= '';
                minBec1:= 9998;
                minBec2:= 9999;  
                cc:= 0;
                cantAct:= 0;
                act:= c.uni;
                while (act = c.uni) and (c.cantInv <> 0) do
                begin
                    cc:= cc + 1;
                    cantAct := cantAct + c.cantInv;
                    calcularMin(min1,min2,minBec1,minBec2, c.nom, c.cantBec);
                    lectura(c);
                end;
                calcularMax (maxInv,unMax,cantAct,act);
                writeln('La universidad ', act , ' tiene un total de centros de: ', cc);
                writeln('Los dos centros con menor cantidad de becarios en la universidad actual son: ');     
                writeln('1-' , min1 , ' con una cantidad de becarios igual a : ', minBec1);
                writeln('2-', min2 , ' con una cantidad de becarios igual a: ', minBec2);
            end;
            writeln('La universidad con mayor cantidad de investigadores en total es :  ');
            writeln(unMax ,' con un total de ', maxInv , ' investigadores.' );
        end;
    begin
        carga();
    end;
begin
    corte();
end.