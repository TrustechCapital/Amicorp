function funRegistraDatos(){
    var valor1=parseInt(GI('numLetras').value);
    var valor2=parseInt(GI('numNumeros').value);
    
    if((valor1+valor2)!=GI('numCaracteres').value)
    {
      alert('Los numeros de caracteres no coinciden');
    }
    else
    {    
      var pass='"'+GI('PasswordDef').value+'"';    
      var url = ctxRoot + "/doRef.do?json={\"id\":\"cambiaParametrosSeguridad\",\"Fallas\":"+GI('numFallas').value+",\"Caracteres\":"+GI('numCaracteres').value+",\"Letras\":"+GI('numLetras').value+",\"Numeros\":"+GI('numNumeros').value+",\"Historial\":"+GI('numHistorial').value+",\"DiasCambio\":"+GI('numDiasCambio').value+",\"DiasInactivo\":"+GI('numDiasInactivo').value+",\"Conecciones\":"+GI('numConecciones').value+",\"MinDesconeccion\":"+GI('numMinConeccion').value+",\"Pass\":"+pass+"}";
      makeAjaxRequest(url, "HTML", funRegistraDatos2, null); 
    }
}

function funRegistraDatos2(obj, result) {  

    alert("La operación se realizó correctamente");    
  
}
