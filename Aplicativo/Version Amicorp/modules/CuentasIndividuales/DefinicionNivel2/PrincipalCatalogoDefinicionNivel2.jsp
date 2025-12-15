<FORM name="frmDatos" id="frmDatos">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo"><div id="dvNivel">Titulo</div></td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto">
          <tr>
            <td width="15%">&nbsp;</td>
            <td width="5%" nowrap>
              <input type="text" name="paramFideicomiso" id="paramFideicomiso" size="10" maxlength="10" tipo="Num" value="<%=session.getAttribute("fideicomisoCtasInd")!=null?session.getAttribute("fideicomisoCtasInd").toString():"0"%>"/>
            </td>
            <td colspan="5" width="60%">
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomisoCtasIndiv" param="divNombreFideicomisoParam" next="divReedireccion">&nbsp;</div>
            </td>
            <td nowrap width="15%" colspan="4">
              <div id="divReedireccion" class="textoNegrita" ref ="refer" fun="reedireccionar();" next="datLongitudMaxima">&nbsp;</div>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td width="5%" nowrap><div id="dvNivel1">&nbsp;</div></td>
            <td colspan="5">
              <select id="paramParentNivel" name="paramParentNivel" ref="conRegNiv" fun="loadComboElementDo" keyValue="datClave" theValue="datDato" param="cmbNivel1Param" next="formsLoaded" required/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td width="5%" nowrap>Clave</td>
            <td colspan="5">
              <input type="text" name="paramClave" id="paramClave" size="10" maxlength="30" tipo="AlphaNumeric"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td width="15%">&nbsp;</td>
            <td width="5%" nowrap>Nombre</td>
            <td colspan="5">
              <input type="text" name="paramNombre" id="paramNombre" size="60" maxlength="100" tipo="AlphaNumeric"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="8" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
              <input type="text" name="paramNivel" id="paramNivel" size="2" value="2" style="visibility:hidden"/>
              <input type="text" name="datLongitudMaxima" id="datLongitudMaxima" size="1" style="visibility:hidden" ref="conLonMaxLonNivFid" fun="loadTxtElementX" theValue="longitudMaxima" param="divNombreFideicomisoParam" next="cargaLongitudNiveles"/>
            </td>
          </tr>
          <tr>
            <td align="center" colspan="8">&nbsp;
              <input type="button" name="cmdAceptar" id="cmdAceptar" value="Aceptar" class="boton" ref="conPriCatNiv" fun="loadTableElement" tabla="tblRegPri" onclick="if(fvCat.checkForm())consultar(this,GI('frmDatos'),false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" name="cmdLimpiar" id="cmdLimpiar" value="Limpiar" class="boton" onclick="limpiar(frmDatos);"/>
            </td>
          </tr>
          <tr>
            <td align="center" colspan="8">&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="8">
              <input type="button" value="   Alta   " name="cmdAlta" class="boton" onclick="cargaMantenimientoCatalogoDefinicionNivel2(1)"/>
              <input type="button" value="Modificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoCatalogoDefinicionNivel2(2)"/>
              <input type="button" value="   Baja   " name="cmdBaja" class="boton" onclick="cargaMantenimientoCatalogoDefinicionNivel2(3);"/>
              <input type="button" value="Consultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoCatalogoDefinicionNivel2(4)"/>
              <input type="BUTTON" value="Regresar" name="cmdRegresar" id="cmdRegresar" class="boton_x" onclick="regresarCtasIndiv();"/>
      
            </td>
          </tr>
          <tr>
            <td align="center" colspan="8" valign="middle">&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="8">
              <table cellspacing="0" cellpadding="0" border="0" class="texto" align="center">
                <tr align="left" class="cabeceras">
                  <td align="center" width="23">&nbsp;</td>
                  <td  width="300">Clave</td>
                  <td  width="300">Nombre</td>
                  <td  width="100">Status</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;width:723;">
                <table id="tblRegPri" border="0" cellspacing="0" cellpadding="0" dataInfo="tblRegDat" keys="datContrato,datClave" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
