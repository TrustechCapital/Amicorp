<form name="frmDatos" id="frmDatos" onsubmit="">
  <table width="100%">
    <tr>
      <td align="center" class="titulo">Reporte de Distribuci&oacute;n</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table align="center" class="texto" width="100%">
          <tr valign="middle">
            <td width="35%">&nbsp;</td>
            <td width="10%">Id RC</td>
            <td>
               <input type="text" name="paramIdRC" id="paramIdRC" tipo="Texto" size="10" maxlength="5" required message="El Id RC es un campo obligatorio" onblur="upperRC(this);consultaEmisor(this,GI('paramPrograma'),GI('paramFideicomiso'),GI('paramEmision'));"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="35%">&nbsp;</td>
            <td width="10%">Programa</td>
            <td>
              <select size="1" disabled name="paramPrograma" id="paramPrograma" ref="conETCmbProgs" fun="loadComboElement" keyValue="eproIdPrograma" theValue="eproNomPrograma" next="formsLoaded" param="cmbPrograma" onchange="cargaComboSiguiente(this,false);"/>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="10%">Fideicomiso</td>
            <td>
              <select size="1" name="paramFideicomiso" id="paramFideicomiso" ref="emision.conETEmisorFideicomiso" fun="loadComboElement" keyValue="idFideicomiso" theValue="descFideicomiso"  param="cmbFideicomiso"  next="hideWaitLayer" onchange="cargaEmisiones(GI('paramIdRC'),this);">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="10%">Emisiones</td>
            <td>
              <div id="dvEmisiones" style="font-weight:bold"></div>
            
              <!--select size="1" name="paramEmision" id="paramEmision" ref="conETCmbEmiAsgPrgFid" fun="loadComboElement" keyValue="eemiIdEmision" theValue="pizarraSerie" param="cmbEmision" next="hideWaitLayer">
                <option value="-1">-- Seleccione --</option>
              </select-->
            </td>
            <td width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center" nowrap>&nbsp;
              <input type="button" value="Aceptar" name="cmdAceptarPer" class="boton" ref="emision.conETPriRepDisPeriodo" fun="loadTableElement" tabla="tblRegPer" onclick="consultaRepDist(this);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <input type="button" value="Limpiar" name="cmdLimpiar" class="boton" onclick="limpiar(frmDatos);"/>
               <input type="hidden" id="paramorder" name="paramorder" value="s" style="position:absolute"/>
               <input type="hidden" id="paramCupon" name="paramCupon" style="position:absolute"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="4">
              <!--input type="BUTTON" value="  Alta   " name="cmdAlta" class="boton" onclick="cargaMantenimientoCalculoPago(1);"/-->
              <input type="BUTTON" value="Modificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoCalculoPago(2);"/>
              <input type="BUTTON" value="Consultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoCalculoPago(4);"/>
              <input type="BUTTON" value=" Detalle " name="cmdDetalle" class="boton" onclick="cargaDetalleReporteDistribucion(1);"/>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="BUTTON" value="Reporte Distribución" name="cmdRepDistribucion" name="cmdRepDistribucion" class="boton" onclick="generaDatosExcel();"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center" class="subtitulo">Periodos<hr width="50%"/></td>
          </tr>
          <tr align="center">
            <td colspan="4">
              <table cellspacing="0" cellpadding="0" border="0" class="texto">
                <tr align="left" class="cabeceras">
                  <td width="23" align="center" nowrap>&nbsp;</td>
                  <td width="50" nowrap>Id RC</td>
                  <td width="58" nowrap>Periodo</td>
                  <td width="77" nowrap>Programa</td>
                  <td width="83" nowrap>Fideicomiso</td>
                  <td width="142" nowrap>Emisor</td>
                  <td width="100" nowrap>Fecha Inicio </td>
                  <td width="100" nowrap>Fecha Fin </td>
                  <td width="100" nowrap>Fecha Pago</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top; width:733px;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegPer" dataInfo="arrTblDatPer" keys="idRc,ecedIdPrograma,ecedNomPrograma,ecedIdFideicomiso,ecedNomFideicomiso,ecedNomEmisor,ecedIdPeriodo,ecedFecInicioPer,ecedFecFinPer,ecedFecPagoPer" fun="clickTablaPer" radioWidth="23px" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
               </table>
              </div>
            </td>
          </tr>
           <tr>
            <td colspan="4" align="center">&nbsp;</td>
          </tr>
           <tr>
            <td colspan="4" align="center" id="hdEmisiones" style="visibility:hidden;">
               <table>
                  <tr>
                     <td class="subtitulo" width="300" align="center">Emisiones</td>
                     <td style="visibility:hidden;">
                        <input type="button" value="Aceptar" name="cmdAceptar" class="boton" ref="emision.conETPriRepDis" fun="loadTableElement" tabla="tblReg" onclick="consultar(this, frmDatos, false);"/>&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="BUTTON" value=" Detalle " name="cmdDetalle" class="boton" onclick="cargaDetalleReporteDistribucion(1);"/>
                     </td>
                  </tr>
               </table>
               <hr  width="50%"/>
            </td>
          </tr>
          <tr align="center">
            <td colspan="4" id="tbEmisiones" style="visibility:hidden;">
              <table cellspacing="0" cellpadding="0" border="0" class="texto">
                <tr align="left" class="cabeceras">
                  <td width="23" align="center" nowrap>&nbsp;</td>
                  <td width="50" nowrap>Id RC</td>
                  <td width="58" nowrap>Cup&oacute;n</td>
                  <td width="77" nowrap>Programa</td>
                  <td width="67" nowrap>Emisi&oacute;n</td>
                  <td width="54" nowrap>Pizarra</td>
                  <td width="71" nowrap>Serie</td>
                  <td width="83" nowrap>Fideicomiso</td>
                  <td width="142" nowrap>Emisor</td>
                  <td width="100" nowrap>Fecha Inicio </td>
                  <td width="100" nowrap>Fecha Fin </td>
                  <td width="100" nowrap>Fecha Pago</td>
                  <td width="80" nowrap>Reporte</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top; width:1092px;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblReg" dataInfo="arrTblDat" keys="idRc,ecedIdPrograma,ecedNomPrograma,ecedIdFideicomiso,ecedNomFideicomiso,ecedIdEmision,ecedNomEmisor,ecedIdPeriodo,ecedCvePizarra,ecedNumSerie,ecedFecInicioPer,ecedFecFinPer,ecedFecPagoPer,repDist" fun="clickTabla" radioWidth="23px" NoRecordsMsg="No existen Registros para estos criterios de búsqueda" onDblClick="GI('cmdDetalle').click()">
                <!--table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblReg" dataInfo="arrTblDat" keys="ecedIdPrograma,ecedIdFideicomiso,ecedIdEmision,ecedIdPeriodo" fun="clickTabla" radioWidth="23px" NoRecordsMsg="No existen Registros para estos criterios de búsqueda"-->
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>

<a id="linkReporte" href="#" style="visibility:hidden">Archivo</a>