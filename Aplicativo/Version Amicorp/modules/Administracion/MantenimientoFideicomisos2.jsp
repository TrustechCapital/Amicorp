<FORM name="frmDatosMantenimientoFideicomisos2" id="frmDatosMantenimientoFideicomisos2" onsubmit="">
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
            <td width="25%">N&uacute;m. Fideicomiso</td>
            <td>
              <input type="text" name="ctoNumContrato" id="ctoNumContrato" tipo="Num" size="10" maxlength="10" required message="El Número de Fideicomiso es un campo obligatorio"/>
            </td>
            <td width="11%">Cto. Eje</td>
            <td width="3%">
              <input type="text" name="ctoNumCtoEje" id="ctoNumCtoEje" tipo="Num" size="10" maxlength="10"/>
            </td>
          </tr>
          <tr>
            <td width="25%">Nombre</td>
            <td colspan="3" width="11%">
              <input type="text" name="ctoNomContrato" id="ctoNomContrato" size="50" maxlength="80" required message="El Nombre es un campo obligatorio"/>
            </td>
          </tr>
          <tr>
            <td width="25%">Tipo de Persona</td>
            <td width="33%">
              <select size="1" name="ctoCveTipoPer" id="ctoCveTipoPer" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="ctoNumNotario" param="clavesCombo23" required message="El Tipo de Persona es un campo obligatorio"/>
            </td>
            <td width="11%">&nbsp;</td>
            <td width="3%">
              <input type="text" name="ctoNumCliente" id="ctoNumCliente" tipo="Num" size="10" maxlength="10" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td width="11%" colspan="4">
              <hr/>
            </td>
          </tr>
          <tr valign="middle">
            <td class="subtitulo" width="25%" colspan="4">
            <table id="tabs" cellpadding="0" cellspacing="0" border="0" style="visibility:hidden">
                <tr>
                  <td class="tab_blanco_claro">&nbsp;</td>
                  <td class="tab_relleno_claro" onclick="cambiaTab(this, 'cargaMantenimientoFideicomisosTab()');">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Caracter&iacute;sticas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                  <td class="tab_claro_azul">&nbsp;</td>
                  <td class="tab_relleno_azul" onclick="cambiaTab(this, 'cargaMantenimientoFideicomisos2Tab()');">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Caracter&iacute;sticas Adicionales&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                  <td class="tab_azul_blanco">&nbsp;</td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td width="11%" colspan="4">
              <hr/>
            </td>
          </tr>
          <tr>
            <td width="25%" class="subtitulo">Tipo Cliente</td>
            <td width="33%">&nbsp;</td>
            <td width="11%">&nbsp;</td>
            <td width="3%">&nbsp;</td>
          </tr>
          <tr>
            <td align="left">&nbsp;&nbsp;</td>
            <td align="left">
              <input type="radio" name="rdTipoCliente" id="ctoTipoClient" class="radio" value2="PUBLICO" onclick="clickPublicoPrivado('ctoTipoClient',this,false)"/>P&uacute;blico
            </td>
            <td align="left" width="20%">
              <input type="radio" name="rdTipoCliente" id="Privado" class="radio" value="PRIVADO" onclick="clickPublicoPrivado('ctoTipoClient',this,true)"/>Privado
            </td>
            <td align="left" width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td height="10%" valign="middle" align="char">&nbsp;</td>
            <td height="10%" valign="middle" align="left">
              <DIV align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="rdTipoPublic" id="ctoTipoPublic" class="radio" value2="GOBIERNO FEDERAL" onclick="asignaValueRadio2Master('ctoTipoPublic',this)"/>Gobierno Federal
              </DIV>
            </td>
            <td height="28" colspan="2" nowrap>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="checkbox" name="ctoCveReqSorsChk" id="ctoCveReqSorsChk" class="check" tv="1" fv="0"/>Req. Expediente de Identificaci&oacute;n del Cliente
            </td>
          </tr>
          <tr>
            <td height="10%" valign="middle" align="char"/>
            <td height="10%" valign="middle" align="left">
              <DIV align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="rdTipoPublic" id="Paraestatal" class="radio" value="PARAESTATAL" onclick="asignaValueRadio2Master('ctoTipoPublic',this)"/>Paraestatal
              </DIV>
            </td>
            <td align="left">No. Expediente</td>
            <td align="left">
              <input type="text" name="ctoNumExpSors" id="ctoNumExpSors" size="14" maxlength="14"/>
            </td>
          </tr>
          <tr>
            <td height="10%" valign="middle" align="char"/>
            <td height="10%" valign="middle" align="left">
              <DIV align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="rdTipoPublic" id="Estatal" class="radio" value="ESTATAL" onclick="asignaValueRadio2Master('ctoTipoPublic',this)"/>Estatal
              </DIV>
            </td>
            <td width="11%" colspan="2" align="left">&nbsp;</td>
          </tr>
          <tr>
            <td height="10%" valign="middle" align="char"/>
            <td height="10%" valign="middle" align="left">
              <DIV align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="rdTipoPublic" id="Municipal" class="radio" value="MUNICIPAL" onclick="asignaValueRadio2Master('ctoTipoPublic',this)"/>Municipal
                <input type="radio" name="rdTipoPublic" id="Nada" class="radio" value="" style="visibility:hidden"/>
              </DIV>
            </td>
            <td width="11%">&nbsp;</td>
            <td width="3%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="33%">&nbsp;</td>
            <td width="11%">&nbsp;</td>
            <td width="3%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="33%">Oficio Exenci&oacute;n
              <input type="text" name="ctoNumOficioExe" id="ctoNumOficioExe" size="20" maxlength="20"/>
            </td>
            <td width="11%" nowrap>Reg. Nal. Inv. Ext.</td>
            <td>
              <input type="text" name="ctoRegNalInvEx" id="ctoRegNalInvEx" size="20" maxlength="20"/>
            </td>
          </tr>
          <tr>
            <td nowrap>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="checkbox" name="ctoCveShcpChk" id="ctoCveShcpChk" class="check" tv="1" fv="0"/>Registro SHCP
            </td>
            <td>
              <input type="text" name="ctoRegShcp" id="ctoRegShcp" size="25" maxlength="25"/>
            </td>
            <td>Ult. Renovaci&oacute;n</td>
            <td>
              <input type="text" name="txtUltRenovacion" size="10" maxlength="10"/>
            </td>
          </tr>
          <tr>
            <td width="25%" nowrap>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="checkbox" name="ctoCveGobdfChk" id="ctoCveGobdfChk" class="check" tv="1" fv="0"/>Registro Gob. D. F.
            </td>
            <td width="33%">
              <input type="text" name="ctoRegGobdf" id="ctoRegGobdf" size="25" maxlength="25"/>
            </td>
            <td width="11%">&nbsp;</td>
            <td width="3%">
              <input type="text" name="ctoFoseg" id="ctoFoseg" size="1" maxlength="1" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td width="25%" colspan="4">
              <hr/>
            </td>
          </tr>
          <tr>
            <td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="radio" name="rdTipoContacto" id="ctoTipoContacto" class="radio" value2="CONTRATO PRIVADO" onclick="clickContratoEscritura('ctoTipoContacto',this,true)"/>Contrato Privado
            </td>
            <td width="33%">
              <input type="radio" name="rdTipoContacto" id="ctoTipoContacto2" class="radio" value="ESCRITURA PUBLICA" onclick="clickContratoEscritura('ctoTipoContacto',this,false)"/>Escitura P&uacute;blica
            </td>
            <td width="11%">&nbsp;</td>
            <td width="3%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="33%" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;No. Escritura&nbsp;
              <input type="text" name="ctoNumEscritura" id="ctoNumEscritura" size="25" maxlength="25"/>
            </td>
            <td width="3%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="33%" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Notario &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <select size="1" name="ctoNumNotario" id="ctoNumNotario" ref="muestraDatosNotarios" fun="loadComboElement" keyValue="notNumNotario" theValue="notNomNotario" next="loadCatalogo"  onchange="muestraLocalidadNumNotario();"/>
            </td>
            <td width="3%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="33%" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Localidad &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="text" name="txtLocalidad" size="25" maxlength="50"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="33%" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;No. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <input type="text" name="txtNumNotario" id="txtNumNotario" tipo="Num" size="10" maxlength="10"/>            </td>
            <td>&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value=" Aceptar  " id="cmdAceptar" name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/>
        <input type="BUTTON" value=" Cancelar " id="cmdCancelar" name="cmdCancelar" class="boton_x" onclick="showWaitLayer(); cargaPrincipalFideicomisos();" style="visibility:hidden"/>
        <input type="BUTTON" value=" Atención " id="cmdAtencion" name="cmdAtencion" class="boton" onclick="cargaPrincipalAtencionFideicomisos();" style="visibility:hidden"/>
        <input type="BUTTON" value="Honorarios" id="cmdHonorarios" name="cmdHonorarios" class="boton" onclick="cargaConsultaHonorariosFideicomisos();" style="visibility:hidden"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>
