<FORM name="frmDatosMantenimientoAnteproyectoCaracteristicas" id="frmDatosMantenimientoAnteproyectoCaracteristicas" onsubmit=" ">
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
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="2">Proyecto</td>
              <td>
                <input type="text" name="antNumProspecto" id="antNumProspecto" tipo="Num" size="10" maxlength="10" required message="El Proyecto es un campo obligatorio"/>
              </td>
              <td align="right">&nbsp;</td>
              <td nowrap>&nbsp;</td>
              <td>
                <input type="text" name="antNumPromotor" id="antNumPromotor" tipo="Num" size="10" required message="El Número de Promotor es un dato obligatorio" value="0" style="visibility:hidden;"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="2">Nombre del Negocio</td>
              <td colspan="4">
                <input type="text" name="antNomNegocio" id="antNomNegocio" size="50" maxlength="100" required message="El Nombre del Fideicomiso es un campo obligatorio"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="2">Abogado Responsable</td>
              <td colspan="4">
                <select size="1" name="antNumAbogado" id="antNumAbogado" ref="claveAbogado" fun="loadComboElement" keyValue="ejeNumEjecAtenc" theValue="ejeNomEjecutivo" next="antNumNotario" required message="El Abogado Responsable es un campo obligatorio"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="6">&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td class="subtitulo" height="25" width="15%">&nbsp;</td>
              <td class="subtitulo" height="25" nowrap colspan="6">
                <table id="tabs" cellpadding="0" cellspacing="0" border="0" style="visibility:hidden">
                  <tr>
                    <td class="tab_blanco_claro">
                      <img src="imagenes/spacer.gif" width="37" height="1"/>
                    </td>
                    <td class="tab_relleno_claro" onclick="cambiaTab(this, 'cargaMantenimientoProspectosAnteproyectoGeneralesTab()');">Generales</td>
                    <td class="tab_claro_azul">
                      <img src="imagenes/spacer.gif" width="34" height="1"/>
                    </td>
                    <td class="tab_relleno_azul" onclick="cambiaTab(this, 'cargaMantenimientoProspectosAnteproyectoCaracteristicasTab()');">Caracteristicas</td>
                    <td class="tab_azul_blanco">
                      <img src="imagenes/spacer.gif" width="35" height="1"/>
                    </td>
                  </tr>
                </table>
              </td>
              <td class="subtitulo" height="25" width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="6">&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td colspan="3" nowrap class="subtitulo">Tipo de Cliente</td>
              <td colspan="3">&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td colspan="3" nowrap>&nbsp;</td>
              <td colspan="3">&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="2">
                <input type="radio" name="rdTipoCliente" id="antTipoClient" class="radio" value2="PUBLICO" onclick="clickPublicoPrivado('antTipoClient',this,false)"/>&nbsp;P&uacute;blico
              </td>
              <td>&nbsp;</td>
              <td nowrap>
                <input type="radio" name="rdTipoCliente" id="Privado" class="radio" value="PRIVADO" onclick="clickPublicoPrivado('antTipoClient',this,true)"/>&nbsp;Privado
              </td>
              <td nowrap>&nbsp;
                </td>
              <td>&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap width="15%">
                <input type="radio" name="rdTipoPublic" id="antTipoPublic" class="radio" value2="GOBIERNO FEDERAL" onclick="asignaValueRadio2Master('antTipoPublic',this)"/>&nbsp;Gobierno Federal
              </td>
              <td nowrap width="15%"><input type="radio" name="rdTipoPublic" id="Estatal" class="radio" value="ESTATAL" onclick="asignaValueRadio2Master('antTipoPublic',this)"/>&nbsp;Estatal
                </td>
              <td>&nbsp;</td>
              <td>&nbsp;
                </td>
              <td>&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>
                <input type="radio" name="rdTipoPublic" id="Paraestatal" class="radio" value="PARAESTATAL" onclick="asignaValueRadio2Master('antTipoPublic',this)"/>&nbsp;Paraestatal
              </td>
              <td nowrap width="15%"><input type="radio" name="rdTipoPublic" id="Municipal" class="radio" value="MUNICIPAL" onclick="asignaValueRadio2Master('antTipoPublic',this)"/>&nbsp;Municipal
                <input type="radio" name="rdTipoPublic" id="Nada" class="radio" value="" style="visibility:hidden"/>
                </td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>
                &nbsp;
              </td>
              <td nowrap>&nbsp;
                </td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="5%">&nbsp;</td>
              <td>
                &nbsp;
              </td>
              <td>&nbsp;
                              </td>
                              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            
            <tr align="left">
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="2">Giro/Actividad</td>
              <td  align="left">
                <input type="text" name="ctoRama" id="ctoRama" tipo="AlphaNumeric" size="50" maxlength="255"/>

                <!--select size="1" name="ctoRama" id="ctoRama" ref="claveActividad" fun="loadComboElement" keyValue="actNumRama" theValue="actNomRama" next="antNomActividad" onchange="cambiaComboPr(this)"/-->              
            </td>
            <td  align="left">
              <input type="text" name="antNomActividad" id="antNomActividad" tipo="AlphaNumeric" size="60" maxlength="255"/>

              <!--select size="1" name="antNomActividad" id="antNomActividad" ref="consultaActividades" fun="loadComboElement" keyValue="actNomRama" theValue="actNomRama" next="antNumNotario" required message="Giro/Actividad es un campo obligatorio"/-->
            </td>
            <td nowrap colspan="7">&nbsp;</td>
          </tr>
          <tr>
             
            <tr>
              <td class="subtitulo" width="15%">&nbsp;</td>
              <td class="subtitulo" colspan="3" nowrap>Tipo de Contrato</td>
              <td>&nbsp;</td>
              <td colspan="2" class="subtitulo" nowrap><div style="visibility:hidden">Convenios Modificatorios</div></td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="2">&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td nowrap>&nbsp;</td>
              <td>&nbsp;
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="2">
                <input type="radio" name="rdTipoContacto" id="antTipoContacto" class="radio" value2="CONTRATO PRIVADO" onclick="clickContratoEscritura('antTipoContacto',this,true)"/>&nbsp;Contrato Privado
              </td>
              <td colspan="2">
                <input type="radio" name="rdTipoContacto" id="antTipoContacto2" class="radio" value="ESCRITURA PUBLICA" onclick="clickContratoEscritura('antTipoContacto',this,false)"/>&nbsp;Escritura Publica
              </td>
              <td nowrap><div style="visibility:hidden">Fecha1</div></td>
              <td>
                <div style="visibility:hidden"><input type="text" name="txtFecha1" id="txtFecha1" tipo="Fecha" size="10" maxlength="10" onchange="descomponeFecha(this,GI('antDiaConmod1'),GI('antMesConmod1'),GI('antAnoConmod1'));"/></div>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="2">&nbsp;</td>
              <td>No. Escritura</td>
              <td colspan="2">
                <input type="text" name="antNumEscritura" id="antNumEscritura" tipo="AlphaNumeric" size="25" maxlength="25"/>
              </td>
              <td>
                <div style="visibility:hidden"><input type="text" name="txtFecha2" id="txtFecha2" tipo="Fecha" size="10" maxlength="10" onchange="descomponeFecha(this,GI('antDiaConmod2'),GI('antMesConmod2'),GI('antAnoConmod2'));"/></div>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="2">&nbsp;</td>
              <td>Notario</td>
              <td colspan="2" nowrap>
                <select size="1" name="antNumNotario" id="antNumNotario" ref="claveNotarios" fun="loadComboElement" keyValue="notNumNotario" theValue="notNomNotario" next="loadCatalogo" onchange="muestraLocalidadNumNotario();"/>
              </td>
              <td nowrap>
                <div style="visibility:hidden"><input type="text" name="txtFecha3" id="txtFecha3" tipo="Fecha" size="10" maxlength="10" onchange="descomponeFecha(this,GI('antDiaConmod3'),GI('antMesConmod3'),GI('antAnoConmod3'));"/></div>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="2">&nbsp;</td>
              <td>Localidad</td>
              <td colspan="2">
                <input type="text" name="txtLocalidad" tipo="AlphaNumeric" size="50" maxlength="50"/>
              </td>
              <td>&nbsp;
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="2">&nbsp;</td>
              <td>No.</td>
              <td>
                <input type="text" name="txtNumNotario" id="txtNumNotario" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td>&nbsp;</td>
              <td>&nbsp;
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%" height="26">&nbsp;</td>
              <td height="26" colspan="6">
                <input type="text" name="antDiaConmod1" id="antDiaConmod1" tipo="Num" size="1" maxlength="2" style="visibility:hidden"/>
                <input type="text" name="antMesConmod1" id="antMesConmod1" tipo="Num" size="1" maxlength="2" style="visibility:hidden"/>
                <input type="text" name="antAnoConmod1" id="antAnoConmod1" tipo="Num" size="1" maxlength="4" style="visibility:hidden"/>
                <input type="text" name="antDiaConmod2" id="antDiaConmod2" tipo="Num" size="1" maxlength="2" style="visibility:hidden"/>
                <input type="text" name="antMesConmod2" id="antMesConmod2" tipo="Num" size="1" maxlength="2" style="visibility:hidden"/>
                <input type="text" name="antAnoConmod2" id="antAnoConmod2" tipo="Num" size="1" maxlength="4" style="visibility:hidden"/>
                <input type="text" name="antDiaConmod3" id="antDiaConmod3" tipo="Num" size="1" maxlength="2" style="visibility:hidden"/>
                <input type="text" name="antMesConmod3" id="antMesConmod3" tipo="Num" size="1" maxlength="2" style="visibility:hidden"/>
                <input type="text" name="antAnoConmod3" id="antAnoConmod3" tipo="Num" size="1" maxlength="4" style="visibility:hidden"/>
              </td>
              <td width="10%" height="26">&nbsp;</td>
            </tr>
            <tr>
              <td class="subtitulo" width="15%">&nbsp;</td>
              <td class="subtitulo" colspan="3" nowrap>Tipo de Administraci&oacute;n</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="2">&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td colspan="3" nowrap>
                <input type="radio" name="rdTipoAdmon" id="antTipoAdmon" class="radio" value2="SI" onclick="asignaValueRadio2Master('antTipoAdmon',this)"/>&nbsp;Con Administraci&oacute;n
              </td>
              <td nowrap>
                <input type="radio" name="rdTipoAdmon" id="antTipoAdmon2" class="radio" value="NO" onclick="asignaValueRadio2Master('antTipoAdmon',this)"/>&nbsp;Sin Administraci&oacute;n
              </td>
              <td colspan="2" nowrap>&nbsp;
                </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="2">Fideicomiso</td>
              <td>
                <input type="text" name="antNumContrato" id="antNumContrato" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td>&nbsp;</td>
              <td nowrap>Fecha de Alta</td>
              <td>
                <input type="text" name="txtFecAltaCaracteristicasAnteproyecto" size="10" maxlength="10"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td width="60%" height="100%">&nbsp;</td>
      </tr>
      <tr align="center">
        <td height="100%">
          <input type="BUTTON" value="Aceptar " name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/>
          <input type="BUTTON" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="cargaPrincipalProspectosAnteproyecto();" style="visibility:hidden"/>
        </td>
      </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>
