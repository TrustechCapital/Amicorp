<FORM name="frmDatosHonorariosConsulta" id="frmDatosHonorariosConsulta" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Honorarios</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" class="texto" align="center">
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="10%">Proyecto</td>
            <td>
              <input type="text" name="paramProyecto" id="paramProyecto" tipo="Num" size="10" maxlength="10"/>
            </td>
            <td width="10%">&nbsp;
            </td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="10%">D&iacute;a de corte</td>
            <td>
              <input type="text" name="paramDiaCorte" id="paramDiaCorte" tipo="Num" size="2" maxlength="2"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="10%">Periodicidad</td>
            <td>
              <select size="1" name="paramPeriodicidad" id="paramPeriodicidad" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="paramStatus" param="clavesCombo9"/>
            </td>
            <td width="10%">&nbsp;
            </td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="10%">Status:</td>
            <td>
              <select id="paramStatus" name="paramStatus" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="formsLoaded" param="clavesCombo31"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td width="100%" colspan="4" align="center" valign="middle">
            <table width="224" cellpadding="0" cellspacing="0">
                <tr>
                <td width="112"  align="center" valign="middle">
                  <input type="BUTTON" id="Aceptar" name="Aceptar" value="Aceptar" class="boton_left" onmouseover="this.className='boton_leftSobre'" onmouseout="this.className='boton_left';" ref="muestraDatosHonorarios" fun="loadTableElement" tabla="tablaRegistrosHonorarios" onclick="consultar(this, GI('frmDatosHonorariosConsulta'), false);">
                  </td>
                  <td width="112" align="center" valign="middle">
                  <input type="BUTTON" value="Limpiar" name="cmdLimpiar" class="boton_right" onmouseover="this.className='boton_rightSobre'" onmouseout="this.className='boton_right';"  onclick="RF(GI('frmDatosHonorariosConsulta'));"/>                
                </td>
                </tr>
              </table>
              
              
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
            <table cellpadding="0" cellspacing="0">
                <tr>                  
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="  Alta   " id="cmdAlta" name="cmdAlta" onmouseover="this.className='boton_leftSobre'" onmouseout="this.className='boton_left';" class="boton_left" onclick="cargaMantenimientoHonorarios(1)"/> </td>
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="Modificar" id="cmdModificar" name="cmdModificar" onmouseover="this.className='boton_middleSobre'" onmouseout="this.className='boton_middle';" class="boton_middle" onclick="cargaMantenimientoHonorarios(2)"/> </td>
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="  Baja   " id="cmdBaja" name="cmdBaja" onmouseover="this.className='boton_middleSobre'" onmouseout="this.className='boton_middle'" class="boton_middle" onclick="eliminarRegistro();"/> </td>
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="Consultar" id="cmdConsultar" name="cmdConsultar" onmouseover="this.className='boton_rightSobre'" onmouseout="this.className='boton_right';" class="boton_right" onclick="cargaMantenimientoHonorarios(3)"/> </td>                   
                  </td>
                </tr>
                </table>  
              
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" height="37" align="center">
              <table cellspacing="0" cellpadding="0" border="0" align="center" class="texto">
                <tr class="cabeceras">
                  <td width="23">&nbsp;</td>
                  <td width="80">Proyecto</td>
                  <td width="300">Nombre</td>
                  <td width="100">D&iacute;a de corte</td>
                  <td width="200">Periodicidad</td>
                  <td width="100">Status</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:100%;">
              <table id="tablaRegistrosHonorarios" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaHonorariosData" keys="ahoAnteproyecto" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
              </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  <tr align="center">
    <td height="100%">&nbsp;</td>
  </tr>
  </table>
</FORM>
