<form name="frmMantenimientoConceptos" id="frmMantenimientoConceptos" onsubmit=" ">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo" id="tituloMantenimiento">Mantenimiento a Conceptos KYC</td>
    </tr>
    <tr>
      <td height="25">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr id="trconpIdPersona">
            <td width="20%">&nbsp;</td>
            <td>Tipo Persona</td>
            <td colspan="4">
              <select size="1" name="conpIdPersona" id="conpIdPersona" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbTipoPersona" next="conpSecuencia" onchange="cargaComboKYC(this,'conpIdConceptoCombo')" required message="El Tipo de Persona es un campo obligatorio"/>
            </td>
          </tr>
          <tr id="trconpIdConcepto">
            <td width="20%">&nbsp;</td>
            <td>No.Concepto</td>
            <td colspan="4">
              <input type="text" name="conpIdConcepto" value="0" id="conpIdConcepto" tipo="Num" required message="El No. de Concepto es un campo obligatorio" maxlength="2" size="20" onChange="cambiaConcepto()"/>            
              <select size="1" name="conpIdConceptoCombo"  id="conpIdConceptoCombo" ref="conConceptosKyc" fun="loadComboElement" keyValue="conpIdConcepto" theValue="conpNombre"  style="visibility:hidden" onchange="GI('conpIdConcepto').value=(this.value>0)?this.value:0;cargaComboKYC(this,'conpIdSubconceptoCombo')"/>
            </td>
          </tr>
          <tr id="trconpIdSconcepto">
            <td width="20%">&nbsp;</td>
            <td>No. SConcepto</td>
            <td colspan="4">
              <input type="text" name="conpIdSconcepto" value="0" id="conpIdSconcepto" tipo="Num" required message="El No. de SubConcepto es un campo obligatorio" maxlength="2" size="20"/>           
              <select size="1" name="conpIdSubconceptoCombo" id="conpIdSubconceptoCombo" ref="conConceptosKyc" fun="loadComboElement" keyValue="conpIdSconcepto" theValue="conpNombre" param="cmbConceptos2" style="visibility:hidden"  onchange="GI('conpIdSconcepto').value=(this.value>0)?this.value:0;"/>
            </td>
          </tr>
          <tr id="trconpIdSsconcepto">
            <td>&nbsp;</td>
            <td>No. SSConcepto</td>
            <td colspan="4">
              <input type="text" name="conpIdSsconcepto" value="0" id="conpIdSsconcepto" tipo="Num" required message="El No. de SubSubConcepto es un campo obligatorio" maxlength="2" size="20"/>              
            </td>
          </tr>
         <!-- <tr>  
            <td>&nbsp;</td>
            <td>Clave</td>
            <td>
              <input type="text" name="conpClave" id="conpClave" maxlength="100" size="20"/>
            </td>
          </tr>
          -->
          <tr>
            <td>&nbsp;</td>
            <td>Concepto</td>
            <td colspan="4">
              <input type="text" name="conpNombre" id="conpNombre" required message="El Concepto es un campo obligatorio" maxlength="100" size="30"/>
            </td>
          </tr>
         
          <tr id="trconpSecuencia">
            <td>&nbsp;</td>
            <td>Concepto MINDS</td>
            <td colspan="4">
              <select size="1" name="conpSecuencia" id="conpSecuencia" ref="conETDatInd" fun="loadComboElement" extraValue="eindFormaEmp" keyValue="eindIdSubindice" theValue="eindDescripcion" onchange="if(this.selectedIndex!=0){GI('conpTipoDato').value=GA(this.options[this.selectedIndex],'extraValue');GI('conpTipoDato').disabled=true}else{GI('conpTipoDato').disabled=false;GI('conpTipoDato').selectedIndex=0}" param="cmbSecuencias" next="conpTipoDato"/>
            </td>
          </tr>
           <tr>
            <td>&nbsp;</td>
            <td>Comentario</td>
            <td colspan="4">
              <textarea id="conpComentario" name="conpComentario" onkeydown="validaLongitud(this,250);" style="width:250px"></textarea>
            </td>
          </tr>
          <tr id="trconpTipoDato">
            <td>&nbsp;</td>
            <td>Tipo Dato</td>
            <td colspan="4">
             <select size="1" name="conpTipoDato" id="conpTipoDato" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbTipoDato" next="conpTabla" required message="El Tipo de Dato es un campo obligatorio"/>
            </td>
          </tr>
          <tr id="trconpTabla">
            <td>&nbsp;</td>
            <td>Criterio de seleccion</td>
            <td colspan="4">              
              <select size="1" name="conpTabla" id="conpTabla" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbCriterio" next="conpEstatus" onchange="GI('conpBaseCheck').checked=((this.selectedIndex!=0)?true:false);"/>
             <input type="checkbox"  name="conpBaseCheck" id="conpBaseCheck" class="check" disabled tv="1" fv="0"/>Se obtiene de base
             <input type="HIDDEN" name="conpBase" id="conpBase" value=0/>
             </td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>Estatus</td>
            <td colspan="4">
             <select size="1" name="conpEstatus" id="conpEstatus" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="cmbStatus" next="loadCatalogo" required message="El Estatus es un campo obligatorio" />
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr id="trObligatorio">
      <td width="60%" height="100%" align="center">
        <table class="texto">
          <tr>
            <td><input type="checkbox" class="check" name="conpRenovarCheck" id="conpRenovarCheck" tv="1" fv="0"/>Se Renueva
               <input type="HIDDEN" name="conpRenovar" id="conpRenovar" value=0/>
            </td>
            <td> <input type="checkbox" class="check" name="conpObligatorioCheck" id="conpObligatorioCheck" tv="1" fv="0"/>Obligatorio
             <input type="HIDDEN" name="conpObligatorio" id="conpObligatorio" value=0/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td align="center">
        <input type="button" value="Aceptar " name="cmdAceptar" id="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/>
        <input type="button" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="onButtonClick('KYC.Conceptos.PrincipalConceptos','')" style="visibility:hidden;position:absolute"/>
      </td>
    </tr>
  </table>
</form>
