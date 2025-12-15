<form name="frmDatosInterfase" id="frmDatosInterfase">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Interfase MINDS</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" align="center" class="texto">
          <tr valign="middle">
            <td align="left" class="subtitulo" width="29%">&nbsp;</td>
            <td align="left" class="subtitulo" colspan="2">&nbsp;</td>
            <td align="left" class="subtitulo" width="24%">&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td colspan="4" align="center" class="subtitulo" width="30%">
              <a id="ligaArchivo" href="#" style="visibility:hidden">Archivo</a>
            </td>
          </tr>
          <tr valign="middle">
            <td align="left" width="19%">&nbsp;</td>
            <td align="right" width="13%">Fecha Valor
            </td>
            <td align="left" width="44%">
              <input type="text" name="txtFechaValor" id="txtFechaValor" size="10" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="asignaFechaValor" maxlength="10" tipo="Fecha" required message="La Fecha Valor es un campo obligatorio"/>
            </td>
            <td align="left" width="24%">&nbsp;</td>
          </tr>
          <tr valign="middle">
            
            <td>
              <input type="hidden" name="txtNomArch" id="txtNomArch" size="30"  maxlength="30" /><!--required message="El nombre del archivo es obligatorio"-->
              <input type="hidden"  id="interfase" value="1"/><!--required message="El nombre del archivo es obligatorio"-->
            </td>
          </tr>
          <tr valign="middle">
            
            <td colspan="4" align="center">Seleccione un tipo de interfase</td>
          </tr>
          <tr valign="middle">
            <td align="left" width="29%">&nbsp;</td>
            <td align="right" width="3%">Clientes Anteproyecto</td>
            <td align="left" width="44%">
              <input type="radio" name="chkPeriodicidad" id="chk1" class="radio" onClick="GI('interfase').value=this.id.replace('chk','')" value="1" checked="checked"/>
            <!--<input type="file" id="txtRutaFile"/>-->
            </td>
            <td align="left" width="24%">&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td align="left" width="29%">&nbsp;</td>
            <td align="right" width="3%">Genera Clientes KYC</td>
            <td align="left" width="44%">
              <input type="radio" name="chkPeriodicidad" id="chk3" class="radio" onClick="GI('interfase').value=this.id.replace('chk','')" value="2"/>
            <!--<input type="file" id="txtRutaFile"/>-->
            </td>
            <td align="left" width="24%">&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td align="left" width="29%">&nbsp;</td>
            <td align="right" width="3%">Interfase Movimientos</td>
            <td align="left" width="44%">
              <input type="radio" name="chkPeriodicidad" id="chk2" class="radio" onClick="GI('interfase').value=this.id.replace('chk','')" value="3"/>
            <!--<input type="file" id="txtRutaFile"/>-->
            </td>
            <td align="left" width="24%">&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td align="left" width="29%">&nbsp;</td>
            <td align="right" width="3%">&nbsp; <!--Genera Ctas KYC--></td>
            <td align="left" width="44%">
              <!--input type="radio" name="chkPeriodicidad" id="chk4" class="radio" onClick="GI('interfase').value=this.id.replace('chk','')" value="4"/-->
            <!--<input type="file" id="txtRutaFile"/>-->
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
        <input type="button" value="Limpiar" name="cmdLimpiar" id="cmdLimpiar" class="boton" onclick="onButtonClickPestania('Interfases.InterfaseMains.PrincipalInterfaseMains','');"/>
      </td>
    </tr>
    <input type="BUTTON" id="cmdConsultaConceptosPendientes" name="cmdConsultaConceptosPendientes" ref="getPendientesObligatoriosMinds" fun="loadTableElement" tabla="tablaConceptosObligatoriosPendientes" onclick="consultar(GI('cmdConsultaConceptosPendientes'), GI('frmDatosInterfase'), false)" style="visibility:hidden"/>
    <tr align="center">
                <td colspan="2">
                <br>
                <table cellspacing="0" cellpadding="0" border="0">
                    <tr align="left" class="cabeceras">
                      <td width="23px" align="center">&nbsp;</td>
                      <td width="200px">Tipo Persona</td>
                      <td width="100px">Id. Persona</td>
                      <td width="100px">Fideicomiso</td>
                      <td width="150px">Nombre Campo</td>
                    </tr>
                  </table>
                  <div style="height:200px; overflow:auto; width:573px;">
                    <table id="tablaConceptosObligatoriosPendientes" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaConceptosData" keys="" fun="" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda"/>
                  </div>
                </td>
              </tr>
  </table>
</form>
