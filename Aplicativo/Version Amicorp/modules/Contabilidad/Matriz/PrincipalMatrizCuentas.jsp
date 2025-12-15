<form name="frmDatosMatriz" id="frmDatosMatriz" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Cat&aacute;logo de Matriz de Cuentas</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" class="texto" align="center">
          <tr>
            <td width="30%">&nbsp;</td>
            <td>Cuenta</td>
            <td>Scta</td>
            <td>Sscta</td>
            <td>Ssscta</td>
            <td>Sssscta</td>
            <td>Ssssscta</td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td>
              <input type="text" name="paramNumCta" id="paramNumCta" size="4" maxlength="4" tipo="Num"/>
            </td>
            <td>
              <input type="text" name="paramNumScta" id="paramNumScta" size="4" maxlength="2" tipo="Num"/>
            </td>
            <td>
              <input type="text" name="paramNumSscta" id="paramNumSscta" size="4" tipo="Num"/>
            </td>
            <td>
              <input type="text" name="paramNumSsscta" id="paramNumSsscta" size="4" maxlength="2" tipo="Num"/>
            </td>
            <td>
              <input type="text" name="paramNumSsssscta" id="paramNumSssscta" size="4" maxlength="4" tipo="Num"/>
            </td>
            <td>
              <input type="text" name="paramNumSsssscta" id="paramNumSsssscta" size="4" tipo="Num"/>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="8" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="8" align="center">&nbsp;
              <input type="button" value="Aceptar" name="cmdAceptar" class="boton" ref="conPriMatCue" fun="loadTableElement" tabla="tblRegPriMatCue" onclick="consultarCount(this, frmDatosMatriz, false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" value="Limpiar" name="cmdLimpiar" class="boton" onclick="limpiar(frmDatosMatriz);"/>
            </td>
          </tr>
          <tr>
            <td colspan="8">&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="8">
              <input type="button" value="   Alta  " name="cmdAlta" class="boton" onclick="cargaMantenimientoMatrizCuentas(1);"/>
              <input type="button" value="Modificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoMatrizCuentas(2);"/>
              <input type="button" value="   Baja  " name="cmdBaja" class="boton" onclick="cargaMantenimientoMatrizCuentas(3);"/>
              <input type="button" value="Consultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoMatrizCuentas(4);"/>
            </td>
          </tr>
          <tr>
            <td colspan="8">&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="8">
              <table border="0" cellpadding="0" cellspacing="0">
                <tr class="cabeceras">
                  <td width="23" nowrap>&nbsp;</td>
                  <td width="50" nowrap>Cuenta</td>
                  <td width="36" nowrap>Scta</td>
                  <td width="40" nowrap>Sscta</td>
                  <td width="46" nowrap>Ssscta</td>
                  <td width="55" nowrap>Sssscta</td>
                  <td width="65" nowrap>Ssssscta</td>
                  <td width="300" nowrap>Nombre</td>
                  <td width="50" nowrap>Cuenta</td>
                  <td width="36" nowrap>Scta</td>
                  <td width="40" nowrap>Sscta</td>
                  <td width="46" nowrap>Ssscta</td>
                  <td width="55" nowrap>Sssscta</td>
                  <td width="65" nowrap>Ssssscta</td>
                  <td width="100" nowrap>Status</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top;width:1010px" radioWidth="23px">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegPriMatCue" dataInfo="arrTblMatCueDat" keys="ctamTipoNegocio,ctamClasifProd,ctamCtaClien,ctamSctaClien,ctamSsctaClien,ctamSssctaClien,ctamSsssctaClien,ctamSssssctaClien" fun="clickTabla" radioWidth="23px" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
