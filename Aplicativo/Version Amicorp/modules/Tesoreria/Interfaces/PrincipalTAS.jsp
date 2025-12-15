<!--modificar-->
<TD colspan="2" valign="middle" align="center" class="titulo">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <FORM name="frmTas" id="frmTas" method="post">

      <input type="hidden" id="paramInterfaceID" name="paramInterfaceID" value="" />
      <input type="hidden" id="paramFechaAnt" name="paramFechaAnt" value="" />
      <input type="hidden" id="paramMesAbierto" name="paramMesAbierto" value="1" />

      <input type="hidden" id="paramInterfase" name="paramInterfase" value="" />
      <input type="hidden" name="paramDia" id="paramDia" size="2" maxlength="2" tipo="Num"/>
      <input type="hidden" name="paramMes" id="paramMes" size="2" maxlength="2" tipo="Num" required message="El Mes es un campo obligatorio" onblur="asignaRequiredCampos(this);"/>
      <input type="hidden" name="paramAnio" id="paramAnio" size="4" maxlength="4" tipo="Num" required message="El Año es un campo obligatorio" onblur="asignaRequiredCampos(this);"/>
      
      <input type="hidden" id="paramUsuario" name="paramUsuario" value="<%=session.getAttribute("userid")!=null?session.getAttribute("userid").toString():"0"%>"/>
      <!--%String res = request.getParameter("resp")==null?"0":request.getParameter("resp");%-->
      <tr>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
        <td height="100%">&nbsp;</td>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Interfase Tas </td>
      </tr>
      <tr>
        <td height="100%">
          <!--<input type="BUTTON" value="pruebas TIMMER " name="pruebas" class="boton" onclick="iniciarProcesoParaGenerarPorcentajesDeTiempoTranscurrido();"/>-->
        </td>
      </tr>
      <tr>
        <td height="100%">
          <table width="50%" align="center" class="texto" border="0">
            <tr valign="middle">
              <td></td>
              <td align="left" nowrap>Fecha:</td>
              <td align="center">
                <input type="text" id="paramFecha" name="paramFecha" tipo="Fecha" onblur="descomponeFecha(this)" required style="width:100px;">
              </td>
            
            </tr>
            <tr valign="middle">
              <td></td>
              <td align="left" nowrap>Interface a Ejecutar:</td>
              <td align="center">
                <select id="slcReportes" name="slcReportes" onblur="cambiaInterface(this.value)" required style="width:100px;">
                  <option value="-1">-- Seleccione --</option>
                  <option value="mx.gob.nafin.fiduciario.business.upload.processors.TasProcessorImpl:1">TAS</option>
                  <option value="mx.gob.nafin.fiduciario.business.upload.processors.TasProcessorImplCapitales:1">TAS MC</option>
                  <option value="mx.gob.nafin.fiduciario.business.upload.processors.ScnProcessorImpl:3">SCN</option>
                  <option value="mx.gob.nafin.fiduciario.business.upload.processors.MecaProcessorImpl:4">MECA</option>
                  <option value="mx.gob.nafin.fiduciario.business.upload.processors.TefProcessorImpl:2">TEF</option>
                </select>
              </td>
                <td colspan>
                <input class="boton" type="button" name="btnLimpiar" id="btnLimpiar" value="Limpiar" onclick="Limpiar();"/>
              
              </td>
            </tr>
            <tr valign="left">
              <td align="left" colspan=4>&nbsp;
              </td>
             
            </tr> 
              <tr valign="left">
              <td align = "right" colspan=2>
                <input type="BUTTON"  name="btnConsultaArchivo" id="btnConsultaArchivo" value="Consultar" class="boton" fun="loadTableElement" tabla="tblTransferenciaPri" onclick="consultaArchivo();" />
               
               </td><td colspan=2>
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input class="boton" type="button" name="btnEliminar" id="btnEliminar" value="Eliminar" onclick="procesoEliminar();"/>
              </td>
            <tr valign="left">
              <td align="left" colspan=4>&nbsp;
              </td>
             
            </tr>  
            <tr >            
              <td align="center" colspan="4">
                <input type="button" value="Archivo Aplicación" name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaResultadoTransferencia();"/>
              </td>   
                          
            </tr>
            <tr valign="middle">
              <td colspan="4" align="center" class="subtitulo" width="30%">
                <a id="ligaArchivo" href="#" style="visibility:hidden">Archivo</a>
              </td>
            </tr>            
            <!--tr>
                <td>
                    <input type="text" id="resp" name="resp" value="<%/*=res*/%>">
                </td>
            </tr-->
            <tr>
              <td colspan="4">
                <hr/>
              </td>
            </tr>
            
        </tr>
      </table>
    </td>
  </tr>
  </FORM>
   <!--% 
    res = request.getParameter("resp")==null?"0":request.getParameter("resp");
    //out.println(res);
    if(res.equals(String.valueOf("0"))){%-->
            <tr>
              <td colspan="4" align="center">
                <iframe id="frameUpload" align="center" style="z-index:1;" src="<%=request.getContextPath()%>/modules/Tesoreria/Interfaces/TasUpload.do" frameborder="0" scrolling="no" width="600" height="50" AllowTransparency></iframe>
                <div id="dvInterface" class="texto"></div>
              </td>
            </tr>
  <%/*}else{*/%>
            <!--tr>
              <td colspan="2">
                Éste archivo ya ha sido procesado
              </td>
            </tr-->
  <%/*}*/%>
          </table>
        </td>
      <tr>
        <td>
        </td>
      </tr>
      </tr>
          <tr>
            <td colspan="8" align="center">
              <table cellspacing="0" cellpadding="0" border="0" class="texto" width="913px">
                <tr align="left" class="cabeceras">
                  <td align="center" nowrap width="23">&nbsp;</td>
                  <td nowrap width="80">Fideicomiso</td>
                  <td nowrap width="80">Secuencial</td>
                  <td nowrap width="150">Tipo Movimiento</td>
                  <td nowrap width="100">Cto. Inversión</td>
                  <td nowrap width="100">Pizarra</td>
                  <td nowrap width="100">Serie</td>
                  <td nowrap width="50">Cupón</td>
                  <td nowrap width="80">Status</td>
                  <td nowrap width="150">Nombre Archivo</td>
                </tr>
              </table>
              <div id="tablaConsulta" style="height:300px; overflow:auto; position:relative; vertical-align:top;width:913px">
                <table id="tblTransferenciaPri" border="0" cellspacing="0" cellpadding="0" dataInfo="arrTblTransferencia" keys="traAnoMovto,traMesMovto,traDiaMovto,traEntidadFin" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>        
          </tr>      
    </form>
  </table>
  
  <div id="dvFileUpload" style="position: absolute; top: 0; left: 0;"></div>
</TD>
