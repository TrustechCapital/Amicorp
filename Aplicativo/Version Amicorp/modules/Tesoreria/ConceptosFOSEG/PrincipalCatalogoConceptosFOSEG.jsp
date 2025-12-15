<form name="frmDatosConceptosFOSEG" id="frmDatosConceptosFOSEG">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Cat&aacute;logo de Conceptos FOSEG</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <table width="90%" align="center" class="texto">
          <tr>
            <td width="30%">&nbsp;</td>
            <td align="center">
              <input type="text" name="paramNumEje" id="paramNumEje" size="10" tipo="Num" maxlength="10"/>
            </td>
            <td align="center">
              <input type="text" name="paramNumPrograma" id="paramNumPrograma" size="10" tipo="Num" maxlength="10"/>
            </td>
            <td align="center">
              <input type="text" name="paramNumProyecto" id="paramNumProyecto" size="10" tipo="Num" maxlength="10"/>
            </td>
            <td align="center">
              <input type="text" name="paramNumAccion" id="paramNumAccion" size="10" tipo="Num" maxlength="10"/>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td align="center" class="textoRP" valign="top">Eje</td>
            <td align="center" class="textoRP" valign="top">Programa</td>
            <td align="center" class="textoRP" valign="top">Proyecto</td>
            <td align="center" class="textoRP" valign="top">Acci&oacute;n</td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td>Nombre</td>
            <td colspan="3">
              <input type="text" name="paramNombre" id="paramNombre" size="50" maxlength="250" tipo="AlphaNumeric"/>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="16%" colspan="6" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td align="center" colspan="6">&nbsp;
              <input type="button" name="cmdAceptar" id="cmdAceptar" value="Aceptar" class="boton" ref="conPriCatConFOSEG" fun="loadTableElement" tabla="tblRegPriConFOSEG" onclick="consultar(this,frmDatosConceptosFOSEG,false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" name="cmdLimpiar" id="cmdLimpiar" value="Limpiar" class="boton" onclick="limpiar(frmDatosConceptosFOSEG);"/>
            </td>
          </tr>
          <tr>
            <td align="center" colspan="6">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" colspan="6">
              <input type="button" value="   Alta   " name="cmdAlta" class="boton" onclick="cargaMantenimientoCatalogoConceptosFOSEG(1)"/>
              <input type="button" value="Modificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoCatalogoConceptosFOSEG(2)"/>
              <input type="button" value="   Baja   " name="cmdBaja" class="boton" onclick="cargaMantenimientoCatalogoConceptosFOSEG(3);"/>
              <input type="button" value="Consultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoCatalogoConceptosFOSEG(4)"/>
            </td>
          </tr>
          <tr>
            <td align="center" colspan="6">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="6" align="center">
              <table cellspacing="0" cellpadding="0" border="0" class="texto">
                <tr align="left" class="cabeceras">
                  <td width="23" nowrap>&nbsp;</td>
                  <td width="80" nowrap>Eje</td>
                  <td width="80" nowrap>Programa</td>
                  <td width="80" nowrap>Proyecto</td>
                  <td width="80" nowrap>Acci&oacute;n</td>
                  <td width="500" nowrap>Nombre</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;">
                <table id="tblRegPriConFOSEG" border="0" cellspacing="0" cellpadding="0" dataInfo="tblRegPriCatConFOSEG" keys="cueNumCtam,cueNumScta,cueNumSscta,cueNumSsscta,cueNumSssscta,cueNumSsssscta" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
