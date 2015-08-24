
organizar([1,2,5,2,1,9,1,8,9]);

function organizar(lista){

  var listaAgrupada = [];

  for (var i = 0; i < lista.length; i++) {

    var adicionarItem = true;

    for (var j = 0; j < listaAgrupada.length; j++) {

      if(listaAgrupada[j] === lista[i]){
        adicionarItem = false;
        break;
      }
    }

    if(adicionarItem){
      listaAgrupada.push(lista[i]);
    }
  }

  console.log(listaAgrupada + ' - ' + listaAgrupada.length);
}
