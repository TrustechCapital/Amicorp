<form name="frmDatosInstrucciones" id="frmDatosInstrucciones" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      <td height="100%">&nbsp;</td>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Instrucciones SWIFT Aceptadas Pendientes de Afectar Saldos</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto" border="0">
          <tr>
            <td class="texto" align="center" width="25%" colspan="4">Fecha&nbsp;&nbsp;
              <input type="text" name="paramFecha" id="paramFecha" size="10" tipo="Fecha" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" tipo="Fecha" next="txtFechaContable" onblur="verificaFecha(this);"/>
            </td>
          </tr>
          <tr>
            <td class="texto" align="center" width="50%" colspan="4">Folio&nbsp;&nbsp;
              <input type="text" name="paramFolio" id="paramFolio" size="10" maxlength="10" tipo="Num"/>
            </td>
          </tr>
          <tr>
            <td class="texto" align="center" width="25%" colspan="4">
              <input type="radio" name="paramTipo" id="paramPendientes" value="0" onclick="this.value = 0; paramAplicadas.value = -1; paramStatus.value = 'ACEPTADA'" class="radio" checked/>&nbsp;Pendientes
              <input type="radio" name="paramTipo" id="paramAplicadas" value="-1" onclick="this.value = 0; paramPendientes.value = -1; paramStatus.value = ''" class="radio"/>&nbsp;Aplicadas
            </td>
          </tr>
          <tr>
            <td class="textoNegrita" width="100%" align="center" colspan="4">
              <input type="text" name="paramorder" id="paramorder" size="1" value="S" style="visibility:hidden"/>
              <input type="text" name="paramDia" id="paramDia" size="1" maxlength="1" style="visibility:hidden"/>
              <input type="text" name="paramMes" id="paramMes" size="1" maxlength="1" style="visibility:hidden"/>
              <input type="text" name="paramAno" id="paramAno" size="1" maxlength="1" style="visibility:hidden"/>
              <input type="text" name="txtFechaContable" id="txtFechaContable" size="10" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" tipo="Fecha" next="formsLoaded" style="visibility:hidden"/>
              <input type="text" name="txtMesAbierto" id="txtMesAbierto" size="1" maxlength="1" value="0" style="visibility:hidden"/>
              <input type="text" name="paramStatus" id="paramStatus" size="6" value="ACEPTADA" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td align="center" colspan="4">&nbsp;
              <input type="button" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" ref="conPriInsIntSWIFT" fun="loadTableElement" tabla="tblRegPriInsIntLiqRec" onclick="consultarX(this, frmDatosInstrucciones, false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" value="Limpiar" name="cmdLimpiar" id="cmdLimpiar" class="boton" onclick="onButtonClickPestania('Tesoreria.InstruccionesInternetSWIFT.PrincipalInstruccionesInternetSWIFTAceptadas','');"/>
            </td>
          </tr>
          <tr>
            <td class="textoNegrita" width="100%" align="center" colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td width="100%" class="subtitulo" align="center" colspan="4">Instrucciones Aceptadas Pendientes de Aplicar con Tipo de Cambio</td>
          </tr>
          <tr>
            <td width="20%" colspan="4">
              <table cellspacing="0" cellpadding="0" border="0" align="center" width="100%" class="texto">
                <tr align="left" class="cabeceras">
                  <td width="23" align="center" nowrap>&nbsp;</td>
                  <td nowrap width="62">Folio</td>
                  <td nowrap width="100">Status</td>
                  <td nowrap width="80">Fideicomiso</td>
                  <td nowrap width="147">Instrucci&oacute;n</td>
                  <td nowrap width="67">Moneda</td>
                  <td nowrap width="67">Importe</td>
                  <td nowrap width="54">Paridad</td>
                  <td nowrap width="118">Importe c Paridad</td>
                  <td nowrap width="142">Concepto</td>
                  <td nowrap width="113">Cto Inversi&oacute;n</td>
                  <td nowrap width="80">&Aacute;rea</td>
                  <td nowrap width="82">Fch Instrucc</td>
                </tr>
              </table>
              <div style="height:100px; overflow:auto; position:relative; vertical-align:top;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegPriInsIntLiqRec" dataInfo="arrTblInsIntRecDat" keys="folio,tipoInstruccion,fideicomiso,importe,moneda" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
          <tr>
            <td class="textoNegrita" width="25%">&nbsp;</td>
            <td class="subtitulo" width="25%"><div id="dvTipoCambio">Tipo de Cambio</div></td>
            <td class="textoNegrita" width="25%">&nbsp;</td>
            <td class="textoNegrita" width="25%">&nbsp;</td>
          </tr>
          <tr>
            <td class="textoNegrita" width="25%">&nbsp;</td>
            <td class="textoNegrita" width="25%"><div id="dv0">Moneda</div></td>
            <td class="textoNegrita" width="25%">
              <input type="text" name="txtMoneda" id="txtMoneda" size="20"/>
            </td>
            <td class="textoNegrita" width="25%">&nbsp;</td>
          </tr>
          <tr>
            <td class="textoNegrita" width="25%">&nbsp;</td>
            <td class="textoNegrita" width="25%"><div id="dv1">Importe Moneda Origen</div></td>
            <td class="textoNegrita" width="25%">
              <input type="text" name="txtImporteOrigen" id="txtImporteOrigen" size="20">
            </td>
            <td class="textoNegrita" width="25%">&nbsp;</td>
          </tr>
          <tr>
            <td class="textoNegrita" width="25%">&nbsp;</td>
            <td class="textoNegrita" width="25%"><div id="dv2">Tipo de Cambio</div></td>
            <td class="textoNegrita" width="25%">
              <input type="text" name="txtTipoCambio" id="txtTipoCambio" size="10" tipo="Money"  tipo="Money" prec="100.2" message="El Tipo de Cambio es un campo obligatorio" onblur="verificaTipoCambio(this);" onChange="formatImporte(this)"/>
            </td>
            <td class="textoNegrita" width="25%">&nbsp;</td>
          </tr>
          <tr>
            <td class="textoNegrita" width="25%">&nbsp;</td>
            <td class="textoNegrita" width="25%"><div id="dv3">Moneda Nacional</div></td>
            <td class="textoNegrita" width="25%">
              <input type="text" name="txtImporteNacional" id="txtImporteNacional" tipo="Money" prec="100.2" size="20"/>
            </td>
            <td class="textoNegrita" width="25%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="button" value="Contabilizar" name="cmdContabilizar" class="boton" onclick="contabilizar();"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</form>
