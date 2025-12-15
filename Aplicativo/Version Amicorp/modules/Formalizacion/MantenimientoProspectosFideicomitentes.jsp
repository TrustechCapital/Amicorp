<FORM name="frmDatosMantenimientoFideicomitentes" id="frmDatosMantenimientoFideicomitentes" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Fideicomitentes</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table border="0" width="100%" class="texto">
            <tr>
              <td width="25%">&nbsp;</td>
              <td width="10%" nowrap>Proyecto</td>
              <td>
                <input type="text" name="afbAnteproyecto" id="afbAnteproyecto" tipo="Num" size="10" maxlength="10" onblur="consultarExistenciaFideicomitente();" required message="El Anteproyecto es un campo obligatorio"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">&nbsp;</td>
              <td width="10%" nowrap>Nombre del Proyecto</td>
              <td>
                <input type="text" name="txtNomProyecto" id="txtNomProyecto" size="50" maxlength="50"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">&nbsp;</td>
              <td width="10%" nowrap>Tipo Persona</td>
              <td>
                <input type="text" name="txtTipoPersona" id="txtTipoPersona" size="50" maxlength="50"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">&nbsp;</td>
              <td width="10%" nowrap>Tipo Negocio</td>
              <td>
                <input type="text" name="txtTipoNegocio" id="txtTipoNegocio" size="50" maxlength="50"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">&nbsp;</td>
              <td width="10%" nowrap>Clasificacion</td>
              <td>
                <input type="text" name="txtClasificacion" id="txtClasificacion" size="50" maxlength="50"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>		
            <tr>
              <td width="25%">&nbsp;</td>
              <td width="10%" nowrap>Producto</td>
              <td>
                <input type="text" name="txtProducto" id="txtClasificacion" size="50" maxlength="50"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>				
            <tr>
              <td width="25%">&nbsp;
              </td>
              <td colspan="2">
                <hr/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">&nbsp;</td>
              <td width="10%" nowrap>N&uacute;mero</td>
              <td>
                <input type="text" name="afbNumFidben" id="afbNumFidben" tipo="Num" size="10" maxlength="10" required message="El Número es un campo obligatorio"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">&nbsp;</td>
              <td width="10%" nowrap>Nombre</td>
              <td>
                <input type="text" name="afbNomFidben" id="afbNomFidben" size="50" maxlength="50" required message="El Nombre es un campo obligatorio"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
             
             <tr>
              <td width="25%">&nbsp;</td>
              <td width="10%" nowrap>Tipo Persona</td>
              <td>
                <select id="afbTipoPersona" name="afbTipoPersona" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="afbNomPais" param="clavesCombo23" required message="El Tipo de Persona es un campo obligatorio"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            
            <tr>
              <td width="25%">&nbsp;</td>
              <td width="10%" nowrap>Pa&iacute;s</td>
              <td>
                <select id="afbNomPais" name="afbNomPais" ref="clavePais" fun="loadComboElement" keyValue="paiNomPais" theValue="paiNomPais" next="loadCatalogo" required message="El País es un campo obligatorio" onchange="cargaParamComboEstado(this,false);"/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td width="60%" height="100%">&nbsp;</td>
      </tr>
      <div style="position:absolute;visibility:hidden">
        <input type="text" name="afbCurp" id="afbCurp" value=""/>
        <input type="text" name="afbTelFidben" id="afbTelFidben" value=""/>
        <input type="text" name="afbCvePersona" id="afbCvePersona" value="FIDEICOMITENTE"/>
        <input type="text" name="afbCveStFidBen" id="afbCveStFidBen" value="ACTIVO"/>
        <input type="text" name="afbCalleNum" id="afbCalleNum" value=""/>
        <input type="text" name="afbNomColonia" id="afbNomColonia" value=""/>
        <input type="text" name="afbNomPoblacion" id="afbNomPoblacion" value=""/>
        <input type="text" name="afbNomMunicipio" id="afbNomMunicipio" value=""/>
        <input type="text" name="afbNomEstado" id="afbNomEstado" value=""/>
        <input type="text" name="afbCodigoPostal" id="afbCodigoPostal" value=""/>
      </div>
      <tr align="center">
        <td height="100%">
          <input type="button" value="Aceptar " name="cmdAceptar" class="boton" onclick="AltaOModificaInfo();" style="visibility:hidden"/>
          <input type="BUTTON" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="cargaPrincipalProspectosFideicomitentes();" style="visibility:hidden"/>
           <input type="BUTTON" value="Ir a KYC" name="cmdKYC" class="boton" onclick="cargaCheckList();" style="visibility:hidden"/>
        </td>
      </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>
<table cellpadding="0" cellspacing="0" width="1168" height="640" id="ContenedorKYC" style="visibility:hidden;">
  <tr>
    <td colspan="2" width="1168" align="right" height="40" class="AcotacionesKYC"></td>    
  </tr>
  <tr>
    <td width="168" align="right" height="600" style="vertical-align:top;"><div id="cargaCheck"></div></td>
    <td width="1000" align="center" height="600" style="background-color: #E4E4E4;"><div id="cargaConceptos" style="vertical-align:top;"><div style="color: #CCCCCC;font-size: 70px;font-weight: bold;">KYC</div></div></td>
  </tr>
</table>
