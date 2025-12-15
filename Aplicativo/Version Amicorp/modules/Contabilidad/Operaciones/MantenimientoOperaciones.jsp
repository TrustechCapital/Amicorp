<form name="frmMantenimientoOperaciones" id="frmMantenimientoOperaciones" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento a Cat&aacute;logo de Operaciones</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="15%">
              <div id="divCombo1">Tipo de Operación</div>
            </td>
            <td>
              <select size="1" name="combo1" id="combo1" ref="cves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" param="cmbCombo1Param" next="asignaPK2ObjHTML" onchange="cargaCombosPrevioGenerarOperacion(this);"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="15%">
              <div id="divComboX" style="visibility:hidden">comboX</div>
            </td>
            <td><input type="text" name="txtSecuencial" id="txtSecuencial" size="10" maxlength="10" tipo="Num" style="visibility:hidden"/></td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="15%">
              <div id="divCombo2">combo2</div>
            </td>
            <td>
              <select size="1" name="combo2" id="combo2" ref="cves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" param="cmbCombo2Param" next="" onchange="cargaComboCorrespondiente(GI('combo1'),2);"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="15%">
              <div id="divCombo3">combo3</div>
            </td>
            <td>
              <select size="1" name="combo3" id="combo3" ref="conIns" fun="loadComboElement" keyValue="insNumInstrume" theValue="insNomInstrume" param="cmbCombo3Param" next="" onchange="cargaComboCorrespondiente(GI('combo1'),1000);"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="15%">
              <div id="divCombo4">combo4</div>
            </td>
            <td>
              <select size="1" name="combo4" id="combo4" ref="cves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" param="cmbCombo4Param" next="" onchange="cargaComboCorrespondiente(GI('combo1'),4);"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="15%">
              <div id="divCombo5">combo5</div>
            </td>
            <td>
              <select size="1" name="combo5" id="combo5" ref="cves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" param="cmbCombo5Param" next="" onchange="cargaComboCorrespondiente(GI('combo1'),1000);"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="15%">
              <div id="divCombo6">combo6</div>
            </td>
            <td>
              <select size="1" name="combo6" id="combo6" ref="cves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" param="cmbCombo6Param" next="" onchange="cargaComboCorrespondiente(GI('combo1'),1000);"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="15%">
              <div id="divCombo7" style="visibility:hidden">combo7</div>
            </td>
            <td>
              <select size="1" name="combo7" id="combo7" ref="cves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" param="cmbCombo7Param" next="" style="visibility:hidden" onchange="cargaComboCorrespondiente(GI('combo1'),1000);"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="20%">&nbsp;</td>
            <td nowrap width="15%">&nbsp;</td>
            <td nowrap>&nbsp;</td>
            <td nowrap width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="15%">No. Operaci&oacute;n</td>
            <td>
              <input type="text" name="opeNumOperacion" id="opeNumOperacion" size="10" maxlength="10" tipo="Num" required message="El No. de Operación es un campo obligatorio" onfocus="generaNumeroOperacion(this,GI('combo1'));"/>
              <input type="text" name="paramNumeroOperacion" id="paramNumeroOperacion" size="10" maxlength="10" tipo="Num" style="visibility:hidden"/>
              <input type="text" name="eopNumOperacion" id="eopNumOperacion" size="10" maxlength="10" tipo="Num" style="visibility:hidden"/>
              <input type="text" name="eopNumSecOpera" id="eopNumSecOpera" size="10" maxlength="10" tipo="Num" style="visibility:hidden"/>
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="15%">Descripci&oacute;n</td>
            <td>
              <input type="text" name="opeNomOperacion" id="opeNomOperacion" size="50" maxlength="50" tipo="AlphaNumeric" required message="La Descripción es un campo obligatorio"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="15%">Status</td>
            <td>
              <input type="text" name="opeCveStOperaci" id="opeCveStOperaci" size="10" maxlength="25" disabled class="inputLocked" value="PENDIENTE"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="button" value="Aceptar " name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacion();" style="visibility:hidden"/>
              <input type="button" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('Contabilidad.Operaciones.PrincipalOperaciones','')" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td width="20%" colspan="4">
              <hr/>
            </td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="4">
              <input type="button" value="   Alta  " name="cmdAlta" id="cmdAlta" class="boton" onclick="cargaMantenimientoEstructuraOperaciones(1);" style="visibility:hidden"/>
              <input type="button" value="Modificar" name="cmdModificar" id="cmdModificar" class="boton" onclick="cargaMantenimientoEstructuraOperaciones(2);" style="visibility:hidden"/>
              <input type="button" value="  Baja   " name="cmdBaja" id="cmdBaja" class="boton" onclick="cargaMantenimientoEstructuraOperaciones(3);" style="visibility:hidden"/>
              <input type="button" value="Consultar" name="cmdConsultar" id="cmdConsultar" class="boton" onclick="cargaMantenimientoEstructuraOperaciones(4);" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" class="subtitulo" align="center">Estuctrura de Operaciones</td>
          </tr>
          <tr align="center">
            <td colspan="4">
              <table cellspacing="0" cellpadding="0" border="0">
                <tr class="cabeceras">
                  <td width="23" nowrap>&nbsp;</td>
                  <td width="103" nowrap>No.</td>
                  <td width="91" nowrap>Secuencial</td>
                  <td width="85" nowrap>Transacci&oacute;n</td>
                  <td width="100" nowrap>Status</td>
                </tr>
              </table>
              <div style="height:50px; overflow:auto; position:relative; vertical-align:top;width:425px">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegPriEstrucOpe" dataInfo="arrTblEstrucOpe" keys="eopNumOperacion,eopNumSecOpera,eopNomTransac" fun="clickTabla2" radioWidth="26px">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
