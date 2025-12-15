<form name="frmDatos" id="frmDatos" onsubmit="">
  <input type="hidden" name="paramOrder" id="paramOrder" value="S"/>
  <table width="100%" style="height:auto;">
    <tr>
      <td align="center" class="titulo">Clasificaci&oacute;n PLD</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>
        <table align="center" class="texto" width="100%">
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="10%">Fecha Inicio</td>
            <td width="15%"><input type="text" name="paramFechaInicio" id="paramFechaInicio" tipo="Date" size="10" maxlength="10" /></td>
            <td width="10%">Fecha Fin</td>
            <td width="15%"><input type="text" name="paramFechaFin" id="paramFechaFin" tipo="Date" size="10" maxlength="10" /></td>
            <td width="10%">&nbsp;</td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>Folio</td>
            <td><input type="text" name="paramFolio" id="paramFolio" tipo="Num" size="10" maxlength="10" /></td>
            <td>Cliente</td>
            <td><input type="text" name="paramCliente" id="paramCliente" tipo="Num" size="10" maxlength="10" /></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>Cr&eacute;dito</td>
            <td><input type="text" name="paramCredito"  id="paramCredito" tipo="AlphaNumeric" size="15" maxlength="20"/></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td><input type="button" value="Buscar" name="cmdBuscar" id="cmdBuscar" class="boton" ref="qryVintaClasificacionPagos" fun="loadTableElement" tabla="tblReg" onclick="consultarCPLD(this, frmDatos, true, 'paramOrder');"/></td>
            <td>&nbsp;</td>
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
                  <td width="80px" nowrap>Fecha de Operaci&oacute;n</td>
                  <td width="200px" nowrap>Cliente</td>
                  <td width="130px" nowrap>Nivel de Riesgo</td>
                  <td width="130px" nowrap>Moneda</td>
                  <td width="100px" nowrap>Importe</td>
                  <td width="150px" nowrap>Clasificaci&oacute;n</td>
                  <td width="100px" nowrap>Estatus</td>
                  <td width="130px" nowrap>Reportado CNBV</td>
                </tr>
              </table>
              <div style="height:100px; overflow:auto; position:relative; vertical-align:top;">
                <table cellpadding="0" cellspacing="0" width="100%" class="texto" id="tblReg" dataInfo="arrTblDat" keys="vclasificacion,idPago,idTipoPago,iperiod,idProducto,idCredito,idCliente,vcomentarios,vcomentariosOc,ireporta" fun="clickTabla" radioWidth="23px" NoRecordsMsg="No existen Registros para estos criterios de b&uacute;squeda">
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
              <div id="wrapper" style="overflow:hidden;"><textarea name="txtComentariosEjecutivo" id="txtComentariosEjecutivo" style="width:350px; height:80px;" class="inputLocked" disabled="disabled"></textarea></div>
            </td>
            <td width="20%" align="left"><input type="checkbox" name="chkReporta" id="chkReporta" class="check"/>&nbsp;<label for="chkReporta">Reporta CNBV</label></td>
            <td width="10%">&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="10%">Comentarios Oficial de Cumplimiento</td>
            <td width="40%" colspan="2">
              <div id="wrapper" style="overflow:hidden;"><textarea name="txtComentarios" id="txtComentarios" style="width:350px; height:80px"></textarea></div>
            </td>
            <td width="20%" align="right"><input type="button" value="Aceptar" name="cmdAutorizar" class="boton" onclick="operacionClasificacionPago();"/></td>
            <td width="10%"><input type="button" value="Limpiar" name="cmdLimpiar" class="boton_x" onclick="cargaPrincipalClasificacionPagos();"/></td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
        </table>
      </td>
    </tr>
  </table>
</form>