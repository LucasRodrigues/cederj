
validarInstrucoesDePilha('3IIRRRRRRR');
validarInstrucoesDePilha('2RRIIIRRIR');

function validarInstrucoesDePilha (instrucoes){

  var pilhaTamanho = 0;
  var asIntrucoesSaoValidas = true;
  var listaInstrucoes = instrucoes.split('');

  for (var i = 0; i < listaInstrucoes.length; i++) {

    if(i === 0){
      pilhaTamanho = parseInt(listaInstrucoes[i]);
    }else{
      if(listaInstrucoes[i] === 'R'){
          pilhaTamanho--;
      }else if (listaInstrucoes[i] === 'I'){
          pilhaTamanho++;
      }
    }

    if(pilhaTamanho < 0){
      asIntrucoesSaoValidas = false;
      break;
    }
  }

  if(asIntrucoesSaoValidas){
    console.log('As instruções fornecidas são válidas;');
  }else{
      console.log('As instruções fornecidas não são válidas;');
  }
}
