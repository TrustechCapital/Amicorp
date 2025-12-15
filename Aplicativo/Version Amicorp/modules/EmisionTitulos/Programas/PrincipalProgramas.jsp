<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table width="100%" style="height:auto;">
    <tr>
      <td align="center" class="titulo">Programas</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table align="center" class="texto">
          <tr valign="middle">
            <td width="30%">&nbsp;</td>
            <td nowrap width="13%">Id RC</td>
            <td>
              <input type="text" name="paramIdRC" id="paramIdRC" tipo="Texto" class="idRC" size="10" maxlength="5" onblur="upperRC(this)"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="30%">&nbsp;</td>
            <td nowrap width="13%">Programa</td>
            <td>
              <select size="1" name="paramNumPrograma" id="paramNumPrograma" ref="conETCmbProgs" fun="loadComboElement" keyValue="eproIdPrograma" theValue="eproNomPrograma" next="paramInstrumento"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="13%">Tipo de Instrumento</td>
            <td>
              <select size="1" name="paramInstrumento" id="paramInstrumento" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbLoadParam510" next="formsLoaded"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="13%">Fecha de Inicio</td>
            <td>
              <input type="text" name="paramFechaInicio" id="paramFechaInicio" size="10" maxlength="10" tipo="Fecha"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="13%">Fecha de Vencimiento</td>
            <td>
              <input type="text" name="paramFechaVencimiento" id="paramFechaVencimiento" size="10" maxlength="10" tipo="Fecha"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <!--tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="13%">Status</td>
            <td>
              <select size="1" name="paramStatus" id="paramStatus" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbStatusParam" next="formsLoaded"/>
            </td>
            <td>&nbsp;</td>
          </tr-->
          <tr>
            <td colspan="4" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">&nbsp;
              <input type="button" value="Aceptar" name="cmdAceptar" class="boton" ref="conETPriProg" fun="loadTableElement" tabla="tblReg" onclick="consultar(this, frmDatos, false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
              <input type="BUTTON" value="   Alta  " name="cmdAlta" class="boton" onclick="cargaMantenimientoProgramas(1);"/>
              <input type="BUTTON" value="Modificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoProgramas(2);"/>
              <input type="BUTTON" value="   Baja  " name="cmdBaja" class="boton" onclick="cargaMantenimientoProgramas(3);"/>
              <input type="BUTTON" value="Consultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoProgramas(4);"/>
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
                  <td width="80">Id RC</td>
                  <td width="80">Programa</td>
                  <td width="140">Tipo Negocio</td>
                  <td width="200">Nombre</td>
                  <td width="200">Instrumento</td>
                  <td width="150">Modalidad Emisi&oacute;n</td>
                  <td width="100">Importe</td>
                  <td width="100">Imp Disponible</td>
                  <!--td width="100">Status</td-->
                </tr>
              </table>
              <div style="height:200px; overflow:auto; position:relative; vertical-align:top; width:1073px;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblReg" dataInfo="arrTblDat" keys="eproIdPrograma" fun="clickTabla" radioWidth="23px">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
