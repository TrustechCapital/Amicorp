<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Layout Bancos</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="70%" align="center" class="texto">
          <tr>
            <td width="40%">&nbsp;</td>
            <td nowrap width="10%">Banco</td>
            <td align="left" width="10%">
                <select name="paramBanco" id="paramBanco" ref="cmbLayoutBanco" fun="loadComboElement" keyValue="flyIdBanco" theValue="flyNomBanco"  next="paramInterfase"/>
            </td>
             <td width="40%">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td nowrap width="10%">Interfase</td>
            <td align="left">
                <select name="paramInterfase" id="paramInterfase" ref="cmbLayoutInterfase" fun="loadComboElement" keyValue="flyIdInterfase" theValue="flyNomInterfase"  next="formsLoaded"/>
            </td>
            <td>
            </td>
          </tr>
          <tr>
            <td colspan="5" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="5" align="center">
            <table width="224" cellpadding="0" cellspacing="0">
                <tr>
                <td width="112"  align="center" valign="middle">
                  <input type="BUTTON" value="Aceptar" id="cmdAceptar" name="Aceptar" class="boton_left" onmouseover="this.className='boton_leftSobre'" onmouseout="this.className='boton_left';" ref="qryLayoutBancos" fun="loadTableElement" tabla="tabla" onclick="if(fvMantenimiento.checkForm())consultar(this, GI('frmDatos'), false);">
                  </td>
                  <td width="112" align="center" valign="middle">
                  <input type="BUTTON" value="Limpiar" id="cmdLimpiar" name="cmdLimpiar" class="boton_right" onmouseover="this.className='boton_rightSobre'" onmouseout="this.className='boton_right';" onclick="limpiar(frmDatos);"/>
                </td>
                </tr>
            </table> 
            </td>
          </tr>
          <tr>
            <td colspan="5" align="center">&nbsp;</td>
          </tr>
          <tr>
              <td width="100%" colspan="5" align="center" valign="middle">
              <table cellpadding="0" cellspacing="0">
                <tr>                  
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="  Alta   " id="cmdAlta" name="cmdAlta" onmouseover="this.className='boton_leftSobre'" onmouseout="this.className='boton_left';" class="boton_left" onclick="cargaMantenimiento(1)"/> </td>
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="Modificar" id="cmdModificar" name="cmdModificar" onmouseover="this.className='boton_middleSobre'" onmouseout="this.className='boton_middle';" class="boton_middle" onclick="cargaMantenimiento(2)"/> </td>
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="  Baja   " id="cmdBaja" name="cmdBaja" onmouseover="this.className='boton_middleSobre'" onmouseout="this.className='boton_middle'" class="boton_middle" onclick="eliminarRegistro();"/> </td>
                   <td width="112"  align="center" valign="middle"> <input type="BUTTON" value="Consultar" id="cmdConsultar" name="cmdConsultar" onmouseover="this.className='boton_rightSobre'" onmouseout="this.className='boton_right';" class="boton_right" onclick="cargaMantenimiento(3)"/> </td>                   
                  </td>
                </tr>
                </table>  
                
              </td>
            </tr>
          <tr>
            <td width="100%" colspan="5" align="center" valign="middle">&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="5">
              <table cellspacing="0" cellpadding="0" border="0">
                <tr align="left" class="cabeceras">
                  <td width="23px">&nbsp;</td>
                  <td width="80px">Id Banco</td>
                  <td width="80px">Id Interfase</td>
                  <td width="80px">No Movto</td>
                  <td width="80px">Id Movto</td>
                  <td width="100px">Banco</td>
                  <td width="200px">Interfase</td>
                  <td width="200px">Movimiento</td>
                </tr>
              </table>
              <div style="height:250px; width:843px; overflow:auto; position:relative; vertical-align:top;">
                <table id="tabla" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaData" keys="flyIdBanco,flyIdInterfase,flyIdLayout,flyCampoTarget3" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
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
  </table>
</FORM>
