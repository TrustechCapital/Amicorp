<FORM name="frmDatos" id="frmDatos">
<table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
  <tr>
    <td rowspan="7" width="10%" height="100%">&nbsp;</td>
    <td height="100%">&nbsp;</td>
    <td rowspan="7" width="10%" height="100%">&nbsp;</td>
  </tr>
  <tr>
    <td align="center" height="100%" class="titulo">Administraci&oacute;n de Cuentas</td>
  </tr>
  <tr>
    <td height="100%">&nbsp;</td>
  </tr>
  <tr>
    <td height="100%">
      <table width="90%" class="texto">
        <tr>
          <td width="40%">&nbsp;</td>
          <td width="10%">
            <input type="radio" name="rdTipo" id="rdStatus" class="radio" required message="El Tipo de Consulta es un campo obligatorio" onclick="muestraObj('paramFecha'); muestraObj('paramStatus'); muestraObj('dvFecha'); paramCuenta.value = ''; ocultaObj('paramCuenta');  RA(paramCuenta,'required'); SA(paramStatus,'required','true')"/>&nbsp;Status
          </td>
          <td>
            <select id="paramStatus" name="paramStatus" message="El Status es un campo obligatorio">
              <option value="-1">-- Seleccione --</option>
              <option value="ACEPTADA">ACEPTADA</option>
              <option value="CAPTURADA">CAPTURADA</option>
              <option value="CANCELADA">CANCELADA</option>
              <option value="NO ASIGNADA">NO ASIGNADA</option>
              <option value="PENDIENTE">PENDIENTE</option>
              <option value="RECHAZADA">RECHAZADA</option>
            </select>
          </td>
          <td width="20%">&nbsp;</td>
        </tr>
        <tr>
          <td width="30%">&nbsp;</td>
          <td>
             <div id="dvFecha" style="visibility:hidden" align="center">&nbsp;&nbsp;&nbsp;Fecha:</div>
          </td>
          <td>
          <!--<input type="text" name="paramFecha" id="paramFecha" tipo="Fecha" size="10" maxlength="10"/>-->
            <input type="text" name="paramFecha" id="paramFecha" tipo="Fecha" size="10" required message="La fecha es un campo obligatorio" style="visibility:hidden"/>
          </td>
          <td width="20%">&nbsp;</td>
        </tr>
        <tr>
          <td width="30%">&nbsp;</td>
          <td width="15%">
            <input type="radio" name="rdTipo" id="rdCuenta" class="radio" onclick="muestraObj('paramCuenta'); paramStatus.selectedIndex = 0; ocultaObj('paramStatus'); ocultaObj('paramFecha'); ocultaObj('dvFecha'); RA(paramStatus,'required'); SA(paramCuenta,'required','true')" onchange="limpiaObj();"/>No. de Cuenta
          </td>
          <td>
            <input type="text" name="paramCuenta" id="paramCuenta" size="20" maxlength="9" message="El No. de Cuenta es un campo obligatorio"/>
          </td>
          <td width="20%">&nbsp;</td>
        </tr>
        
        <tr>
          <td width="30%">&nbsp;</td>
          <td width="15%"><div id="dvMotRechazo" style="visibility:hidden" align="center">Motivo de Rechazo</div></td>
          <td>
            <input type="text" name="paramMotRechazo" id="paramMotRechazo" size="50" maxlength="50" style="visibility:hidden"/>
          </td>
          <td width="20%">&nbsp;</td>
         </tr> 
        
        <tr>
          <td align="center" colspan="4">
            <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            <input type="text" name="FechaContable" id="FechaContable" size="10" maxlength="10" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="formsLoaded" style="visibility:hidden"/>          
        </tr>
        
        <tr>
          <td align="center" colspan="4">&nbsp;
            <input type="BUTTON" name="cmdAceptarC" id="cmdAceptarC" value="Aceptar" class="boton" ref="conPriAdmCue" fun="loadTableElement" tabla="tblRegPriAdmCue" onclick="consultarYOcultarBotones(this,frmDatos,false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="BUTTON" name="cmdLimpiarC" id="cmdLimpiarC" value="Limpiar" class="boton" onclick="cargaPrincipalAdministracionCuentas();"/>
          </td>
        </tr>
        <tr>
          <td align="center" colspan="4">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="4" class="subtitulo" align="center">Cuentas TEF &oacute; SPEI</td>
        </tr>
        <tr>
          <td colspan="4">
            <table cellspacing="0" cellpadding="0"   border="0">
              <tr>
                <td class="cabeceras" width="20" nowrap>&nbsp;</td>
                <td class="cabeceras" width="83" nowrap>Fideicomiso</td>
                <td class="cabeceras" width="200" nowrap>Titular</td>
                <td class="cabeceras" width="120" nowrap>Cuenta</td>
                <td class="cabeceras" width="70" nowrap>Clave Cta</td>  
                <td class="cabeceras" width="102" nowrap>Fecha Captura</td>
                <td class="cabeceras" width="150" nowrap>Tipo Cuenta</td>
                <td class="cabeceras" width="100" nowrap>Status</td>
                <td class="cabeceras" width="100" nowrap>Status Cuenta</td>

              </tr>
            </table>
            <div style="height:150px; overflow:auto; position:relative; vertical-align:top; weidht:100%;">
              <table id="tblRegPriAdmCue" border="0" cellspacing="0" cellpadding="0" dataInfo="tblRegAdmCueDat" keys="fideicomiso,titular,rfc,cuenta,statusCta,folio,status,claveCta,banco,fechaCaptura,tipoCuenta,claveBanco" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda"/>
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
      <td width="60%" height="100%" align="center">
        <a id="linkReporte" href="#" style="visibility:hidden">Archivo</a> 
        <a id="linkReporteNew" href="#" style="visibility:hidden" target="_new">Archivo</a>
        <input type="hidden" id="refSP" name="refSP" value=""/>
        <input type="hidden" id="refQry" name="refQry" value="getCuentasRechazadas"/>
        <input type="hidden" id="paramurlReporte" name="paramurlReporte" value="/jsp/Reportes/ControlGestion/EnviarCorreo.jsp"/>
        <input type="hidden" id="paramsendToJSP" name="paramsendToJSP" value="true"/>
        
      </td>
    </tr>  
  <tr>
    <td height="100%" align="center">
      <input type="button" value=" Aceptar " name="cmdAceptar" class="boton" onclick="cargaMantenimientoAdministracionCuentas(5)"/>
      <input type="button" value="Cancelar " name="cmdCancelar" class="boton" onclick="cargaMantenimientoAdministracionCuentas(6)"/>
      <input type="button" value=" Rechazar" name="cmdRechazar" class="boton" onclick="cargaMantenimientoAdministracionCuentas(7);"/>
      <input type="button" value="Modificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoAdministracionCuentas(2)"/>
      <input type="button" value="Reporte" name="cmdReporte" class="boton" onclick="desplegarPantallaReporte(this.value);"/>
    </td>
  </tr>
  <tr>
    <td height="100%">&nbsp;</td>
  </tr>
</table>
</FORM>