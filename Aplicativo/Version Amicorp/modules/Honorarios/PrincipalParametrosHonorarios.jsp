<FORM name="frmParametrosHonorariosConsulta" id="frmParametrosHonorariosConsulta" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td align="center" height="100%" class="titulo">Par&aacute;metros de Honorarios</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <tr valign="middle">
              <td width="25%">&nbsp;</td>
              <td width="10%">No. Fideicomiso</td>
              <td>
                <input type="text" name="paramNumFiso" id="paramNumFiso" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">&nbsp;</td>
              <td width="10%">Nombre</td>
              <td>
                <input type="text" name="paramNomFiso" id="paramNomFiso" size="50" maxlength="80"/>
              </td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">&nbsp;</td>
              <td width="10%">&nbsp;</td>
              <td>
                <input type="radio" name="rdFormaCalc" id="rdExento" class="radio" onclick="GI('paramFormaCalc').value='EXENTO'"/>Exento
              </td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">&nbsp;</td>
              <td width="10%">&nbsp;</td>
              <td>
                <input type="radio" name="rdFormaCalc" id="rdCuotaFija" class="radio" onclick="GI('paramFormaCalc').value='IMPORTE FIJO'"/>Cuota Fija
              </td>
              <td width="5%" align="left">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">&nbsp;</td>
              <td width="10%">&nbsp;</td>
              <td align="left">
                <input type="radio" name="rdFormaCalc" id="rdPjePactado" class="radio" onclick="GI('paramFormaCalc').value='PORCENTAJE FIJO VALOR'"/>% Pactado
              </td>
              <td width="5%" align="left">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">&nbsp;</td>
              <td width="10%">&nbsp;</td>
              <td align="left">
                <input type="radio" name="rdFormaCalc" id="rdPjeMillar" class="radio" onclick="GI('paramFormaCalc').value='MILLAR VALOR'"/>% Al Millar
              </td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">&nbsp;</td>
              <td width="10%">&nbsp;</td>
              <td>
                <input type="radio" name="rdFormaCalc" id="rdTablaSaldo" class="radio" onclick="GI('paramFormaCalc').value='TABLA SALDO'"/>Tabla Saldo
              </td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">&nbsp;</td>
              <td width="10%">&nbsp;</td>
              <td>
                <input type="radio" name="rdFormaCalc" id="rdTablaValor" class="radio" onclick="GI('paramFormaCalc').value='TABLA VALOR'"/>Tabla Valor
              </td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="4" align="center" valign="middle">
              <br>
              <table width="224" cellpadding="0" cellspacing="0">
                <tr>
                <td width="112"  align="center" valign="middle">
                  <input type="BUTTON" id="Aceptar" name="Aceptar" value="Aceptar" class="boton_left" onmouseover="this.className='boton_leftSobre'" onmouseout="this.className='boton_left';" ref="muestraDatosParametrosHonorarios" fun="loadTableElement" tabla="tablaRegistrosParametrosHonorarios" onclick="consultar(this, GI('frmParametrosHonorariosConsulta'), false);"/>
                  </td>
                  <td width="112" align="center" valign="middle">
                  <input type="BUTTON" value="Limpiar" name="cmdLimpiar" size="20%" class="boton_right" onmouseover="this.className='boton_rightSobre'" onmouseout="this.className='boton_right';" onclick="RF(GI('frmParametrosHonorariosConsulta'));"/>
                </td>
                </tr>
            </table>
                
                
              </td>
            </tr>
            <tr>
              <td colspan="4" align="center" valign="middle">
                <input type="text" name="paramFormaCalc" id="paramFormaCalc" size="10" style="visibility:hidden"/>
              </td>
            </tr>
            <tr>
              <td colspan="4" align="center" valign="middle">
              <table cellpadding="0" cellspacing="0">
                <tr>                  
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="  Alta   " id="cmdAlta" name="cmdAlta" onmouseover="this.className='boton_leftSobre'" onmouseout="this.className='boton_left';" class="boton_left" onclick="cargaMantenimientoParametrosHonorarios(1)"/> </td>
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="Modificar" id="cmdModificar" name="cmdModificar" onmouseover="this.className='boton_middleSobre'" onmouseout="this.className='boton_middle';" class="boton_middle" onclick="cargaMantenimientoParametrosHonorarios(2)"/> </td>                   
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="Consultar" id="cmdConsultar" name="cmdConsultar" onmouseover="this.className='boton_rightSobre'" onmouseout="this.className='boton_right';" class="boton_right" onclick="cargaMantenimientoParametrosHonorarios(3)"/> </td>                   
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
                    <td width="115px">Tipo Negocio</td>
                    <td width="250px">Nombre</td>
                    <td width="130px">A quien se cobra</td>
                    <td width="200px">Periodicidad</td>
                    <td width="90px">Status</td>
                  </tr>
                </table>
                <div style="height:150px; overflow:auto; position:relative; vertical-align:top; width:930px;">
                  <table id="tablaRegistrosParametrosHonorarios" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaParametrosHonorariosData" keys="pacNumContrato" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                  </table>
                </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
  </table>
</FORM>
