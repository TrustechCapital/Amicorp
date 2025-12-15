<!-- PrincipalCancelacionOperaciones.jsp -->
<form name="frmDatosMovimientos" id="frmDatosMovimientos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Cancelaci&oacute;n de Operaciones Honorarios</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table class="texto" width="100%">
          <tr>
            <td width="30%">&nbsp;</td>
            <td>Fideicomiso</td>
            <td>Folio</td>
            <td>M&oacute;dulo</td>
            <td>Transacci&oacute;n</td>
            <td>Hora</td>
            <td>D&iacute;a</td>
            <td>Mes</td>
            <td>A&ntilde;o</td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td>
              <input type="text" name="paramFideicomiso" id="paramFideicomiso" size="10" maxlength="10" tipo="Num"/>
            </td>
            <td>
              <input type="text" name="paramFolio" id="paramFolio" size="10" maxlength="10" tipo="Num"/>
            </td>
            <td>
              <input type="text" name="paramModulo" id="paramModulo" size="2" maxlength="2" tipo="Num"/>
            </td>
            <td>
              <input type="text" name="paramTransaccion" id="paramTransaccion" size="5" maxlength="5" tipo="Num"/>
            </td>
            <td>
              <input type="text" name="paramHora" id="paramHora" size="2" maxlength="2" tipo="Num"/>
            </td>
            <td>
              <input type="text" name="paramDia" id="paramDia" size="2" maxlength="2" tipo="Num"/>
            </td>
            <td>
              <input type="text" name="paramMes" id="paramMes" size="2" maxlength="2" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="consultaMesAbierto" tipo="Num" onblur="validaMesActual(this)" />              
            </td>
            <td>
              <input type="text" name="paramAno" id="paramAno" size="4" maxlength="4" ref="conStaMesCon" fun="validaMesAbierto" param="objAnoMesParam" tipo="Num"/>
            </td>
            <td width="30%">&nbsp;
            </td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td align="center" colspan="8" class="textoNegrita">
              <div id="divMesAbierto"/>
            </td>
            <td align="center">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" colspan="10">&nbsp;
              <input type="button" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" ref="cancelHon" fun="loadTableElement" tabla="tblRegPriMov" onclick="if(fvCat.checkForm())consultarSaveParameters(this, frmDatosMovimientos, false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" value="Limpiar" name="cmdLimpiar" id="cmdLimpiar" class="boton" onclick="onButtonClick('Honorarios.CancelacionOperacionesHonorarios.PrincipalCancelacionOperacionesHon','')"/>
            </td>
          </tr>
          <tr>
            <td colspan="10" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
              <input type="text" name="paramStatusCancelado" id="paramStatusCancelado" size="10" maxlength="10" value="CANCELADO" style="visibility:hidden"/>
            </td>
          </tr>
          <tr align="center">
            <td colspan="10">
              <table cellspacing="0" cellpadding="0" border="0">
                <tr class="cabeceras">
                  <td nowrap width="23">&nbsp;</td>
                  <td width="80" nowrap>Fecha</td>
                  <td width="50" nowrap>Hora</td>
                  <td width="86" nowrap>Fideicomiso</td>
                  <td width="70" nowrap>Folio</td>
                  <td width="50" nowrap>Trans.</td>
                  <td width="250" nowrap>Descripci&oacute;n</td>
                  <td width="100" nowrap>Importe</td>
                  <td width="100" nowrap>Status</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top; width:840px">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegPriMov" dataInfo="arrTblMovDat" keys="movAnoMovto,movMesMovto,movDiaMovto,movNumContrato,movSubContrato,movFolioOpera,movNumModulo,movNumTransac,movCveStMovto" fun="clickTabla" radioWidth="23px"  NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>              
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
