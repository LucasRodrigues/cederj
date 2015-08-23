program ad_01_exercicio_03;

uses sysutils;

type
  TNumeros = array of integer;

function eUmNumeroPrimo(numero: integer): boolean;
var
  i:integer;
begin
  eUmNumeroPrimo := true;
  for i := 2 to numero - 1 do
    begin
      if(numero mod i = 0)then
        begin
          eUmNumeroPrimo := false;
        end;
    end;
end;

function pegarNumerosPrimosMenorQueUmNumero(numero:integer):TNumeros;
var
  numeros: TNumeros;
  contador, i: integer;
begin
  setLength(numeros,1000);
  contador := 0;

  numeros[contador] := 2;
  contador := contador + 1;

  for i := 3 to numero - 1  do begin

    if(i mod 2 <> 0) then
      begin
          if(eUmNumeroPrimo(i) = true) then
            begin
              numeros[contador] := i;
              contador := contador + 1;
            end;
      end;
  end;

  pegarNumerosPrimosMenorQueUmNumero := numeros;
end;

function somaDeDoisNumeros(numeros: TNumeros; numero: integer): string;
var
  achou: boolean;
  i,j: integer;
begin
  achou := false;

  for i := 0 to length(numeros) - 1  do
    begin
      if(numeros[i] > 0) then
        begin
          for j := i to length(numeros) - 1 do begin

            if(numeros[j] > 0) then
              begin
                if(numeros[i] + numeros[j] = numero) then
                  begin
                    somaDeDoisNumeros := IntToStr(numeros[i]) + ' e ' + IntToStr(numeros[j]);
                    achou := true;
                    break;
                  end;
              end
            else
              begin
                break;
              end;
          end;

          if(achou = true) then
            begin
              break;
            end;
        end
      else
        begin
          break;
        end;
    end;
end;

var
    numero: integer;
    numerosPrimos : TNumeros;
begin
    WriteLn('Informe um número par entre 4 e 1000');
    Readln(numero);

    if(numero mod 2 = 0) then
      begin
        numerosPrimos := pegarNumerosPrimosMenorQueUmNumero(numero);
        WriteLn('Os números primos ' + somaDeDoisNumeros(numerosPrimos, numero) + ' somados dão o número informado');
      end
    else
      begin
        WriteLn('O número informado não é par')
      end;
end.
