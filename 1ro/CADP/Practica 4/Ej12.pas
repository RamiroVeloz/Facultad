{
12. En astrofísica, una galaxia se identifica por su nombre, su tipo (1. elíptica; 2. espiral; 3. lenticular; 4.
irregular), su masa (medida en kg) y la distancia en pársecs (pc) medida desde la Tierra. La Unión
Astronómica Internacional cuenta con datos correspondientes a las 53 galaxias que componen el Grupo
Local. Realizar un programa que lea y almacene estos datos y, una vez finalizada la carga, informe:
a) la cantidad de galaxias de cada tipo.
b) la masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) y el
porcentaje que esto representa respecto a la masa de todas las galaxias.
c) la cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc.
d) el nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.
}

program ej12 ;

const
    dimft = 4;
    dimfg = 5;
    limitestr = 20;

type
    rangot = 1..dimft;
    rangog = 0..dimfg;
    str = string [limitestr];

    vect = array [rangot] of integer;

    galaxia = record
        nom:str;
        tipo: rangot;
        masa:real;
        dtp:real;
    end;
    vecg = array [rangog] of galaxia;

    procedure cargaYAnalisis ();

        procedure inicializarVector (var vt:vect);
        var
            i:integer;
        begin
            for i:= 0 to dimft do
                vt[i]:= 0;
        end;

        procedure mostrarCant (vt:vect);
        var
            i:integer;
        begin
            for i:= 0 to dimft do 
                writeln ('Existen ',vt[i],' de galaxias del tipo ', i , ' .');
        end;

        procedure lectura (var g:galaxia);
        begin
            write('Ingrese el nombre de la galaxia : ');readln(g.nom);
            write('Ingrese el tipo: ');readln(g.tipo);
            write('Ingrese la masa: '); readln (g.masa);
            write('Ingrese la distancia a la tierra en parsecs: ');readln(g.dtp);
        end;

        procedure carga (var vg: vecg);
        var
            i:integer;
            vt:vect;
            g:galaxia;
        begin
            inicializarVector (vt);
            for i:=0 to dimfg do begin
                lectura(g);
                vt[g.tipo]:= vt[g.tipo] + 1;
                vg[i]:= g;
            end;
            mostrarCant(vt);
        end;

        procedure mostrarVG (vg:vecg);
        var
            i:integer;
        begin
            for i:= 0 to dimfg do begin
                writeln(vg[i].nom);
                writeln(vg[i].tipo);
                writeln(vg[i].masa);
                writeln(vg[i].dtp);
            end;
        end;

        procedure calcularMax (var n1,n2:str; var m1,m2:real; nom:str; masa:real);
        begin
            if (masa > m1 ) and (n1 <> nom) then begin
                m2:= m1; n2:= n1;
                n1:= nom ; m1:= masa;
            end
            else if (masa > m2) and (n1 <> nom) then begin
                m2:= masa; n2:= nom;
            end;
        end;

        procedure calcularMin (var n1,n2:str; var m1,m2:real; nom:str; masa:real);
        begin
            if (masa < m1 ) and (n1 <> nom) then begin
                m2:= m1; n2:= n1;
                n1:= nom ; m1:= masa;
            end
            else if (masa < m2) and (n1 <> nom) then begin
                m2:= masa; n2:= nom;
            end;
        end;

        procedure recorrerVG (vg:vecg);
        var
            i,cant:integer;
            mtres,mtotal,pm,mmax1,mmax2,mmin1,mmin2:real;
            nmax1,nmax2,nmin1,nmin2:str;
        begin
            mtres:= 0;
            mtotal:= 0;
            cant:= 0;
            for i:= 0 to dimfg do begin
                mtotal := mtotal + vg[i].masa;
                if (vg[i].nom = 'andromeda') or (vg[i].nom = 'via lactea') or (vg[i].nom = 'triangulo') then
                    mtres := mtres + vg[i].masa;
                if (vg[i].tipo = 4) and (vg[i].dtp < 1000) then
                    cant:= cant + 1;
                calcularMax (nmax1,nmax2,mmax1,mmax2,vg[i].nom,vg[i].masa);
                calcularMin (nmin1,nmin2,mmin1,mmin2,vg[i].nom,vg[i].masa);
            end;
            pm := (mtres / 100) * mtotal;
            writeln ('La masa total acumulada de las tres galaxias principales es: ',mtres:4:2);
            writeln ('El porcentaje que representa su peso respecto a la masa de todas las galaxias es: ', pm:4:2);
            writeln('La cantidad de galaxias irregulares que tienen una distancia menor a 1000pc es de : ', cant);
            writeln ('Las dos galaxias con mayor masa son: ');
            writeln ('1- La galaxia ', nmax1 , ' con una masa de ', mmax1:4:2);
            writeln ('2- La galaxia ', nmax2 , ' con una masa de ', mmax2:4:2);
            writeln ('Las dos galaxias con menor masa son: ');
            writeln ('1- La galaxia ', nmin1 , ' con una masa de ', mmin1:4:2);
            writeln ('2- La galaxia ', nmin2 , ' con una masa de ', mmin2:4:2);
        end; 
    var
        vg:vecg;
    begin
        carga(vg);
        recorrerVG(vg);
    end;

begin
    cargaYAnalisis();
end.