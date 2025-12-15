<form name="frmMantenimientoAdquirentes" id="frmMantenimientoAdquirentes" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento Adquirentes</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
            <tr>
            <td width="1%">&nbsp;</td>
            <td width="15%">Fideicomiso</td>
            <td>
              <input type="text" name="fadqIdFideicomiso" id="fadqIdFideicomiso" tipo = "Num" size="10" maxlength="10" onblur="consultaNombreFideicomiso('nomFideicomiso',this);" required message = "Valor obligatorio"/>
            </td>
            <td width="45%">
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;
            </td>
            <td>&nbsp;
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
           <tr>
            <td width="1%">&nbsp;
            </td>
            <td width="15%">Sub Cuenta</td>
            <td>
              <input type="text" name="fadqIdSubcuenta" id="fadqIdSubcuenta" tipo="Num" size="10" maxlength="10" required message="Valor obligatorio"/>
            </td>
            <td><!--Num. Venta--></td>
            <td>
              <input type="hidden" name="fadqIdVenta" id="fadqIdVenta" tipo="Num" size="10" maxlength="10" value="0"/>
            </td>
            <td>&nbsp;
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="1%">&nbsp;</td>
            <td width="15%">N&uacute;m. Inmueble</td>
            <td>
              <input type="text" name="fadqIdBien" id="fadqIdBien" size="50" maxlength="50" required message="Valor obligatorio"/>
            </td>
            <td>Edificio</td>
            <td>
              <input type="text" name="fadqIdEdificio" id="fadqIdEdificio" size="10" maxlength="50" required message="Valor obligatorio"/>
            </td>
            <td>&nbsp;
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <!--tr>
            <td width="1%">&nbsp;</td>
            <td width="15%">Periodo</td>
            <td>
              <select name="fadqPeriodo" id="fadqPeriodo" ref="claves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" param= "clavesCombo356" next="fadqMoneda" required message="La Moneda es un campo obligatorio"/>
            </td>
            <td>&nbsp;</td>
            <td>
              &nbsp;
            </td>
            <td>&nbsp;
            </td>
            <td width="10%">&nbsp;</td>
          </tr-->
           <tr>
            <td width="1%">&nbsp;</td>
            <td width="15%">Num. Unidad</td>
            <td>
              <input type="text" name="fadqIdDepto" id="fadqIdDepto" size="50" maxlength="50" required message="Valor obligatorio"/>
            </td>
            <td>Adquirente</td>
            <td>
              <input type="text" name="fadqNombreComprador" id="fadqNombreComprador" size="25" maxlength="125" required message = "Valor obligatorio"/>
            </td>
            <td>&nbsp;
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          
          <tr>
            <td width="1%">&nbsp;</td>
            <td nowrap width="7%" colspan="4">&nbsp;
            </td>
            <td>&nbsp;</td>
          </tr>
          
           <tr>
            <td width="1%">&nbsp;</td>
            <td width="15%">Comprador</td>
            <td>
              <input type="text" name="fadqNomComprador" id="fadqNomComprador" size="50" maxlength="250"/>
            </td>
            <td>Escritura</td>
            <td>
              <input type="text" name="fadqNumEscrcom" id="fadqNumEscrcom" size="25" maxlength="30"/>
            </td>
            <td>&nbsp;
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="1%">&nbsp;</td>
            <td width="15%">&nbsp;</td>
            <td>&nbsp;</td>
            <td>Fecha Escritura</td>
            <td>
              <input type="text" name="fadqFecEscricom" id="fadqFecEscricom" tipo="Fecha" size="10" maxlength="10"/>
            </td>
            <td>&nbsp;
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          
           <tr>
            <td width="1%">&nbsp;</td>
            <td nowrap width="7%" colspan="4">&nbsp;
            </td>
            <td>&nbsp;</td>
          </tr>
          </tr>
          <tr>
            <td width="1%">&nbsp;</td>
            <td width="15%">Valor Liberacion</td>
            <td>
              <input type="text" name="fadqValor" id="fadqValor" tipo = "Num" size="16" maxlength="16" required message = "Valor obligatorio"/>
            </td>
            <td>Notario</td>
            <td>
              <select name="fadqNotario" id="fadqNotario" ref="claveNotarios" fun="loadComboElement" keyValue="notNumNotario" theValue="notNomNotario" next="fadqMoneda" onchange="despliegaLocalidad(this);"/><!--cargaParamComboEstado(this,false);-->
            </td>
            <td>&nbsp;
            </td>
            <td width="10%">&nbsp;</td>
            </tr>
            <tr>
            <td width="1%">&nbsp;</td>
            <td width="15%">Moneda:</td>
            <td>
              <select name="fadqMoneda" id="fadqMoneda" ref="conNumMonNomMon" fun="loadComboElement" keyValue="monNumPais" theValue="monNomMoneda" next="fadqTipoVenta" required message="Campo obligatorio"/>
            </td>
            <td>Localidad</td>
            <td>
              <!--<select name="fadqLocalidad" id="fadqLocalidad" ref="ComboLocalidadAdquirentes" fun="loadComboElement" keyValue="notNumNotario" theValue="notLocalidadNota" param= "parametroComboEstado" next="formsLoaded"/>-->
              <input type="text" name="fadqLocalidad" id="fadqLocalidad" size="25" maxlength="125"/>
            </td>
            <td>&nbsp;
            </td>
            <td width="10%">&nbsp;</td>
            </tr>
           <tr>
           <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">Tipo Venta</td>
            <td>
              <select name="fadqTipoVenta" id="fadqTipoVenta" fun="loadComboElement" ref="claves" keyValue="cveDescClave" theValue="cveDescClave" param= "clavesCombo351" next="fadqStatus" required message="Campo obligatorio"/>
            </td>
            
            <td>Estatus: <!--C V--></td>
            <td>
              <select size="1" name="fadqStatus" id="fadqStatus" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="loadCatalogo" param="clavesCombo560" required message = "Valor obligatorio"/>
            </td>
            <td>&nbsp;
            </td>
            <td width="10%">&nbsp;</td>
            </tr>
           <tr>
           <tr>
           <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">
              <!--P>Tipo Plazo</P-->
            </td>
            <td>
              <!--select name="fadqTipoPlazo" id="fadqTipoPlazo" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param= "clavesCombo352" next="fadqNotario" required message="Campo obligatorio"/-->
            </td>
            <td><!--Estructuracion--> &nbsp;
            </td>
            <td>
              <!--input type="radio" name="rdTipoMovimiento" id="fadqCv" value2="VENTA" onchange="asignaValueRadio2Master('fadqCv',this);" required message="El Tipo de Movimiento es un campo obligatorio" class="radio"/-->
            </td>
            <td>&nbsp;
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
           <!--tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">Total de Plazos</td>
            <td>
              <input type="text" name="fadqNumPlazo" id="fadqNumPlazo" tipo="Num" size="10" maxlength="10" required message="Valor obligatorio"/>
            </td>
            <td>Contrato de Compra/Venta</td>
            <td>
              <input type="radio" name="rdTipoMovimiento" id="fadqCv2" value="CONTRATO" onchange="asignaValueRadio2Master('fadqCv',this);" class="radio"/>
            </td>
            <td>&nbsp;
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">Enganche</td>
            <td>
              <input type="text" name="fadqEnganche" id="fadqEnganche" tipo = "Num" size="16" maxlength="16"/>
            </td>
            <td>Contrato</td>
            <td>
              <input type="text" name="fadqContrato" id="fadqContrato" size="25" maxlength="35"/>
            </td>
            <td>&nbsp;
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">Abono</td>
            <td>
              <input type="text" name="fadqAbono" id="fadqAbono" tipo = "Num" size="16" maxlength="16" required message="Valor obligatorio"/>
            </td>
            <td>Folio Real
            </td>
            <td>
              <input type="text" name="fadqFolio" id="fadqFolio"  size="25" maxlength="35"/>
            </td>
            <td>&nbsp;
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
           <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">Saldo</td>
            <td>
              <input type="text" name="fadqSaldo" id="fadqSaldo" tipo = "Num" size="16" maxlength="16"/>
            </td>
            <td>Ubicacion Del Registro P&uacute;blico de la Propiedad</td>
            <td>
              <textarea cols="30" name="fadqRegPub" id="fadqRegPub"></textarea>
            </td>
            <td>&nbsp;
            </td>
            <td width="10%">&nbsp;</td>
          </tr-->
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap>
            </td>
            <td nowrap>
              <input type="hidden" name="fadqPagos" id="fadqPagos" tipo="Num" size="10" maxlength="10"/>
            </td>
            <td>&nbsp;</td>
            <td>
              &nbsp;  
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">&nbsp;</td>
            <td>
              <input type="hidden" name="fadqFecAlta" id="fadqFecAlta"/>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;
            </td>
            <td>&nbsp;
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">&nbsp;</td>
            <td>
              <input type="hidden" name = "fadqFecMod" id="fadqFecMod"/>
            </td>
            
            <td>&nbsp;
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="button" value="Aceptar " name="cmdAceptar" id="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/>
        <input type="button" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="showWaitLayer(); cargaPrincipalAdquirentes();" style="visibility:hidden"/>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr align="center">
            <td colspan="5">
            <input type="button" value="consultar" name="cmdConsultar" id="cmdConsultar" ref="adquirentesPagos" fun="loadTableElement" tabla="tablaConsultaPagos" onclick="consultar(this, GI('frmMantenimientoAdquirentes'), false);"  class="boton" style="visibility:hidden;"/>
    
              <table cellspacing="0" cellpadding="0" border="0">
                <tr align="left" class="cabeceras">
                  <td width="23px">&nbsp;</td>
                  <td width="100px">Fideicomiso</td>
                  <td width="124px">Sub Fideicomiso</td>
                  <td width="126px">Num. Inmueble</td>
                  <td width="150px">Num. Unidad</td>
                  <td width="85px">Num. Venta</td>
                  <td width="150px">Adquirente</td>
                  <td width="85px">Estatus</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:893px;">
                <table id="tablaConsultaPagos" border="0" cellspacing="0" cellpadding="0" dataInfo="arregloParametrosPagos" keys="fpaiIdFideicomiso,fpaiIdSubcuenta,fpaiIdBien,fpaiIdDepto,fpaiIdPeriodo"  fun="clickTabla2" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
  </table>
</form>
