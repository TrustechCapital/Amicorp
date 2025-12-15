<FORM name="frmDatos" id="frmDatos">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Cat&aacute;logo de Datos de Operaci&oacute;n</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto">
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="5%" nowrap>
              <input type="text" name="paramFideicomiso" id="paramFideicomiso" size="10" maxlength="10" tipo="Num" value="<%=session.getAttribute("fideicomisoCtasInd")!=null?session.getAttribute("fideicomisoCtasInd").toString():"0"%>"/>
            </td>
            <td colspan="5" width="60%">
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomisoCtasIndiv" param="divNombreFideicomisoParam" next="divReedireccion">&nbsp;</div>
            </td>
            <td nowrap width="15%" colspan="4">
              <div id="divReedireccion" class="textoNegrita" ref ="refer" fun="reedireccionar();" next="paramFechaInicio">&nbsp;</div>
            </td>

            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="5%" nowrap>Fecha Inicio</td>
            <td colspan="5">
              <input type="text" name="paramFechaInicio" id="paramFechaInicio" size="10" maxlength="10" tipo="Fecha" ref="conFecConFirstDay" fun="loadTxtElementX" theValue="fecha" next="paramFechaFin" required message="La Fecha Inicio es un campo obligatorio"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="5%" nowrap>Fecha Fin</td>
            <td colspan="5">
              <input type="text" name="paramFechaFin" id="paramFechaFin" size="10" maxlength="10" tipo="Fecha" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="formsLoaded" required message="La Fecha Fin es un campo obligatorio"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="8" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" colspan="8">&nbsp;
              <input type="button" name="cmdAceptar" id="cmdAceptar" value="Aceptar" class="boton" ref="conPriCatDatOpe" fun="loadTableElement" tabla="tblRegPri" onclick="if(fvCat.checkForm())consultarDo(this,GI('frmDatos'),false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" name="cmdLimpiar" id="cmdLimpiar" value="Limpiar" class="boton" onclick="onButtonClickPestania('CuentasIndividuales.DatosOperacion.PrincipalCatalogoDatosOperacion','');"/>
            </td>
          </tr>
          <tr>
            <td align="center" colspan="8">&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="8">
              <input type="button" value="   Alta   " name="cmdAlta" class="boton" onclick="cargaMantenimientoCatalogoDatosOperacion(1)"/>
              <input type="button" value="Modificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoCatalogoDatosOperacion(2)"/>
              <input type="button" value="   Baja   " name="cmdBaja" class="boton" onclick="cargaMantenimientoCatalogoDatosOperacion(3);"/>
              <input type="button" value="Consultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoCatalogoDatosOperacion(4)"/>
            </td>
          </tr>
          <tr>
            <td align="center" colspan="8">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="8" align="center">
              <table cellspacing="0" cellpadding="0" border="0" class="texto" width="323px">
                <tr align="left" class="cabeceras">
                  <td align="center" nowrap width="23">&nbsp;</td>
                  <td nowrap width="100">Fecha</td>
                  <td nowrap width="100">Tasa</td>
                  <td nowrap width="100">ISR</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;width:323px">
                <table id="tblRegPri" border="0" cellspacing="0" cellpadding="0" dataInfo="tblRegDat" keys="datEntClave,datFecha" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
