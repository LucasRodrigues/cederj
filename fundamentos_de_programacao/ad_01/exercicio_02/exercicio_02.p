program ad_01_exercicio_02;

uses sysutils;

type
  TPoint = record
            x : integer;
            y : integer;
          end;
  TPoints = array of TPoint;

function pegarPontoMedio(points: TPoints): string;
var
  i, contador, somaX, somaY: integer;
  pontoX, pontoY : real;
begin
  contador := 0;
  somaX := 0;
  somaY := 0;
  pontoX := 0.0;
  pontoY := 0.0;

  for i := 0 to length(points) do begin

    if((points[i].x = 0) and (points[i].y = 0)) then
      begin
        break;
      end
    else
      begin
        somaX := somaX + points[i].x;
        somaY := somaY + points[i].y;

        contador := contador + 1;
      end;
  end;

  pontoX := real(somaX) / real(contador);
  pontoY := real(somaY) / real(contador);


  pegarPontoMedio := '[' + FloatToStr(pontoX) + ',' + FloatToStr(pontoY) + ']';
end;


var
  continuarPrograma : boolean;
  points : TPoints;
  x,y,contador: integer;
begin
  setLength(points, 100);
  contador := 0;
  continuarPrograma := true;

  while(continuarPrograma) do
    begin
      WriteLn('Informe o valor de X:');
      Readln(x);
      WriteLn('Informe o valor de Y:');
      Readln(y);

      if( x = 0) and (y = 0) then
        begin
          continuarPrograma := false;
        end
      else
        begin
          points[contador].y := y;
          points[contador].x := x;
          contador := contador + 1;
        end;
    end;

    if(contador = 0) then
      begin
        WriteLn('Nenhum ponto informado para o programa');
      end
    else
      begin
        WriteLn('Ponto médio entre os informados é ' + pegarPontoMedio(points));
      end;
end.
