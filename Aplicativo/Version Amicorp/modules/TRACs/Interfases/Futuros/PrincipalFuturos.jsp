<form name="frmDatosInterfase" id="frmDatosInterfase" onsubmit=" ">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Interfase Futuros</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;&nbsp;</td>
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
              <input type="text" name="txtFechaValor" id="txtFechaValor" size="10" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="cmbTipoLiq" maxlength="10" tipo="Fecha" required message="La Fecha Valor es un campo obligatorio" style="width:150px;"/>
              <input type="hidden" style="position:absolute;" name="txtNomArch" id="txtNomArch" size="30" value="FUTUROS_DDMMYYYY" maxlength="30" required message="El Nombre Archivo es un campo obligatorio" style="width:150px;"/>
            
            </td>
            <td align="left" width="24%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td colspan="2">
        <hr/>
      </td>
    </tr>
    <tr>
      <td colspan="2">
        <iframe id="frameUpload" name="frameUpload" align="center" style="z-index:1;visibility:visible;" src="<%=request.getContextPath()%>/modules/TRACs/Interfases/Futuros/FuturosUpload.do" frameborder="0" scrolling="no" width="600" height="50" AllowTransparency></iframe>
        <div id="dvInterface" class="texto"></div>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center">&nbsp;
        <input type="button" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaFuncion();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input style="visibility:hidden;" type="button" value="Ejecutar" name="cmdVaciar" id="cmdVaciar" class="boton" onclick="ejecutaStoreFuturos();"/>&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" value="Limpiar" name="cmdLimpiar" id="cmdLimpiar" class="boton" onclick="onButtonClickPestania('TRACs.Interfases.Futuros.PrincipalFuturos','');"/>
        
      </td>
    </tr>
    <tr>
      <td colspan="2" class="subtitulo">
          <br>
      </td>
    </tr>
    <tr>
      <td colspan="2" align="center">
          <table cellspacing="0" cellpadding="0" border="0"  class ="texto" style="width:750px;height:250px;font-size:20px;background-color:#5A694A;color:white;">
            <tr align="center">
              <td style="font-size:30px;height:50px;">
                  Operatividad durante el periodo
                <hr/>
              </td>
            </tr>
            <tr align="center">
              <td>
                <div id="dvMovtosFuturo">
                  No ha cargado archivo ...
                </div>
              </td>
            </tr>
          </table>
      </td>
    </tr>
    <tr>
      <td colspan="2" class="subtitulo" align="center">
          <br><br>
          Posición
          <hr/>
      </td>
    </tr>
    <tr>
      <td colspan="2" align="center">
          <table cellspacing="0" cellpadding="0" border="0">
            <tr align="left" class="cabeceras">
              <td width="23px">
                <input style="visibility:hidden;" type="BUTTON" value="" id="cmdConsultar" name="cmdConsultar" class="btnSearch" ref="qryFuturosTrack" fun="loadTableElement" tabla="tabla" onclick="consultar(this, GI('frmDatosInterfase'), false);" title="Consultar"/> 
              </td>
              <td width="50px">Fiso</td>
              <td width="50px">SubCta</td>
              <td width="80px">CtoInver</td>
              <td width="80px">Id</td>
              <td width="100px">Fec Compra</td>
              <td width="80px">Pizarra</td>
              <td width="50px">Serie</td>
              <td width="50px">Cupón</td>
              <td width="80px">Contratos</td>
              <td width="100px">V Nominal</td>
              <td width="80px">IPC</td>
            </tr>
          </table>
          <div style="height:150px; width:823px; overflow:auto; position:relative; vertical-align:top;">
            <table id="tabla" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaData" keys="defNumContratos,defIpc,defIdSecuencial" fun="clickTabla" radioWidth="23" ><!--NoRecordsMsg="No existen Registros para estos criterios de búsqueda"-->
            </table>
          </div> 
      </td>
    </tr>
    
    <tr>
      <td align="center">&nbsp;
              <input type="hidden" id="paramorder" name="paramorder" value="s" style="position:absolute;"/>
              <input type="hidden" id="paramFideicomiso" name="paramFideicomiso" value="" style="position:absolute;"/>
              <input type="hidden" id="paramPizarra" name="paramPizarra" value="" style="position:absolute;"/>
              <input type="hidden" id="paramSerie" name="paramSerie" value="" style="position:absolute;"/>
              <input type="hidden" id="paramCupon" name="paramCupon" value="" style="position:absolute;"/>
              <input type="hidden" id="paramSCta" name="paramSCta" value="" style="position:absolute;"/>
              <input type="hidden" id="paramCtoInver" name="paramCtoInver" value="" style="position:absolute;"/>
                            
              
              <a id="linkReporteNew" href="#" target="_new" style="visibility:hidden;position: absolute; top: 0; left: 0;" >Archivo</a>
      </td>
    </tr>
              
  </table>
</form>
