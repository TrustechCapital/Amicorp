<FORM name="frmPrincipalBienesGar" id="frmPrincipalBienesGar" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Bienes en Garantia</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" align="center" class="texto">
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="15%">Fideicomiso:</td>
            <td>
              <input type="text" name="paramFiso" id="paramFiso" tipo="Num" size="10" maxlength="10" onblur="consultaNombreFideicomiso('nomFideicomiso',this);"/>
            </td>
            <td width="45%">
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="15%">Subfiso:</td>
            <td colspan="2">
              <input type="text" name="paramSubfiso" id="paramSubfiso" size="10" maxlength="10"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="15%">Id Garantia:</td>
            <td colspan="2">
              <input type="text" name="paramIdGar" id="paramIdGar" size="10" maxlength="10"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
           <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="15%">Tipo de Garantia: </td>
            <td>
              <select size="1" id="paramCveTipoGar" name="paramCveTipoGar" ref="claves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" param="clavesCombo38" next="paramStatus" onchange="cargaParamComboEstadoP(this,false);"/><!--onchange="cmbTipoBienParam.llaveClaveSec = this.value;  loadElement(GI('paramClasFide'));"      paramTipoBienFideicomitido-->
            </td>
            <td width="45%">
              <div id="Fideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
           <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="15%">Clasificaci&oacute;n de Bien Fideicomitido:</td>
            <td>
              <select size="1" name="paramCveTipoBien" id="paramCveTipoBien" ref="claves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" param="parametroComboEstado" next="formsLoaded"> <!--clavesCombo72  paramStatus cmbTipoBienParam"     paramClasFide-->
              <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td width="45%">
              <div id="nomFideicomiso2" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
            </td>
            <td width="15%">&nbsp;</td>
            </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="15%">Estatus:</td>
            <td colspan="2">
              <select size="1" name="paramStatus" id="paramStatus" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="formsLoaded" param="clavesCombo31"/>
            </td>
            <td align="left" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="5" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="5" align="center">&nbsp;
              <input type="BUTTON" value="Aceptar" id="cmdAceptar" name="Aceptar" class="boton" ref="consultarBienesGar" fun="loadTableElement" tabla="tablaRegistrosBienesGar" onclick="consultar(this, GI('frmPrincipalBienesGar'), false);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="BUTTON" value="Limpiar" id="cmdLimpiar" name="cmdLimpiar" class="boton" onclick="RF(GI('frmPrincipalBienesGar'));"/>
            </td>
          </tr>
          <tr>
            <td colspan="5" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="5" align="center">
              <input type="BUTTON" value="Registro de Bien" id="cmdRegistro" name="cmdAlta" class="boton" onclick="cargaMantenimientoBienesGar(1);"/>
              <input type="BUTTON" value="Revaluacion" id="cmdRevaluacion" name="cmdRevaluacion" class="boton" onclick="cargaMantenimientoBienesGar(3);"/>
              <input type="BUTTON" value="Salida de Bien" id="cmdSalidaBien" name="cmdSalidaBien" class="boton" onclick="cargaMantenimientoBienesGar(5);"/> <!--eliminarRegistro()-->
              <input type="BUTTON" value="Modificar" id="cmdModificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoBienesGar(2);"/>
              <input type="BUTTON" value="Consulta"  name="cmdConsultar" class="boton" onclick="cargaMantenimientoBienesGar(4)"/>
              <!--<input type="BUTTON" value="Imagenes" id="cmdImagenes" name="cmdImagenes" class="boton" onclick="cargaMantenimientoBienesFideicomitidos(6)"/>-->
            </td>
          </tr>
          <tr>
            <td width="100%" colspan="5" align="center" valign="middle">&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="5">
              <table cellspacing="0" cellpadding="0" border="0">
                <tr align="left" class="cabeceras">
                  <td width="23px">&nbsp;</td>
                  <td width="110px">Fideicomiso</td>
                  <td width="110px">Subfiso</td>
                  <td width="110px">Id Garantia</td>
                  <td width="110px">Tipo Garantia</td>
                  <td width="110px">Clasificacion</td>
                  <td width="110px">Importe &Uacute;lt.Val.</td>
                   <td width="110px">Estatus</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tablaRegistrosBienesGar" dataInfo="tablaBienesGarData" keys="fgrsIdFideicomiso,fgrsIdSubcuenta,forsIdGarantia" fun="clickTabla" radioWidth="23px"  NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>
