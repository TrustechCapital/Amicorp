<form name="frmDatos" id="frmDatos" onsubmit="">
  <table width="100%" style="height:auto;">
    <tr>
      <td align="center" class="titulo">Autorizar Operaciones</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>
        <table align="center" class="texto" width="100%">
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="10%">Fecha</td>
            <td width="20%"><input type="text" name="paramFecha" id="paramFecha" tipo="Date" size="10" maxlength="10" /></td>
            <td width="10%"><input type="button" value="Buscar" name="cmdBuscar" class="boton" ref="qryVintaPagosPendientes" fun="loadTableElement" tabla="tblReg" onclick="consultarAP(this, frmDatos, true);"/></td>
            <td width="30%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>
        <table align="center" class="texto" width="100%">
          <tr>
            <td width="30%">&nbsp;</td>
            <td>
              <table cellpadding="0" cellspacing="0">
                <tr class="cabeceras" align="center">
                  <td align="center" width="25px" nowrap>&nbsp;</td>
                  <td width="50px" nowrap>Folio</td>
                  <td width="110px" nowrap>Fecha de Operaci&oacute;n</td>
                  <td width="120px" nowrap>Cr&eacute;dito</td>
                  <td width="130px" nowrap>Tipo de Operaci&oacute;n</td>
                  <td width="130px" nowrap>Moneda</td>
                  <td width="130px" nowrap>Importe</td>
                  <td width="130px" nowrap>Estatus</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;">
                <table cellpadding="0" cellspacing="0" width="100%" class="texto" id="tblReg" dataInfo="arrTblDat" keys="idPago,idTipoPago,iperiod,idProducto,idCredito,idCliente" fun="clickTabla" radioWidth="23px" NoRecordsMsg="No existen Registros para estos criterios de b&uacute;squeda">
                </table>
              </div>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr id="trSeccion" style="visibility:hidden;">
      <td>
        <table align="center" class="texto">
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="10%">Comentarios Ejecutivo</td>
            <td width="40%" colspan="2">
              <div id="wrapper" style="overflow:hidden;"><textarea name="txtComentarios" id="txtComentarios" style="width:350px; height:80px"></textarea></div>
            </td>
            <td width="20%" align="right"><input type="button" value="Autorizar" name="cmdAutorizar" class="boton" onclick="operacionPago(2);"/></td>
            <td width="10%"><input type="button" value="Rechazar" name="cmdRechazar" class="boton_x" onclick="operacionPago(3);"/></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
        </table>
      </td>
    </tr>
  </table>
</form>