var lista = [4,5,6,2,3,1];
var passos = 1;
var trocas = 1;

console.log('Passo ' + passos + ' - ' + lista);
ordenar(lista);

function ordenar(lista){

  for (var i = 1; i < lista.length; i++){
     for (var j = 0; j < i; j++) {

      if(lista[i] < lista[j]){
          var temp = lista[i];
          lista[i] = lista[j];
          lista[j] = temp;

          console.log('Troca ' + trocas + ' - ' + j + ' <- ' + i + ' - ' + lista);
          trocas++;
      }
    }
    passos++;
    console.log('Passo ' + passos + ' - ' + lista);
  }
}
