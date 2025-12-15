<FORM name="frmPtosSol" id="frmPtosSol" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="vertical-align:top;">
      <tr>
        <td align="center" height="100%" class="titulo">Puntos de Revisión de Instrucciones</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <!--<tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <tr>
              <td width="25%">&nbsp;</td>
              <td nowrap>Fideicomiso:</td>
              <td colspan="2">
                <input type="text" name="insNumContrato" id="insNumContrato" size="10" disabled="disabled"/> 
              </td>
              <td width="5%">&nbsp;
              </td>
            </tr>
            <tr>
              <td width="25%">&nbsp;</td>
              <td nowrap>Folio:</td>
              <td colspan="2">
                <input type="text" name="insNumFolioInst" id="insNumFolioInst" size="20" disabled="disabled"/>
              </td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">&nbsp;</td>
              <td nowrap>Tipo de Instruccion:</td>
              <td colspan="2">
                <input type="text" name="insCveTipoInstr" id="insCveTipoInstr" size="35" disabled="disabled"/>
              </td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>
              <td width="25%">&nbsp;</td>
              <td nowrap>Estatus:</td>
              <td colspan="2">
                <input type="text" name="insCveStInstruc" id="insCveStInstruc" size="10" disabled="disabled"/>
              </td>
              <td width="5%">&nbsp;</td>
            </tr>-->
            <tr>
              <td width="100%" colspan="5" align="center" valign="middle">
                  <table width="100%">
                       <tr>
                            <td width="100%" height="34">
                                <table width="100%" class="texto">
                                    <tr>
                                       <td width="10%">NUM.</td>
                                        <td width="15%">
                                          <input type="text" name="insNumContrato" id="insNumContrato" size="20" disabled="disabled"/>
                                        </td>
                                        <td width="10%">NOMBRE</td>
                                        <td width="65%">
                                          <input type="text" name="txtNomContraro" id="txtNomContraro" size="80" disabled="disabled"/>
                                        </td>
                                    </tr>
                                </table>
                           </td>
                        </tr>
                        <tr>
                         <td width="100%">
                                <table width="100%" class="texto">
                                    <tr>
                                       <td width="50%" align="center" colspan="2">TIPO DE INTRUCCION</td>
                                        <td width="25%" align="center">FOLIO</td>
                                        <td width="25%" align="center">ESTATUS INSTRUCCION</td>
                                    </tr>
                                    <tr>
                                       <td width="50%" align="center" colspan="2">
                                         <input type="text" name="insCveTipoInstr" id="insCveTipoInstr" size="80" disabled="disabled"/>
                                        </td>
                                        <td width="25%" align="center">
                                          <input type="text" name="insNumFolioInst" id="insNumFolioInst" size="40" disabled="disabled"/>
                                        </td>
                                        <td width="25%" align="center">
                                          <input type="text" name="insCveStInstruc" id="insCveStInstruc" size="40" disabled="disabled"/>
                                        </td>
                                    </tr>
                                    <tr>
                                       <td width="50%" align="center" colspan="2">TIPO DE SOLICITUD</td>
                                        <td width="25%" align="center"></td>
                                        <td width="25%" align="center"></td>
                                    </tr>                                    
                                    <tr>
                                       <td width="50%" align="center" colspan="2">
                                         <input type="text" name="txtInsOperacion" id="txtInsOperacion" size="80" disabled="disabled"/>
                                        </td>
                                        <td width="25%" align="center">
                                        <input  id="paramEtapa" name="paramEtapa" size="10" style="visibility:hidden" /></input></td>
                                        <td width="25%" align="center">
                                        </td>
                                    </tr>                                    
                                </table>
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
                <table cellspacing="1" cellpadding="0" border="0">
                  <tr align="left" class="cabeceras">
                    <td width="25px"></td>
                    <td width="100px">Id</td>
                    <td width="400px">Punto de Revision</td>
                    <td width="50px">Cumple</td>
                    <td width="600px">Observaciones</td>
                  </tr>
                </table>
                <div style="height:250px; overflow:auto; position:relative; vertical-align:top;width:1175px">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegPtosRev" dataInfo="arrTblDatPtoRev" keys="fpurIdPuntorev" fun="clickTablaPtoRev" radioWidth="23px" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </td>
            </tr>
            <tr align="center"><td colspan="5">&nbsp;</td></tr>
            <tr align="center">
              <td colspan="5">
                <table width="90%" cellspacing="1" cellpadding="0" border="0" class="texto">
                  <tr>
                    <td>Cumple:</td>
                    <td>
                       <input type="radio" class="radio" name="rdCorrecto" id="rdSi" value="S" required message="Valor obligatorio"> SI&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       <input type="radio" class="radio" name="rdCorrecto" id="rdNo" value="N"> NO
                    </td>
                    <td>&nbsp;</td>
                    <td>Observaciones:</td>
                    <td>
                      <textarea name="txtObservaciones" id="txtObservaciones" style="width:600px;height:80px" onkeydown="validaLongitud(this,255);"></textarea>
                    </td>
                  </tr>
               </table>
               </td>
            </tr>
            <tr align="center"><td colspan="5"><a id="linkReporteNew" href="#" style="visibility:hidden" target="_new">Archivo</a></td></tr>
            <tr align="center"><td colspan="5">
               <input type="BUTTON" name="cmdGuardar" value="Guardar" class="boton" onclick="guardar(1);">
               <input type="BUTTON" name="cmdRegresar" value="Regresar" class="boton" onclick="regresarAlaCharola2();">
               <input type="BUTTON" name="cmdReporte" value="Reporte Finalidades" class="boton" onclick="generaReporte();"/>
            </td></tr>
          </table>
        </td>
      </tr>
  </table>
</FORM>