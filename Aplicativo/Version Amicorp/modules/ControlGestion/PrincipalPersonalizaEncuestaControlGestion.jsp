<FORM name="frmPrincipalPersonalizaEncuestaControlGestion" id="frmPrincipalPersonalizaEncuestaControlGestion" onsubmit="">
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
            <td width="30%">&nbsp;</td>
            <td width="9%" nowrap>No. Pregunta</td>
            <td>
              <input type="text" name="paramNoPregunta" id="paramNoPregunta" tipo="Num" size="10" maxlength="5"/>
            </td>
            <td colspan="3" width="5%">&nbsp;
            </td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="9%" nowrap>Descripci&oacute;n</td>
            <td>
              <input type="text" name="paramDescPregunta" id="paramDescPregunta" tipo="AlphaNumeric" size="40" maxlength="100"/>
            </td>
            <td colspan="3" width="5%">&nbsp;
            </td>
          </tr>
          <tr>
            <td colspan="6" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="6" align="center">
              <input type="BUTTON" value="Aceptar" id="cmdAceptar" name="cmdAceptar" class="boton" ref="muestraDatosPreguntas" fun="loadTableElement" tabla="tablaRegistrosDatosPreguntas" onclick="consultar(this, GI('frmPrincipalPersonalizaEncuestaControlGestion'), false);"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="BUTTON" value="Limpiar" id="cmdLimpiar" name="cmdLimpiar" class="boton" onclick="RF(GI('frmPrincipalPersonalizaEncuestaControlGestion'));"/>
            </td>
          </tr>
          <tr>
            <td colspan="6">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="6" align="center">
              <input type="BUTTON" value="  Alta   " id="cmdAlta" name="cmdAlta" class="boton" onclick="cargaMantenimientoPersonalizaEncuenstaControlGestion(1);"/>
              <input type="BUTTON" value="Modificar" id="cmdModificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoPersonalizaEncuenstaControlGestion(2);"/>
              <input type="BUTTON" value="  Baja   " id="cmdBaja" name="cmdBaja" class="boton" onclick="eliminarRegistroPreguntas();"/>
              <input type="BUTTON" value="Consultar" id="cmdConsultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoPersonalizaEncuenstaControlGestion(3);"/>
              <input type="BUTTON" value=" Incisos " id="cmdIncisos" name="cmdIncisos" class="boton" onclick="cargaPrincipalPersonalizaEncuenstaIncisosControlGestion();"/>
            </td>
          </tr>
          <tr>
            <td colspan="6">&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="6">
              <table cellspacing="0" cellpadding="0" border="0">
                <tr class="cabeceras">
                  <td width="23px">&nbsp;</td>
                  <td width="100px">No. Pregunta</td>
                  <td width="300px">Descripci&oacute;n</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:460px;">
                <table id="tablaRegistrosDatosPreguntas" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaDatosPreguntasData" keys="pecNumPregunta" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
