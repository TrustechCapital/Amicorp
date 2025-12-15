<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table width="100%" style="height:auto;">
    <tr>
      <td align="center" class="titulo">Calendario de Pagos</td>
    </tr>
    <tr>
      <td>
        <input type="hidden" id="refQry" name="refQry" value="emision.getFunRepDistribucion"/>
      </td>
    </tr>
    <tr>
      <td height="100%">
        <table align="center" class="texto" border="0" cellspacing="1" cellpadding="2">
          <tr valign="middle">
          <td width="20%">&nbsp;</td>
            <td nowrap>Id RC</td>
            <td width="25%">
              <input type="text" name="paramidRC" id="paramidRC" tipo="Texto" size="10" maxlength="5" onblur="upperRC(this);cargaProgFid(this,GI('paramNumPrograma'),GI('paramNumFiso'),GI('paramNumEmision'));"/>
            </td>
            <td width="5">&nbsp;</td>
            <td nowrap>&nbsp;</td>
            <td>
              &nbsp;
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr valign="middle">
          <td width="20%">&nbsp;</td>
            <td nowrap>Emisi&oacute;n</td>
            <td width="25%">
              <select size="1" name="paramNumEmision" id="paramNumEmision" ref="conETCmbEmiAsgPrgFid" fun="loadComboElement" keyValue="eemiIdPrograma" theValue="pizarraSerie" next="paramNumPrograma" param="cmbEmision">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td width="5">&nbsp;</td>
            <td nowrap>Fecha de Inicio</td>
            <td>
              <input type="text" name="paramFechaInicio" id="paramFechaInicio" size="10" maxlength="10" tipo="Fecha"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap>Programa</td>
            <td width="25%">
              <select size="1" disabled name="paramNumPrograma" id="paramNumPrograma" ref="conETCmbProgs" fun="loadComboElement" keyValue="eproIdPrograma" theValue="eproNomPrograma" param="cmbPrograma"  next="paramNumFiso"  ><!--required message="El Programa es un campo obligatorio"-->
                  <option value="0">-- Seleccione --</option><!--onchange="cargaComboFideicomiso(this,GI('eemiIdFideicomiso'),false,0);"-->
                </select>
              <!--select size="1" name="paramNumPrograma" id="paramNumPrograma" ref="conETCmbProgs" fun="loadComboElement" keyValue="eproIdPrograma" theValue="eproNomPrograma" next="paramNumFiso" disabled/-->
            </td>
            <td width="5">&nbsp;</td>
            <td nowrap>Pizarra</td>
            <td>
              <input type="text" name="paramPizarra" id="paramPizarra" size="10" maxlength="25"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
          <td width="20%">&nbsp;</td>
            <td nowrap>Fideicomiso</td>
            <td width="25%">
              <select size="1" name="paramNumFiso" id="paramNumFiso" ref="emision.conETEmisorFideicomiso" fun="loadComboElement" keyValue="idFideicomiso" theValue="descFideicomiso" next="paramInstrumento" param="cmbFideicomiso"><!--  onchange="cargaComboFideicomiso(this,GI('eemiNomEmisor'),false,0);" required message="El Fideicomiso es un campo obligatorio"-->
                  <option value="0">-- Seleccione --</option>
                </select>
            
              <!--select size="1" name="paramNumFiso" id="paramNumFiso" ref="conETCmbFisoAsigProg" fun="loadComboElement" keyValue="efidIdFideicomiso" theValue="ctoNomContrato" next="paramInstrumento" disabled>
                <option value="-1">-- Seleccione --</option>
              </select-->
            </td>
            <td width="5">&nbsp;</td>
            <td nowrap>Serie</td>
            <td>
              <input type="text" name="paramSerie" id="paramSerie" size="10" maxlength="25"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap>Instrumento</td>
            <td width="25%">
              <select size="1" name="paramInstrumento" id="paramInstrumento" ref="conETCmbInstrEmision" fun="loadComboElement" keyValue="eproInstrumento" theValue="eproInstrumento" next="conETDatInd"/>
            </td>
            <td width="5">&nbsp;</td>
            <td nowrap><!--Status--></td>
            <td>
              <!--select size="1" name="paramStatus" id="paramStatus" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbStatusParam" next="formsLoaded"/-->
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="7" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="7" align="center">
              <input type="button" value="Aceptar" name="cmdAceptar" class="boton" ref="conETPriDatGen2" fun="loadTableElement" tabla="tblReg" onclick="consultar(this, frmDatos, false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" value="Limpiar" name="cmdLimpiar" class="boton" onclick="limpiar(frmDatos);"/>
            </td>
          </tr>
          <tr>
            <td colspan="7" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="7" align="center">
              <input type="BUTTON" value="Consultar" name="cmdConsultar" class="boton" onclick="ejecutaFuncion();"/>
              <input type="BUTTON" value="Genera PDF" name="cmdGeneraPDF" class="boton" onclick="generaDatosPDF();"/>
            </td>
          </tr>
          <tr>
            <td colspan="7" align="center">
              <input type="hidden" id="paramRepInfoUrlLogo" name="paramRepInfoUrlLogo" value="<%="http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()+"/imagenes/logo_bn.jpg"%>" />
            </td>
          </tr>
          <tr align="center">
            <td colspan="7">
              <table border="0" cellpadding="0" cellspacing="0">
                <tr class="cabeceras" align="left">
                  <td align="center" width="23" nowrap>&nbsp;</td>
                  <td width="50" nowrap>Id RC</td>
                  <td width="150" nowrap>Programa</td>
                  <td width="100" nowrap>Pizarra</td>
                  <td width="100" nowrap>Serie</td>
                  <td width="150" nowrap>Contrato</td>
                  <td width="150" nowrap>Instrumento</td>
                  <td width="250" nowrap>Fideicomitente</td>
                  <td width="70" nowrap>Fecha Inicio</td>
                  <td width="80" nowrap>Parámetros</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top;width:1123px;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblReg" dataInfo="arrTblDat" keys="idRc,eemiIdPrograma,eproNomPrograma,eemiIdFideicomiso,eemiIdEmision,eemiNomEmisor,eemiCvePizarra,eemiNumSerie,eereTipoCalculo,ctoNomContrato,parametros" fun="clickTabla" radioWidth="23px" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">  
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
<a id="linkReporte" href="#" style="visibility:hidden">Archivo</a>