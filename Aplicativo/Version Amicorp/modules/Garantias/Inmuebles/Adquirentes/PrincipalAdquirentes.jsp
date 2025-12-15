<FORM name="frmPrincipalAdquirentes" id="frmPrincipalAdquirentes" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Adquirentes</td>
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
            
               <input type="text" name="paramNumFideicomiso" id="paramNumFideicomiso" tipo="Num" size="10" maxlength="10" onblur="consultaNombreFideicomiso('nomFideicomiso',this);"/>
            </td>
            <td width="45%">
              <div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam">&nbsp;</div>
            </td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="8%" nowrap>Num. Inmueble</td>
            <td>
              <input type="text" name="paramInmueble" id="paramInmueble" size="50" maxlength="50"/>
            </td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="8%" nowrap>Num. Unidad</td>
            <td>
              <input type="text" name="paramDepto" id="paramDepto" size="50" maxlength="50"/>
            </td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="8%" nowrap>Adquirente</td>
            <td>
              <input type="text" name="paramComprador" id="paramComprador" size="25" maxlength="125"/>
            </td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td width="8%" nowrap>Estatus</td>
            <td>
              <select size="1" name="paramStatus" id="paramStatus" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="loadCatalogo" param="clavesCombo560"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="BUTTON" value="Aceptar" id="cmdAceptar" name="cmdAceptar" class="boton" ref="principalAdquirentes" fun="loadTableElement" tabla="tablaConsultaAdquirentes" onclick="consultar(this, GI('frmPrincipalAdquirentes'), false);"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<!--principalAdquirentes-->
              <input type="BUTTON" value="Limpiar" id="cmdLimpiar" name="cmdLimpiar" class="boton" onclick="RF(GI('frmPrincipalAdquirentes'));"/>
            </td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="BUTTON" value="  Alta   " id="cmdAlta" name="cmdAlta" class="boton" onclick="cargaMantenimientoAdquirentes(1);"/>
              <input type="BUTTON" value="Modificar" id="cmdModificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoAdquirentes(2);"/>
              <input type="BUTTON" value="  Baja   " id="cmdBaja" name="cmdBaja" class="boton" onclick="eliminarRegistro();"/>
              <input type="BUTTON" value="Consultar" id="cmdConsultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoAdquirentes(3);"/>
               
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
                  <td width="124px">SubFiso</td>
                  <td width="126px">Inmueble</td>
                  <td width="126px">Edificio</td>
                  <td width="150px">Depto</td>
                  <td width="85px">Periodo Venta</td>
                  <td width="150px">Adquirente</td>
                  <td width="85px">Saldo</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top;">
                <table id="tablaConsultaAdquirentes" border="0" cellspacing="0" cellpadding="0" dataInfo="arregloParametrosAdquirentes" keys="fadqIdFideicomiso,fadqIdSubcuenta,fadqIdBien,fadqIdEdificio,fadqIdDepto,fadqIdVenta"  fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
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