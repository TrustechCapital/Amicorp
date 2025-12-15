<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento Reglas de Transaccionalidad</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%"  width="100%">
        <table width="100%" align="center" class="texto" border="0">
          <tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="5%" nowrap>Tipo Negocio</td>
            <td valign="middle" height="6" width="8%" colspan="2">
              <select name="farTipoNegocio" id="farTipoNegocio" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="farIdTipoOperacion" param="clavesCombo703" required message="El Tipo de Negocio es obligatorio"/>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="8%" valign="middle" nowrap>&nbsp;</td>
            <td width="5%" valign="middle" nowrap>No. Fideicomiso</td>
            <td valign="middle" width="8%" nowrap>
              <input type="text" name="farIdContrato" id="farIdContrato" size="15" maxlength="15" required message="El n�mero de Negocio es obligatorio" onblur="recupera_producto(this)"/>
            </td>
            <td valign="middle" width="8%" nowrap>
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
               <input type="text" name="txtMoneda" id="txtMoneda" size="30" maxlength="50" style="visibility:hidden"/>
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="5%" nowrap>Reglas Transaccionalidad</td>
            <td valign="middle" height="6" width="8%" colspan="2">
              <select name="farIdTipoOperacion" id="farIdTipoOperacion" ref="claves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" next="farTipoPersona" param="clavesCombo702" required message="El Tipo Operaci�n es obligatorio"/>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="5%" nowrap>Tipo Persona</td>
            <td valign="middle" height="6" width="8%" colspan="2">
              <select name="farTipoPersona" id="farTipoPersona" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="farCveStActividad" param="clavesCombo704" required message="El Tipo de Persona es obligatorio"/>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>

          <tr valign="middle">
            <td width="8%" valign="middle" nowrap>&nbsp;</td>
            <td width="5%" valign="middle" nowrap>RFC Tipo Persona</td>
            <td valign="middle" width="8%" nowrap>
              <input type="text" name="farNumTipoPersona" id="farNumTipoPersona" size="20" maxlength="20" required message="El n�mero de Persona es obligatorio" />
            </td>
            <td valign="middle" width="8%" nowrap>
              &nbsp;
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>

          
          <!--  DEPOSITOS  -->
          
          <tr>
            <td valign="middle" height="6"  colspan="5" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="left" height="6" width="5%" colspan="3" class="subtitulo">
                DEPOSITOS<hr/>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="5%" nowrap>
              Valida Depositos
            </td>
            <td valign="middle" height="6" width="8%" colspan="2">
              <input type="checkbox" name="farValidaDepositoChk" id="farValidaDepositoChk" class="check" tv="1" fv="2"/>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="left" height="6" width="5%" colspan="3" class="subtitulo">
                Moneda Nacional
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="8%" valign="middle" nowrap>&nbsp;</td>
            <td width="5%" valign="middle" nowrap>Importe Individual de Depositos PF</td>
            <td valign="middle" width="8%" colspan="2">
              <input type="text" name="farImpDeposito" id="farImpDeposito" size="10" maxlength="18" tipo="Num"/>
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="8%" valign="middle" nowrap>&nbsp;</td>
            <td width="5%" valign="middle" nowrap>Importe Individual de Depositos PM o Fideicomiso</td>
            <td valign="middle" width="8%" colspan="2">
              <input type="text" name="farImpDepositoPm" id="farImpDepositoPm" size="10" maxlength="18" tipo="Num"/>
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          
          <tr valign="middle">
            <td width="8%" valign="middle" nowrap>&nbsp;</td>
            <td width="5%" valign="middle" nowrap>Importe Acumulado Mensual de Depositos</td>
            <td valign="middle" width="8%" colspan="2">
              <input type="text" name="farImpMesDeposito" id="farImpMesDeposito" size="10" maxlength="18" tipo="Num"/>
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="left" height="6" width="5%" colspan="3" class="subtitulo">
                Moneda Extranjera
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="8%" valign="middle" nowrap>&nbsp;</td>
            <td width="5%" valign="middle" nowrap>Importe Individual de Depositos Ext. PF</td>
            <td valign="middle" width="8%" colspan="2">
              <input type="text" name="farImpDepositoExt" id="farImpDepositoExt" size="10" maxlength="18" tipo="Num"/>
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="8%" valign="middle" nowrap>&nbsp;</td>
            <td width="5%" valign="middle" nowrap>Importe Individual de Depositos Ext. PM o Fideicomiso</td>
            <td valign="middle" width="8%" colspan="2">
              <input type="text" name="farImpDepositoExtPm" id="farImpDepositoExtPm" size="10" maxlength="18" tipo="Num"/>
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>          
          <tr valign="middle">
            <td width="8%" valign="middle" nowrap>&nbsp;</td>
            <td width="5%" valign="middle" nowrap>Importe Acumulado Mensual de Depositos Ext.</td>
            <td valign="middle" width="8%" colspan="2">
              <input type="text" name="farImpMesDepositoExt" id="farImpMesDepositoExt" size="10" maxlength="18" tipo="Num"/>
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          
          <!--  RETIROS  -->
          
          <tr>
            <td valign="middle" height="6"  colspan="5" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="left" height="6" width="5%" colspan="3" class="subtitulo">
                RETIROS<hr/>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="5%" nowrap>
              Valida Retiros
            </td>
            <td valign="middle" height="6" width="8%" colspan="2">
              <input type="checkbox" name="farValidaRetiroChk" id="farValidaRetiroChk" class="check" tv="1" fv="2"/>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="left" height="6" width="5%" colspan="3" class="subtitulo">
                Moneda Nacional
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="8%" valign="middle" nowrap>&nbsp;</td>
            <td width="5%" valign="middle" nowrap>Importe Individual de Retiros PF</td>
            <td valign="middle" width="8%" colspan="2">
              <input type="text" name="farImpRetiro" id="farImpRetiro" size="10" maxlength="18" tipo="Num"/>
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="8%" valign="middle" nowrap>&nbsp;</td>
            <td width="5%" valign="middle" nowrap>Importe Individual de Retiros PM o Fideicomisos</td>
            <td valign="middle" width="8%" colspan="2">
              <input type="text" name="farImpRetiroPm" id="farImpRetiroPm" size="10" maxlength="18" tipo="Num"/>
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>          
          <tr valign="middle">
            <td width="8%" valign="middle" nowrap>&nbsp;</td>
            <td width="5%" valign="middle" nowrap>Importe Acumulado Mensual de Retiros</td>
            <td valign="middle" width="8%" colspan="2">
              <input type="text" name="farImpMesRetiro" id="farImpMesRetiro" size="10" maxlength="18" tipo="Num"/>
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="left" height="6" width="5%" colspan="3" class="subtitulo">
                Moneda Extranjera
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="8%" valign="middle" nowrap>&nbsp;</td>
            <td width="5%" valign="middle" nowrap>Importe Individual de Retiros Ext. PF</td>
            <td valign="middle" width="8%" colspan="2">
              <input type="text" name="farImpRetiroExt" id="farImpRetiroExt" size="10" maxlength="18" tipo="Num"/>
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="8%" valign="middle" nowrap>&nbsp;</td>
            <td width="5%" valign="middle" nowrap>Importe Individual de Retiros Ext.  PM o Fideicomisos</td>
            <td valign="middle" width="8%" colspan="2">
              <input type="text" name="farImpRetiroExtPm" id="farImpRetiroExtPm" size="10" maxlength="18" tipo="Num"/>
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>          
          <tr valign="middle">
            <td width="8%" valign="middle" nowrap>&nbsp;</td>
            <td width="5%" valign="middle" nowrap>Importe Acumulado Mensual de Retiros Ext.</td>
            <td valign="middle" width="8%" colspan="2">
              <input type="text" name="farImpMesRetiroExt" id="farImpMesRetiroExt" size="10" maxlength="18" tipo="Num"/>
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          
          <!--  DEPOSITOS EFECTIVO  -->
          <!--
          <tr>
            <td valign="middle" height="6"  colspan="5" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="left" height="6" width="5%" colspan="3" class="subtitulo">
                DEPOSITOS EN EFECTIVO<hr/>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="5%" nowrap>
              Valida D�positos en Efectivo
            </td>
            <td valign="middle" height="6" width="8%" colspan="2">
              <input type="checkbox" name="farValidaDepositoEftvoChk" id="farValidaDepositoEftvoChk" class="check" tv="1" fv="2"/>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <!--tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="left" height="6" width="5%" colspan="3" class="subtitulo">
                Moneda Nacional
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="8%" valign="middle" nowrap>&nbsp;</td>
            <td width="5%" valign="middle" nowrap>Importe Individual de D�positos en Efectivo</td>
            <td valign="middle" width="8%" colspan="2">
              <input type="text" name="farImpDepositoEftvo" id="farImpDepositoEftvo" size="10" maxlength="18" tipo="Num"/>
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="8%" valign="middle" nowrap>&nbsp;</td>
            <td width="5%" valign="middle" nowrap>Importe Acumulado Mensual de D�positos en Efectivo</td>
            <td valign="middle" width="8%" colspan="2">
              <input type="text" name="farImpMesDepositoEftvo" id="farImpMesDepositoEftvo" size="10" maxlength="18" tipo="Num"/>
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr-->
          
          <!--tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td align="left" height="6" width="5%" colspan="3" class="subtitulo">
                Moneda Extranjera
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="8%" valign="middle" nowrap>&nbsp;</td>
            <td width="5%" valign="middle" nowrap>Moneda de Dep�sito en Efectivo</td>
            <td valign="middle" width="8%" colspan="2">
              <select size="1" name="farValidaMonedaEftvo" id="farValidaMonedaEftvo" ref="claveMoneda" fun="loadComboElement" keyValue="monNumPais" theValue="monNomMoneda" next="farCveStActividad"/>
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="8%" valign="middle" nowrap>&nbsp;</td>
            <td width="5%" valign="middle" nowrap>Importe Individual de D�positos en Efectivo <br>Ext.</td>
            <td valign="middle" width="8%" colspan="2">
              <input type="text" name="farImpDepositoEftvoExt" id="farImpDepositoEftvoExt" size="10" maxlength="18" tipo="Num"/>
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="8%" valign="middle" nowrap>&nbsp;</td>
            <td width="5%" valign="middle" nowrap>Importe Acumulado Mensual de Depositos en Efectivo Fisica <br>Ext.</td>
            <td valign="middle" width="8%" colspan="2">
              <input type="text" name="farImpMesDepositoEftvoExt" id="farImpMesDepositoEftvoExt" size="10" maxlength="18" tipo="Num"/>
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="8%" valign="middle" nowrap>&nbsp;</td>
            <td width="5%" valign="middle" nowrap>Importe Acumulado Mensual de D�positos en Efectivo Moral<br>Ext.</td>
            <td valign="middle" width="8%" colspan="2">
              <input type="text" name="farImpMesDepEftvoExtMor" id="farImpMesDepEftvoExtMor" size="10" maxlength="18" tipo="Num"/>
            </td>
            <td width="5%" valign="middle" nowrap>&nbsp;</td>
          </tr-->
          
          
          
          <tr valign="middle">
            <td valign="middle" colspan="5">&nbsp;</td>
          </tr>
          <tr>
            <td valign="middle" height="6" width="8%" nowrap>&nbsp;</td>
            <td valign="middle" height="6" width="5%" nowrap>Estatus</td>
            <td valign="middle" height="6" width="8%" colspan="2">
              <select size="1" name="farCveStActividad" id="farCveStActividad" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="clavesCombo31" next="asignaValues2ObjHTML" required message="El Status es obligatorio"/>
            </td>
            <td valign="middle" height="6" width="5%" nowrap>&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td colspan="5" height="100%">&nbsp;&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar " id="cmdAceptar" name="cmdAceptar" class="boton" onclick="ejecutaOperacion();" style="visibility:hidden"/>
        <input type="BUTTON" value="Cancelar" id="cmdCancelar" name="cmdCancelar" class="boton_x" onclick="regresar()" style="visibility:hidden"/>
      </td>
    </tr>
  </table>
</FORM>
