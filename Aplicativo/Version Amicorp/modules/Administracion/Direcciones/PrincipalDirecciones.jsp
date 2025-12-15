<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Direcciones Fideicomitentes</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto">
          <tr>
            <td width="12%">&nbsp;</td>
            <td nowrap width="15%">No. Fideicomiso</td>
            <td>
              <input type="text" name="paramFideicomiso" id="paramFideicomiso" size="10" maxlength="10"/>
            </td>
            <td colspan="4">
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="12%">&nbsp;</td>
            <td nowrap width="15%">No. Fideicomitente</td>
            <td colspan="5">
              <input type="text" name="paramFideicom" id="paramFideicom" size="10" maxlength="10"/></td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="12%">&nbsp;</td>
            <td nowrap width="15%">Raz&oacute;n Social</td>
            <td colspan="5">
              <input type="text" name="fidNomFideicom" id="fidNomFideicom" size="50" maxlength="50"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="8">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="8" align="center">&nbsp;
            <input type="BUTTON" value="Regresar" id="cmdRegresar" name="cmdRegresar" class="boton" ref="conPriDirFid" fun="loadTableElement" tabla="tblReg" onclick="cargaMantenimientoFideicomitentes(operacion);"/></td>
          </tr>
          <tr>
            <td align="center" colspan="8">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
              <input type="text" name="paramTipoPersona" id="paramTipoPersona" size="10" style="visibility:hidden" value="FIDEICOMITENTE"/>
            </td>
          </tr>
          <tr>
            <td align="center" colspan="8">
              <input type="BUTTON" value="  Alta   " id="cmdAlta" name="cmdAlta" class="boton" onclick="cargaMantenimientoDirecciones(1)"/>
              <input type="BUTTON" value="Modificar" id="cmdModificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoDirecciones(2)"/>
              <input type="BUTTON" value="  Baja   " id="cmdBaja" name="cmdBaja" class="boton" onclick="cargaMantenimientoDirecciones(3);"/>
              <input type="BUTTON" value="Consultar" id="cmdConsultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoDirecciones(4)"/>
            </td>
          </tr>
          <tr>
            <td colspan="8">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="8" align="center">
              <table cellspacing="0" cellpadding="0" border="0" class="texto">
                <tr class="cabeceras">
                  <td width="23" nowrap>&nbsp;</td>
                  <td width="40" nowrap>No.</td>
                  <td width="300" nowrap>A la Atenci&oacute;n de</td>
                  <td width="300" nowrap>Direcci&oacute;n</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;">
                <table id="tblReg" border="0" cellspacing="0" cellpadding="0" dataInfo="arrTblDat" keys="dirNumContrato,dirCvePersFid,dirNumPersFid,dirNumSecDirecc" fun="clickTabla2" radioWidth="23">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
