<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table width="100%" style="height:auto;">
    <tr>
      <td align="center" class="titulo">Par&aacute;metros de Impresi&oacute;n</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table align="center" class="texto">
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="10%">Id RC</td>
            <td>
               <input type="text" name="paramIdRC" id="paramIdRC" tipo="Texto" size="10" maxlength="5" required message="El Id RC es un campo obligatorio" onblur="upperRC(this);consultaEmisor(this,GI('paramNumPrograma'),GI('paramNumFiso'),GI('paramNumEmision'));"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr valign="middle">
            <td width="35%">&nbsp;</td>
            <td width="10%">Programa</td>
            <td>
              <select size="1" disabled name="paramNumPrograma" id="paramNumPrograma" ref="conETCmbProgs" fun="loadComboElement" keyValue="eproIdPrograma" theValue="eproNomPrograma" next="paramNumFiso" onchange="showWaitLayer(); "/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="10%">Fideicomiso</td>
            <td>
              <select size="1" disabled name="paramNumFiso" id="paramNumFiso" ref="conETCmbFisoAsigProg" fun="loadComboElement" keyValue="efidIdFideicomiso" theValue="ctoNomContrato" next="cmbNumAutoridad" onchange="showWaitLayer();">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="10%">Emisi&oacute;n</td>
            <td>
              <select size="1" name="paramNumEmision" id="paramNumEmision" ref="conETCmbEmiAsgPrgFid" fun="loadComboElement" keyValue="eemiIdEmision" theValue="pizarraSerie" next="paramNumPrograma" param="cmbEmision">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="10%">Autoridad</td>
            <td>
              <select size="1" name="cmbNumAutoridad" id="cmbNumAutoridad" ref="conETCmbAut" fun="loadComboElement" keyValue="eautIdAutoridad" theValue="eautNomAutoridad" next="paramStatus" param="paramAutoridad" onchange="showWaitLayer(); cargaComboDependiente(this,false);"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="10%">Responsable</td>
            <td>
              <select size="1" name="paramNomResponsable" id="paramNomResponsable" ref="conETCmbRes" fun="loadComboElement" keyValue="eareNomResponsable" theValue="eareNomResponsable" next="formsLoaded" param="paramCmb">
                <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="35%">&nbsp;</td>
            <td width="10%">Status</td>
            <td>
              <select size="1" name="paramStatus" id="paramStatus" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbStatusParam" next="formsLoaded"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="button" value="Aceptar" name="cmdAceptar" class="boton" ref="conETPriParImp" fun="loadTableElement" tabla="tblReg" onclick="consultar(this, frmDatos, false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" value="Limpiar" name="cmdLimpiar" class="boton" onclick="limpiar(frmDatos);"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="text" name="paramNomAutoridad" id="paramNomAutoridad" size="10" style="visibility:hidden"/>
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="BUTTON" value="   Alta  " name="cmdAlta" class="boton" onclick="cargaMantenimientoParametrosImpresion(1);"/>
              <input type="BUTTON" value="Modificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoParametrosImpresion(2);"/>
              <input type="BUTTON" value="   Baja  " name="cmdBaja" class="boton" onclick="cargaMantenimientoParametrosImpresion(3);"/>
              <input type="BUTTON" value="Consultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoParametrosImpresion(4);"/>
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
                  <td width="50" nowrap>Id RC</td>
                  <td width="150" nowrap>Programa</td>
                  <td width="150" nowrap>Fideicomiso</td>
                  <td width="150" nowrap>Pizarra - Serie</td>
                  <td width="150" nowrap>Autoridad</td>
                  <td width="150" nowrap>Responsable</td>
                  <td width="100" nowrap>Tipo Aviso</td>
                  <td width="150" nowrap>Posici&oacute;n en Reporte</td>
                  <td width="70" nowrap>Secuencial</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblReg" dataInfo="arrTblDat" keys="idRc,envpIdPrograma,envpIdFideicomiso,envpIdEmision,envpIdTipoAviso,envpIdNumPos,envpIdSecuencial" fun="clickTabla" radioWidth="23px">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
