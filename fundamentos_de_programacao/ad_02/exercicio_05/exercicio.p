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

function aListaAEMaiorQueAListaB(ponteiroA: T_point; ponteiroB: T_point):boolean;
var
  tamanhoPonteiroA,tamanhoPonteiroB:integer;
begin

    tamanhoPonteiroA := tamanhoPonteiro(ponteiroA);
    tamanhoPonteiroB := tamanhoPonteiro(ponteiroB);

    aListaAEMaiorQueAListaB := tamanhoPonteiroA > tamanhoPonteiroB;
end;

function encadearListas(maiorPonteiro: T_point; menorPonteiro: T_point): T_point;
var
  maiorTamanhoPonteiro,menorTamanhoPonteiro,i,j:integer;
  nextPoint,p,tempPonteiro:T_point;
begin

  maiorTamanhoPonteiro := tamanhoPonteiro(maiorPonteiro);
  menorTamanhoPonteiro := tamanhoPonteiro(menorPonteiro);

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

procedure exericio(listaA:T_point;listaB:T_point);
var
  resultado:T_point;
begin

    if(asListasEncadeadasSaoValidas(listaA,listaB)) then
      begin
        if(aListaAEMaiorQueAListaB(listaA,listaB))then
          begin
            writeln('A lista A é maior, logo no final dela será encadeada a lista B');
            resultado := encadearListas(listaA,listaB);
          end
        else
          begin
              writeln('A lista B é maior, logo no final dela será encadeada a lista A');
              resultado := encadearListas(listaB,listaA);
          end;
        writeln('Nova lista com tamanho ' + IntToStr(tamanhoPonteiro(resultado)));
      end
    else
      begin
        writeln('Listas possuem mesmo tamanho e não serão encadeadas.');
      end;
end;

var
  i: integer;
  prim,prim2: T_point;
  p, resultado: T_point;
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

    {Mesmo tamanho}
    exericio(prim,prim);
    {Lista A maior que B}
    exericio(prim,prim2);
    {Lista A menor que B}
    exericio(prim2,prim);

end.
