var lista = [4,5,6,2,3,1];
var passos = 1;
var trocas = 1;

ordenar(lista);

function ordenar(lista){

  console.log('Passo ' + passos + ' - ' + lista);

  for (var i = 0; i < lista.length; i++) {

    var menorNumeroIndice = null;
    var menorNumero = lista[i];

    for (var j = i; j < lista.length; j++) {

      if(menorNumero > lista[j]){
        menorNumero = lista[j];
        menorNumeroIndice = j;
      }
    }

    if(menorNumeroIndice){
      var temp = lista[i];
      lista[i] = lista[menorNumeroIndice];
      lista[menorNumeroIndice] = temp;
      console.log('Troca ' + trocas + ' - ' + i + ' <- ' + menorNumeroIndice + ' - ' + lista);
      trocas++;
    }

    passos++;
    console.log('Passo ' + passos + ' - ' + lista);
  }
}
