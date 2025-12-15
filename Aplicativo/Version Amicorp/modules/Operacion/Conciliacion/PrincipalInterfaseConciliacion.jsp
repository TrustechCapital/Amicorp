<form name="frmDatosInterfase" id="frmDatosInterfase" onsubmit=" ">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%"><div id="tit1" class="titulo1" onClick="pestaña(this,GI('tit2'),GI('div1'),GI('div2'),GI('div4'),GI('div3'))">Conciliaci&oacute;n de Operaciones</div></td>
      <td align="center" height="100%"><div id="tit2" class="titulo2" onClick="pestaña(this,GI('tit1'),GI('div2'),GI('div1'),GI('div3'),GI('div4'))">Conciliaci&oacute;n Financiera</div></td>
      <td width="40%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" colspan="3">
        <table width="90%" align="center" class="texto">
          <tr valign="middle">
            <td align="left" class="subtitulo" width="29%">&nbsp;</td>
            <td align="left" class="subtitulo" colspan="2">&nbsp;</td>
            <td align="left" class="subtitulo" width="24%">&nbsp;</td>
          </tr> 
          <tr valign="middle">
          <td align="left" width="19%">&nbsp;</td>
          <td align="right" width="13%">Fecha:
          </td>
          <td align="left" width="44%">
              <input type="text" name="paramFecha" id="paramFecha" size="10" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="selectIdConci" maxlength="10" tipo="Fecha" required message="La Fecha Valor es un campo obligatorio" style="width:100px;"/>
              &nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" value="Autorizar" name="cmdComfirm" id="cmdComfirm" class="boton" onclick="confirmar()"/>
              <input type="text" name="fechaHidden" id="fechaHidden" style="visibility:hidden;position:absolute;"/>
              <input type="text" name="ruta" id="ruta" style="visibility:hidden;position:absolute;" value="<%=request.getContextPath()%>"/>
              <input type="text" name="ocultaArchivo" id="ocultaArchivo" style="visibility:hidden;position:absolute;" value="0"/>
          </td>
          <td align="left" width="24%">&nbsp;</td>
          </tr>
        </table>
    <tr>
              <td colspan="3">
                <hr/>
              </td>
    </tr>
  </table> 

<table id="div2" cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="visibility:hidden;position:absolute;">
  <tr>
      <td height="100%">
        <table align="center" class="texto" border="0" width="300">
            <tr>
            <td colspan=2>
               <table align="center" width="60%" class="texto">
                  <tr>
                     <td nowrap width="60%">Banco</td>
                     <td align="left" width="10%">
                         <select name="cmbBanco" id="cmbBanco" ref="cmbLayoutBanco" fun="loadComboElement" keyValue="flyIdBanco" theValue="flyNomBanco"  next="cmbInterfase" required message="El banco es un campo obligatorio"/>
                     </td>
                   </tr>
                   <tr>
                     <td nowrap >Interfase</td>
                     <td align="left">
                         <select name="cmbInterfase" id="cmbInterfase" ref="cmbLayoutInterfase" fun="loadComboElement" keyValue="flyIdInterfase" theValue="flyNomInterfase"  next="formsLoaded" required message="La interfase es un campo obligatorio"/>
                     </td>
                   </tr>
                  </table>
            </td>
         </tr>
          <tr valign="middle" style="width:210px;position:absolute;visibility:hidden;">
            <td align="left" nowrap style="width:100px">Nombre Archivo</td>
            <td align="left" nowrap>
              <input type="hidden" name="txtNomArch" id="txtNomArch" size="30"  maxlength="30" required message="El Nombre Archivo es un campo obligatorio"  disabled/>
            </td>
          </tr>
           <tr valign="middle" style="width:210px;visibility:hidden;position:absolute;">
            <td align="left" nowrap style="width:100px">Conciliación</td>
            <td align="left" nowrap>
              <select size="1" name="selectIdConci" id="selectIdConci"  fun="loadComboElement" keyValue="flyIdLayout" theValue="flyNomLayout" ref="consultaLayoutsCash" next="conciliaOpe()" onchange="GI('paramIdConci').value = this.value-1;document.frameUpload.location=GI('ruta').value+'/modules/Operacion/Conciliacion/ConciliacionUpload.do';">
            </td>
          </tr>
          <tr>
            <td colspan=2>
              <input type="text" name="paramIdConci" id="paramIdConci" size="30"  maxlength="30" style="width:150px;visibility:hidden;"/>
              <a id="ligaArchivo" href="#" style="visibility:hidden">Archivo</a>
            </td>
          </tr>
        </table>
      </td>
      <td rowspan =2 align="left" valing="top" width="30%" heigth="150px">
                  <input type="hidden" id="paramorder" name="paramorder" value="s" style="position:absolute"/>
                  <input type="hidden" id="paramNombre" name="paramNombre" value="" style="position:absolute"/>
                  <table cellspacing="0" cellpadding="0" border="0">
                    <tr align="center" class="subtitulo">
                      <td colspan="5" align="center">Archivos Cargados</td>
                    </tr>
                    <tr align="left" class="cabeceras">
                      <td width="23px" align="center">
                        <input type="BUTTON" value="" id="cmdConsultar" name="cmdConsultar" class="btnSearch" ref="qryArchivosConcilia" fun="loadTableElement" tabla="tablaArchivos" onclick="consultaArchivos(this)" title="Consultar Archivos"/> 
                      </td>
                      <td width="80px">idBanco</td>
                      <td width="80px">idInterfase</td>
                      <td width="100px">Banco</td>
                      <td width="200px">Interfase</td>
                    </tr>
                  </table>
                  <div style="height:50px; overflow:auto; width:483px;" >
                          <table id="tablaArchivos" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaArchivosData" keys="idBanco,idInterfase" fun="clickTablaArchivos" radioWidth="23"></table>
                     </div>
                  
      </td>
  </tr>
  <tr>
    <td width="60%" height="100%" colspan=2>&nbsp;</td>
  </tr>
  <tr>
      <td colspan=2>
        <iframe id="frameUpload" onmouseover="if(GI('ocultaArchivo').value=='1'){GI('ocultaArchivo').value='0';document.frameUpload.location=GI('ruta').value+'/modules/Operacion/Conciliacion/ConciliacionUpload.do';}" name="frameUpload" align="center" style="z-index:1;" src="<%=request.getContextPath()%>/modules/Operacion/Conciliacion/ConciliacionUpload.do" frameborder="0" scrolling="no" width="600" height="50" AllowTransparency></iframe>
        <div id="dvInterface" class="texto"></div>
      </td>
  </tr>
  <tr>
    <td align="center" colspan=2>
     <input type="button" value="Subir Archivo" name="cmdAceptar" id="cmdAceptar" class="boton" onclick="subirArchivo()"/>&nbsp;&nbsp;&nbsp;&nbsp;
     <input type="button" value="Conciliar" name="cmdVaciar" id="cmdVaciar" class="boton" onclick="funConcilia()"/>&nbsp;&nbsp;&nbsp;&nbsp;     
     <input type="BUTTON" id="cmdConcilia" name="cmdConcilia" value="Consultar" class="boton" ref="consultaConciFinan" fun="loadTableElement" tabla="tablaConcilia" onclick="consultar(this, GI('frmDatosInterfase'), false);"/>
     <input type="BUTTON" id="ejeReporte" name="ejeReporte" value="Reporte" class="boton"   onclick="ejecutaReporte(0);"/>
     <input type="BUTTON" id="ejeReporteExcel" name="ejeReporteExcel" value="Exportar Excel" class="boton"   onclick="ejecutaReporte(1);"/>
    </td>
  </tr>
</table>
 


    <div id="div1" style="width:903px;" align="center">   
      <table cellspacing="0" cellpadding="0" border="0" width="100%" align="center" style="position:relative;left:0;">
        <tr>
          <td colspan="2" align="center"> <input type="BUTTON" id="cmdOperacion" name="cmdOperacion" value="Consultar" class="boton" ref="consultaConciliacion" fun="loadTableElementConcilia" tabla="tablaConceptos" onclick="conciliaOpe()"/></td>
        </tr>
         <tr>
          <td colspan="2" align="center">&nbsp; </td>
        </tr>
         <tr>
          <td colspan="2" align="center">&nbsp; </td>
        </tr>
        <tr align="center">
                <td colspan="2">
                <table cellspacing="0" cellpadding="0" border="0">
                    <tr align="left" class="cabeceras">
                      <td width="23px" align="center">&nbsp;</td>
                      <td width="170px">Concepto</td>
                      <td width="100px">Estado</td>
                      <td width="30px">No.</td>
                      <td width="140px">Estado</td>
                      <td width="30px">No.</td>
                      <td width="100px">Estado</td>
                      <td width="30px">No.</td>
                      <td width="100px">Estado</td>
                      <td width="30px">No.</td>
                      <td width="110px">Estado</td>
                      <td width="30px">No.</td>
                      <td width="100px">Estado</td>
                      <td width="30px">No.</td>
                    </tr>
                  </table>
                  <div style="height:200px; overflow:auto; width:973px;">
                    <table id="tablaConceptos" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaConceptosData" keys="fcaDescripcion" fun="" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda"/>
                  </div>
                </td>
              </tr>
      </table>
    </div>   
    
    <div style="position:absolute;left:-50;" id="contDet">
      <table id="div4" cellspacing="0" cellpadding="0" border="0" width="100%" align="center">
        <tr>
                <td align="center" valign="middle" class="subtitulo">Consulta Detallada (Depositos,Retiros,Traspasos y Valuación Mercado)</td>
        </tr>
        <tr align="center" >
                <td>
                      <div id="conDetallada">
                          <table cellspacing="1" cellpadding="0" border="0" style="width:1000px;">
                              <tr align="left" class="cabeceras">
                                <td width="900px" align="center">&nbsp;</td>
                              </tr>
                          </table>
                         <div style="height:150;">
                            &nbsp;
                         </div> 
                      </div>
                </td>
              </tr>
      </table>
    </div>
    
    <div style="position:absolute;left:0;">
      <table id="div3" cellspacing="0" cellpadding="0" border="0" width="100%" align="center" style="position:relative;top:-80;visibility:hidden">
    
        <tr align="center">
                <td colspan="2">
                <div style="overflow:auto; width:903px; height:190px;">
                <table cellspacing="0" cellpadding="0" border="0" style="width:2623px;">
                    <tr align="left" class="cabeceras">
                      <td width="23px" align="center">&nbsp;</td>
                      <td width="100px">Status</td>
                      <td width="100px">Secuencial</td>
                      <td width="100px">Dato1</td>
                      <td width="100px">Valor1</td>
                      <td width="100px">Datoc1</td>
                      <td width="100px">Valorc1</td>
                      <td width="100px">Dato2</td>
                      <td width="100px">Valor2</td>
                      <td width="100px">Datoc2</td>
                      <td width="100px">Valorc2</td>
                      <td width="100px">Dato3</td>
                      <td width="100px">Valor3</td>
                      <td width="100px">Datoc3</td>
                      <td width="100px">Valorc3</td>
                      <td width="100px">Dato4</td>
                      <td width="100px">Valor4</td>
                      <td width="100px">Datoc4</td>
                      <td width="100px">Valorc4</td>
                      <td width="100px">Dato5</td>
                      <td width="100px">Valor5</td>
                      <td width="100px">Datoc5</td>
                      <td width="100px">Valorc5</td>
                      <td width="100px">Dato6</td>
                      <td width="100px">Valor6</td>
                      <td width="100px">Datoc6</td>
                      <td width="100px">Valorc6</td>
                    </tr>
                  </table>
                    <table width="2623px" id="tablaConcilia" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaConciliaData" keys="fcdIdSecuencial,fcdFecha,fcdIdConciliacion" fun="" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda"/>
                  </div>
                  
                 </div> 
                </td>
              </tr>
      </table>
      </div>

<a id="linkReporte" href="#" style="visibility:hidden" target="_blank">Archivo</a> 
   <a id="linkReporteNew" href="#" style="visibility:hidden" target="_blank">Archivo</a>
   

</form>