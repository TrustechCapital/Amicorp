<FORM name="frmDomicilioFiscalHonorariosConsulta" id="frmDomicilioFiscalHonorariosConsulta" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td align="center" height="100%" class="titulo">Domicilio Fiscal del Fideicomiso</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <tr valign="middle">
              <td width="35%">&nbsp;</td>
              <td width="10%">No. Fideicomiso</td>
              <td>
                <input type="text" name="paramNumFiso" id="paramNumFiso" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td width="35%">&nbsp;</td>
              <td width="10%">RFC</td>
              <td>
                <input type="text" name="paramRfc" id="paramRfc" tipo="AlphaNumeric" size="13" maxlength="255"/>
              </td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td width="35%">&nbsp;</td>
              <td width="10%">Nombre</td>
              <td>
                <input type="text" name="paramNombre" id="paramNombre" tipo="AlphaNumeric" size="40" maxlength="255"/>
              </td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="4" align="center" valign="middle">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="4" align="center" valign="middle">
              <table width="224" cellpadding="0" cellspacing="0">
                <tr>
                <td width="112"  align="center" valign="middle">
                  <input type="BUTTON" id="Aceptar" name="Aceptar" value="Aceptar" class="boton_left" onmouseover="this.className='boton_leftSobre'" onmouseout="this.className='boton_left';" ref="muestraDatosDomicilioFiscalHonorarios" fun="loadTableElement" tabla="tablaRegistrosDomicilioFiscalHonorarios" onclick="consultar(this, GI('frmDomicilioFiscalHonorariosConsulta'), false);"/>
                  </td>
                  <td width="112" align="center" valign="middle">
                  <input type="BUTTON" value="Limpiar" name="cmdLimpiar" size="20%" class="boton_right" onmouseover="this.className='boton_rightSobre'" onmouseout="this.className='boton_right';" onclick="RF(GI('frmDomicilioFiscalHonorariosConsulta'));"/>
                </td>
                </tr>
            </table>
                
                
              </td>
            </tr>
            <tr>
              <td colspan="4" align="center" valign="middle">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="4" align="center" valign="middle">
              <table cellpadding="0" cellspacing="0">
                <tr>                  
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="  Alta   " id="cmdAlta" name="cmdAlta" onmouseover="this.className='boton_leftSobre'" onmouseout="this.className='boton_left';" class="boton_left" onclick="cargaMantenimientoDomicilioFiscalHonorarios(1)"/> </td>
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="Modificar" id="cmdModificar" name="cmdModificar" onmouseover="this.className='boton_middleSobre'" onmouseout="this.className='boton_middle';" class="boton_middle" onclick="cargaMantenimientoDomicilioFiscalHonorarios(2)"/> </td>
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="  Baja   " id="cmdBaja" name="cmdBaja" onmouseover="this.className='boton_middleSobre'" onmouseout="this.className='boton_middle'" class="boton_middle" onclick="eliminarRegistro();"/> </td>
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="Consultar" id="cmdConsultar" name="cmdConsultar" onmouseover="this.className='boton_rightSobre'" onmouseout="this.className='boton_right';" class="boton_right" onclick="cargaMantenimientoDomicilioFiscalHonorarios(3)"/> </td>                   
                  </td>
                </tr>
            </table>               
              </td>
            </tr>
            <tr>
              <td colspan="4" align="center" valign="middle">&nbsp;</td>
            </tr>
            <tr align="center">
              <td colspan="4">
                <table cellspacing="0" cellpadding="0" border="0">
                  <tr align="left" class="cabeceras">
                    <td width="23px" align="center">&nbsp;</td>
                    <td width="85px">Fideicomiso</td>
                    <td width="300px">Domicilio</td>
                    <td width="100px">RFC</td>
                    <td width="300px">Nombre</td>
                  </tr>
                </table>
                <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:845px;">
                  <table id="tablaRegistrosDomicilioFiscalHonorarios" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaDomicilioFiscalHonorariosData" keys="dfNumContrato" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                  </table>
                </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
  </table>
</FORM>
