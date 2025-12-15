<FORM name="frmPrincipalConstitucion" id="frmPrincipalConstitucion" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;" class="texto">
    <tr>
      <td align="center" height="100%" class="titulo">Ficha de Constituci&oacute;n</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" class="subtitulo"><table cellspacing="2" cellpadding="3" border="0" width="100%" class="texto">
          <tr>
            <td width="33%">&nbsp;</td>
            <td nowrap width="8%">Prospecto</td>
            <td>
              <input type="text" name="paramProspecto" id="paramProspecto" tipo="AlphaNumeric" size="10"/>
            </td>
            <td colspan="6" width="5%">&nbsp;
            </td>
          </tr>
          <tr>
            <td width="33%">&nbsp;</td>
            <td nowrap width="8%">Promotor</td>
            <td>
              <select size="1" name="paramPromotor" id="paramPromotor" ref="clavePromotor" fun="loadComboElement" keyValue="ejeNumEjecAtenc" theValue="ejeNomEjecutivo" next="paramStatus"/>
            </td>
            <td colspan="6" width="5%">&nbsp;
            </td>
          </tr>
          <tr>
            <td width="33%">&nbsp;</td>
            <td nowrap width="8%">Status</td>
            <td>
              <select size="1" name="paramStatus" id="paramStatus" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="formsLoaded" param="clavesCombo161"/>
            </td>
            <td colspan="6" width="5%">&nbsp;
            </td>
          </tr>
          <tr>
            <td colspan="9">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="9" height="100%" align="center">&nbsp;
              <input type="BUTTON" id="Aceptar" name="cmdAceptar" value="Aceptar" class="boton" ref="muestraDatosFichaConstitucion" fun="loadTableElement" tabla="tablaRegistrosDatosFichaConstitucion" onclick="consultar(this, GI('frmPrincipalConstitucion'), false);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="BUTTON" value=" Limpiar " name="cmdLimpiar" class="boton" onclick="RF(GI('frmPrincipalConstitucion'));"/>
            </td>
          </tr>
          <tr>
            <td colspan="9">
              
              <input type="text" name="paramorder" id="paramorder" style="position:absolute;visibility:hidden;" value="s"/>&nbsp;
            </td>
          </tr>
          <tr>
            <td colspan="9" class="subtitulo" align="center">Consulta de Prospectos</td>
          </tr>
          <tr>
            <td colspan="9">
              <table cellspacing="0" cellpadding="0" border="0">
                <tr class="cabeceras">
                  <td width="23px">&nbsp;</td>
                  <td width="70px">Prospecto</td>
                  <td width="250px">Nombre</td>
                  <td width="90px">Fec. Apertura</td>
                  <td width="250px">Tipo de Negocio</td>
                  <td width="160px">Clasif.Producto</td>
                  <td width="90px">Status</td>
                  <td width="70px">Contrato</td>
                </tr>
              </table>
              <div style="height:350px; overflow:auto; position:relative; vertical-align:top; width:1010px;">
                <table id="tablaRegistrosDatosFichaConstitucion" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaDatosFichaConstitucionData"  keys="antNumProspecto,antCveStProspec" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
