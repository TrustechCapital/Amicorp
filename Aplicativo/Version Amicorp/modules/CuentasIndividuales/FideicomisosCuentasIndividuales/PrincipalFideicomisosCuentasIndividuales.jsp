<FORM name="frmPrincipalFideicomisosCuentasIndividuales" id="frmPrincipalFideicomisosCuentasIndividuales">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Fideicomisos con Cuentas Individuales</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto">
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="5%" align="right">Fideicomiso
            </td>
            <td>
              <input type="text" name="paramFideicomiso" id="paramFideicomiso"  size="10" maxlength="10" tipo="Num" value="<%=session.getAttribute("fideicomisoCtasInd")!=null?session.getAttribute("fideicomisoCtasInd").toString():""%>" onblur="consultaNombreFideicomiso('nomFideicomiso',this);" align="right"/>
            </td>
            <td>
              <!--<div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam" next="divReedireccion">&nbsp;</div>-->
               <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
            </td>
            <td width="15%" colspan="4">
              <div id="divReedireccion" class="textoNegrita" ref ="refer" fun="reedireccionar();">&nbsp;</div>
            </td>
          </tr>
          <tr>
            <td colspan="8" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="8" align="center">
              <input type="BUTTON" id="Aceptar" name="Aceptar" value="Aceptar" class="boton" ref="muestraDatosParamFisos" fun="loadTableElement" tabla="tablaFisosCuentasIndividuales" onclick="consultar(this, GI('frmPrincipalFideicomisosCuentasIndividuales'), false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="BUTTON" value="Limpiar" name="cmdLimpiar" size="20%" class="boton" onclick="limpiar();"/>
            </td>
          </tr>
          <tr>
            <td colspan="8" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="8">
              <input type="button" value="   Alta   " name="cmdAlta" class="boton" onclick="cargaMantenimientoFideicomisosCuentasIndividuales(1);"/>
              <input type="button" value="Modificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoFideicomisosCuentasIndividuales(2);"/>
              <input type="button" value="   Baja   " name="cmdBaja" class="boton" onclick="eliminarRegistro();"/>
              <input type="button" value="Consultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoFideicomisosCuentasIndividuales(3);"/>
            </td>
          </tr>
          <tr>
            <td colspan="8" align="center" valign="middle">&nbsp;
            </td>
          </tr>
          <tr align="center">
            <td colspan="8">
              <table cellspacing="0" cellpadding="0" border="0" class="texto" align="center">
                <tr align="left" class="cabeceras">
                  <td align="center"  width="23">&nbsp;</td>
                  <td  width="79">Contrato</td>
                  <td  width="112">Participaci&oacute;n</td>
                  <td  width="292">Descripci&oacute;n</td>
                  <td  width="100">Status</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top; width:606;">
                <table id="tablaFisosCuentasIndividuales" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaFisosCuentasIndividualesData" keys="ctoNumContrato" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
