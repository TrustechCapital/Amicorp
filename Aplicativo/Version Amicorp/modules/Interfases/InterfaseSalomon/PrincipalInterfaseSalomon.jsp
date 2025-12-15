<form name="frmDatosInterfase" id="frmDatosInterfase">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Interfase Contabilidad Institucional</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" align="center" class="texto">
          <tr valign="middle">
            <td colspan="4" align="center" class="subtitulo" width="30%">
              <a id="ligaArchivo" href="#" style="visibility:hidden">Archivo</a>
            </td>
          </tr>
          <tr valign="middle">
            <td align="left" width="4%">&nbsp;</td>
            <td align="right" width="10%">Fecha Valor&nbsp;</td>
            <td align="left" width="60%">
              <input type="text" name="txtFechaValor" id="txtFechaValor" size="10" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="txtFechaInicio" maxlength="10" tipo="Fecha" required message="La Fecha Valor es un campo obligatorio"/>
            </td>
            <td align="left" width="20%">&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td align="left" width="29%">&nbsp;</td>
            <td align="right" width="3%">Interfase</td>
            <td align="left" width="44%">
              <select size="1" name="cmbInterfase" id="cmbInterfase" ref="claves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" next="formsLoaded" param="clavesCombo800" onchange="ponerNombreArchivo();"/>
           </td>
            <td align="left" width="24%">&nbsp;</td>
          </tr>
          
          <!--tr valign="middle">
            <td align="left" width="29%">&nbsp;</td>
            <td align="right" width="3%">Diario</td>
            <td align="left" width="44%">
              <input type="radio" name="chkPeriodicidad" id="chkDiario" class="radio" value="1" required message="La Periodicidad es un campo obligatorio" onclick="ponerNombreArchivo();"/>
            </td>
            <td align="left" width="24%">&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td align="left" width="29%">&nbsp;</td>
            <td align="right" width="3%">Mensual</td>
            <td align="left" width="44%">
              <input type="radio" name="chkPeriodicidad" id="chkMensual" class="radio" value="2" onclick="ponerNombreArchivo();"/>
            </td>
            <td align="left" width="24%">&nbsp;</td>
          </tr-->
          
          
          <tr valign="middle">
            <td align="left" width="29%">&nbsp;</td>
            <td align="center" class ="subtitulo">
              Proceso
            </td>
            <td align="left" width="44%"> &nbsp;</td>
            <td align="left" width="24%">&nbsp;</td>
          </tr>
          
          <tr valign="middle">
            <td align="left" width="29%">&nbsp;</td>
            <td align="right" width="3%"><b>Fideicomisos</b></td>
            <td align="left" width="44%">
              <input type="radio" name="chkProceso" id="chkFideicomisos" class="radio" value="1" onclick="habilitaPeriodo(GI('chkHonorarios'));"/>
            </td>
            <td align="left" width="24%">&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td align="left" width="29%">&nbsp;</td>
            <td align="right" width="3%"><b>Honorarios</b></td>
            <td align="left" width="44%">
              <input type="radio" name="chkProceso" id="chkHonorarios" class="radio" value="2" onclick="habilitaPeriodo(this);"/>
            </td>
            <td align="left" width="24%">&nbsp;</td>
          </tr>
          
          
          <tr valign="middle">
            <td align="left" width="4%">&nbsp;</td>
            <td align="left" width="20%">&nbsp;</td>
            <td align="left" colspa=2>  
            
              <table class="texto" cellspacing="0" cellspacing="1" id="dvPerHono">
                <tr valign="middle">
                  <td align="right"  width="100">Fecha Inicio</td>
                  <td align="left">
                    <input type="text" name="txtFechaInicio" id="txtFechaInicio" size="10" maxlength="10" tipo="Fecha" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="txtFechaFin"/>
                  </td>
                </tr>
                <tr valign="middle">
                  <td align="right" width="100">Fecha Fin</td>
                  <td align="left">
                    <input type="text" name="txtFechaFin" id="txtFechaFin" size="10" maxlength="10" tipo="Fecha" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="asignaFechaValor"/>
                  </td>
                </tr>
                <tr valign="middle">
                  <td align="right" colspan="5"><hr/></td>
                </tr>
              </table>
              
            </td>
          </tr>
          
          
          <tr valign="middle">
            <td align="left" width="4%">&nbsp;</td>
            <td align="right" width="10%">Folio Poliza</td>
            <td align="left" width="60%">
              <input type="text" name="txtFolioPoliza" id="txtFolioPoliza" size="10" maxlength="10" tipo="Numero" required message=" El Folio de la Poliza es un campo obligatorio"/>
            </td>
            <td align="left" width="20%">&nbsp;</td>
          </tr>
          
          <tr valign="middle">
            <td align="left" width="29%">&nbsp;</td>
            <td align="right" nowrap width="3%">Nombre de Archivo</td>
            <td align="left" nowrap width="44%">
              <input type="text" name="txtNomArch" id="txtNomArch" size="30"  maxlength="40" disabled="disabled"/>
            </td>
            <td align="left" width="24%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center">&nbsp;
        <input type="button" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaStoreInterfase();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" value="Limpiar" name="cmdLimpiar" id="cmdLimpiar" class="boton" onclick="onButtonClickPestania('Interfases.InterfaseSalomon.PrincipalInterfaseSalomon','');"/>
      </td>
    </tr>
  </table>
   
</form>
<a id="linkReporte" href="#" style="visibility:hidden">Archivo</a> 
<a id="linkReporteNew" href="#" style="visibility:hidden" target="_new">Archivo</a> 

<a id="linkReporteEGRESOS" href="#" style="visibility:hidden">Archivo</a> 
<a id="linkReporteINGRESOS" href="#" style="visibility:hidden">Archivo</a> 