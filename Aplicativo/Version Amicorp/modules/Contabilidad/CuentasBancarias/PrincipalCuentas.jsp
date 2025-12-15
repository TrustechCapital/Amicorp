<FORM name="frmCuentas" id="frmCuentas" onsubmit="">
<table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Cuentas Bancarias</td>
    </tr>
</table>    
  <table cellspacing="1" cellpadding="1" class="texto"  border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
         <tr valign="middle">
              <td width="25%">&nbsp;</td>
              <td nowrap>Fideicomiso</td>
              <td>
                <input type="text" name="paramFideicomiso" id="paramFideicomiso" tipo="Num" size="10" maxlength="10" onblur="consultaNombreFideicomiso('nomFideicomiso',this);" required message="El Fideicomiso es un campo obligatorio"/>
              </td>
              <td>
                <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
              </td>
              <td width="5%" colspan=2>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="40%">&nbsp;</td>
            <td width="8%">Tipo</td>
            <td colspan="4">
              <table class="texto">
          <tr>
            <td>
              <input type="RADIO" name="rdPersona" id="rdPersona" value2="0" class="radio" onclick="GI('paramTipo').value=0"/>
              </td>
              <td>
                Fideicomiso
             </td>
          </tr>
          <tr>
            <td>
              <input type="RADIO" name="rdPersona" id="rdPersona2" value2="1" class="radio" onclick="GI('paramTipo').value=1"/>
            </td>
            <td>
                Fideicomitente
            </td>
          </tr>
          <tr>
            <td>
              <input type="RADIO" name="rdPersona" id="rdPersona3" value2="2" class="radio" onclick="GI('paramTipo').value=2"/>
            </td>
             <td>
                Fideicomisario
            </td>
          </tr>
          <tr>
            <td>
              <input type="RADIO" name="rdPersona" id="rdPersona4" value2="3" class="radio" onclick="GI('paramTipo').value=3"/>
            </td>
             <td>
                Tercero
            </td>
          </tr>
       </table>
            </td>
            <td width="8%">&nbsp;</td>
          </tr>
        <tr>
             <td colspan="11" align="center">
              <input type="checkbox" name="chkDetallado" id="chkDetallado" onchange="detallado(this.checked)" class="check"/> Detallado
            </td>
        </tr>   
          
          <tr valign="middle">
            <td width="40%">&nbsp;</td>
            <td width="8%">&nbsp;</td>
            <td colspan="4">
              <input type="text" name="paramTipo" id="paramTipo" tipo="Num" size="10" style="visibility:hidden"/>
              <input type="text" name="paramCuenta" id="paramCuenta" tipo="Num" value="" size="10" style="visibility:hidden"/>
            </td>
            <td width="8%">&nbsp;</td>
          </tr>
          <tr><td colspan="7" align="center"><table align="center"><tr>
            <td align="center" valign="bottom">
              <div id="aceptarDetallado" align="center"><input type="BUTTON" id="Aceptar" name="cmdAceptar" value="Aceptar" class="boton" ref="consultaCuentasBancarias" fun="loadTableElement" tabla="tablaCuentas" onclick="consultar(this, GI('frmCuentas'), false);"/></div>
            </td>
            <td  align="center" valign="bottom">
              <input type="BUTTON" value="Limpiar" name="cmdLimpiar" size="20%" class="boton" onclick="limpiar(frmCuentas);"/>
            </td>
            <td  align="center" valign="bottom">
              <input type="button" value="Ver Ficha" name="cmdFicha" id="cmdFicha" align="left" class="boton" onclick="reponeFichaCuenta();"/>
            </td>
            </tr></table></td>
          </tr>
          <tr>
          <td colspan="7">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="7" align="center" valign="middle" class="subtitulo">Cuentas Bancarias</td>
          </tr>
          <tr align="center">
            <td colspan="7">
              <table cellspacing="0" cellpadding="0" border="0">
                <tr align="left" class="cabeceras">
                  <td width="23px" align="center">&nbsp;</td>
                  <td width="123px">Cuenta Cheques</td>
                   <td width="100px">Banco</td>
                  <td width="100px">Plaza</td>
                  <td width="150px">Cuenta Clabe</td>
                  <td width="150px">Titular</td>
                  <td width="100px">SubCuenta</td>
                  <td width="100px">Tipo</td>
                   <td width="100px">Saldo</td>
                </tr>
              </table>
              <div style="height:230px; overflow:auto; position:relative; vertical-align:top;">
                <table id="tablaCuentas" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaCuentasData" keys="fcbaClabeCba"  fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda"/>
              </div>
      </td>
    </tr>
    <tr>
            <td colspan="7" align="center" valign="middle">
              <input type="text" name="paramorder" id="paramorder" size="1" value="s" style="visibility:hidden"/>
            </td>
          </tr>
  </table>
</FORM>
