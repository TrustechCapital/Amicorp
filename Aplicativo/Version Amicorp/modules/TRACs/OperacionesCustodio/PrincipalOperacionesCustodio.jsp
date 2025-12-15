<form name="frmDatos" id="frmDatos">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Operaciones Custodio</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td>
        <table align="center" class="texto">
          <tr valign="middle">
            <td colspan="4" align="center" class="subtitulo">
              <a id="ligaArchivo" href="#" style="visibility:hidden">Archivo</a>
            </td>
          </tr>
          <tr valign="middle">
            <td align="left">&nbsp;</td>
            <td align="left">Fecha
            </td>
            <td align="left">
              &nbsp;&nbsp;&nbsp;<input type="text" name="fecha" id="fecha" size="10"  maxlength="10" tipo="Fecha" required message="La Fecha Valor es un campo obligatorio"/>
            </td>
            <td align="left">&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td align="left">&nbsp;</td>
            <td align="left">Nombre del Archivo
            </td>
            <td align="left">
              &nbsp;&nbsp;&nbsp;<input type="text" name="nombre" id="nombre" size="10"  maxlength="10" required message="El nombre del Archivo es un campo obligatorio"/>
            </td>
            <td align="left">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td align="center">
      <hr width="40%">
      </td>
    </tr>
    <tr>
      <td align="center">
      <table cellpadding="0" cellspacing="0">
                <tr>                  
                   <td width="112"  align="center" valign="middle"><input type="button" value="Archivo" name="cmdAceptar" id="cmdAceptar" onmouseover="this.className='boton_leftSobre'" onmouseout="this.className='boton_left';" class="boton_left" onclick="ejecutaStoreInterfase();"/></td>
                   <td width="112"  align="center" valign="middle"><input type="button" value="Reporte" name="cmdReporte" id="cmdReporte" onmouseover="this.className='boton_rightSobre'" onmouseout="this.className='boton_right';" class="boton_right" onclick="reporteNafin();"/></td>    
                </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td colspan = 2 align="left">
        <div id="dvProcedimiento">
        </div>
      </td>
    </tr>
  </table>
</form>
