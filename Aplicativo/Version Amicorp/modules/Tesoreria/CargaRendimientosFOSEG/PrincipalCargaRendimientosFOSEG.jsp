<FORM name="frmDatosCargaRendimientos" id="frmDatosCargaRendimientos">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Carga de Rendimientos por Contrato de Inversi&oacute;n</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <table width="90%" align="center" class="texto">
          <tr>
            <td width="30%">&nbsp;</td>
            <td colspan="2" nowrap width="20%">Fideicomiso</td>
            <td width="25%">
              <select size="1" name="paramFideicomiso" id="paramFideicomiso" ref="conNumFidNomFidFOSEG" fun="loadComboElement" keyValue="ctoNumContrato" theValue="ctoNomContrato" next="formsLoaded"/>
            </td>
            <td width="25%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td colspan="2" nowrap width="20%">Contrato Inversi&oacute;n</td>
            <td width="25%">
              <input type="text" name="paramContratoInversion" id="paramContratoInversion" size="10" maxlength="10" tipo="Num"/>
            </td>
            <td width="25%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td colspan="2" nowrap width="20%">Ejercicio</td>
            <td width="25%">
              <input type="text" name="paramEjercicio" id="paramEjercicio" size="4" maxlength="4" tipo="Num"/>
            </td>
            <td width="25%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="5" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td align="center" colspan="5">&nbsp;
              <input type="button" name="cmdAceptar" id="cmdAceptar" value="Aceptar" class="boton" ref="conPriCarRenFOSEG" fun="loadTableElement" tabla="tblRegPriCarRenFOSEG" onclick="consultar(this,frmDatosCargaRendimientos,false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" name="cmdLimpiar" id="cmdLimpiar" value="Limpiar" class="boton" onclick="limpiar(frmDatosCargaRendimientos);"/>
            </td>
          </tr>
          <tr>
            <td colspan="5">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="5" align="center">
              <input type="button" value="   Alta   " name="cmdAlta" class="boton" onclick="cargaMantenimientoCargaRendimientos(1)"/>
              <input type="button" value="Modificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoCargaRendimientos(2)"/>
              <input type="button" value="   Baja   " name="cmdBaja" class="boton" onclick="cargaMantenimientoCargaRendimientos(3);"/>
              <input type="button" value="Consultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoCargaRendimientos(4)"/>
            </td>
          </tr>
          <tr>
            <td colspan="5">&nbsp;</td>
          </tr>
          <tr align="center">
            <td width="50%" colspan="5">
              <table cellspacing="0" cellpadding="0" border="0" class="texto">
                <tr align="left" class="cabeceras">
                  <td width="23" nowrap>&nbsp;</td>
                  <td width="79" nowrap>Fideicomiso</td>
                  <td width="147" nowrap>Contrato de Inversi&oacute;n</td>
                  <td width="73" nowrap>Ejercicio</td>
                  <td width="170" nowrap>Importe de Rendimiento</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;width:83%">
                <table id="tblRegPriCarRenFOSEG" border="0" cellspacing="0" cellpadding="0" dataInfo="tblRegPriCarRenFOSEGDat" keys="renNumFid,renNumContrato,renEjercicio" fun="clickTabla" radioWidth="25" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
