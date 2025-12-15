<FORM name="frmMantenimientoBienesFideicomitidos" id="frmMantenimientoBienesFideicomitidos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento del Registro de Bienes Fideicomitidos</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" align="center" class="texto">
          <tr>
            <td width="30%">Fideicomiso:</td>
            <td nowrap width="15%">
              <input type="text" name="fbifIdFideicomiso" id="fbifIdFideicomiso" tipo="Num" size = "10" maxlength="10" required message = "Valor obligatorio"/>
            </td>
            <td>SubCuenta:
            </td>
            <td width="45%">     
                <input type="text" name="fbifIdSubCuenta" id="fbifIdSubCuenta" tipo="Num" size = "10" maxlength="10" required message = "Valor obligatorio"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">Tipo de Bien Fideicomitido:</td>
            <td nowrap width="15%">
                <select size="1" name="fbifIdTipoBien" id="fbifIdTipoBien" ref="cves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" param="clavesCombo70b" next="fbifIdCveBien"  onchange="cargaParamComboProducto(this,false);" required message = "Valor obligatorio"/>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;
            </td>
            <td width="15%">
            <input type="hidden" id="paramMesAbierto" name="paramMesAbierto" value="<%=session.getAttribute("mesAbiertoLbl")%>"/>;
            </td>
          </tr>
           <tr>
            <td nowrap width="25%">Clave de Bien Fideicomitido:</td>
            <td nowrap width="15%">
              <select size="1" name="fbifIdCveBien" id="fbifIdCveBien" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="clavesCombo71" next="fbifMoneda" required message = "Valor obligatorio">
              <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td>&nbsp;</td>
            <td width="45%">&nbsp;
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
           <tr>
            <td width="30%">Identificacion del Bien:</td>
            <td nowrap width="15%">
            <input type="text" name="fbifIdBien" id="fbifIdBien"  size = "30" maxlength="25" required message = "Valor obligatorio"/>
            </td>
            <td>&nbsp;</td>
            <td width="45%">&nbsp;
            </td>
            <td width="15%">&nbsp;</td>
          <tr>
           <tr>
            <td width="30%">Importe del Bien:</td>
            <td nowrap width="15%">
              <input type="text" name="fbifImpBien" id="fbifImpBien" tipo="Num" size = "20" maxlength="16" />
            </td>
            <td>Importe &Uacute;ltima Valuaci&oacute;n</td>
            <td width="45%">
              <input type="text" name="fbifImpUltValua" id="fbifImpUltValua" tipo="Num" size="20" maxlength="16" value="0"/>
            </td>
            <td width="15%">&nbsp;</td>
          <tr>
           <tr>
            <td width="30%">Moneda:</td>
            <td nowrap width="15%">
              <select size="1" name="fbifMoneda" id="fbifMoneda" ref="conNumMonNomMon" fun="loadComboElement" keyValue="monNumPais" theValue="monNomMoneda" next="fbifPerValuacion"/><!--onchange="siCambiaLaMoneda(this);"-->
            </td>
            <td>Fecha Ultima Valuacion</td>
            <td width="45%">
              <input type="text" name="fbifFecUltValua" id="fbifFecUltValua" tipo="Fecha" size="10" maxlength="10"/>
            </td>
            <td width="15%">&nbsp;</td>
          <tr>
           <tr>
            <td width="30%">Importe Moneda:</td>
            <td nowrap width="15%">
              <input type="text" name="fbifImpMoneda" id="fbifImpMoneda" tipo="Num" size = "20" maxlength="16" />
            </td>
            <td>Periodicidad:</td>
            <td width="45%">
              <select size="1" name="fbifPerValuacion" id="fbifPerValuacion" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="clavesCombo53" next="fbifStBien"/>
            </td>
            <td width="15%">&nbsp;</td>
          <tr>
           <tr>
            <td width="30%">Descripcion:</td>
            <td nowrap width="15%">
              <textarea cols="30" name="fbifDescBien" id="fbifDescBien" value="-"></textarea>
            </td>
             <td>Fecha Inicio</td>
            <td width="45%">
              <input type="text" name="fbifFecInicio" id="fbifFecInicio" tipo="Fecha" size="10" maxlength="10" required message = "Valor obligatorio"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">Comentario:</td>
            <td nowrap width="10%">
              <textarea cols="30" name="fbifTexComentario" id="fbifTexComentario"></textarea>
            </td>
            <td>Fecha Fin</td>
            <td width="45%">
              <input type="text" name="fbifFecFin" id="fbifFecFin" tipo="Fecha" size="10" maxlength="10"/>
            </td>
            <td align="left" width="15%">&nbsp;</td>
          </tr>
           <tr>
            <td width="30%">Estatus</td>
            <td nowrap width="15%">
              <select size="1" name="fbifStBien" id="fbifStBien" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="loadCatalogo" param="clavesCombo31"/>
             </td>
            <td>&nbsp;</td>
            <td>&nbsp;
            </td>
            <td align="left" width="15%">&nbsp;</td>
          </tr>
          
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="15%"><div id="importeRevaluacion" style="visibility:hidden"> Importe Revaluaci&oacute;n: </div> </td>
            <td colspan="2">
              <input type="text" name = "txtImporteRevaluacion" id="txtImporteRevaluacion" style="visibility:hidden"/>
            </td>
            <td align="left" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="15%"><div id="divFecha" style="visibility:hidden"> Fecha </div> </td>
            <td colspan="2">
              <input type="text" name = "txtFecha" id="txtFecha" tipo = "Date" style="visibility:hidden"/>
            </td>
            <td align="left" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="15%"><div id="tipoCambio" style="visibility:hidden"> Tipo de Cambio </div> </td>
            <td colspan="2">
              <input type="text" name = "fbifTipoCambio" id="fbifTipoCambio" style="visibility:hidden"/>
            </td>
            <td align="left" width="15%">&nbsp;</td>
          </tr>
           <tr>
            <td colspan="5" align="center">
              
      </td>
    </tr>
     <tr>
            <td colspan="5" align="center">
              <input type="button" value="Aceptar " name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/>
          <input type="button" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('ControlGestion.PrincipalBienesFideicomitidos','')" style="visibility:hidden"/>
            </td>
          </tr>
    <tr>
    </tr>
  </table>
</FORM>
