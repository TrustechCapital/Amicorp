<FORM name="frmDatosMantenimientoAnteproyectoGenerales" id="frmDatosMantenimientoAnteproyectoGenerales" onsubmit=" ">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Proyecto</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="100%" class="texto">
            <tr>
              <td width="10%">&nbsp;</td>
              <td nowrap width="20%">Proyecto</td>
              <td>
                <input type="text" name="antNumProspecto" id="antNumProspecto" tipo="Num" size="10" maxlength="10" onblur="validarPkAlta(this);" required message="El N�mero de Proyecto es un dato obligatorio"/>
              </td>
              <td>&nbsp;</td>
              <td nowrap width="20%">&nbsp;</td>
              <td>
                <input type="text" name="antNumPromotor" id="antNumPromotor" tipo="Num" size="10" required message="El N�mero de Promotor es un dato obligatorio" value="0" style="visibility:hidden;"/>
              </td>
                <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="10%">&nbsp;</td>
              <td nowrap width="20%">Nombre del Negocio</td>
              <td colspan="4">
                <input type="text" name="antNomNegocio" id="antNomNegocio" size="50" maxlength="100" required message="El Nombre del Fideicomiso es un dato obligatorio"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="10%">&nbsp;</td>
              <td nowrap width="20%">Abogado Responsable</td>
              <td colspan="4">
                <select size="1" name="antNumAbogado" id="antNumAbogado" ref="claveAbogado" fun="loadComboElement" keyValue="ejeNumEjecAtenc" theValue="ejeNomEjecutivo" next="antTipoNegSat" required message="El Abogado Responsable es un dato obligatorio"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="10%">&nbsp;</td>
              <td nowrap width="20%">Tipo Persona</td>
              <td width="50%"><select size="1" name="antTipoNegSat" id="antTipoNegSat" ref="claves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" next="antCveFormMan" param="clavesCombo709" required message="El Tipo de Persona es un campo obligatorio"/>
			  </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td class="subtitulo" NOWRAP align="left" width="10%">&nbsp;
              </td>
              <td class="subtitulo" NOWRAP align="left" colspan="5" width="30%">
                <table id="tabs" cellpadding="0" cellspacing="0" border="0" style="visibility:hidden">
                  <tr>
                    <td class="tab_blanco_azul">
                      <img src="imagenes/spacer.gif" width="37" height="1"/>
                    </td>
                    <td class="tab_relleno_azul" onclick="cambiaTab(this, 'cargaMantenimientoProspectosAnteproyectoGeneralesTab()');">Generales</td>
                    <td class="tab_azul_claro">
                      <img src="imagenes/spacer.gif" width="37" height="1"/>
                    </td>
                    <td class="tab_relleno_claro" onclick="cambiaTab(this, 'cargaMantenimientoProspectosAnteproyectoCaracteristicasTab()');">Caracteristicas</td>
                    <td class="tab_claro_blanco">
                      <img src="imagenes/spacer.gif" width="35" height="1"/>
                    </td>
                  </tr>
                </table>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="10%">&nbsp;</td>
              <td nowrap>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td width="20%">&nbsp;</td>
              <td>&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="10%">&nbsp;</td>
              <td nowrap width="20%">Forma Manejo</td>
              <td colspan="4">
                
                <select size="1" name="antCveFormMan" id="antCveFormMan" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="antCveTipoNeg" param="clavesCombo24" required message="La Forma de Manejo es un dato obligatorio"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="10%">&nbsp;</td>
              <td nowrap width="20%">Tipo&nbsp;de Negocio</td>
              <td colspan="4">
                <select size="1" name="antCveTipoNeg" id="antCveTipoNeg" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="antMoneda" param="clavesCombo36" onchange="actualizaComboClasProd();" required message="El Tipo de Negocio es un dato obligatorio"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="10%">&nbsp;</td>
              <td nowrap width="20%">Clasificaci&oacute;n Producto</td>
              <td colspan="4">
                <select size="1" name="antCveClasifPro" id="antCveClasifPro" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="clavesCombo37" next="formsLoaded" onchange="actualizaComboProducto();" required message="La Clasificaci�n del Producto es un dato obligatorio"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="10%">&nbsp;</td>
              <td nowrap width="20%">Producto</td>
              <td colspan="4">
                <select size="1" name="antNumProducto" id="antNumProducto" ref="claveProducto" fun="loadComboElement" keyValue="prlNumProducto" theValue="prlNomProducto" next="formsLoaded" param="parametroComboProducto" required message="El Producto es un dato obligatorio">
                  <option value="-1">-- Seleccione --</option>
                </select>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="10%">&nbsp;</td>
              <td nowrap width="20%">&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td nowrap width="20%">&nbsp;</td>
              <td>&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="10%">&nbsp;</td>
              <td nowrap width="20%">Fecha de Inicio Negociaci&oacute;n</td>
              <td>
                <input type="text" name="antFechaApertura" id="antFechaApertura" tipo="Fecha" size="10" maxlength="10"/>
              </td>
              <td>&nbsp;</td>
              <td nowrap width="20%">Fecha Prob. Constituci&oacute;n</td>
              <td>
                <input type="text" name="antFecProConsti" id="antFecProConsti" tipo="Fecha" size="10" maxlength="10"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="10%">&nbsp;</td>
              <td nowrap width="20%">
                <input type="checkbox" name="antCveComiteChk" id="antCveComiteChk" class="check" tv="1" fv="0"/>Comit&eacute; &nbsp;T&eacute;cnico
              </td>
              <td>
                <input type="checkbox" name="antCveRevocableChk" id="antCveRevocableChk" class="check" tv="1" fv="0"/>Revocable
              </td>
              <td>&nbsp;</td>
              <td nowrap width="20%">Aportaci&oacute;n Inicial</td>
              <td>
                <input type="text" name="antImpApertura" id="antImpApertura" size="17" maxlength="17" tipo="Money" value="0.0" prec="16.2" reqPrecValue/>
                
              </td>
              <td width="10%"><select size="1" name="antMoneda" id="antMoneda" ref="claveMoneda" fun="loadComboElement" keyValue="monNomMoneda" theValue="monNomMoneda" next="antSeguimiento"/>
              </td>
            </tr>
            <tr>
              <td width="10%">&nbsp;</td>
              <td nowrap width="20%">&nbsp;</td>
              <td colspan="4">&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="10%">&nbsp;</td>
              <td nowrap width="20%">Patrimonio</td>
              <td colspan="4">
                <textarea name="antPatrimonio" id="antPatrimonio" style="width:400px;height:80px"></textarea>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="10%">&nbsp;</td>
              <td nowrap width="20%">Descripci&oacute;n Ultima Gesti&oacute;n</td>
              <td colspan="4">
                <textarea name="antDesGestion" id="antDesGestion" style="width:400px;height:80px" onkeydown="validaLongitud(this,250);"></textarea>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="10%">&nbsp;</td>
              <td nowrap width="20%">&nbsp;</td>
              <td colspan="2">&nbsp;</td>
              <td nowrap width="20%">&nbsp;</td>
              <td>&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="10%">&nbsp;</td>
              <td nowrap width="20%">Situaci&oacute;n</td>
              <td colspan="2">
                <select size="1" name="antSeguimiento" id="antSeguimiento" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="antCveStProspec" param="clavesCombo125"/>
              </td>
              <td nowrap width="20%">Fecha &Uacute;ltima Gesti&oacute;n</td>
              <td>
                <input type="text" name="antFecGestion" id="antFecGestion" tipo="Fecha" size="10" maxlength="10"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="10%">&nbsp;</td>
              <td nowrap width="20%">Status</td>
              <td colspan="4">
                <select size="1" name="antCveStProspec" id="antCveStProspec" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="loadCatalogo" param="clavesCombo161" required message="El Status es un dato obligatorio"/>
              </td>
              <td width="10%">&nbsp;
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td width="60%" height="100%">&nbsp;</td>
      </tr>
      <tr align="center">
        <td height="100%">
          <input type="BUTTON" value="  Aceptar  " name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/>
          <input type="BUTTON" value="Siguiente >" name="cmdSiguiente" class="boton" onclick="guardaInfoSiguiente();" style="visibility:hidden"/>
          <input type="BUTTON" value="  Cancelar " name="cmdCancelar" class="boton_x" onclick="cargaPrincipalProspectosAnteproyecto();" style="visibility:hidden"/>
        </td>
      </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>
