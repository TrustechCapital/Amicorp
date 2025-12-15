<form name="frmDatosInstrucciones" id="frmDatosInstrucciones" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Charola de Instrucciones de Internet Recibidas</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto">
          <tr>
            <td class="texto" align="center" width="25%">Fecha&nbsp;&nbsp;
              <input type="text" name="paramFecha" id="paramFecha" size="10" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="txtFechaContable" tipo="Fecha" required message="La Fecha es un campo obligatorio" onblur="verificaFecha(this);"/>
            </td>
          </tr>
          <tr>
            <td class="textoNegrita" width="100%" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
              <input type="text" name="paramDia" id="paramDia" size="1" maxlength="1" style="visibility:hidden"/>
              <input type="text" name="paramMes" id="paramMes" size="1" maxlength="1" style="visibility:hidden"/>
              <input type="text" name="paramAno" id="paramAno" size="1" maxlength="1" style="visibility:hidden"/>
              <input type="text" name="txtFechaContable" id="txtFechaContable" size="10" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" tipo="Fecha" next="formsLoaded" style="visibility:hidden"/>
              <input type="text" name="txtMesAbierto" id="txtMesAbierto" size="1" maxlength="1" value="0" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td align="center">&nbsp;
              <input type="button" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" ref="conPriInsIntLiqRec" fun="loadTableElementSpecial" tabla="tblRegPriInsIntLiqRec" onclick="consultarTablas(this, frmDatosInstrucciones, false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" value="Limpiar" name="cmdLimpiar" id="cmdLimpiar" class="boton" onclick="borrar();"/>
            </td>
          </tr>
          <tr>
            <td class="textoNegrita" width="100%" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td class="textoNegrita" width="100%" align="center">
              <input type="button" value="Aceptar Movimiento" name="cmdAceptarMovimientos" class="boton" onclick="contabilizar();"/>
              <input type="button" value="Ficha Única" name="cmdFichaUnica" class="boton" onclick="cargaPrincicalFichaUnicaInstruccionesInternetRecibidas();"/>
            </td>
          </tr>
          <tr>
            <td class="textoNegrita" width="100%" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td width="100%" class="subtitulo" align="center">Liquidaciones con Status Activo</td>
          </tr>
          <tr>
            <td  align="center" class="textoNegrita">
              <table cellspacing="0" cellpadding="0" border="0" align="center" width="774px" class="texto">
                <tr align="left" class="cabeceras">
                  <td nowrap width="35">&nbsp;</td>
                  <td nowrap width="43">Rubro</td>
                  <td nowrap width="62">Folio</td>
                  <td nowrap width="40">Hora</td>
                  <td nowrap width="79">Fideicomiso</td>
                  <td nowrap width="150">Instrucci&oacute;n</td>
                  <td nowrap width="67">Importe</td>
                  <td nowrap width="113">Cto Inversi&oacute;n</td>
                  <td nowrap width="103">Cuenta Nafin</td>
                  <td nowrap width="82">Fch Instrucc</td>
                </tr>
              </table>
              <div style="height:100px; overflow:auto; position:relative; vertical-align:top; width:774px">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegPriInsIntLiqRec" dataInfo="arrTblInsIntRecDat" keys="folio,tipoInstruccion,fideicomiso" radioWidth="23px" NoRecordsMsg1="No existen Depósitos para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
          
          <tr>
            <td width="100%" align="center" class="textoNegrita">&nbsp;</td>
          </tr>
          <tr>
            <td width="100%" align="center" class="subtitulo">Dep&oacute;sitos con Status Activo</td>
          </tr>
          <tr>
            <td  align="center" class="textoNegrita">
              <table cellspacing="0" cellpadding="0" border="0" align="center" width="774px" class="texto">
                <tr align="left" class="cabeceras">
                  <td nowrap width="23">&nbsp;</td>
                  <td nowrap width="43">Rubro</td>
                  <td nowrap width="62">Folio</td>
                  <td nowrap width="40">Hora</td>
                  <td nowrap width="79">Fideicomiso</td>
                  <td nowrap width="150">Instrucci&oacute;n</td>
                  <td nowrap width="67">Importe</td>
                  <td nowrap width="113">Cto Inversi&oacute;n</td>
                  <td nowrap width="103">Cuenta Nafin</td>
                  <td nowrap width="82">Fch Instrucc</td>
                </tr>
              </table>
              <div style="height:100px; overflow:auto; position:relative; vertical-align:top; width:774px">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegPriInsIntDepRec" dataInfo="arrTblInsIntRecDat" keys="folio,tipoInstruccion,fideicomiso" radioWidth="23px" NoRecordsMsg1="No existen Depósitos para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
          <tr>
            <td  align="center" class="textoNegrita">
              <input type="button" value="Agregar todo" name="cmdAgregarTodo" fun="loadTableElementSpecial" tabla="tblRegPriInsAcePro" class="boton"  onclick="agregarTodoElContenido(this, frmDatosInstrucciones, false);" /><!--style="visibility:hidden"-->
            </td>
          </tr>
		<!--NUEVO**************************************************************************-->
          <tr>
            <td width="100%" align="center" class="textoNegrita">&nbsp;
            </td>
          </tr>
             <!--NUEVO*********FIN**************************************************************-->
                
          <tr>
            <td width="100%" align="center" class="textoNegrita">&nbsp;</td>
          </tr>
          <tr>
            <td width="100%" align="center" class="subtitulo">Instrucciones Aceptadas para Procesar</td>
          </tr>
          <tr>
            <td align="center" class="textoNegrita">
              <table cellspacing="0" cellpadding="0" border="0" align="center" width="774px" class="texto">
                <tr align="left" class="cabeceras">
                   <td nowrap width="23">&nbsp;</td>
                  <td nowrap width="43">Rubro</td>
                  <td nowrap width="62">Folio</td>
                  <td nowrap width="40">Hora</td>
                  <td nowrap width="79">Fideicomiso</td>
                  <td nowrap width="150">Instrucci&oacute;n</td>
                  <td nowrap width="67">Importe</td>
                  <td nowrap width="113">Cto Inversi&oacute;n</td>
                  <td nowrap width="103">Cuenta Nafin</td>
                  <td nowrap width="82">Fch Instrucc</td>
                </tr>
              </table>
              <div style="height:100px; overflow:auto; position:relative; vertical-align:top; width:774px">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegPriInsAcePro" dataInfo="arrTblInsIntRecDat" keys="folio,tipoInstruccion,fideicomiso" radioWidth="23px"><!--arrTblInsAcePro-->
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
