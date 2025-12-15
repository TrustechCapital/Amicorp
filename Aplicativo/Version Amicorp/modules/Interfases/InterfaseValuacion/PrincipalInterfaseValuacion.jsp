<form name="frmDatosInterfase" id="frmDatosInterfase" onsubmit=" ">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Personas Bloqueadas</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto">
          <tr valign="middle">
            <td align="left" class="subtitulo" width="29%">&nbsp;</td>
            <td align="left" class="subtitulo" colspan="2">&nbsp;</td>
            <td align="left" class="subtitulo" width="24%">&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td colspan="4" align="center" class="subtitulo" width="30%">
              <a id="ligaArchivo" href="#" style="visibility:hidden">Archivo</a>
            </td>
          </tr>
          <tr valign="middle">
            <td align="left" width="19%">&nbsp;</td>
            <td align="right" width="13%">Fecha Valor
            </td>
            <td align="left" width="44%">
              <input type="text" name="txtFechaValor" id="txtFechaValor" size="10" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="cmbTipoLiq" maxlength="10" tipo="Fecha" required message="La Fecha Valor es un campo obligatorio" style="width:150px;"/>
            </td>
            <td align="left" width="24%">&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td align="left" width="29%">&nbsp;</td>
            <td align="right" nowrap width="3%">Nombre Archivo</td>
            <td align="left" nowrap width="44%">
              <input type="text" name="txtNomArch" id="txtNomArch" size="30"  maxlength="30" required message="El Nombre Archivo es un campo obligatorio" style="width:150px;"/>
            </td>
            <td align="left" width="24%">&nbsp;</td>
          </tr>
		  
        </table>
      </td>
    </tr>
    <tr>
              <td colspan="2">
                <hr/>
              </td>
            </tr>
    <tr>
              <td colspan="2">
                <iframe id="frameUpload" name="frameUpload" align="center" style="z-index:1;visibility:visible;" src="<%=request.getContextPath()%>/modules/Interfases/InterfaseValuacion/ValuacionUpload.do" frameborder="0" scrolling="no" width="600" height="50" AllowTransparency></iframe>
                <div id="dvInterface" class="texto"></div>
              </td>
            </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center">&nbsp;
        <input type="button" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaFuncion();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" value="Cargar Personas" name="cmdVaciar" id="cmdVaciar" class="boton" onclick="ejecutaStoreInterfase();"/>&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" value="Limpiar" name="cmdLimpiar" id="cmdLimpiar" class="boton" onclick="onButtonClickPestania('Interfases.InterfaseValuacion.PrincipalInterfaseValuacion','');"/>
        
        
      </td>
    </tr>
  </table>
</form>
