<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento a Cat&aacute;logo de &Iacute;ndices</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="13%" nowrap>No. &Iacute;ndice</td>
            <td>
              <input type="text" name="ecinIdIndice" id="ecinIdIndice" size="10" tipo="Num" maxlength="10" required message="El No. Índice es un campo obligatorio"/>
              <input type="text" name="paramNumIndice" id="paramNumIndice" size="10" style="visibility:hidden"/>
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="13%" nowrap>Descripci&oacute;n</td>
            <td>
              <input type="text" name="ecinDescripcion" id="ecinDescripcion" size="50" maxlength="50" required message="La Descripción es un campo obligatorio"/>
            </td>
            <td align="center" width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="13%" nowrap>Forma de Empleo</td>
            <td>
              <input type="text" name="ecinFormaEmp" id="ecinFormaEmp" size="50" maxlength="70" required message="La Forma de Empleo es un campo obligatorio"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="13%" nowrap>Status</td>
            <td>
              <select size="1" name="ecinStCatindic" id="ecinStCatindic" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbStatusParam" next="asignaValues2ObjHTML" required message="El Status es un campo obligatorio"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="4">
              <input type="BUTTON" value="Aceptar " name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionIndice();" style="visibility:hidden"/>
              <input type="BUTTON" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="onButtonClick('EmisionTitulos.Indices.PrincipalCatalogoIndices','')" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="4">
              <hr/>
            </td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="4">
              <input type="BUTTON" value="   Alta  " name="cmdAlta" id="cmdAlta" class="boton" onclick="cargaMantenimientoEstructuraIndices(1);" style="visibility:hidden"/>
              <input type="BUTTON" value="Modificar" name="cmdModificar" id="cmdModificar" class="boton" onclick="cargaMantenimientoEstructuraIndices(2);" style="visibility:hidden"/>
              <input type="BUTTON" value="  Baja   " name="cmdBaja" id="cmdBaja" class="boton" onclick="cargaMantenimientoEstructuraIndices(3);" style="visibility:hidden"/>
              <input type="button" value="Consultar" name="cmdConsultar" id="cmdConsultar" class="boton" onclick="cargaMantenimientoEstructuraIndices(4);" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" class="subtitulo" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" class="subtitulo" align="center">Estructura &Iacute;ndices</td>
          </tr>
          <tr>
            <td colspan="4">
              <table border="0" cellpadding="0" cellspacing="0">
                <tr class="cabeceras">
                  <td width="23" nowrap>&nbsp;</td>
                  <td class="cabeceras" width="80px">Indice</td>
                  <td class="cabeceras" width="80px">Sec.</td>
                  <td class="cabeceras" width="300px">Descripci&oacute;n</td>
                  <td class="cabeceras" width="300px">Forma de Empleo</td>
                  <td class="cabeceras" width="100px" nowrap>Status</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;width:930px">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblReg" dataInfo="arrTblDat2" keys="eindIdIndice,eindIdSubindice" fun="clickTabla2" radioWidth="23px">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
