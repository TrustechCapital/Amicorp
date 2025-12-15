<form name="frmDatos" id="frmDatos" onsubmit="">
  <table width="100%" style="height:auto;">
    <tr>
      <td align="center" class="titulo">F&oacute;rmulas</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table align="center" class="texto">
          <tr valign="middle">
            <td width="40%">&nbsp;</td>
            <td nowrap width="10%">No. de F&oacute;rmula</td>
            <td>
              <select size="1" name="paramNumFormula" id="paramNumFormula" ref="conETCmbFor" fun="loadComboElement" keyValue="efrmIdFormula" theValue="efrmIdFormula" next="paramClasificacion"/>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="40%">&nbsp;</td>
            <td nowrap width="10%">Tipo de F&oacute;rmula</td>
            <td>
              <select size="1" name="paramClasificacion" id="paramClasificacion" ref="conETDatInd" fun="loadComboElement" keyValue="eindIdSubindice" theValue="eindDescripcion" param="cmbLoadParam520" next="paramStatus"/>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="40%">&nbsp;</td>
            <td nowrap width="10%">Nombre</td>
            <td>
              <input type="text" name="paramNomFormula" id="paramNomFormula" size="50" maxlength="100"/>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="40%">&nbsp;</td>
            <td nowrap width="10%">Status</td>
            <td>
              <select size="1" name="paramStatus" id="paramStatus" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbStatusParam" next="formsLoaded"/>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">&nbsp;
              <input type="button" value="Aceptar" name="cmdAceptar" class="boton" ref="conETPriFor" fun="loadTableElement" tabla="tblReg" onclick="consultar(this, frmDatos, false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
              <input type="BUTTON" value="   Alta  " name="cmdAlta" class="boton" onclick="cargaMantenimientoFormulas(1);"/>
              <input type="BUTTON" value="Modificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoFormulas(2);"/>
              <input type="BUTTON" value="   Baja  " name="cmdBaja" class="boton" onclick="cargaMantenimientoFormulas(3);"/>
              <input type="BUTTON" value="Consultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoFormulas(4);"/>
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
                  <td width="90" nowrap>No. F&oacute;rmula</td>
                  <td width="150" nowrap>Clasificaci&oacute;n</td>
                  <td width="200" nowrap>Nombre</td>
                  <td width="200" nowrap>Descripci&oacute;n</td>
                  <td width="100" nowrap>Status</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblReg" dataInfo="arrTblDat" keys="efrmIdFormula,efrmIdClasific" fun="clickTabla" radioWidth="23px">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
