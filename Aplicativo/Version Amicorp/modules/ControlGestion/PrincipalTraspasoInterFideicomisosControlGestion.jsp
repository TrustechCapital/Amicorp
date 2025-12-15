<FORM name="frmPrincipalTraspasoInterFideicomisosControlGestion" id="frmPrincipalTraspasoInterFideicomisosControlGestion" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Traspaso Inter-Fideicomisos</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table cellspacing="3" cellpadding="2" border="0" width="100%" class="texto">
          <tr>
            <td>No. Fideicomiso</td>
            <td>
              <input type="text" name="txtNumFiso" id="txtNumFiso" tipo="Num" size="15" maxlength="10" required message="El Número de Fideicomiso es un dato obligatorio"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="BUTTON" value="  >>>  " name="cmdFlecha" id="cmdFlecha" class="boton" onclick="botonFlecha();"/>
            </td>
            <td class="subtitulo">Status</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>
              <input type="radio" name="rdStatus" id="rdSi" class="radio" checked/>Si</td>
            <td>
              <input type="BUTTON" value="  Modificar  " name="cmdModificar1" id="cmdModificar1" class="boton" onclick="botonModificar1();"/>
            </td>
            <td>
              <input type="BUTTON" value="   Aceptar   " name="cmdAceptar1" id="cmdAceptar1" class="boton" onclick="botonAceptar1();"/>
            </td>
            <td>
              <input type="BUTTON" value="  Cancelar " name="cmdCancelar1" id="cmdCancelar1" class="boton" onclick="botonCancelar1()"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>
              <input type="radio" name="rdStatus" id="rdNo" class="radio"/>No
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td colspan="7">&nbsp;
            </td>
          </tr>
          <tr>
            <td colspan="7">
              <hr/>
            </td>
          </tr>
          <tr>
            <td colspan="7" class="subtitulo" align="center">Fideicomisos</td>
          </tr>
          <tr>
            <td colspan="7">
              <table cellspacing="0" cellpadding="0" border="0" width="100%">
                <tr class="cabeceras">
                  <td width="78">FISO</td>
                  <td width="551">NOMBRE</td>
                  <td width="304">STATUS</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:100%;">
                <table id="tablaRegistrosDatosFideicomisos" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaDatosFideicomisosData" keys="fiso" fun="clickTablaFisos">
                </table>
              </div>
            </td>
          </tr>
          <tr>
            <td colspan="7">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="7" class="subtitulo">Fideicomisos Origen</td>
          </tr>
          <tr>
            <td colspan="2">Fideicomiso Origen</td>
            <td>&nbsp;</td>
            <td>Contrato de Inversi&oacute;n</td>
            <td>&nbsp;</td>
            <td>Usuarios</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2">
              <select size="1" name="tifCtoOrigen" id="tifCtoOrigen" ref="claveCmbFisoOrigenTraspaso" fun="loadComboElement" keyValue="fiso" theValue="nombre" next="cargaTablaFideicomisos" required message="El Fideicomiso Origen es un dato obligatorio" onchange="cambiaFideicomiso(this,false);"/>
            </td>
            <td>&nbsp;</td>
            <td>
              <select size="1" name="tifCtoInterOrigen" id="tifCtoInterOrigen" ref="claveCmbContratoInversionTraspaso" fun="loadComboElement" keyValue="cprContratoInter" theValue="cprContratoInter" next="formsLoaded" required message="El Contrato de Inversion Origen es un dato obligatorio" param="parametroComboContratoInversion">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td>&nbsp;</td>
            <td>
              <select size="1" name="tifUsuario" id="tifUsuario" ref="claveCmbUsuariosTraspaso" fun="loadComboElement" keyValue="ateEjecAtencion" theValue="ateNomEjecutivo" next="formsLoaded" required message="El Usuario es un dato obligatorio" param="parametroComboUsuarios">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td colspan="7">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="7" class="subtitulo">Fideicomisos Destino</td>
          </tr>
          <tr>
            <td colspan="2">Fideicomiso Destino</td>
            <td>&nbsp;</td>
            <td>Contrato de Inversi&oacute;n</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2">
              <select size="1" name="tifCtoDestino" id="tifCtoDestino" ref="claveCmbFisoDestinoTraspaso" fun="loadComboElement" keyValue="fiso" theValue="nombre" next="formsLoaded" required message="El Fideicomiso Destino es un dato obligatorio" param="parametroComboFideicomisoDestino" onchange="cargaComboContratoInversionDestino(this,false);">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td>&nbsp;</td>
            <td>
              <select size="1" name="tifCtoInterDestino" id="tifCtoInterDestino" ref="claveCmbContratoInversionTraspaso" fun="loadComboElement" keyValue="cprContratoInter" theValue="cprContratoInter" next="formsLoaded" required message="El Contrato de Inversión Destino es un dato obligatorio" param="parametroComboContratoInversionDestino">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td colspan="7">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="7" align="center">
              <input type="BUTTON" value="   Asignar   " name="cmdAsignar" id="cmdAsignar" class="boton" onclick="botonAsignar();"/>
              <input type="BUTTON" value="  Modificar  " name="cmdModificar2" id="cmdModificar2" class="boton" onclick="botonModificar2();"/>
              <input type="BUTTON" value="    Borrar    " name="cmdBorrar" id="cmdBorrar" class="boton" onclick="botonBorrar();"/>
              <input type="BUTTON" value="   Aceptar   " name="cmdAceptar2" id="cmdAceptar2" class="boton" onclick="botonAceptar2();"/>
              <input type="BUTTON" value="  Cancelar " name="cmdCancelar2" id="cmdCancelar2" class="boton" onclick="botonCancelar2();"/>
            </td>
          </tr>
          <tr>
            <td colspan="7">&nbsp;
              <input type="BUTTON" id="hdFideicomisos" name="hdFideicomisos" ref="claveCmbFisoOrigenTraspaso" fun="loadTableElementSpecial" tabla="tablaRegistrosDatosFideicomisos" style="visibility:hidden"/>
              <input type="BUTTON" id="hdTraspasos" name="hdTraspasos" ref="muestraTraspasosInterFideicomisos" fun="loadTableElement" tabla="tablaRegistrosDatosTraspasos" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="7">
              <hr/>
            </td>
          </tr>
          <tr>
            <td colspan="7" class="subtitulo" align="center">Traspasos - Interfideicomisos</td>
          </tr>
          <tr>
            <td colspan="7">
              <table cellspacing="0" cellpadding="0" border="0" width="100%">
                <tr class="cabeceras">
                  <td width="23">&nbsp;</td>
                  <td width="389">USUARIO</td>
                  <td width="131">ORIGEN</td>
                  <td width="152">CTO_ORI</td>
                  <td width="121">DESTINO</td>
                  <td width="129">CTO_DES</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:100%;">
                <table id="tablaRegistrosDatosTraspasos" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaDatosTraspasosData" keys="tifUsuario,tifCtoOrigen,tifCtoInterOrigen,tifCtoDestino,tifCtoInterDestino" fun="clickTablaTraspasos" radioWidth="35">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">&nbsp;</td>
    </tr>
  </table>
</FORM>
