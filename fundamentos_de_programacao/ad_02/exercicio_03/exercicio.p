program ad_02_exercicio_03;

uses sysutils;

type
  Pessoa = record
            nome: string;
            idade: integer;
            salario: real;
          end;
  ArqPessoa = file of Pessoa;
  ListaPessoa = array of Pessoa;

function lerArquivo(): ListaPessoa;
var
  arquivo: ArqPessoa;
  lista: ListaPessoa;
  item: Pessoa;
  contador: integer;
const
  caminhoDoArquivo = './cadastro.txt';
begin

  assign(arquivo,caminhoDoArquivo);
  reset(arquivo);

  setLength(lista,3);
  contador := 0;

  while not eof(arquivo) do
    begin
        read(arquivo, item);

        lista[contador] := item;

        contador := contador + 1;
    end;

    lerArquivo := lista;
end;

procedure escreverLista(lista: ListaPessoa);
var
  i: integer;
begin

  for i := 0 to length(lista) do
    begin
      write('Pessoa ' + IntToStr(i));
      write(' [- Nome ' + lista[i].nome);
      write('- Idade ' + IntToStr(lista[i].idade));
      write('- Salário ' + FloatToStr(lista[i].salario) + ']');
      writeln('')
    end;
end;

var
  opcaoEscolhida: integer;
  continuar: boolean;
  lista: ListaPessoa;
  menor,temp: Pessoa;
  menorIndice,i,j: integer;
const
  opcaoOrdernarNome = 1;
  opcaoOrdenarIdade = 2;
  opcaoOrdenarSalario = 3;
  opcaoSair = 4;
begin

  continuar := true;

  while (continuar) do
    begin
      writeln('Escolha a opção desejada');
      writeln('(' + IntToStr(opcaoOrdernarNome) +') Ordernar por nome');
      writeln('(' + IntToStr(opcaoOrdenarIdade) +') Ordernar por idade');
      writeln('(' + IntToStr(opcaoOrdenarSalario) +') Ordernar por salario');
      writeln('(' + IntToStr(opcaoSair) +') Sair');
      readln(opcaoEscolhida);

      writeln('Você escolheu a opção ' + IntToStr(opcaoEscolhida));

      case (opcaoEscolhida) of
        opcaoOrdernarNome:
          begin
            lista := lerArquivo();
            writeln('Antes');
            escreverLista(lista);

            for i := 0 to length(lista) do
              begin
                  menor := lista[i];
                  menorIndice := i;

                  for j := i to length(lista) do
                    begin
                        if(menor.nome > lista[j].nome) then
                          begin
                            menor := lista[j];
                            menorIndice := j;
                          end;
                    end;

                  temp := lista[i];
                  lista[i] := menor;
                  lista[menorIndice] := temp;
              end;
              writeln('Depois');
              escreverLista(lista);
          end;
        opcaoOrdenarIdade:
          begin
            lista := lerArquivo();
            writeln('Antes');
            escreverLista(lista);

            for i := 0 to length(lista) do
              begin
                  menor := lista[i];
                  menorIndice := i;

                  for j := i to length(lista) do
                    begin
                        if(menor.idade > lista[j].idade) then
                          begin
                            menor := lista[j];
                            menorIndice := j;
                          end;
                    end;

                  temp := lista[i];
                  lista[i] := menor;
                  lista[menorIndice] := temp;
              end;

              writeln('Depois');
              escreverLista(lista);
          end;
        opcaoOrdenarSalario:
          begin
              lista := lerArquivo();
              writeln('Antes');
              escreverLista(lista);

              for i := 0 to length(lista) do
                begin
                    menor := lista[i];
                    menorIndice := i;

                    for j := i to length(lista) do
                      begin
                          if(menor.salario > lista[j].salario) then
                            begin
                              menor := lista[j];
                              menorIndice := j;
                            end;
                      end;

                    temp := lista[i];
                    lista[i] := menor;
                    lista[menorIndice] := temp;
                end;

                writeln('Depois');
                escreverLista(lista);
          end;
        opcaoSair:
          begin
            continuar:= false;
          end;
        end
    end;
end.
