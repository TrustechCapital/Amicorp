<FORM name="frmPrincipalPersonalizaEncuestaIncisosControlGestion" id="frmPrincipalPersonalizaEncuestaIncisosControlGestion" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Personaliza Encuesta</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table cellspacing="3" cellpadding="2" border="0" width="100%" class="texto">
          <tr>
            <td width="45%">&nbsp;</td>
            <td width="8%" nowrap>No. Pregunta</td>
            <td>
              <input type="text" name="paramNoPregunta" id="paramNoPregunta" tipo="Num" size="10" maxlength="5"/>
            </td>
            <td colspan="3" width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="6" align="center">
              <input type="BUTTON" value="Aceptar" id="hdRegistrosIncisos" name="hdRegistrosIncisos" ref="muestraDatosIncisos" fun="loadTableElement" tabla="tablaRegistrosDatosIncisos" style="visibility:hidden"/>
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="6" align="center">
              <input type="BUTTON" value="  Alta   " id="cmdAlta" name="cmdAlta" class="boton" onclick="cargaMantenimientoPersonalizaEncuenstaIncisosControlGestion(1);"/>
              <input type="BUTTON" value="Modificar" id="cmdModificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoPersonalizaEncuenstaIncisosControlGestion(2);"/>
              <input type="BUTTON" value="  Baja   " id="cmdBaja" name="cmdBaja" class="boton" onclick="eliminarRegistroIncisos();"/>
              <input type="BUTTON" value="Consultar" id="cmdConsultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoPersonalizaEncuenstaIncisosControlGestion(3);"/>
              <input type="BUTTON" value="Regresar " id="cmdRegresar" name="cmdRegresar" class="boton" onclick="cargaPrincipalPersonalizaEncuestaControlGestion();"/>
            </td>
          </tr>
          <tr>
            <td colspan="6">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="6" class="subtitulo" align="center">INCISOS DE LA ENCUESTA</td>
          </tr>
          <tr align="center">
            <td colspan="6">
              <table cellspacing="0" cellpadding="0" border="0">
                <tr class="cabeceras">
                  <td width="23px">&nbsp;</td>
                  <td width="90px">No. Inciso</td>
                  <td width="500px">Descripci&oacute;n</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:650px;">
                <table id="tablaRegistrosDatosIncisos" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaDatosIncisosData" keys="ienNumInciso,ienNumPregunta" fun="clickTabla" radioWidth="35">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
