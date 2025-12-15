<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table width="100%" style="height:auto;">
    <tr>
      <td align="center" class="titulo">Seguimiento Proyecto</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table align="center" class="texto" width="90%">
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="20%">Prospecto</td>
            <td>
              <input type="text" name="paramNumProspecto" id="paramNumProspecto" tipo="Num" size="10" maxlength="10" required message="El Prospecto es un campo obligatorio"/>
            </td>
            <td width="25%">&nbsp;</td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td colspan="2" align="center"><hr/></td>
            <td align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <table cellpadding="0" cellspacing="0">
                <tr>                  
                   <td width="112"  align="center" valign="middle"> <input type="button" value="Aceptar" name="cmdAceptar" id="cmdAceptar" onmouseover="this.className='boton_leftSobre'" onmouseout="this.className='boton_left';" class="boton_left" ref="qryRepSeguimientoProy" fun="loadTableElement" tabla="tblReg" onclick="consultaSeguimieto(this)"/> </td>
                   <td width="112"  align="center" valign="middle"> <input type="button" value="Limpiar" name="cmdLimpiar"  onmouseover="this.className='boton_middleSobre'" onmouseout="this.className='boton_middle';" class="boton_middle" onclick="limpiar(frmDatos);"/> </td>
                   <td width="112"  align="center" valign="middle"> <input type="button" value="Generar Reporte" name="cmdReporte" id="cmdReporte"  onmouseover="this.className='boton_rightSobre'" onmouseout="this.className='boton_right';" class="boton_right"  onclick="generarReporteSeguimiento()"/> </td>           
                  </td>
                </tr>
                </table>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden;"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="4">
              <table border="0" cellpadding="0" cellspacing="0">
                <tr class="cabeceras" align="left">
                  <td align="center" width="23" nowrap>&nbsp;</td>
                  <td width="50" nowrap>No.</td>
                  <td width="300" nowrap>Proyecto</td>
                  <td width="100" nowrap>Fecha</td>
                  <td width="200" nowrap>Usuario</td>
                  <td width="150" nowrap>Seguimiento</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:823px;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblReg" dataInfo="arrTblDat" keys="fspNumPro,fspSeguimiento" fun="clickTabla" radioWidth="23px" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center"><a id="linkReporte" href="#" style="visibility:hidden" target="_new">Archivo</a> &nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
