program
 ad_02_exercicio_04;

uses
 sysutils;

type
  conjuntoDeInteiros = set of 1..100;

function intersecao(var conjuntoA: conjuntoDeInteiros;var conjuntoB: conjuntoDeInteiros): integer;
var
  intersecaoResultado: conjuntoDeInteiros;
  resultado: integer;
begin
  intersecaoResultado:= conjuntoA * conjuntoB;

  if(intersecaoResultado = [])then
    begin
      resultado:=0;
    end
  else if (intersecaoResultado = conjuntoA) then
    begin
      resultado:=1;
    end
  else
    begin
      resultado :=2;
    end;

    intersecao := resultado;
end;

var
  conjuntoA, conjuntoB: conjuntoDeInteiros;
begin

  // Teste caso conjunto sem elementos na interseção
  conjuntoA := [1,2];
  conjuntoB := [3,4];

  writeln(IntToStr(intersecao(conjuntoA,conjuntoB)));

  // Teste caso conjunto são identicos
  conjuntoA := [1,2];
  conjuntoB := [1,2];

  writeln(IntToStr(intersecao(conjuntoA,conjuntoB)));

  // Teste caso conjunto possuem algum elemento na interseção
  conjuntoA := [1,3];
  conjuntoB := [1,2];

  writeln(IntToStr(intersecao(conjuntoA,conjuntoB)));
end.
