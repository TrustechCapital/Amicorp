<FORM name="frmDatosAtencionConsulta" id="frmDatosAtencionConsulta" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Atenci&oacute;n</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto">
            <tr valign="middle">
              <td width="20%">&nbsp;</td>
              <td>No. Fideicomiso</td>
              <td>
                <input name="paramNumContrato" id="paramNumContrato" size="10" tipo="Num" required/>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="20%">&nbsp;</td>
              <td>Nombre</td>
              <td>
                <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
              </td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="20%">&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="100%" colspan="4" align="center" class="subtitulo">Ejecutivos Asignados al Fideicomiso</td>
            </tr>
            <tr align="center">
              <td colspan="4">
                <table cellspacing="0" cellpadding="0" border="0">
                  <tr align="left" class="cabeceras">
                    <td width="23px" nowrap>&nbsp;</td>
                    <td width="70px" nowrap>Fideicomiso</td>
                    <td width="90px" nowrap>Banca</td>
                    <td width="70px" nowrap>N&uacute;mero</td>
                    <td width="300px" nowrap>Nombre</td>
                    <td width="70px" nowrap>Est Nivel 1</td>
                    <td width="70px" nowrap>Est Nivel 2</td>
                    <td width="70px" nowrap>Est Nivel 3</td>
                    <td width="70px" nowrap>Est Nivel 4</td>
                    <td width="70px" nowrap>Est Nivel 5</td>
                  </tr>
                </table>
                <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:940px;">
                  <table id="tablaRegistrosEjecutivosAsignadosAlFideicomiso" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaEjecutivosAsignadosAlFideicomisoData" keys="ateCveBanca,ateEjecAtencion,ateNumContrato" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                  </table>
                </div>
              </td>
            </tr>
            <tr>
              <td width="100%" colspan="4" align="center">
                <input type="button" id="hdRegistrosAtencion" name="hdRegistrosAtencion" ref="muestraEjecutivosAsignadosAlFideicomiso" fun="loadTableElement" tabla="tablaRegistrosEjecutivosAsignadosAlFideicomiso" param="varNumContrato" style="visibility:hidden"/>
                <input type="button" id="hdRegistrosEjecutivos" name="hdRegistrosEjecutivos" ref="muestraEjecutivos" fun="loadTableElement" tabla="tablaRegistrosEjecutivos" style="visibility:hidden"/>
              </td>
            </tr>
            <tr>
              <td width="100%" colspan="4" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <!--input type="BUTTON" id="Aceptar" name="Aceptar" value="Aceptar" class="boton" ref="muestraEjecutivosAsignadosAlFideicomiso" fun="loadTableElement" tabla="tablaRegistrosEjecutivosAsignadosAlFideicomiso" onclick="consultar(this, GI('frmDatosAtencionConsulta'), false);"-->
                <input type="BUTTON" value="   Alta   " name="cmdAlta" class="boton"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              </td>
            </tr>
            <tr>
              <td width="100%" colspan="4" align="center">&nbsp;</td>
            </tr>
            <tr>
              <td width="100%" colspan="4" align="center" class="subtitulo">Ejecutivos</td>
            </tr>
            <tr align="center">
              <td colspan="4">
                <table cellspacing="0" cellpadding="0" border="0">
                  <tr align="left" class="cabeceras">
                    <td width="23px" nowrap>&nbsp;</td>
                    <td width="90px" nowrap>Banca</td>
                    <td width="70px" nowrap>N&uacute;mero</td>
                    <td width="300px" nowrap>Nombre</td>
                    <td width="200px" nowrap>Tipo Ejecutivo</td>
                    <td width="70px" nowrap>Lada</td>
                    <td width="80px" nowrap>Tel&eacute;fono</td>
                    <td width="70px" nowrap>Ext</td>
                  </tr>
                </table>
                <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:940px;">
                  <table id="tablaRegistrosEjecutivos" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaEjecutivosData" keys="ejeCveBanca,ejeNumEjecAtenc" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
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
          <input type="BUTTON" value="  Baja  " name="cmdBaja" class="boton"/>
          <input type="BUTTON" value="Regresar" name="cmdCancelar" class="boton" onclick="cargaMantenimientoFideicomisos2Tab();"/>
        </td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
  </table>
</FORM>
