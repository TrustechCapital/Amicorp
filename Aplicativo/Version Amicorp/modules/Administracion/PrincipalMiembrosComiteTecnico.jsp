<FORM name="frmDatosMiembrosComiteTecnicoConsulta" id="frmDatosMiembrosComiteTecnicoConsulta" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Miembros del Comite T&eacute;cnico</td>
      </tr>
      <tr>
        <td height="100%">
          <input type="BUTTON" id="hdRegistrosMiembrosComiteTecnico" name="hdRegistrosMiembrosComiteTecnico" ref="muestraDatosMiembrosComiteTecnico" fun="loadTableElement" tabla="tablaRegistrosMiembrosComiteTecnico" param="varNumContratoMiembros" style="visibility:hidden"/>
        </td>
      </tr>
      <tr>
        <td height="100%">
          <table width="100%" align="center" class="texto" border="0" cellspacing="1" cellpadding="2">
            <tr valign="middle">
              <td width="35%">&nbsp;</td>
              <td width="5%" nowrap>N&uacute;m. Fideicomiso</td>
              <td colspan="2" width="5%">
                <input type="text" name="paramNumContratoMiembros" id="paramNumContratoMiembros" size="10" maxlength="10" tipo="Num"/>
              </td>
              <td colspan="3">
                <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
              </td>
            </tr>
            <tr>
              <td width="35%">&nbsp;</td>
              <td width="5%" nowrap>Comite t&eacute;cnico</td>
              <td colspan="5">
                <input type="text" name="txtNomComite" id="txtNomComite" size="50" maxlength="50"/>
              </td>
            </tr>
            <tr>
              <td width="35%">&nbsp;</td>
              <td width="5%" nowrap>&nbsp;</td>
              <td width="5%" colspan="3">&nbsp;</td>
              <td align="left">&nbsp;</td>
              <td align="left" width="13%">&nbsp;</td>
            </tr>
            <tr>
              <td width="20%" class="subtitulo" align="center" colspan="7">
                <input type="BUTTON" value="  Alta   " id="cmdAlta" name="cmdAlta" class="boton" onclick="cargaMantenimientoMiembrosComiteTecnico(1);"/>
                <input type="BUTTON" value="Modificar" id="cmdModificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoMiembrosComiteTecnico(2);"/>
                <input type="BUTTON" value="  Baja   " id="cmdBaja" name="cmdBaja" class="boton" onclick="eliminarRegistroMiembros();"/>
                <input type="BUTTON" value="Consultar" id="cmdConsultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoMiembrosComiteTecnico(3);"/>
                <input type="BUTTON" value="Regresar " id="cmdRegresar" name="cmdRegresar" class="boton" onclick="cargaPrincipalComiteTecnico();"/>
              </td>
            </tr>
            <tr>
              <td width="20%" class="subtitulo" align="center" colspan="7">&nbsp;</td>
            </tr>
            <tr align="center">
              <td colspan="7">
                <table cellspacing="0" cellpadding="0" border="0">
                  <tr align="left" class="cabeceras">
                    <td width="23px" align="center" nowrap>&nbsp;</td>
                    <td width="220px" nowrap>Nombre del Miembro</td>
                    <td width="200px" nowrap>Participación</td>
                    <td width="270px" nowrap>Nombre de la Instituci&oacute;n</td>
                    <td width="350px" nowrap>Nombre del Puesto</td>
                    <td width="90px" nowrap>Status</td>
                  </tr>
                </table>
                <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:1070px;">
                  <table id="tablaRegistrosMiembrosComiteTecnico" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaMiembrosComiteTecnicoData" keys="comNumMiembro,comNumContrato" fun="clickTablaMiembros" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                  </table>
              </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td width="60%" height="100%">&nbsp;</td>
      </tr>
  </table>
</FORM>
