program ad_01_exercicio_05;

uses sysutils;

type
   TLista = array of integer;
   TContagem = record
                chave : integer;
                valor : integer;
              end;
    TListaContagem = array of TContagem;

var
  lista : TLista;
  LISTA_TAMANHO, ITEM_LISTA_NUMERO_MAXIMO : integer;

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

function pegarNumeroComMenorFrequencia(lista: Tlista): string;
var
  listaAgrupada : TListaContagem;
  item : TContagem;
  i, menor : integer;
  texto : string;
begin
  menor := 100;
  texto := '';

  listaAgrupada := agrupar(lista);

  for i := 0 to length(listaAgrupada) - 1 do begin

      item := listaAgrupada[i];

      if(item.chave > 0) then
        begin
          if(item.valor = menor) then
            begin
              texto := texto + ',' +IntToStr(item.chave);
            end
          else if (item.valor < menor) then
            begin
              texto := IntToStr(item.chave);
              menor := item.valor;
            end;
        end
      else
        begin
          break;
        end;
  end;

  pegarNumeroComMenorFrequencia := '[' + texto + ']';
end;

function mediaLista(lista: TLista): real;
var
  soma : integer;
  i : integer;
begin
  soma := 0;

  for i := 0 to Length(lista) - 1 do begin

    soma := soma + lista[i];
  end;

  mediaLista := (real (soma) / real(Length(lista)));
end;

function escreverLista(lista: TLista):string;
var
  texto : string;
  i : integer;
begin
  texto := '[';

  for i := 0 to Length(lista) - 1 do begin

    texto := texto + IntToStr(lista[i]) + ',';
  end;

  texto := texto + ']';

  escreverLista := texto;
end;

function pegarMaiorNumeroDaLista(lista: TLista):integer;
var
  maiorNumero : integer;
  i : integer;
begin
  maiorNumero := 0;

  for i := 0 to Length(lista) - 1 do
    begin

      if(lista[i] > maiorNumero ) then
        begin
          maiorNumero := lista[i];
        end;
    end;

    pegarMaiorNumeroDaLista := maiorNumero;
end;

function pegarMenorNumeroDaLista(lista: TLista):integer;
var
  menorNumero : integer;
  i : integer;
begin
  menorNumero := ITEM_LISTA_NUMERO_MAXIMO;

  for i := 0 to Length(lista) - 1 do
    begin

      if(lista[i] < menorNumero) then
        begin
          menorNumero := lista[i];
        end;
    end;

    pegarMenorNumeroDaLista := menorNumero;
end;

function gerarLista(listaTamanho: integer): TLista;
var
  i: integer;
  lista : array[0..49] of integer;
begin

  for i := 0 to listaTamanho - 1 do begin

      lista[i] := Random(ITEM_LISTA_NUMERO_MAXIMO) + 1;
  end;

  gerarLista := lista;
end;

function pegarNumeroProximosDaMedia(lista: TLista): string;
var
  listaNumeroProximo: string;
  listaAgrupada: TListaContagem;
  media, temp, menorDistancia : real;
  i : integer;
begin
  media := mediaLista(lista);
  listaAgrupada := agrupar(lista);
  menorDistancia := 1000;

  for i := 0 to length(listaAgrupada) - 1 do begin

      if (listaAgrupada[i].chave > 0) then
        begin
          temp := abs(media - listaAgrupada[i].chave);

          if(temp < menorDistancia) then
            begin
              listaNumeroProximo := IntToStr(listaAgrupada[i].chave);
              menorDistancia := temp;
            end
          else if (temp = menorDistancia) then
            begin
              listaNumeroProximo := listaNumeroProximo + ',' + IntToStr(lista[i]);
            end;
        end
      else
        begin
          break;
        end;
  end;

  pegarNumeroProximosDaMedia := '[' + listaNumeroProximo + ']';
end;

begin
  LISTA_TAMANHO := 50;
  ITEM_LISTA_NUMERO_MAXIMO := 20;

  Randomize;

  lista := gerarLista(LISTA_TAMANHO);

  WriteLn('Lista:');
  WriteLn(escreverLista(lista));
  WriteLn('Menor item da lista:');
  WriteLn(pegarMenorNumeroDaLista(lista));
  WriteLn('Maior item da lista:');
  WriteLn(pegarMaiorNumeroDaLista(lista));
  WriteLn('Média dos items da lista:');
  WriteLn(mediaLista(lista):4:2);
  WriteLn('Item(s) mais próximo da média da lista:');
  WriteLn(pegarNumeroProximosDaMedia(lista));
  WriteLn('Item(s) com maior frequência:');
  WriteLn(pegarNumeroComMaiorFrequencia(lista));
  WriteLn('Item(s) com menor frequência:');
  WriteLn(pegarNumeroComMenorFrequencia(lista));

  agrupar(lista);
end.
