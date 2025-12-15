<FORM name="frmDatosProspectosConsulta" id="frmDatosProspectosConsulta" onsubmit="">
<table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Prospectos</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" class="texto" align="center">
          <tr>
            <td width="20%">&nbsp;</td>
            <td>Prospecto</td>
            <td>
              <input type="text" name="paramProspecto" id="paramProspecto" tipo="Num" size="10" maxlength="10"/>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;
            </td>
            <td width="10%">&nbsp;
            </td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td>Nombre</td>
            <td colspan="3">
              <input type="text" name="paramNombreProspecto" id="paramNombreProspecto" size="50" maxlength="50"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td>Tipo de Negocio</td>
            <td>
              <select size="1" name="paramTiposNegocioProspecto" id="paramTiposNegocioProspecto" ref="claves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" next="paramStatus" param="clavesCombo148"/>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;
            </td>
            <td width="10%">&nbsp;
            </td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td>Status:</td>
            <td>
              <select id="paramStatus" name="paramStatus" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="formsLoaded" param="clavesCombo161"/>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="6" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
         
          <tr>
            <td width="100%" colspan="6" align="center" valign="middle">&nbsp;
              
               <table width="224" cellpadding="0" cellspacing="0">
              <tr>
              <td width="112"  align="center" valign="middle">
                <input type="BUTTON" id="Aceptar" name="cmdAceptar" value="Aceptar" class="boton_left" onmouseover="this.className='boton_leftSobre'" onmouseout="this.className='boton_left';" ref="muestraProspectos" fun="loadTableElement" tabla="tablaRegistrosProspectos" onclick="consultar(this, GI('frmDatosProspectosConsulta'), false);"/>
                </td>
                <td width="112" align="center" valign="middle">
                <input type="BUTTON" name="cmdLimpiar" value="Limpiar" class="boton_right" onmouseover="this.className='boton_rightSobre'" onmouseout="this.className='boton_right';" onclick="RF(GI('frmDatosProspectosConsulta'));"/>
              
              </td>
              </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td colspan="6" align="center">&nbsp;</td>
          </tr>
          <tr>
          
            <td colspan="6" align="center">
              <table cellpadding="0" cellspacing="0">
                <tr>                  
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="  Alta   " id="cmdAlta" name="cmdAlta" onmouseover="this.className='boton_leftSobre'" onmouseout="this.className='boton_left';" class="boton_left" onclick="cargaMantenimientoProspectos(1);"/> </td>
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="Modificar" id="cmdModificar" name="cmdModificar" onmouseover="this.className='boton_middleSobre'" onmouseout="this.className='boton_middle';" class="boton_middle" onclick="cargaMantenimientoProspectos(2);"/> </td>
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="  Baja   " id="cmdBaja" name="cmdBaja" onmouseover="this.className='boton_middleSobre'" onmouseout="this.className='boton_middle'" class="boton_middle" onclick="eliminarRegistro();"/> </td>
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="Consultar" id="cmdConsultar" name="cmdConsultar" onmouseover="this.className='boton_rightSobre'" onmouseout="this.className='boton_right';" class="boton_right" onclick="cargaMantenimientoProspectos(3);"/> </td>
                          
                  </td>
                </tr>
          </table>
            </td>
          </tr>
          <tr>
            <td colspan="6" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="6" height="37">
              <table cellspacing="0" cellpadding="0" border="0" width="100%" align="center" class="texto">
                <tr class="cabeceras">
                  <td width="23">&nbsp;</td>
                  <td width="42">No.</td>
                  <td width="364">Nombre</td>
                  <td width="131">Tipo de Negocio</td>
                  <td width="118">Fecha de Inicio</td>
                  <td width="111">Fecha Const.</td>
                  <td width="88">Contrato</td>
                  <td width="107">Status</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:100%;">
                <table id="tablaRegistrosProspectos" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaProspectosData" keys="prsNumProspecto,prsCveStatus" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
</table>
</FORM>
