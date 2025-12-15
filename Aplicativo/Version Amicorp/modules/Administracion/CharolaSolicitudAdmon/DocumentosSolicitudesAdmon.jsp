<FORM name="frmDocumentos" id="frmDocumentos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="vertical-align:top;">
      <tr>
        <td align="center" height="100%" class="titulo">Documentos de Solicitudes</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <!--<tr>
              <td width="25%">&nbsp;</td>
              <td nowrap>Fideicomiso:</td>
              <td colspan="2">
                <input type="text" name="insNumContrato" id="insNumContrato" size="10" disabled="disabled"/>
              </td>
              <td width="5%">&nbsp;</td>
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
              <td nowrap>Tipo de Solicitud:</td>
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
                            
          <td width="100%" height="34"> <table width="100%" class="texto">
              <tr> 
                <td> FIDEICOMISO 
                  <input type="text" name="txtNumContrato" id="txtNumContrato2" size="20" disabled="disabled"/>
                  - 
                  <input type="text" name="txtNomContraro" id="txtNomContraro2" size="80" disabled="disabled"/> 
                </td>
              </tr>
            </table></td>
                        </tr>
                        <tr>
                         <td width="100%">
                               <hr size="2">
                                <table width="1000" class="texto">
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
                                    </tr>      </table>
            <table width="1000" class="texto">                                 
            <tr>
              <td width="100%" colspan="5" align="center" valign="middle">&nbsp;</td>
            </tr>
            <tr style="visibility:hidden">
              <td width="25%">&nbsp;</td>
              <td nowrap>Documento:</td>
              <td colspan="2">
                <select size="1" name="cboNombre" id="cboNombre" ref="qryDocumentsCbo" fun="loadComboElement" keyValue="fdocIdDocumento" theValue="fdocNombre" param = "paramsQryDocumentsCbo" next="fin" onchange="cargaTablaParaDocumentos();" required message="Seleccione un documento"/>
                </td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr align="center"><td colspan="5"><a id="linkReporteNew" href="#" style="visibility:hidden" target="_new">Archivo</a></td></tr>
            <tr style="visibility:hidden">
              <td width="25%">&nbsp;</td>
              <td nowrap>&nbsp;</td>
              <td colspan="2">
                 <input type="button" value="Agregar Documento" class="boton"  onclick="AgregaArchivo();">
              </td>
              <td width="5%">&nbsp;</td>
            </tr>
            <tr>           
            <td width="16%">URL Imagen</td>
            <td width="84%"><input type="text" name="rcvgarUbicacionImagen" id="rcvgarUbicacionImagen" tipo="AlphaNumeric" size="50" maxlength="255" value="1008361_OCTUBRE.pdf,1008361_OCTUBRE.pdf"/><input type="button" class="boton"  value="Ver Imagenes" uris="1008361_OCTUBRE.pdf,1008361_OCTUBRE.pdf" names="Solicitud 1,solicitud 2" target="new" onclick="var uris=GA(this,'uris'); var names=GA(this,'names');  var target=GA(this,'target');  if(target=='new' || target=='blank'){window.open(ctxRoot+'/jsp/Global/Visualizer.jsp?uris='+uris+'&names='+names);  }else{alert('Modulo en desarrollo')}
"></td>
          </tr>
          <tr>
              <td colspan="2">
                <iframe id="frameUpload" name="frameUpload"  style="z-index:1;visibility:visible;" src="<%=request.getContextPath()%>/jsp/Global/FTPUpload.jsp" frameborder="0" scrolling="no" width="800" height="100" AllowTransparency></iframe>
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
                    <td width="100px">Punto de Revision</td>
                    <td width="400px">Descripcion</td>
                    <td width="50px">Cumple</td>
                    <td width="600px">Observaciones</td>
                  </tr>
                </table>
                <div style="height:250px; overflow:auto; position:relative; vertical-align:top;width:1175px">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegDocumentos" dataInfo="arrTblDatPtoRev" keys="fetaIdEtapa,fpurIdPuntorev" fun="clickTablaPtoRev" radioWidth="23px" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
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
                       <input type="radio" class="radio" name="rdCorrecto" id="rdSi" required message="Valor obligatorio";> SI&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       <input type="radio" class="radio" name="rdCorrecto" id="rdNo"> NO
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
            <tr align="center"><td colspan="5">&nbsp;</td></tr>
            <tr align="center"><td colspan="5">
               <input type="BUTTON" name="btnGuardar" value="Guardar" class="boton" onclick="guardar(2);"/>
               <input type="BUTTON" name="btnRegresar" value="Regresar" class="boton" onclick="regresarAlaCharola2();"/>
            </td></tr>
          </table>
        </td>
      </tr>
  </table>
</FORM>