{
1. En un colegio secundario, cada alumno participa de un proyecto de ciencias. El proyecto de
un alumno pertenece a un tópico (volcanes, vida marina, migración de las aves, etc.). Un
mismo alumno pudo haber presentado más de un proyecto (en distintos tópicos). En la
última hora del evento las personas visitantes pueden votar el proyecto del alumno que más
le gustó.


a. Realice un programa para el sistema de votación. Un voto consiste en el nombre del
alumno y el tópico en el cual pertenece el proyecto.
 Almacene esta información en una estructura óptima para la búsqueda, ordenada
por nombre de alumno. Para cada alumno almacene todos sus proyectos ordenado
por tópico.


c. Al finalizar la carga (se lee el alumno ‘zzz’) se debe informar:
i. Cual fue el proyecto ganador: nombre del alumno, tópico y cantidad de
votos.


ii. Número de votos totales, es decir la suma de los votos de todos los
proyectos en los que participa un alumno, ordenados alfabéticamente por
nombre de alumno.
}

program rep2;

type
	str = string[20];

	topico= record
		nom:str;
	end;

	lista = ^nodoT;
	nodoT = record
		data:topico;
		sig:lista;
	end;
	
	alumno = record
		nom:str;
		listaTopicos:lista;
	end;

	arbol = ^nodoA;
	nodoA = record
		data:alumno;
		hi:arbol;
		hd:arbol;
	end;

	procedure cargarArbol (var a:arbol);
		procedure agregarTopicosOrdenados (var l:lista; t:topico);
		var
			ant,act,nue:lista;
		begin
			new(nue);
			nue^.data := t;
			nue^.sig:= nil;
			if (l = nil) then
				l:= nue
			else begin
				ant:= l; act:= l;
				while (act <> nil) and (act^.data.nom < nue^.data.nom) do begin
					ant:= act;
					act:= act^.sig;
				end;
				if (ant = act) then begin
					nue^.sig:= l;
					l:= nue;
				end
				else begin
					ant^.sig:= nue;
					nue^.sig:= act;
				end;
			end;
		end;

		procedure agregarAlumno (var a:arbol; alu:alumno; t:topico);
		begin
			if (a = nil) then begin
				new(a);
				a^.data.nom := alu.nom;
				a^.data.listaTopicos := nil;
				agregarTopicosOrdenados(a^.data.listaTopicos, t);
				a^.hi := nil; a^.hd := nil;
			end
			else if (a^.data.nom = alu.nom ) then
				agregarTopicosOrdenados(a^.data.listaTopicos, t)
			else if (a^.data.nom > alu.nom) then
				agregarAlumno (a^.hi, alu,t)
			else
				agregarAlumno (a^.hd,alu,t);
		end;

	var
		alu:alumno; t:topico;
	begin
		write('Ingrese el nombre del alumno: ');readln(alu.nom);
		if (alu.nom <> 'zzz') then begin
			write('Ingrese el topico: '); readln(t.nom);
			agregarAlumno(a,alu,t);
			cargarArbol(a);
		end;
	end;

	procedure mostrarArbol (a:arbol);
		procedure mostrarLista(l:lista);
		begin
			if (l<> nil) then begin
				writeln('Topico: ', l^.data.nom);
				mostrarLista(l^.sig);
			end;
		end;
	begin
		if (a<> nil) then begin
			mostrarArbol(a^.hi);
			writeln('Nombre del alumno: ', a^.data.nom);
			writeln('Topicos votados: ');
			mostrarLista(a^.data.listaTopicos);
			writeln();
			mostrarArbol(a^.hd);
		end;
	end;

	procedure informarGanador (a:arbol);
		procedure devolverMax (l:lista; var maxT:str; var cantv:integer);
		var
			act:str; cant:integer;
		begin
			if (l<> nil) then begin
				while (l<> nil) do begin
				act:= l^.data.nom;
				cant:= 0;
				while  (l<> nil) and(act = l^.data.nom) do begin
					cant:= cant+1;
					l:= l^.sig;
				end;
				if (cant > cantV) then begin
					cantv:= cant;
					maxT := act;
				end;
				end;
			end;
		end;

		procedure retornarGanador (a:arbol; var maxt:str; var cantv:integer);
		begin
			if (a<> nil) then begin
				retornarGanador(a^.hi,maxt,cantv);
				devolverMax (a^.data.listaTopicos, maxt,cantv);
				retornarGanador(a^.hd,maxt,cantv);
			end;
		end;
	var
		maxt:str;
		cantv:integer;
	begin
		maxt := '';
		cantv:= -1;
		retornarGanador(a,maxt,cantv);
		writeln('El proyecto con mas votos es: ', maxt, ' con un total de : ', cantv);
	end;

	procedure informarCantidades (a:arbol);
		function contarLista (l:lista):integer;
		begin
			if (l<>nil) then
				contarLista := contarLista(l^.sig) +1
			else
				contarLista := 0;
		end;
	begin
		if (a<>nil) then begin
			informarCantidades (a^.hi);
			writeln('El alumno ',a^.data.nom, ' tiene un total de ', contarLista(a^.data.listaTopicos), ' votos.');
			informarCantidades(a^.hd);
		end;
	end;

var
	a:arbol;
begin
	a:= nil;
	cargarArbol(a);
	mostrarArbol(a);
	informarGanador(a);
	informarCantidades(a);
end.
