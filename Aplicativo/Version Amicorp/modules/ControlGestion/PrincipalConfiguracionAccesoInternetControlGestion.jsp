<FORM name="frmPrincipalConfiguracionAccesoInternetControlGestion" id="frmPrincipalConfiguracionAccesoInternetControlGestion" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Cierre/Apertura Linea de Internet</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table cellspacing="2" cellpadding="3" border="0" width="100%" class="texto">
          <tr>
            <td colspan="4" class="subtitulo" align="center">Acceso Habilitado</td>
          </tr>
          <tr>
            <td align="center" width="30%">&nbsp;
              </td>
              <td align="center" width="10%">
                <input type="radio" name="rdAcceso" value="rdSi" id="rdSi" class="radio" onclick="verificaCambio();"/>Si
              </td>
            <td align="center" width="10%">
              <input type="radio" name="rdAcceso" value="rdNo" id="rdNo" class="radio" onclick="verificaCambio();"/>No
            </td>
            <td align="center" width="30%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="    Aceptar     " name="cmdAceptar" class="boton" onclick="realizaCambioParamValor();"/>
        <input type="BUTTON" value="   Modificar   " name="cmdModificar" class="boton" onclick="habilitaRadios()"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>
