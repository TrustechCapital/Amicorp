<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table width="100%" style="height:auto;">
    <tr>
      <td align="center" class="titulo">Bit&aacute;cora</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>
        <table align="center" class="texto">
          <tr valign="middle">
            <td width="23%">&nbsp;</td>
            <td width="29%">N&uacute;mero del ejercicio</td>
            <td width="26%">
              <input type="text" name="paramNumEjercicio" id="paramNumEjercicio" tipo="NUM" size="10" maxlength="10"/>
            </td>
            <td width="23%">&nbsp;</td>
          </tr>
          <tr>
            <td width="23%">&nbsp;</td>
            <td width="29%">Periodo</td>
            <td width="26%">
              <input type="text" name="paramPeriodo"  id="paramPeriodo" tipo="Date" size="10" maxlength="10" />
            </td>
            <td width="23%">&nbsp;</td>
          </tr>
          <tr>
            <td width="23%">&nbsp;</td>
            <td width="29%">Tipo de Declaracion</td>
            <td width="26%">
              <input type="text" name="paramTipoDeclaracion"  id="paramTipoDeclaracion" size="30" maxlength="50" onblur="convertirMayusculas(this);"/>
            </td>
            <td width="23%">&nbsp;</td>
          </tr>
          <tr>
            <td width="23%">&nbsp;</td>
            <td width="29%">Fecha de la Declaracion</td>
            <td width="26%">
              <input type="text" name="paramFechaDeclaracion" id="paramFechaDeclaracion" tipo="Date" size="10" maxlength="10"/>
            </td>
            <td width="23%">&nbsp;</td>
          </tr>
          <tr>
            <td width="23%">&nbsp;</td>
            <td width="29%">Folio</td>
            <td width="26%">
              <input type="text" name="paramFolio"  id="paramFolio" tipo="NUM" size="10" maxlength="10"/>
            </td>
            <td width="23%">&nbsp;</td>
          </tr>
          <tr>
            <td width="23%">&nbsp;</td>
            <td width="29%">&nbsp;</td>
            <td width="26%">.
            </td>
            <td width="23%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="button" value="Aceptar" name="cmdAceptar" class="boton" ref="conBitacora" fun="loadTableElement" tabla="tblReg" onclick="consultar(this, frmDatos, false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" value="Limpiar" name="cmdLimpiar" class="boton" onclick="limpiar(frmDatos);"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="BUTTON" value="   Alta  " name="cmdAlta" class="boton" onclick="cargaMantenimientoBitacora(1);"/>
              <input type="BUTTON" value="Modificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoBitacora(2);"/>
              <input type="BUTTON" value="   Baja  " name="cmdBaja" class="boton" onclick="eliminarRegistro();"/>
              <input type="BUTTON" value="Consultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoBitacora(4);"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="4">
              <table border="0" cellpadding="0" cellspacing="0">
                <tr class="cabeceras" align="left">
                  <td align="center" width="23" nowrap>&nbsp;</td>
                  <td width="150" nowrap>Ejercicio</td>
                  <td width="150" nowrap>Periodo</td>
                  <td width="150" nowrap>Tipo de Declaracion</td>
                  <td width="150" nowrap>Fecha de la Declaracion</td>
                  <td width="150" nowrap>Folio</td>
                </tr>
              </table>
              <div style="height:300px; overflow:auto; position:relative; vertical-align:top;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblReg" dataInfo="arrTblDat" keys="fbdeEjercicioDeclara,fbdePeriodoDeclara,fbdeTipoDeclara" fun="clickTabla" radioWidth="23px" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
