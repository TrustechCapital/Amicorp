<form name="frmDatos" id="frmDatos" onsubmit="">
  <table width="100%">
    <tr>
      <td align="center" class="titulo">Mantenimiento a Cat&aacute;logo de Autoridades</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table align="center" class="texto" width="100%">
          <tr valign="middle">
            <td width="30%">&nbsp;</td>
            <td nowrap width="10%">No. Autoridad</td>
            <td>
              <input type="text" name="eautIdAutoridad" id="eautIdAutoridad" size="10" tipo="Num" maxlength="10" required message="El No. Autoridad es un campo obligatorio"/>
              <input type="text" name="paramNumAutoridad" id="paramNumAutoridad" size="10" style="visibility:hidden"/>
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="10%">Nombre Autoridad</td>
            <td>
              <input type="text" name="eautNomAutoridad" id="eautNomAutoridad" size="50" maxlength="100" required message="La Nombre Autoridad es un campo obligatorio"/>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td height="29" class="xl22" width="164" style="height:21.75pt;width:123pt">Nmo. Autoridad</td>
            <td nowrap width="10%">
              <input type="text" name="eautNmoAutoridad" id="eautNmoAutoridad" size="50" maxlength="100" required message="El Nmo. Autoridad es un campo obligatorio"/>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="10%">Direcci&oacute;n</td>
            <td>
              <input type="text" name="eautDirAutoridad" id="eautDirAutoridad" size="75" maxlength="200" required message="La Dirección es un campo obligatorio"/>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="10%">Status</td>
            <td>
              <select size="1" name="eautStAutoridad" id="eautStAutoridad" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbStatusParam" next="asignaValues2ObjHTML" required message="El Status es un campo obligatorio"/>
            </td>
            <td width="30%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%" colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="4">
              <input type="BUTTON" value="Aceptar " name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionAutoridad();" style="visibility:hidden"/>
              <input type="BUTTON" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('EmisionTitulos.Autoridades.PrincipalCatalogoAutoridades','')" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="4">
              <hr/>
            </td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="4">
              <input type="BUTTON" value="   Alta  " name="cmdAlta" id="cmdAlta" class="boton" onclick="cargaMantenimientoCatalogoResponsables(1);" style="visibility:hidden"/>
              <input type="BUTTON" value="Modificar" name="cmdModificar" id="cmdModificar" class="boton" onclick="cargaMantenimientoCatalogoResponsables(2);" style="visibility:hidden"/>
              <input type="BUTTON" value="  Baja   " name="cmdBaja" id="cmdBaja" class="boton" onclick="cargaMantenimientoCatalogoResponsables(3);" style="visibility:hidden"/>
              <input type="button" value="Consultar" name="cmdConsultar" id="cmdConsultar" class="boton" onclick="cargaMantenimientoCatalogoResponsables(4);" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td width="30%" colspan="4" align="center" class="subtitulo">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%" colspan="4" align="center" class="subtitulo">Responsables</td>
          </tr>
          <tr align="center">
            <td colspan="4">
              <table cellspacing="0" cellpadding="0" border="0" class="texto">
                <tr align="left" class="cabeceras">
                  <td width="23" align="center" nowrap>&nbsp;</td>
                  <td width="80" nowrap>No. Resp.</td>
                  <td width="300" nowrap>Nom. Responsable</td>
                  <td width="300" nowrap>Puesto</td>
                  <td width="100" nowrap>Status</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblReg" dataInfo="arrTblDat2" keys="eareIdAutoridad,eareIdResponsable" fun="clickTabla2" radioWidth="23px">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
