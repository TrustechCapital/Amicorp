<FORM name="frmPrincipalUnidades" id="frmPrincipalUnidades" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Individualizaci&oacute;n de Inmuebles (Unidades Condominales)</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="8%" nowrap>Fideicomiso:</td>
            <td>
              <!--<input type="text" name="paramNumUsuario" id="paramNumUsuario" tipo="Num" size="10" maxlength="10"/>-->
               <input type="text" name="paramNumFideicomiso" id="paramNumFideicomiso" tipo="Num" size="10" maxlength="10" onblur="consultaNombreFideicomiso('nomFideicomiso',this);"/>
            </td>
            <td width="45%">
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
            </td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="8%" nowrap>Unidad:</td>
            <td>
              <!--<input type="text" name="paramNumUsuario" id="paramNumUsuario" tipo="Num" size="10" maxlength="10"/>-->
               <input type="text" name="paramNumUnidad" id="paramNumUnidad"  size="10" maxlength="10"/>
            </td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="8%" nowrap>Status:</td>
            <td>
              <select size="1" name="paramCveStatus" id="paramCveStatus" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="formsLoaded" param="clavesCombo560"/>
            </td>
          </tr>
          
          <tr>
            <td colspan="4" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="BUTTON" value="Aceptar" id="cmdAceptar" name="cmdAceptar" class="boton" ref="prinUnidades" fun="loadTableElement" tabla="tablaConsultaUnidades" onclick="consultar(this, GI('frmPrincipalUnidades'), false);"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="BUTTON" value="Limpiar" id="cmdLimpiar" name="cmdLimpiar" class="boton" onclick="RF(GI('frmPrincipalUnidades'));"/>
            </td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="BUTTON" value="  Alta   " id="cmdAlta" name="cmdAlta" class="boton" onclick="cargaMantenimientoUnidades(1);"/>
              <input type="BUTTON" value="Modificar" id="cmdModificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoUnidades(2);"/>
              <input type="BUTTON" value="  Baja   " id="cmdBaja" name="cmdBaja" class="boton" onclick="eliminarRegistro();"/>
              <input type="BUTTON" value="Consultar" id="cmdConsultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoUnidades(3);"/>
               <input type="BUTTON" value="Mantenimiento Liberación" id="cmdMantenimientoLiberacion" name="cmdMantenimientoLiberacion" class="boton" onclick="cargaMantenimientoUnidades(4);" style="visibility:hidden"/>
            </td>
          </tr>
           <tr>
            <td width="100%" colspan="5" align="center" valign="middle">&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="5">
              <table cellspacing="0" cellpadding="0" border="0">
                <tr align="left" class="cabeceras">
                  <td width="23px">&nbsp;</td>
                  <td width="100px">Fideicomiso</td>
                  <td width="100px">Sub Cta.</td>
                  <td width="100px">Id Garantia</td>
                  <td width="100px">Id Bien</td>
                  <td width="100px">Edificio</td>
                  <td width="100px">Num. Unidad</td>
                  <td width="150px">Registro Contable</td>
                  <td width="100px">Moneda</td>
                  <td width="100px">Status</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width: 973px; ">
                <table id="tablaConsultaUnidades" border="0" cellspacing="0" cellpadding="0" dataInfo="arregloParametrosUnidades" keys="funiIdFideicomiso,funiIdSubcuenta,funiIdBien,funiIdEdificio,funiIdDepto"  fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
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