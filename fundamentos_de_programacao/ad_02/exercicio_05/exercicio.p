program ad_02_exericio_05;

uses
 sysutils;

type
  T_info= integer;
  T_point= ^T_elemento;
  T_elemento = record
                num: T_info;
                prox: T_point;
              end;


function tamanhoPonteiro(ponteiro: T_point): integer;
var
  tamanho: integer;
  tempPonteiro: T_point;
begin
  tamanho:=0;
  tempPonteiro:= ponteiro;

  while tempPonteiro <> nil do
    begin
      tamanho:= tamanho + 1;

      tempPonteiro := tempPonteiro^.prox;
    end;

    tamanhoPonteiro:=tamanho;
end;

function asListasEncadeadasSaoValidas(ponteiroA: T_point; ponteiroB: T_point): boolean;
var
  tamanhoPonteiroA,tamanhoPonteiroB:integer;
begin

  tamanhoPonteiroA := tamanhoPonteiro(ponteiroA);
  tamanhoPonteiroB := tamanhoPonteiro(ponteiroB);

  asListasEncadeadasSaoValidas:= tamanhoPonteiroA <> tamanhoPonteiroB;
end;

function encadearListas(ponteiroA: T_point; ponteiroB: T_point): T_point;
var
  tamanhoPonteiroA,tamanhoPonteiroB:integer;
  maiorTamanhoPonteiro,menorTamanhoPonteiro,i,j:integer;
  menorPonteiro,maiorPonteiro,tempPonteiro:T_point;
  nextPoint,p:T_point;
begin

  tamanhoPonteiroA := tamanhoPonteiro(ponteiroA);
  tamanhoPonteiroB := tamanhoPonteiro(ponteiroB);

  if(tamanhoPonteiroA > tamanhoPonteiroB)then
    begin
      maiorPonteiro := ponteiroA;
      maiorTamanhoPonteiro := tamanhoPonteiroA;
      menorPonteiro := ponteiroB;
      menorTamanhoPonteiro := tamanhoPonteiroB;
    end
  else
    begin
      maiorPonteiro := ponteiroB;
      maiorTamanhoPonteiro := tamanhoPonteiroB;
      menorPonteiro := ponteiroA;
      menorTamanhoPonteiro := tamanhoPonteiroA;
    end;

  tempPonteiro := nil;
  nextPoint := maiorPonteiro;
  for i := 1 to (maiorTamanhoPonteiro) do
    begin
      new(p);
      p^.num:=nextPoint^.num;
      p^.prox:=tempPonteiro;
      nextPoint:=nextPoint^.prox;
      tempPonteiro:= p;
    end;
  nextPoint := menorPonteiro;
  for j := 1 to (menorTamanhoPonteiro) do
    begin
      new(p);
      p^.num := nextPoint^.num;
      p^.prox := tempPonteiro;
      nextPoint := nextPoint^.prox;
      tempPonteiro := p;
    end;

  encadearListas := tempPonteiro;
end;

var
  i: integer;
  prim,prim2: T_point;
  p: T_point;
begin

  prim := nil;
  for i := 0 to 10 do
    begin
      new(p);
      p^.num := i;
      p^.prox := prim;
      prim := p;
    end;

  prim2 := nil;
  for i := 0 to 7 do
    begin
      new(p);
      p^.num := i;
      p^.prox := prim2;
      prim2 := p;
    end;

    if(asListasEncadeadasSaoValidas(prim,prim2)) then
      begin
        encadearListas(prim,prim2);
      end
    else
      begin
        writeln('Listas possuem mesmo tamanho e não serão encadeadas.');
      end;
end.
