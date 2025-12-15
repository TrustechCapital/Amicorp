<table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
  <tr>
    <td align="center" height="100%" class="titulo">Definici&oacute;n Niveles de Estructura</td>
  </tr>
  <tr>
    <td height="100%">&nbsp;</td>
  </tr>
  <tr>
    <td height="100%">
      <table width="100%">
        <tr>
          <td align="center" width="25%">&nbsp;</td>
          <td align="center" width="25%">&nbsp;</td>
          <td align="center" width="25%">&nbsp;</td>
        </tr>
        <tr>
         <td colspan="5">
         <table width="100%">
           <tr>
              <td align="center">
                  <input type="text" name="paramFideicomiso" id="paramFideicomiso" size="10" maxlength="10" tipo="Num" value="<%=session.getAttribute("fideicomisoCtasInd")!=null?session.getAttribute("fideicomisoCtasInd").toString():"0"%>" style="visibility:hidden"/>
                  <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomisoCtasIndiv" param="divNombreFideicomisoParam" next="divReedireccion">&nbsp;</div>
                  <div id="divReedireccion" class="textoNegrita" ref ="refer" fun="reedireccionar();">&nbsp;</div>
              </td>
            </tr>
        </table>
        </td>
        </tr>
        <tr>
          <td align="center" width="25%">&nbsp;</td>
          <td align="center" width="25%">
            <input type="button" value="Nivel1" name="cmdNivel1" id="cmdNivel1" class="boton" ref="conNumNivNomNivFid" fun="cargaNiveles" param="objFideicomisoParam" onclick="cargaPrincipalCatalogoNivel1(this.value);" style="visibility:hidden"/>
          </td>
          <td align="center" width="25%">&nbsp;</td>
        </tr>
        <tr>
          <td align="center" width="25%">&nbsp;</td>
          <td align="center" width="25%">&nbsp;</td>
          <td align="center" width="25%">&nbsp;</td>
        </tr>
        <tr>
          <td align="center" width="25%">&nbsp;</td>
          <td align="center" width="25%">
            <input type="button" value="Nivel2" name="cmdNivel2" id="cmdNivel2" class="boton" onclick="cargaPrincipalCatalogoNivel2(this.value);" style="visibility:hidden"/>
          </td>
          <td align="center" width="25%">&nbsp;</td>
        </tr>
        <tr>
          <td align="center" width="25%">&nbsp;</td>
          <td align="center" width="25%">&nbsp;</td>
          <td align="center" width="25%">&nbsp;</td>
        </tr>
        <tr>
          <td align="center" width="25%">&nbsp;</td>
          <td align="center" width="25%">
            <input type="button" value="Nivel3" name="cmdNivel3" id="cmdNivel3" class="boton" onclick="cargaPrincipalCatalogoNivel3(this.value);" style="visibility:hidden"/>
          </td>
          <td align="center" width="25%">&nbsp;</td>
        </tr>
      </table>
    </td>
  </tr>
</table>
