<FORM name="frmMantenimientoGarantias" id="frmMantenimientoGarantias" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento Derechos de Cobro</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" align="center" class="texto">
          <tr>
            <td >Fideicomiso:</td>
            <td  >
              <input type="text" name="fgarIdFideicomiso" id="fgarIdFideicomiso" tipo="Num" size = "10" maxlength="10" required message = "Valor obligatorio" onblur="consultaNombreFideicomiso('nomFideicomiso',this);"/>
            </td>
            <td><div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div></td>
            <td >&nbsp;     
            </td>
          </tr>
          <tr>
            <td >Sub. Fiso:</td>
            
            <td  >
              <input type="text" name="fgarIdSubcuenta" id="fgarIdSubcuenta" tipo="Num" size = "10" maxlength="10" required message = "Valor obligatorio"/>
            </td>
            <td>&nbsp;</td>
            <td >&nbsp;     
            </td>
            <td ><input type="hidden" id="paramUsuario" name="paramUsuario" value="<%=session.getAttribute("userid").toString()%>"/></td>
          </tr>
          <tr>
            <td >Tipo de Garantia:</td>
            <td  >
                <select size="1" name="fgarCveGarantia" id="fgarCveGarantia" ref="claves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" param="clavesCombo38" next="fgarCvePerValua" required message = "Valor obligatorio"/>
            </td>
            <td  >Importe Garantizado</td>
            <td  >
              <input type="text" name="fgarImpGarantizad" id="fgarImpGarantizad" tipo="Num" size="20" maxlength="16"  value="0" disabled="disabled"/>
            </td>
            <td ><input type="hidden" id="paramMesAbierto" name="paramMesAbierto" value="<%=session.getAttribute("mesAbiertoLbl")%>"/></td>
          </tr>
           <tr>
            <td  >Descripcion </td>
            <td  >
              <textarea cols="35" name="fgarTexGarantia" id="fgarTexGarantia"/></textarea>
            </td>
            <td  >Importe &Uacute;ltima Valuaci&oacute;n</td>
            <td  >
              <input type="text" name="fgarImpUltValua" id="fgarImpUltValua" tipo="Num" size="20" maxlength="16" value="0" disabled="disabled"/>
            </td>
            <td >&nbsp;</td>
          </tr>
           <tr>
            <td >Comentario</td>
            <td  >
              <textarea cols="35" name="fgarTexComentario" id="fgarTexComentario"></textarea>
            </td>
            <td  >Fecha Ultima Valuacion</td>
            <td  >
              <input type="text" name="fgarFecUltValua" id="fgarFecUltValua" tipo="Fecha" size="10" maxlength="10" disabled="disabled"/>
            </td>
            <td >&nbsp;</td>
          <tr>
           <tr>
            <td >Revalua</td>
            <td  >
              <input type="checkbox" id="fgarCveRevaluaChk" name="fgarCveRevaluaChk" class="check" tv="1" fv="0"/>
              <!--<input type="checkbox" name="dirAnoAltaRegChk" id="dirAnoAltaRegChk" class="check" tv="1" fv="0"/>-->
            </td>
            <td>&nbsp;</td>
            <td >&nbsp;
            </td>
            <td >&nbsp;</td>
          <tr>
           <tr>
            <td >Importe Garantia</td>
            <td  >
              <input type="text" name="fgarImpGarantia" id="fgarImpGarantia" tipo="Num" size="20" maxlength="16"/>
            </td>
            <td>&nbsp;</td>
            <td >&nbsp;
            </td>
            <td >&nbsp;</td>
          <tr>
           <tr>
            <td  >% Picnorado</td>
            <td>
              <input type="text" name="fgarPjePicnorado" id="fgarPjePicnorado" tipo="Num" size="20" maxlength="16"/>
            </td>
            <td >&nbsp;
            </td>
            <td >&nbsp;</td>
          <tr>
           <tr>
            <td >Periodicidad Valuaci&oacute;n</td>
            <td  >
              <select size="1" name="fgarCvePerValua" id="fgarCvePerValua" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="clavesCombo52" next="fgarCveStatus"/>
            </td>
            <td  >&nbsp;</td>
                <td>&nbsp;
                </td>
            <td >&nbsp;</td>
          </tr>
          <tr>
            <td >Fecha Inicio</td>
            <td  >
              <input type="text" name="fgarFecInicio" id="fgarFecInicio" tipo="Fecha" size="10" maxlength="10"/><!--onblur="asignaFec();"-->
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;
            </td>
            <td align="left" >&nbsp;</td>
          </tr>
          <tr>
            <td >Fecha de Salida:</td>
            <td  >
              <input type="text" name="fgarFecFin" id="fgarFecFin" tipo="Fecha" size="10" maxlength="10"/>
             </td>
            <td colspan="2">
              
            </td>
            <td align="left" >&nbsp;</td>
          </tr>
          <tr>
            <td >Estatus</td>
            <td  >
              <select size="1" name="fgarCveStatus" id="fgarCveStatus" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="loadCatalogo" param="clavesCombo31"/>
            </td>
            <td colspan="2">
              
            </td>
            <td align="left" >&nbsp;</td>
          </tr>
          <tr>
            <td >&nbsp;</td>
            <td  >&nbsp;
             </td>
            <td colspan="2">
              
            </td>
            <td align="left" >&nbsp;</td>
          </tr>
          <tr>
            <td >&nbsp;</td>
            <td  >
              <input type="text" name="fcoDiaDia" id="fcoDiaDia" size="2" style="visibility:hidden"/>
              <input type="text" name="fcoMesDia" id="fcoMesDia" size="2" style="visibility:hidden"/>
              <input type="text" name="fcoAnoDia" id="fcoAnoDia" size="4" style="visibility:hidden"/>
             </td>
            <td colspan="2">
              
            </td>
            <td align="left" >&nbsp;</td>
          </tr>
           <tr>
            <td colspan="5" align="center">
              
      </td>
    </tr>
     <tr>
            <td colspan="5" align="center">
              <input type="button" value="Aceptar " name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/>
          <input type="button" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('Garantias.DerechosCobro.PrincipalDerechosCobro','')" style="visibility:hidden"/>
            </td>
          </tr>
    <tr>
    </tr>
  </table>
</FORM>