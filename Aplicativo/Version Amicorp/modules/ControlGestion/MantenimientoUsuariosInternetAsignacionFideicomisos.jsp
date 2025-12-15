<FORM name="frmMantenimientoUsuariosInternetAsignacionFideicomisos" id="frmMantenimientoUsuariosInternetAsignacionFideicomisos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Usuarios Fiducia Cliente</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table id="tabs" cellpadding="0" cellspacing="0" border="0">
          <tr>
            <td class="tab_blanco_claro"><img src="imagenes/spacer.gif" width="37" height="1"/></td>
            <td class="tab_relleno_claro" onclick="cambiaTab(this, 'cargaMantenimientoUsuariosInternetPersonas(2)');">Datos Personales/Usuarios</td>
            <td class="tab_claro_azul"><img src="imagenes/spacer.gif" width="34" height="1"/></td>
            <td class="tab_relleno_azul" onclick="cambiaTab(this, 'cargaMantenimientoAsignacionFideicomisos()');">Asignación Fideicomisos</td>
            <td class="tab_azul_blanco"><img src="imagenes/spacer.gif" width="35" height="1"/></td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table cellspacing="2" cellpadding="3" border="0" width="100%" class="texto">
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="10%">Fideicomiso</td>
            <td>
              <input type="text" name="paramFideicomiso" id="paramFideicomiso" size="10" tipo="Num" onblur="consultaNombreFideicomiso('nomFideicomiso',this);" required message="El Número de Fideicomiso es un dato obligatorio"/>
            </td>
            <td width="40%">
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
            </td>
            <td>
            </td>
          </tr>
          <tr>
            <td colspan="5">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
              <input type="BUTTON" id="hdRegistrosAsignacion" name="hdRegistrosAsignacion" ref="muestraDatosAsignacionFideicomisos" fun="loadTableElement" tabla="tablaRegistrosDatosUsuariosAsignacion" style="visibility:hidden"/>
              <input type="text" name="paramEjecutivoAtencion" id="paramEjecutivoAtencion" size="10" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="5" align="center">
              <input type="BUTTON" value="    Alta    " name="cmdAlta" class="boton" onclick="validaAltaAsignacion();"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="BUTTON" value="    Baja    " name="cmdBajar" class="boton" onclick="validaExistaAsignacionComite();"/>
            </td>
          </tr>
          <tr>
            <td colspan="5">
              <hr/>
            </td>
          </tr>
          <tr>
            <td colspan="5" class="subtitulo" align="center">Cat&aacute;logo de Usuarios</td>
          </tr>
          <tr>
            <td colspan="5">
              <table cellspacing="3" cellpadding="2" border="1" width="100%">
                <tr class="cabeceras">
                  <td width="24" height="23">&nbsp;</td>
                  <td width="123" height="23">No. Contrato</td>
                  <td width="707" height="23">Nombre</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:100%;">
                <table id="tablaRegistrosDatosUsuariosAsignacion" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaDatosUsuariosAsignacionData" keys="ateNumContrato,ateEjecAtencion,ateCveBanca" fun="clickTabla2" radioWidth="35">
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
      <td height="100%" align="center">
        <input type="BUTTON" value="   Cancelar   " name="cmdCancelar" class="boton_x" onclick="cargaPrincipalSeguridadUsuariosInternet();"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>
