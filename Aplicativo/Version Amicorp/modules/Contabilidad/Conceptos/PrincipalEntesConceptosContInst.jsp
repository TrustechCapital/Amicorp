<form name="frmDatosConceptosEntes" id="frmDatosConceptosEntes" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Conceptos Contabilidad Institucional (Entes)</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="10%">Fideicomiso</td>
            <td>
              <input type="text" name="paramNumFideicomiso" id="paramNumFideicomiso" size="10" tipo="Num"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="10%">Entes</td>
            <td>
              <input type="text" name="paramEnte" id="paramEnte" size="10" tipo="Num"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="10%">Status</td>
            <td>
              <select size="1" name="paramStatus" id="paramStatus" ref="cves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="cmbStatusParam" next="formsLoaded"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td align="center" colspan="4">&nbsp;
              <input type="button" value="Aceptar" name="cmdAceptar" class="boton" ref="conPriConEnt" fun="loadTableElement" tabla="tblRegPriConEnt" onclick="consultarCount(this, frmDatosConceptosEntes, false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" value="Limpiar" name="cmdLimpiar" class="boton" onclick="limpiar(frmDatosConceptosEntes);"/>
            </td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="4">
              <input type="button" value="   Alta  " name="cmdAlta" class="boton" onclick="cargaMantenimientoEntesConceptosContInst(1);"/>
              <input type="button" value="Modificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoEntesConceptosContInst(2);"/>
              <input type="button" value="   Baja  " name="cmdBaja" class="boton" onclick="cargaMantenimientoEntesConceptosContInst(3);"/>
              <input type="button" value="Consultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoEntesConceptosContInst(4);"/>
            </td>
          </tr>
          <tr>
            <td colspan="4">
              <P class="subtitulo" align="center">&nbsp;</P>
            </td>
          </tr>
          <tr align="center">
            <td colspan="4">
              <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="23" nowrap class="cabeceras">&nbsp;</td>
                  <td width="100" nowrap class="cabeceras">Fideicomiso</td>
                  <td width="100" nowrap class="cabeceras">No. Ente</td>
                  <td width="100" nowrap class="cabeceras">Tipo de Ente</td>
                  <td width="100" nowrap class="cabeceras">Status</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;width:446px">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegPriConEnt" dataInfo="arrTblConEntDat" keys="entNumContrato,entNumEnteCont,entCveStEntes" fun="clickTabla" radioWidth="25px" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
