program ad_02_exercicio_01;

uses sysutils;

var
  arquivo: text;
  numero, somaDosNumeros, maiorNumero, menorNumero: real;
  novoArquivo: string;
begin

    somaDosNumeros := 0;
    maiorNumero := 0;
    menorNumero := 10000000;

    assign(arquivo,'./exemplo.txt');
    reset(arquivo);

    while not eof(arquivo) do
      begin
          readln(arquivo, numero);

          somaDosNumeros :=  somaDosNumeros + numero;

          if(maiorNumero < numero) then
            begin
              maiorNumero := numero;
            end;

          if(menorNumero > numero) then
            begin
              menorNumero := numero;
            end;
      end;

    writeln('A soma dos números do arquivo é de '+ FloatToStr(somaDosNumeros));
    writeln('O maior número do arquivo é '+ FloatToStr(maiorNumero));
    writeln('O menor número do arquivo é '+ FloatToStr(menorNumero));

    writeln('Arquvio antes :');
    reset(arquivo);
    while not eof(arquivo) do
      begin
          readln(arquivo, numero);

          writeln(numero);
      end;

    writeln('Arquvio depois :');
    reset(arquivo);
    while not eof(arquivo) do
      begin
          readln(arquivo, numero);

          if((maiorNumero <> numero) and (menorNumero <> numero)) then
            begin
              writeln(numero);
            end;
      end;


end.
