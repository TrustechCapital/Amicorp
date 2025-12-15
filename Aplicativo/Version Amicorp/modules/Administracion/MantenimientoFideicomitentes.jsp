<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Fideicomitentes</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto" border="0">
          <tr>
            <td width="12%">&nbsp;</td>
            <td nowrap width="15%">No. Fideicomiso</td>
            <td>
              <input type="text" name="fidNumContrato" id="fidNumContrato" tipo="Num" size="10" maxlength="10" onblur="validarPkAlta(this);" required message="El N�mero de Fideicomiso es un campo obligatorio"/>
            </td>
            <td colspan="4">
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="12%">&nbsp;</td>
            <td nowrap width="15%">No. Fideicomitente</td>
            <td>
              <input type="text" name="fidFideicomitente" id="fidFideicomitente" tipo="Num" size="10" maxlength="10" required message="El N�mero de Fideicomitente es un campo obligatorio"/>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td width="16%">&nbsp;</td>
            <td>&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="12%">&nbsp;</td>
            <td nowrap width="15%">Raz&oacute;n Social</td>
            <td colspan="5">
              <input type="text" name="fidNomFideicom" id="fidNomFideicom" size="50" maxlength="50" required message="La Raz�n Social es un campo obligatorio"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          

          <tr>
              <td width="12%">&nbsp;</td>
              <td nowrap width="15%">Listas:</td>
              <td colspan="5">
                <select size="1" name="fidNumTelefCasa" id="fidNumTelefCasa" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="fidNomNacional" param="clavesCombo1003"/>
              </td>
              <td width="10%">&nbsp;</td>
          </tr>          

		  
          <tr>
            <td width="12%">&nbsp;</td>
            <td nowrap width="15%">RFC</td>
            <td colspan="5">
              <input type="text" name="fidRfc" id="fidRfc" size="50" maxlength="50" required message="El RFC es un campo obligatorio"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>          
          
          <tr>
            <td width="12%">&nbsp;</td>
            <td nowrap width="15%">Nivel Riesgo</td>
            <td colspan="5">
              <input type="text" name="fidCurp" id="fidCurp" size="50" maxlength="50" disabled/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
           
            <tr>
              <td width="12%">&nbsp;</td>
              <td nowrap width="15%">Nacionalidad</td>
              <td colspan="5">
                <select size="1" name="fidNomNacional" id="fidNomNacional" ref="claveNacionalidad" fun="loadComboElement" onchange="GI('fidCveMigratoria').selectedIndex=((this.options[this.selectedIndex].text=='MEXICANA')?1:2);" keyValue="nacNomNacional" theValue="nacNomNacional" next="fidCveMigratoria" required message="La nacionalidad es un campo obligatorio"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="12%">&nbsp;</td>
              <td nowrap width="15%">Calidad Migratoria</td>
              <td colspan="5">
                <select size="1" name="fidCveMigratoria" id="fidCveMigratoria" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="fidCveTipoPer" param="clavesCombo16"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            
            <tr>
              <td width="12%">&nbsp;</td>
              <td nowrap width="15%">Tipo Persona</td>
              <td colspan="5">
                <select size="1" name="fidCveTipoPer" id="fidCveTipoPer" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="fidCveStFideico" param="clavesCombo23" required message="El Tipo de Persona es un campo obligatorio"/>
              </td>
              <td align="left" width="10%">&nbsp;</td>
            </tr>
            

            <tr>
              <td width="12%">&nbsp;</td>
              <td nowrap width="15%">Status</td>
              <td colspan="5">
                <select size="1" name="fidCveStFideico" id="fidCveStFideico" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="loadCatalogo" param="clavesCombo31" required message="El Status es un campo obligatorio"/>
              </td>
              <td align="left" width="10%">&nbsp;</td>
            </tr>

			
          <div style="position:absolute;visibility:hidden">
            
            <input type="text" name="fidNumRama" id="fidNumRama"  value="1"/>
            <input type="text" name="fidNumSrama" id="fidNumSrama"  value="1"/>
            <input type="text" name="fidCveSexo" id="fidCveSexo"  value=""/>
            <input type="text" name="fidNumLadaCasa" id="fidNumLadaCasa"  value=""/>
            
            <input type="text" name="fidNumLadaOfic" id="fidNumLadaOfic"  value=""/>
            <input type="text" name="fidNumTelefOfic" id="fidNumTelefOfic"  value=""/>
            <input type="text" name="fidNumExtOfic" id="fidNumExtOfic"  value=""/>
            <input type="text" name="fidNumLadaFax" id="fidNumLadaFax"  value=""/>
            <input type="text" name="fidNumTelefFax" id="fidNumTelefFax"  value=""/>
            <input type="text" name="fidNumExtFax" id="fidNumExtFax"  value=""/>
          </div>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar " name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/>
        <input type="BUTTON" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="cargaPrincipalFideicomitentes();" style="visibility:hidden"/>
        <input type="BUTTON" value="Direcciones" name="cmdDirecciones" class="boton" onclick="cargaPrincipalDirecciones();" style="visibility:hidden"/>
        <input type="BUTTON" value="Ir a KYC" name="cmdKYC" class="boton" onclick="cargaCheckList();" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</FORM>
<table cellpadding="0" cellspacing="0" width="1168" height="640" id="ContenedorKYC" style="visibility:hidden;">
  <tr>
    <td colspan="2" width="1168" align="right" height="40" class="AcotacionesKYC"></td>    
  </tr>
  <tr>
    <td width="168" align="right" height="600" style="vertical-align:top;"><div id="cargaCheck"></div></td>
    <td width="1000" align="center" height="600" style="background-color: #E4E4E4;"><div id="cargaConceptos" style="vertical-align:top;"><div style="color: #CCCCCC;font-size: 70px;font-weight: bold;">KYC</div></div></td>
  </tr>
</table>
