<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table width="100%" style="height:auto;">
    <tr>
      <td align="center" class="titulo">Prestamos de Expedientes</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table align="center" class="texto">
          <!--<tr>
            <td width="35%">&nbsp;</td>
            <td width="10%">Expediente</td>
            <td>
              <input type="text" name="paramNumExpediente" id="paramNumExpediente" size="5" maxlength="5" tipo="Num"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>-->
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="10%">Fideicomiso</td>
            <td>
              <select size="1" name="paramNumFideicomiso" id="paramNumFideicomiso" ref="conNumFidNomFid" fun="loadComboElement" keyValue="ctoNumContrato" theValue="ctoNomContrato" next="paramNumCategoria"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="10%">Folio Documento</td>
            <td>
              <input type="text" name="paramNomDocumento" id="paramNomDocumento" size="30" maxlength="5" tipo="Texto"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="10%">Categoria</td>
            <td>
              <select name="paramNumCategoria" id="paramNumCategoria" ref="qryArchiveroCategorias" fun="loadComboElement" keyValue="idCategoria" theValue="nomCategoria" next="paramCveStatus" param="cmbCategorias"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="10%">Status</td>
            <td>
              <select size="1" name="paramCveStatus" id="paramCveStatus" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbStatusArchivo" next="docEjecutivoPrestamo"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="10%">Solo Historico</td>
            <td>
              <input type="checkbox" onclick="if(this.checked){SA(GI('cmdAceptar'),'ref','qryHistoricoPrestamosDocumento');}else{SA(GI('cmdAceptar'),'ref','qryDocumentosPrestadosYDisponibles')}"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="button" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" ref="qryDocumentosPrestadosYDisponibles" fun="loadTableElement" tabla="tblReg" onclick="consultar(this, GI('frmDatos'), false)"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" value="Limpiar" name="cmdLimpiar" class="boton" onclick="limpiar(frmDatos);"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="BUTTON" value="Prestar" id="btnPrestar" disabled class="boton" onclick="solicitaDatos('prestar')"/>
              <input type="BUTTON" value="Devolver" id="btnDevolver" disabled class="boton" onclick="solicitaDatos('devolver')"/>
              
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
                  <td width="100" nowrap>Folio</td>
                  <!--<td width="100" nowrap>Expediente</td>
                  <td width="300" nowrap>Ubicacion Fisica</td>-->
                  <td width="100" nowrap>Fideicomiso</td>
                  <td width="200" nowrap>Nombre Documento</td>
                  <td width="100" nowrap>Fecha Prestamo</td>
                  <td width="100" nowrap>Fecha Venc.</td>
                  <td width="100" nowrap>Fecha Entrega</td>
                  <td width="100" nowrap>Estatus</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:823px;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblReg" dataInfo="arrTblDat" keys="preSecuencial,docIdDocumento,docEstatus" fun="clickTabla" radioWidth="23px">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <div id="datosPrestamo" style="width:500px;height:200px;position:absolute;left:200px;top:33%;background-color:#ffffff;border:solid 1px #999;padding-top:30px;padding-bottom:30px;display:none">
    <table>
    <tr>
        <td style="font-size:12px;">Prestar a:</td><td><select id="docEjecutivoPrestamo" name="docEjecutivoPrestamo" required ref="muestraUsuariosActivos" fun="loadComboElement" keyValue="perNumUsuario" theValue="perNomUsuario" next="formsLoaded"></select></td>
    </tr>
    <tr>
        <td style="font-size:12px;">Fecha de Vencimiento:</td><td><input id="docFechaVencimientoPrestamo" name="docFechaVencimientoPrestamo" required type="text" style="width:80px"></td>
    </tr>
    <tr>
        <td style="font-size:12px;">Nota:</td><td><textarea id="docNotaPrestamo" name="docNotaPrestamo" style="width:200px"></textarea></td>
    </tr>
    <tr>
        <td colspan="2" align="center"><input class="boton" type="button" value="Regresar" onclick="GI('datosPrestamo').style.display='none';"><input class="boton" type="button" value="Aceptar" onclick="prestaDocumento()"></td>
    </tr>
    </table>
  </div>
</FORM>

