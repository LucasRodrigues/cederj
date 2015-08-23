program ad_01_exercicio_01;

var
    numeroDeLinhas,i,j : Integer;

begin
    WriteLn('Informe o número de linhas:');
    Readln(numeroDeLinhas);

    if(numeroDeLinhas > 0)
      Then
        begin
          for i := 1 to numeroDeLinhas  do
             begin
                  for j := 1 to numeroDeLinhas - i + 1 do
                      begin
                           Write((numeroDeLinhas - j + 1) * i);
                           Write(' ');
                      end;
                  WriteLn('');
             end;
        end
      Else
        begin
          Write('Número invalido')
        end;
end.
