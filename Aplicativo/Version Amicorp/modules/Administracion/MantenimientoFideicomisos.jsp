<FORM name="frmDatosMantenimientoFideicomisos" id="frmDatosMantenimientoFideicomisos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" align="center" style="height:auto;">
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Fideicomisos</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto" border="0">
          <tr valign="middle">
            <td width="25%" nowrap>N&uacute;m. Fideicomiso</td>
            <td width="33%" colspan="2">
              <input type="text" name="ctoNumContrato" id="ctoNumContrato" tipo="Num" size="10" maxlength="10" onblur="validarPkAlta();" required message="El Número de Contrato es un campo obligatorio"/>
            </td>
            <td width="11%">Cto. Eje</td>
            <td width="3%">
              <input type="text" name="ctoNumCtoEje" id="ctoNumCtoEje" tipo="Num" size="10" maxlength="10"/>
            </td>
          </tr>
          <tr>
            <td width="25%" nowrap>Nombre</td>
            <td colspan="4">
              <input type="text" name="ctoNomContrato" id="ctoNomContrato" size="50" maxlength="80" required message="El Nombre es un campo obligatorio"/>
            </td>
          </tr>
          <tr>
            <td width="25%" nowrap>Tipo de Persona</td>
            <td width="33%" colspan="2">
              <select size="1" name="ctoCveTipoPer" id="ctoCveTipoPer" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="ctoCveFormaMan" param="clavesCombo23"/>
            </td>
            <td width="11%">&nbsp;</td>
            <td width="3%">
              <input type="text" name="ctoNumCliente" id="ctoNumCliente" tipo="Num" size="10" maxlength="10" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="5" nowrap>
              <hr/>
            </td>
          </tr>
          <tr valign="middle">
            <td class="subtitulo" width="25%" nowrap colspan="5" align="left">
            <table id="tabs" cellpadding="0" cellspacing="0" border="0" style="visibility:hidden">
                <tr>
                  <td class="tab_blanco_azul">&nbsp;</td>
                  <td class="tab_relleno_azul" onclick="cambiaTab(this, 'cargaMantenimientoFideicomisosTab()');">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Caracter&iacute;sticas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                  <td class="tab_azul_claro">&nbsp;</td>
                  <td class="tab_relleno_claro" onclick="cambiaTab(this, 'cargaMantenimientoFideicomisos2Tab()');">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Caracter&iacute;sticas Adicionales&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                  <td class="tab_claro_blanco">&nbsp;</td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td colspan="5" nowrap>
              <hr/>
            </td>
          </tr>
          <tr>
            <td width="25%" nowrap>Forma de Manejo</td>
            <td width="33%" colspan="2">
              <select size="1" name="ctoCveFormaMan" id="ctoCveFormaMan" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="ctoCveTipoNeg" param="clavesCombo24" required message="La Forma de Manejo es un campo obligatorio"/>
            </td>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%" nowrap>Tipo Negocio</td>
            <td width="33%" colspan="2">
              <select size="1" name="ctoCveTipoNeg" id="ctoCveTipoNeg" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="ctoCveClasProd" param="clavesCombo36" onchange="actualizaComboProducto();" required message="El Tipo Negocio es un campo obligatorio"/>
            </td>
            <td colspan="2" align="left">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%" nowrap>Clasific. Producto</td>
            <td width="33%" colspan="2">
              <select size="1" name="ctoCveClasProd" id="ctoCveClasProd" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="ctoNomActividad" param="clavesCombo37" onchange="actualizaComboProducto();" required message="La Clasificación del Producto es un campo obligatorio"/>
            </td>
            <td colspan="2" align="left">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%" nowrap>Producto</td>
            <td colspan="4">
              <select size="1" name="ctoNumProducto" id="ctoNumProducto" ref="claveProducto" fun="loadComboElement" keyValue="prlNumProducto" theValue="prlNomProducto" next="formsLoaded" param="parametroComboProducto" required message="El Producto es un campo obligatorio">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
          </tr>
          <tr>
            <td width="25%" nowrap>Sector de Atenci&oacute;n</td>
            <td width="33%" colspan="2">
              <select size="1" name="ctoNomActividad" id="ctoNomActividad" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="ctoTipoFiso" param="clavesCombo1005"/>
            </td>
            <td width="11%">&nbsp;</td>
            <td width="3%">&nbsp;</td>
          </tr>		  
          <tr>
            <td width="25%" nowrap>Clasificaci&oacute;n SAT</td>
            <td width="33%" colspan="2">
              <select size="1" name="ctoTipoFiso" id="ctoTipoFiso" ref="claves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" next="antMoneda" param="clavesCombo636"/>
            </td>
            <td width="11%">&nbsp;</td>
            <td width="3%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="5" nowrap>
              <hr/>
            </td>
          </tr>
          <tr>
            <td width="25%" nowrap>
              <input type="checkbox" name="ctoCveArt28Chk" id="ctoCveArt28Chk" class="check" tv="1" fv="0"/>Sujeto Art. 28 LISR
            </td>
            <td width="33%" colspan="2">
              <input type="checkbox" name="ctoEnvioMensChk" id="ctoEnvioMensChk" class="check" tv="1" fv="0"/>Envia Mensajer&iacute;a
            </td>
            <td width="11%">&nbsp;</td>
            <td width="3%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%" nowrap>
              <input type="checkbox" name="ctoCveComiteTecChk" id="ctoCveComiteTecChk" class="check" tv="1" fv="0"/>Comite T&eacute;cnico
            </td>
            <td width="33%" colspan="2">
              <input type="checkbox" name="ctoFirmasMancomunadasChk" id="ctoFirmasMancomunadasChk" class="check" tv="1" fv="0"/>Firmas Mancomunadas
            </td>
            <td width="11%">&nbsp;</td>
            <td width="3%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%" nowrap>
              <input type="checkbox" name="ctoCveRevocableChk" id="ctoCveRevocableChk" class="check" tv="1" fv="0"/>Revocable
            </td>
            <td width="33%" colspan="2">
              <input type="checkbox" name="ctoTipoContChk" id="ctoTipoContChk" tv="1" fv="0" class="check"/>Contabilidad Detallada
            </td>
            <td width="11%">&nbsp;</td>
            <td width="3%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%" nowrap>
              <input type="checkbox" name="ctoCveMonExtChk" id="ctoCveMonExtChk" tv="1" fv="0" class="check"/>Maneja Mon. Ext.
            </td>
            <td>&nbsp;</td>
            <td width="11%" nowrap>Moneda</td>
            <td width="11%" colspan="2">
              <select size="1" name="antMoneda" id="antMoneda" ref="claveMoneda" fun="loadComboElement" keyValue="monNomMoneda" theValue="monNomMoneda" next="ctoCveStContrat" onchange="cargaChkMonedaExt(this)"/>
            </td>
          </tr>
          <tr>
            <td width="25%" nowrap>
              <input type="checkbox" name="ctoCveRepProdChk" id="ctoCveRepProdChk" tv="1" fv="0" class="check"/>Suejto Art. 9 LISR
            </td>
            <td>&nbsp;</td>
            <td width="11%" nowrap>Fecha Constituci&oacute;n</td>
            <td width="11%" colspan="2">
              <input type="text" name="ctoFechaConstitucion" id="ctoFechaConstitucion" tipo="Fecha" size="10" maxlength="10" onchange="descomponeFecha(this);"/>
              <input type="text" name="ctoDiaApertura" id="ctoDiaApertura" size="2" style="visibility:hidden"/>
              <input type="text" name="ctoMesApertura" id="ctoMesApertura" size="2" style="visibility:hidden"/>
              <input type="text" name="ctoAnoApertura" id="ctoAnoApertura" size="4" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td width="25%" nowrap>
              &nbsp;
            </td>
            <td>&nbsp;</td>
            <td width="11%" nowrap>Status</td>
            <td width="11%" colspan="2">
              <select size="1" name="ctoCveStContrat" id="ctoCveStContrat" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="loadCatalogo" param="clavesCombo31" required message="El Status es un campo obligatorio"/>
            </td>
          </tr>
          <tr>
            <td colspan="5">
              <hr/>
            </td>
          </tr>
          <tr valign="middle">
            <td align="center" colspan="5">
              <input type="radio" name="rdTipoAdmon" id="ctoTipoAdmon" class="radio" value2="SI" onclick="asignaValueRadio2Master('ctoTipoAdmon',this)"/>Con Administraci&oacute;n &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="radio" name="rdTipoAdmon" id="ctoTipoAdmon2" class="radio" value="NO" onclick="asignaValueRadio2Master('ctoTipoAdmon',this)"/>Sin Administraci&oacute;n
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value=" Aceptar " id="cmdAceptar" name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/>
        <input type="BUTTON" value="Siguiente" id="cmdSiguiente" name="cmdSiguiente" class="boton" onclick="guardaInfoSiguiente();" style="visibility:hidden"/>
        <input type="BUTTON" value="Cancelar " id="cmdCancelar" name="cmdCancelar" class="boton_x" onclick="showWaitLayer(); cargaPrincipalFideicomisos();" style="visibility:hidden"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>