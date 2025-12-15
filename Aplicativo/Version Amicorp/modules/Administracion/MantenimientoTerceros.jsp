<FORM name="frmDatosMantenimientoTerceros" id="frmDatosMantenimientoTerceros" onsubmit="">
  <table cellspacing="0" cellpadding="0"  width="100%" align="center">
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td align="center" class="titulo">Terceros</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <tr valign="middle">
              <td width="1%" valign="middle" nowrap>No. Fideicomiso</td>
              <td valign="middle" width="5%">
                <input type="text" name="terNumContrato" id="terNumContrato" tipo="Num" size="10" maxlength="10" onblur="validarPkAlta(this);" required message="El Número de Fideicomiso es un campo obligatorio"/>
              </td>
              <td valign="middle" colspan="5">
                <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
              </td>
            </tr>
            <tr valign="middle">
              <td width="1%" valign="middle" nowrap>No. Tercero</td>
              <td width="27%" valign="middle" colspan="2">
                <input type="text" name="terNumTercero" id="terNumTercero" tipo="Num" size="10" maxlength="10"  required message="El Número del Tercero es un campo obligatorio"/>
              </td>
              <td width="5%" valign="middle" nowrap>&nbsp;</td>
              <td width="1%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle">&nbsp;</td>
              <td width="7%" valign="middle">&nbsp;</td>
            </tr>
            <tr>
              <td width="1%" valign="middle" nowrap>Nombre</td>
              <td colspan="4" width="10%" valign="middle">
                <input type="text" name="terNomTercero" id="terNomTercero" size="50" maxlength="50" required message="El Nombre del Tercero es un campo obligatorio"/>
              </td>
              <td align="center">
                <input type="BUTTON" value="Aceptar " name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/>
                <input type="BUTTON" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="cargaPrincipalTerceros();" style="visibility:hidden"/>
              </td>
              <td align="center">
                
                <input type="BUTTON" value="Ver KYC" name="cmdKYC" class="boton" onclick="cargaCheckList();" style="visibility:hidden"/>
              </td>
            </tr>
            <tr>
              <td width="10%" colspan="7" valign="middle">
                <hr>
              </td>
            </tr>       
             
            <tr style="position:absolute;visibility:hidden">
              <td><input type="text" name="terRfc" id="terRfc"/></td>
            </tr> 
            
            <tr id="trNacionalidad">    
            <td width="1%" valign="middle" nowrap>Nacionalidad</td>
              <td width="27%" valign="middle" colspan="2">                
                <select size="1" name="terNomNacional" id="terNomNacional" ref="claveNacionalidad" fun="loadComboElement" keyValue="nacNomNacional" theValue="nacNomNacional" next="terCveTipoPers"/>
              </td>
              <td width="5%" valign="middle" nowrap>&nbsp;</td>
              <td width="1%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle">&nbsp;</td>
              <td width="7%" valign="middle">&nbsp;</td>
            </tr>
            
            <tr style="position:absolute;visibility:hidden" id="trCalidadMigratoria">            
              <td width="1%" valign="middle" nowrap>Calidad Migratoria</td>
              <td width="27%" valign="middle" colspan="2">                
                <input type="text" name="terCveMigratoria" id="terCveMigratoria"/>
              </td>
              <td width="5%" valign="middle" nowrap>&nbsp;</td>
              <td width="1%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle">&nbsp;</td>
              <td width="7%" valign="middle">&nbsp;</td>            
            </tr>
            
            <tr style="position:absolute;visibility:hidden">              
              <td> Actividad
                <input type="text" name="terNumRama" id="terNumRama" value="1"/>
                 <input type="text" name="terNumSrama" id="terNumSrama" value="1"/>
              </td>              
            </tr>
            
            <tr id="trTipoPersona">  
              <td width="1%" valign="middle" nowrap>Tipo Persona</td>
              <td width="27%" valign="middle" colspan="2">                
                <select size="1" name="terCveTipoPers" id="terCveTipoPers" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="loadCatalogo" param="clavesCombo23"/>
              </td>
              <td width="5%" valign="middle" nowrap>&nbsp;</td>
              <td width="1%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle">&nbsp;</td>
              <td width="7%" valign="middle">&nbsp;</td>             
            </tr>       
          </table>
        </td>
      </tr>
      
      
  </table>
  <div style="position:absolute;visibility:hidden">
      <input type="radio" name="terCveSexo" id="terCveSexo"  value="" />
      <input type="text" name="terNumLadaCasa" id="terNumLadaCasa" tipo="Num" size="4" maxlength="4"/>             
      <input type="text" name="terNumTelefCasa" id="terNumTelefCasa" size="20" maxlength="20"/>              
      <input type="text" name="terNumLadaOfic" id="terNumLadaOfic" tipo="Num" size="4" maxlength="4"/>              
      <input type="text" name="terNumTelefOfic" id="terNumTelefOfic" size="20" maxlength="20"/>              
      <input type="text" name="terNumExtOfic" id="terNumExtOfic" tipo="Num" size="10" maxlength="10"/> 
      <input type="text" name="terNumLadaFax" id="terNumLadaFax" tipo="Num" size="4" maxlength="4"/>
      <input type="text" name="terNumTelefFax" id="terNumTelefFax" size="20" maxlength="20"/>
      <input type="text" name="terNumExtFax" id="terNumExtFax" tipo="Num" size="10" maxlength="10"/>            
      <input type="text" name="terCveStTercero" id="terCveStTercero" value="ACTIVO"/>              
      <input type="text" name="terCurp" id="terCurp" tipo="AlphaNumeric" size="18" maxlength="18"/>
              
  </div>
</FORM>
<table cellpadding="0" cellspacing="0" width="1168" height="640" id="ContenedorKYC" style="visibility:hidden;">
  <tr>
    <td colspan="2" width="1168" align="right" height="40" class="AcotacionesKYC"></td>    
  </tr>
  <tr>
    <td width="168" align="right" height="500" style="vertical-align:top;"><div id="cargaCheck"></div></td>
    <td width="1000" align="center" height="500" style="background-color: #E4E4E4;"><div id="cargaConceptos" style="vertical-align:top;"><div style="color: #CCCCCC;font-size: 70px;font-weight: bold;">KYC</div></div></td>
  </tr>
</table>
