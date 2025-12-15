<FORM name="frmMantenimientoAgrupaciones" id="frmMantenimientoAgrupaciones" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento Agrupaciones</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="10%">Id. Agrupacion</td>
            <td>
              <input type="text" name="facoIdAgrupacion" id="facoIdAgrupacion" size="10" maxlength="10" tipo="Num"/>
              <input type="text" name="paramIdAgrupacion" id="paramIdAgrupacion" size="10" maxlength="10" tipo="Num" style="visibility:hidden"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="10%">Nombre</td>
            <td>
              <input type="text" name="facoNombreAgrupacion" id="facoNombreAgrupacion" size="65" maxlength="100" tipo="AlphaNumeric"/>
            </td>
            <td align="right"><div id="dvCuentas" style="visibility:hidden;">
            <table>
                  <tr>
                      <td class="texto">Agrupar Cuentas</td>
                      <td>
                        <input type="RADIO" name="rdAgrupacion" id="cuenta" value="1" class="radio" onclick="activaFuncionalidadDelTipoAgrupacion(this.value)"/>
                      </td>
                </tr>
            </table>
            </div>
          </td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="10%">Nombre Etiqueta(l&oacute;gico)</td>
            <td>
              <input type="text" name="facoEsEtiqueta" id="facoEsEtiqueta" size="65" maxlength="100" tipo="AlphaNumeric"/>
            </td>
            <td align="right"><div id="dvRubros" style="visibility:hidden;">
            <table>
                  <tr>
                      <td class="texto">Agrupar Rubros</td>
                      <td>
                        <input type="RADIO" name="rdAgrupacion" id="rubro" value="0" class="radio" onclick="activaFuncionalidadDelTipoAgrupacion(this.value)"/>
                      </td>
                </tr>
            </table>
           </div>
          </td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td width="10%">Nombre Etiqueta(Impresi&oacute;n)</td>
            <td>
              <input type="text" name="facuNombreImpreso" id="facuNombreImpreso" size="65" maxlength="100" tipo="AlphaNumeric"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="4">
              <input type="BUTTON" value="Aceptar " name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionRubro();" style="visibility:hidden"/>
              <input type="BUTTON" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('Contabilidad.Agrupaciones.PrincipalAgrupaciones','');" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="4">
              <hr/>
            </td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="4">
              <input type="BUTTON" value="   Alta  " name="cmdAlta" id="cmdAlta" class="boton" onclick="operacionesSeleccionadas?cargaAgrupacionesCuentas(1):cargaAgrupaAgrupacion(1);" style="visibility:hidden"/>
              <input type="BUTTON" value="Modificar" name="cmdModificar" id="cmdModificar" class="boton" onclick="operacionesSeleccionadas?cargaAgrupacionesCuentas(2):cargaAgrupaAgrupacion(2);" style="visibility:hidden"/>
              <input type="BUTTON" value="  Baja   " name="cmdBaja" id="cmdBaja" class="boton" onclick="operacionesSeleccionadas?cargaAgrupacionesCuentas(3):cargaAgrupaAgrupacion(3);" style="visibility:hidden"/>
              <input type="button" value="Consultar" name="cmdConsultar" id="cmdConsultar" class="boton" onclick="operacionesSeleccionadas?cargaAgrupacionesCuentas(4):cargaAgrupaAgrupacion(4);" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" class="subtitulo" align="center"><div id="dvTitulo">Asignaciones</div></td>
          </tr>
          <tr>
            <td colspan="4" align="center"><div id="dvTablaCuentas" disabled="disabled">
              <table border="0" cellpadding="0" cellspacing="0" width="500px">
                <tr class="cabeceras">
                  <td width="23" nowrap>&nbsp;</td>
                  <td width="35" nowrap>Id. Agrupacion</td>
                  <td width="116" nowrap>Cuenta de Mayor</td>
                  <td width="34" nowrap>Scta</td>
                  <td width="39" nowrap>Sscta</td>
                  <td width="47" nowrap>Ssscta</td>
                  <td width="55" nowrap>Sssscta</td>
                  <td width="62" nowrap>Ssssscta</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;">
                <table  border="0" cellpadding="0" cellspacing="0" class="texto" id="tblCuentas" dataInfo="arrTblCuenDat" keys="facoIdAgrupacion,fcueMayor,fcueSubCta,fcueSsCta,fcueSssCta,fcueSsssCta,fcueSssssCta" fun="clickTabla2" radioWidth="26px">
                </table>
              </div>
             </div>
            </td>
          </tr>
          <tr><td colspan="3">&nbsp;</td></tr>
          </tr>
          <tr>
            <td colspan="4" align="center"><div id="dvTablaRubros" disabled="disabled">
              <table border="0" cellpadding="0" cellspacing="0">
                <tr class="cabeceras">
                  <td width="23" nowrap>&nbsp;</td>
                  <td width="116" nowrap>Rubro</td>
                  <td width="116" nowrap>Agrupacion Asignada</td>
                  <td width="100" nowrap>Operador</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRubros" dataInfo="arrTblRubDat" keys="facoIdAgrupacion,froaAgrupaHija" fun="clickTabla4" radioWidth="26px">
                </table>
              </div>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
