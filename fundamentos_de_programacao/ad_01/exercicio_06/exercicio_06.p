program ad_01_exercicio_06;

uses sysutils;
type
   TLista = array of integer;
   TContagem = record
                chave : integer;
                valor : integer;
              end;
    TListaContagem = array of TContagem;

function agrupar (lista: Tlista): TListaContagem;
  var
    listaAgrupada: TListaContagem;
    i, j, item, counter : integer;
    achou : boolean;
  begin
    counter := 0;
    setLength(listaAgrupada,20);

    for i := 0 to Length(lista) - 1 do begin

      item := lista[i];
      achou := false;

      for j := 0 to Length(listaAgrupada) - 1 do begin

          if(listaAgrupada[j].chave = item) then
            begin
              listaAgrupada[j].valor := listaAgrupada[j].valor + 1;
              achou := true;
              break;
            end;
      end;

      if(achou = false) then
        begin
          listaAgrupada[counter].chave := item;
          listaAgrupada[counter].valor := 1;
          counter := counter + 1;
        end;
    end;
    agrupar := listaAgrupada;
  end;

function pegarNumeroComMaiorFrequencia(lista: TLista): string;
  var
    listaAgrupada : TListaContagem;
    item : TContagem;
    i, maior : integer;
    texto : string;
  begin
    maior := 0;
    texto := '';

    listaAgrupada := agrupar(lista);

    for i := 0 to length(listaAgrupada) - 1 do begin

        item := listaAgrupada[i];

        if(item.chave > 0) then
          begin
            if(item.valor = maior) then
              begin
                texto := texto + ',' + IntToStr(item.chave) ;
              end
            else if (item.valor > maior) then
              begin
                texto := IntToStr(item.chave);
                maior := item.valor;
              end;
          end
        else
          begin
            break;
          end;
    end;

    pegarNumeroComMaiorFrequencia := '[' + texto + ']';
  end;

var
  continuarPrograma : boolean;
  numero : string;
  numeros : TLista;
  somaDosNumeros, contador : integer;

begin
  continuarPrograma := true;
  somaDosNumeros := 0;
  contador := 0;
  setLength(numeros,1000);

  while(continuarPrograma) do
    begin

      WriteLn('Informe um número');
      Readln(numero);

      if(numero = '') then
        begin
          continuarPrograma := false;
        end
      else
        begin
          somaDosNumeros := somaDosNumeros + StrToInt(numero);
          numeros[contador] := StrToInt(numero);
          contador := contador + 1;
        end;
    end;

    if(somaDosNumeros > 0) then
      begin
        WriteLn('A soma dos números informados é: ' + IntToStr(somaDosNumeros));

        WriteLn('O(s) números com maior frequência é(são): ' + pegarNumeroComMaiorFrequencia(numeros));
      end
    else
      begin
        WriteLn('Nenhum número foi informado');
      end;
end.
