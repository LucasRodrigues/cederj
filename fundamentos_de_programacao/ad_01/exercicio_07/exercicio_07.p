program ad_01_exercicio_07;

uses sysutils;

function inverterPalavra (indice :integer; palavra:string) : string;
begin
     if indice = 0 then
       begin
         inverterPalavra := '';
       end
     else
       begin
         inverterPalavra := palavra[indice] + inverterPalavra(indice - 1, palavra);
       end;
end;

var
  continuarPrograma : boolean;
  palavra : string;
  contadorDeNaoPalindramos : integer;
begin
  continuarPrograma := true;
  contadorDeNaoPalindramos := 0;

  WriteLn('O programa irá finalizar após o primeiro palindramo informado');
  
  while (continuarPrograma = true) do
    begin

      WriteLn('Informe a palavra');
      Readln(palavra);

      if(palavra = inverterPalavra(length(palavra),palavra)) then
        begin
          break;
        end
      else
        begin
          contadorDeNaoPalindramos := contadorDeNaoPalindramos + 1;
        end;
    end;

  WriteLn('A quantidade de não palindramos informados é ' + IntToStr(contadorDeNaoPalindramos));
end.
