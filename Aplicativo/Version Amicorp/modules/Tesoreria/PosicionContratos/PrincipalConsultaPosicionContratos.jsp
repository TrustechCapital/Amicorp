<form name="frmDatosPosicionContratos" id="frmDatosPosicionContratos">

  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      <td height="100%">&nbsp;</td>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Posici&oacute;n de Contratos</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td class="texto" align="left" width="15%">&nbsp;</td>
            <td class="texto" align="left" width="20%">Fideicomiso</td>
            <td class="texto" align="left">
              <input type="text" name="txtNumFideicomiso" id="txtNumFideicomiso" size="10" maxlength="10" tipo="Num" required message="El Fideicomiso es un campo obligatorio" onblur="cargaCmbContratoInversion(this,cmbContratoInversion);"/>
            </td>
            <td width="50%">
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
            </td>
            <td class="subtitulo" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td class="texto" align="left" width="15%">&nbsp;</td>
            <td class="texto" align="left" width="20%">Contrato Inversi&oacute;n</td>
            <td class="texto" align="left" colspan="2">
              <select size="1" name="cmbContratoInversion" id="cmbContratoInversion" ref="conDatConInv" keyValue="cprEntidadFin" theValue="numContratoNomIntermed" fun="loadComboElement" param="cmbContratoInversionParam" next="cmbMercado"/> <!--required message="El Contrato de Inversión es un campo obligatorio"-->
            </td>
            <td class="subtitulo" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td class="texto" align="left" width="15%">&nbsp;</td>
            <td class="texto" align="left" width="20%">Mercado</td>
            <td class="texto" align="left" colspan="2">
              <select name="cmbMercado" id="cmbMercado" ref="cves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" defaultValue="0" param="cmbMercadoParam" next="agregaOpcionReportos"/>
            </td>
            <td class="subtitulo" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" colspan="5">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" valign="middle">&nbsp;
        <input type="BUTTON" name="cmdAceptar" id="cmdAceptar" value="Aceptar" class="boton" ref="conPriConInv" fun="loadTableElement" tabla="tblRegPriPosCon" onclick="if(fvPosicionContratos.checkForm())cargaConsultarPosicionContratos(true);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="BUTTON" name="cmdLimpiar" id="cmdLimpiar" value="Limpiar" class="boton" onclick="limpiar(frmDatosPosicionContratos);"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</form>
