      var catalogo = null;
      var Estado = null;
      
      getObject("mx.com.inscitech.fiducia.domain.Estados", creaEstado);
      getObject("mx.gob.nafin.fiduciario.common.beans.CatalogInfoBean", creaCatalogo);
      
      function creaCatalogo(obj, result) {
        catalogo = JSON.parse(result);
        catalogo.className = "mx.com.inscitech.fiducia.domain.Estados";
      }
      
      function creaEstado(obj, result) {
        Estado = JSON.parse(result);
      }
      
      function cargaEstado(obj, jsonEstado) {
        Estado = JSON.parse(jsonEstado);
        if(Estado != null) {
          GI("txtNumeroPais").value = Estado.edoNumPais;
          GI("txtNumeroEstado").value = Estado.edoNumEstado;
          GI("txtNombreEstado").value = Estado.edoNomEstado;
          GI("txtAbreviaturaEstado").value = Estado.edoAbrvEstado;
        }      
      }
      
      function avisoOperacion(obj, result) {
        alert("Operacion realizada exitosamente!");
      }
      
      function doBuscar() {
        Estado.edoNumPais = GI("txtNumeroPaisBuscar").value;
        Estado.edoNumEstado = GI("txtNumeroEstadoBuscar").value;
        catalogo.catalogo = JSON.stringify(Estado);
        var searchURL = ctxRoot + "/obtenerCatalogo.do?json=" + JSON.stringify(catalogo);
        makeAjaxRequest(searchURL, "HTML", cargaEstado, null);
      }
      
      function doGuardar() {
        Estado.edoNumPais = GI("txtNumeroPais").value;
        Estado.edoNumEstado = GI("txtNumeroEstado").value;
        Estado.edoNomEstado = GI("txtNombreEstado").value;
        Estado.edoAbrvEstado = GI("txtAbreviaturaEstado").value;
        catalogo.catalogo = JSON.stringify(Estado);
        var searchURL = ctxRoot + "/modificaCatalogo.do?json=" + JSON.stringify(catalogo);
        makeAjaxRequest(searchURL, "HTML", avisoOperacion, null);
      }
      
      function doGuardarNvo() {
        //alert(Estado);
        Estado.edoNumPais = GI("txtNumeroPais").value;
        Estado.edoNumEstado = GI("txtNumeroEstado").value;
        Estado.edoNomEstado = GI("txtNombreEstado").value;
        Estado.edoAbrvEstado = GI("txtAbreviaturaEstado").value;
        Estado.edoHrDiferencia=1
        Estado.edoMinDiferencia=1
        Estado.edoAnoAltaReg=1
        Estado.edoMesAltaReg=1
        Estado.edoDiaAltaReg=1
        Estado.edoAnoUltMod=1
        Estado.edoMesUltMod=1
        Estado.edoDiaUltMod=1
        Estado.edoCveStEstado="ninguno"
        catalogo.catalogo = JSON.stringify(Estado);
        var searchURL = ctxRoot + "/altaCatalogo.do?json=" + JSON.stringify(catalogo);
        makeAjaxRequest(searchURL, "HTML", avisoOperacion, null);
      }