<FORM name="frmDatosMantenimientoFideicomisarios" id="frmDatosMantenimientoFideicomisarios" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Fideicomisarios</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <tr valign="middle">
              <td width="10%" valign="middle" nowrap>No. Fideicomiso</td>
              <td width="33%" valign="middle">
                <input type="text" name="benNumContrato" id="benNumContrato" tipo="Num" size="15" maxlength="10" onblur="verificarAlta();" required message="El N�mero de Fideicomiso es un campo obligatorio"/>
              </td>
              <td width="10%" valign="middle">&nbsp;</td>
              <td width="11%" valign="middle" nowrap>&nbsp;</td>
              <td width="3%" valign="middle">&nbsp;
              </td>
              <td width="37%" valign="middle">&nbsp;</td>
            </tr>
            <tr>
              <td width="10%" valign="middle" nowrap>No. Fideicomisario</td>
              <td colspan="5" width="10%" valign="middle">
                <input type="text" name="benBeneficiario" id="benBeneficiario" tipo="Num" size="15" maxlength="10" onblur="verificacionExistenciaRegistro();" required message="El N�mero de Fideicomisario es un campo obligatorio"/>
              </td>
            </tr>
            <tr>
              <td width="10%" valign="middle" nowrap>Nombre</td>
              <td colspan="5" width="10%" valign="middle">
                <input type="text" name="benNomBenef" id="benNomBenef"  size="50" maxlength="50" required message="El Nombre del Fideicomisario es un campo obligatorio"/>
              </td>
            </tr>
            
            <tr>
              <td width="10%" valign="middle" nowrap>RFC</td>
              <td colspan="5" width="10%" valign="middle">
                <input type="text" name="benRfc" id="benRfc"  size="50" maxlength="50" required message="El RFC es un campo obligatorio"/>
              </td>
            </tr>  
			
            <tr>
              <td width="10%" valign="middle" nowrap>Listas:</td>
              <td width="33%" valign="middle">
                <select size="1" name="benNumTelefCasa" id="benNumTelefCasa" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="benNomNacional" param="clavesCombo1003"/>
              </td>
              <td width="10%" valign="middle">&nbsp;</td>
              <td width="11%" valign="middle">&nbsp;</td>
              <td width="3%" valign="middle">&nbsp;</td>
              <td width="37%" valign="middle">&nbsp;</td>
            </tr>


			
            <tr>
              <td width="10%" valign="middle" nowrap>Nivel Riesgo</td>
              <td colspan="5" width="10%" valign="middle">
                <input type="text" name="benCurp" id="benCurp"  size="50" maxlength="50" disabled/>
              </td>
            </tr>            
            
            <tr>
              <td width="10%" colspan="6" valign="middle">
                <hr/>
              </td>
            </tr>
            <tr>
              <td width="10%" valign="middle" nowrap>Representante</td>
              <td width="33%" valign="middle" colspan="5">
                <input type="text" name="benNomRepres" id="benNomRepres" tipo="AlphaNumeric" size="50" maxlength="50"/>
              </td>
            </tr>
            <tr>
              <td width="10%" valign="middle" nowrap>Nacionalidad</td>
              <td width="33%" valign="middle">
                <select size="1" name="benNomNacional" id="benNomNacional" ref="claveNacionalidad" fun="loadComboElement" keyValue="nacNomNacional" theValue="nacNomNacional" next="benCveMigratoria" request message="La nacionalidad es un campo obligatorio"/>
              </td>
              <td width="10%" valign="middle">&nbsp;</td>
              <td width="11%" valign="middle">&nbsp;</td>
              <td width="3%" valign="middle">&nbsp;</td>
              <td width="37%" valign="middle">&nbsp;</td>
            </tr>
            <tr style="position:absolute;visibility:hidden">
              <td width="10%" valign="middle" nowrap>Calidad Migratoria</td>
              <td width="33%" valign="middle">
                <select size="1" name="benCveMigratoria" id="benCveMigratoria" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="benCveTipoPer" param="clavesCombo16"/>
              </td>
              <td width="10%" valign="middle">&nbsp;</td>
              <td width="11%" colspan="3" valign="middle">&nbsp;</td>
            </tr>
			
            <div style="position:absolute;visibility:hidden">
               <input type="text" name="benRfc" id="benRfc" value="" />
               <input type="text" name="benFecNac" id="benFecNac" value="" />
               <input type="text" name="benNumRama" id="benNumRama" value="1" />
               <input type="text" name="benNumSrama" id="benNumSrama" value="1" />
               <input type="text" name="benNumLadaCasa" id="benNumLadaCasa" value="" />

               <input type="text" name="benNumLadaOfic" id="benNumLadaOfic" value="" />
               <input type="text" name="benNumTelefOfic" id="benNumTelefOfic" value="" />
               <input type="text" name="benNumExtOfic" id="benNumExtOfic" value="" />
               <input type="text" name="benNumLadaFax" id="benNumLadaFax" value="" />
               <input type="text" name="benNumTelefFax" id="benNumTelefFax" value="" />
               <input type="text" name="benNumExtFax" id="benNumExtFax" value="" />
            </div>
            <tr>
              <td width="10%" valign="middle" nowrap>Tipo Persona</td>
              <td width="33%" valign="middle">
                <select size="1" name="benCveTipoPer" id="benCveTipoPer" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="benCveStBenefic" param="clavesCombo23" required message="El tipo de persona es un campo obligatorio"/>
              </td>
              <td width="10%" valign="middle">&nbsp;</td>
              <td width="11%" colspan="3" align="left" valign="middle">&nbsp;</td>
            </tr>

            <tr >
              <td width="10%" valign="middle" nowrap>Status</td>
              <td width="33%" valign="middle">
                <select size="1" name="benCveStBenefic" id="benCveStBenefic" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="loadCatalogo" param="clavesCombo31" required message="El Status es un campo obligatorio"/>
              </td>
              <td width="10%" valign="middle">&nbsp;</td>
              <td width="11%" colspan="3" valign="middle">&nbsp;</td>
            </tr>

            
          </table>
        </td>
      </tr>
      <tr>
        <td width="60%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%" align="center">
          <input type="BUTTON" value="Aceptar " name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();"/>
          <input type="BUTTON" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="cargaPrincipalFideicomisarios();"/>
          <input type="BUTTON" value="Ir a KYC" name="cmdKYC" class="boton" onclick="cargaCheckList();" style="visibility:hidden"/>
        </td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
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
