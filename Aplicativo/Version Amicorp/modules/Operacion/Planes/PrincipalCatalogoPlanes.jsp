<FORM name="frmDatos" id="frmDatos">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      <td height="100%">&nbsp;</td>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Cat&aacute;logo de Planes de Operaci&oacute;n</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto">
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="5%" nowrap>Nombre</td>
            <td colspan="5">
              <input type="text" name="paramNombre" id="paramNombre" size="36" maxlength="36"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="5%" nowrap>Periodicidad</td>
            <td colspan="5">
              <select id="paramPeriodicidad" name="paramPeriodicidad" ref="cves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="cmbPeriodicidadParam" next="formsLoaded"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="5%" nowrap>Fecha Inicio Operacion</td>
            <td colspan="5">
              <input type="text" name="Fecha" id="Fecha" size="10" maxlength="10"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="8" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td align="center" colspan="8">&nbsp;
              <input type="button" name="cmdAceptar" id="cmdAceptar" value="Aceptar" class="boton" ref="conPriCatPla" fun="loadTableElement" tabla="tblRegPla" onclick="consultar(this,frmDatos,false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" name="cmdLimpiar" id="cmdLimpiar" value="Limpiar" class="boton" onclick="limpiar(frmDatos);"/>
            </td>
          </tr>
          <tr>
            <td colspan="8" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="8">
              <table cellspacing="0" cellpadding="0" border="0" class="texto">
                <tr align="left" class="cabeceras">
                  <td width="23" align="center" nowrap>&nbsp;</td>
                  <td width="200" nowrap>Plan</td>
                  <td width="500" nowrap>Descripcion</td>
                  <td width="100" nowrap>Periodicidad</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top; width:823px">
                <table id="tblRegPla" border="0" cellspacing="0" cellpadding="0" dataInfo="tblRegPlaDat" keys="plaCveFaseProd" fun="clickTabla" radioWidth="23">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="button" value="   Alta   " name="cmdAlta" class="boton" onclick="cargaMantenimientoCatalogoPlanes(1)"/>
        <input type="button" value="Modificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoCatalogoPlanes(2)"/>
        <input type="button" value="   Baja   " name="cmdBaja" class="boton" onclick="cargaMantenimientoCatalogoPlanes(3);"/>
        <input type="button" value="Consultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoCatalogoPlanes(4)"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>
