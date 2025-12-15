initForms();
var tablaCuentasData = new Array();
tablaCuentasData[0] = "fcbaNumeroCtaBan,123px";
tablaCuentasData[1] = "fcbaBanco,100px";
tablaCuentasData[2] = "fcbaPlazaCba,100px";
tablaCuentasData[3] = "fcbaClabeCba,150px";
tablaCuentasData[4] = "fcbaTitular,150px";
tablaCuentasData[5] = "fcbaSubCuenta,100px";
tablaCuentasData[6] = "fcbaClasTipo,100px";
tablaCuentasData[7] = "salImpSaldoAct,100px";

function limpiar(objForma){
  RF(objForma);
  GI("nomFideicomiso").innerHTML = "";
}

function detallado(stateChk)
{
  if(!stateChk)
  {
      GI("aceptarDetallado").innerHTML = "<input type=\"BUTTON\" id=\"Aceptar\" name=\"cmdAceptar\" value=\"Aceptar\" class=\"boton\" ref=\"consultaCuentasBancarias\" fun=\"loadTableElement\" tabla=\"tablaCuentas\" onclick=\"consultar(this, GI('frmCuentas'), false);\"/>";
  }
  else
  {
      GI("aceptarDetallado").innerHTML = "<input type=\"BUTTON\" id=\"Aceptar\" name=\"cmdAceptar\" value=\"Aceptar\" class=\"boton\" ref=\"consultaCuentasBancariasDetallado\" fun=\"loadTableElement\" tabla=\"tablaCuentas\" onclick=\"consultar(this, GI('frmCuentas'), false);\"/>";
 }
}


pkInfo = null;

function clickTabla(pk)
{
  pkInfo = pk;
}

function reponeFichaCuenta()
{
  if(pkInfo==null)
  {
    alert("¡Seleccione Cuenta Bancaria!")
  }
  else// seleccionó movimiento
  {
      var surl = '{';
      surl+='"sendToJSP":"true",';    
      surl+='"urlReporte":"/modules/Contabilidad/CuentasBancarias/ReposicionFicha.jsp",';
      surl+='"id":"repReposicionFichaCuenta",'; 
      surl+='"clabe":'+pkInfo.fcbaClabeCba+'';
      surl+='}';   
      
      var url = ctxRoot + "/imprimirReporte.do?json="+surl;
      var link = GI('linkReporteNew');
      link.href=url;
      link.click();
      document.onreadystatechange = function() { hideWaitLayer(); document.onreadystatechange = function() {} }
  }
}