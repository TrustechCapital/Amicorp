<form name="frmDatosInstrucciones" id="frmDatosInstrucciones" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Charola de Instrucciones de Internet Contabilizaci&oacute;n</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto" border="0">
          <tr>
            <td class="texto" align="center" width="25%" colspan="4">Fecha &nbsp;&nbsp;
              <input type="text" name="paramFecha" id="paramFecha" size="10" maxlength="10" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="ejecutaFechaContableAnterior"/>
            </td>
          </tr>
          <tr>
            <td class="textoNegrita" width="100%" align="center" colspan="4">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td align="center" colspan="4">&nbsp;
              <input type="button" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" ref="conPriInsIntPenCon" fun="loadTableElement" tabla="tblRegPriLiqPen" onclick="consultarTablas(this, frmDatosInstrucciones, false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" value="Limpiar" name="cmdLimpiar" id="cmdLimpiar" class="boton" onclick="onButtonClickPestania('Contabilidad.InstruccionesInternetContabilizacion.PrincipalInstruccionesInternetContabilizacion','');"/>
            </td>
          </tr>
          <tr>
            <td class="textoNegrita" width="100%" align="center" colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td width="100%" class="subtitulo" align="center" colspan="4">Operaciones de Liquidaci&oacute;n Pendientes</td>
          </tr>
          <tr align="center">
            <td colspan="4">
              <table class="texto" border="0" cellpadding="0" cellspacing="0">
                <tr class="cabeceras">
                  <td nowrap width="23">&nbsp;</td>
                  <td nowrap width="47">Folio</td>
                  <td nowrap width="132">Status Contabilidad</td>
                  <td nowrap width="120">Fecha Aceptaci&oacute;n</td>
                  <td nowrap width="83">Fideicomiso</td>
                  <td nowrap width="111">Instrucci&oacute;n</td>
                  <td nowrap width="75">Importe</td>
                  <td nowrap width="86">Fch Instrucc</td>
                </tr>
              </table>
              <div style="height:100px; overflow:auto; position:relative; vertical-align:top; width:714px;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegPriLiqPen" dataInfo="arrTblLiqPenDat" keys="numContrato,folio,tipoInstruccion,importe,status" fun="clickTabla" radioWidth="23px">
                </table>
              </div>
            </td>
          </tr>
          <tr>
            <td width="100%" align="center" colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td width="100%" align="center" class="subtitulo" colspan="4">Operaciones de Recepci&oacute;n Rechazadas</td>
          </tr>
          <tr align="center">
            <td class="textoNegrita" colspan="4">
              <table class="texto" border="0" cellpadding="0" cellspacing="0">
                <tr class="cabeceras">
                  <td align="center" nowrap width="23">&nbsp;</td>
                  <td nowrap width="47">Folio</td>
                  <td nowrap width="132">Status Contabilidad</td>
                  <td nowrap width="120">Fecha Aceptaci&oacute;n</td>
                  <td nowrap width="83">Fideicomiso</td>
                  <td nowrap width="111">Instrucci&oacute;n</td>
                  <td nowrap width="75">Importe</td>
                  <td nowrap width="86">Fch Instrucc</td>
                </tr>
              </table>
              <div style="height:100px; overflow:auto; position:relative; vertical-align:top; width:654px;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegPriOpeRec" dataInfo="arrTblLiqPenDat" keys="numContrato,folio,tipoInstruccion,importe,status" fun="clickTabla" radioWidth="23px">
                </table>
              </div>
            </td>
          </tr>
          <tr>
            <td align="left" width="40%">&nbsp;</td>
            <td align="left" colspan="2">&nbsp;
            </td>
            <td align="left" width="40%">&nbsp;</td>
          </tr>
          <tr>
            <td align="left" width="40%">&nbsp;</td>
            <td align="left" class="textoNegrita" nowrap width="13%">
              <div id="divNumContrato">Fideicomiso:</div>
            </td>
            <td align="left">
              <input type="text" name="numContrato" id="numContrato" size="25"/>
            </td>
            <td align="left" width="40%">&nbsp;</td>
          </tr>
          <tr>
            <td align="left" width="40%">&nbsp;</td>
            <td align="left" class="textoNegrita" nowrap width="13%">
              <div id="divFolio">Folio:</div>
            </td>
            <td align="left">
              <input type="text" name="folio" id="folio" size="25"/>
            </td>
            <td align="left" width="40%">&nbsp;</td>
          </tr>
          <tr>
            <td align="left" width="40%">&nbsp;</td>
            <td align="left" class="textoNegrita" nowrap width="13%">
              <div id="divTipoInstruccion">Tipo de Instrucción:</div>
            </td>
            <td align="left">
              <input type="text" name="tipoInstruccion" id="tipoInstruccion" size="25"/>
            </td>
            <td align="left" width="40%">&nbsp;</td>
          </tr>
          <tr>
            <td align="left" width="40%">&nbsp;</td>
            <td align="left" class="textoNegrita" nowrap width="13%">
              <div id="divImporte">Importe:</div>
            </td>
            <td align="left">
              <input type="text" name="importe" id="importe" size="25"/>
            </td>
            <td align="left" width="40%">&nbsp;</td>
          </tr>
          <tr>
            <td align="left" width="40%">&nbsp;</td>
            <td align="left" class="textoNegrita" nowrap width="13%">
              <div id="divStatus">Status:</div>
            </td>
            <td align="left">
              <input type="text" name="status" id="status" size="25"/>
            </td>
            <td align="left" width="40%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Contabilizar" name="cmdContabilizar" id="cmdContabilizar" class="boton" onclick="contabilizar();"/>
        <input type="BUTTON" value="Aceptar x Póliza" name="cmdAceptarXPoliza" id="cmdAceptarXPoliza" class="boton" onclick="aceptarXPoliza();"/>
      </td>
    </tr>
  </table>
</form>
