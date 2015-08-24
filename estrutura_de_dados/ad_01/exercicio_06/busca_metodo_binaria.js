
var lista = [3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45, 48, 51, 54, 57, 60, 63, 66, 69, 72, 75, 78, 81, 84, 87, 90, 93, 96, 99];
var item = 0;
var step = 1;

console.log('Passo ' + step + ' - ' + lista);
buscaBinaria(lista,item);

function buscaBinaria (lista, item){

  if(lista.length === 0){
    console.log('Não encontrado');
  }
  else
  {
    var indiceCentralDaLista = Math.floor(lista.length / 2);
    var itemDoIndiceCentral = lista[indiceCentralDaLista];
    console.log('Item central - ' + itemDoIndiceCentral)

    if(itemDoIndiceCentral === item){
      console.log('Encontrado');
    }else{
      var novaLista = [];
      if(item < itemDoIndiceCentral){
        novaLista = lista.slice(0, indiceCentralDaLista);
        console.log('Lista Inferior');
      }else{
        novaLista = lista.slice(indiceCentralDaLista + 1, lista.length);
        console.log('Lista Superior');
      }

      step++;
      console.log('Passo ' + step + ' - ' + novaLista);
      buscaBinaria(novaLista, item);
    }
  }
}
