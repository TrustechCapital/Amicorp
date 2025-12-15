showWaitLayer();

var comboParam = JSON.parse("{\"chido\":1,\"laOtra\":\"pepe\"}");

initForms();

var tablaPaisesData = new Array();
tablaPaisesData[0] = "paiNomPais,150";
tablaPaisesData[1] = "paiAbrPais,50";
tablaPaisesData[2] = "paiCveStPais,50";

function clickTabla(pk) {
  alert("numero de pais: " + pk.paiNumPais + " Nombre: " + pk.paiNomPais);
}