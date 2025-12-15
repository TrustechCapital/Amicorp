<form name="frmDatos" id="frmDatos" onsubmit="">
  <table width="100%">
    <tr>
      <td align="center" class="titulo">Par&aacute;metros de C&aacute;lculo</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table align="center" class="texto">
          <tr>
            <td nowrap width="25%">&nbsp;</td>
            <td nowrap width="10%">Id RC</td>
            <td nowrap>
              <input type="text" name="paramidRC" id="paramidRC" tipo="Texto" size="10" maxlength="5" onblur="upperRC(this);cargaProgFid(this,GI('paramNumPrograma'),GI('paramNumFiso'));"/>
              
              <!--select size="1" name="numEmision" id="numEmision" ref="conETCmbEmiAsgPrgFid" fun="loadComboElement" keyValue="eemiIdPrograma" theValue="pizarraSerie"  param="cmbEmisionParam" next="paramNumPrograma" onchange="cargaComboSiguiente(this);">
                <option value="-1">-- Seleccione --</option>
              </select-->
            </td>
            <td colspan=3>&nbsp;</td>
            <td nowrap width="20%">&nbsp;</td>
          </tr>
          
          <tr>
            <td nowrap width="25%">&nbsp;</td>
            <td nowrap width="10%">Programa</td>
            <td nowrap>
                <select size="1" disabled name="paramNumPrograma" id="paramNumPrograma" ref="conETCmbProgs" fun="loadComboElement" keyValue="eproIdPrograma" theValue="eproNomPrograma" param="cmbPrograma"  next="paramNumFiso"  ><!--required message="El Programa es un campo obligatorio"-->
                  <option value="0">-- Seleccione --</option><!--onchange="cargaComboFideicomiso(this,GI('eemiIdFideicomiso'),false,0);"-->
                </select>
              <!--select size="1" disabled name="paramNumPrograma" id="paramNumPrograma" ref="conETCmbProgs" fun="loadComboElement" keyValue="eproIdPrograma" theValue="eproNomPrograma" next="paramNumFiso" /-->
            </td>
            <td width="5">&nbsp;</td>
            <td nowrap>Pizarra</td>
            <td>
              <input type="text" name="paramPizarra" id="paramPizarra" size="10" maxlength="50"/>
            </td>
            <td nowrap width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="25%">&nbsp;</td>
            <td nowrap width="10%">Fideicomiso</td>
            <td nowrap>
               <select size="1" name="paramNumFiso" id="paramNumFiso" ref="emision.conETEmisorFideicomiso" fun="loadComboElement" keyValue="idFideicomiso" theValue="descFideicomiso" next="formsLoaded" param="cmbFideicomiso"><!--  onchange="cargaComboFideicomiso(this,GI('eemiNomEmisor'),false,0);" required message="El Fideicomiso es un campo obligatorio"-->
                  <option value="0">-- Seleccione --</option>
                </select>
              <!--select size="1" disabled name="paramNumFiso" id="paramNumFiso" ref="conETCmbFisoAsigProg" fun="loadComboElement" keyValue="efidIdFideicomiso" theValue="ctoNomContrato" param="cmbFideicomisoParam" next="formsLoaded">
                <option value="-1">-- Seleccione --</option>
              </select-->
            </td>
            <td width="5">&nbsp;</td>
            <td nowrap>Serie&nbsp;</td>
            <td>
                <input type="text" name="paramSerie" id="paramSerie" size="10" maxlength="50"/>
            </td>
            <td nowrap width="20%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="7" align="center" nowrap>
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="7" align="center" nowrap>&nbsp;
              
              <input type="button" value="Aceptar" name="cmdAceptar" class="boton" ref="conETPriDatGen" fun="loadTableElement" tabla="tblReg" onclick="consultar(this, frmDatos, false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" value="Limpiar" name="cmdLimpiar" class="boton" onclick="limpiar(frmDatos);"/>
            </td>
          </tr>
          <tr>
            <td colspan="7" align="center" nowrap>&nbsp;</td>
          </tr>
          <tr>
            <td height="100%" align="center" colspan="7">
              <input type="BUTTON" value="Consultar" name="cmdConsultar" class="boton" onclick="cargaDetalleParametrosCalculo(1);"/>
            </td>
          </tr>
          <tr>
            <td colspan="7" align="center" nowrap>&nbsp;</td>
          </tr>
          <tr align="center">
            <td colspan="7" nowrap>
              <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td class="cabeceras" width="23" nowrap>&nbsp;</td>
                  <td class="cabeceras" width="50">Id RC</td>
                  <td class="cabeceras" width="100">No. Programa</td>
                  <td class="cabeceras" width="250">Nombre Programa</td>
                  <td class="cabeceras" width="100">Fideicomiso</td>
                  <td class="cabeceras" width="250">Nombre Fideicomiso</td>
                  <td class="cabeceras" width="100">Pizarra</td>
                  <td class="cabeceras" width="100">Serie</td>
                  <td class="cabeceras" width="100">Moneda</td>
                  <td class="cabeceras" width="100">Importe VNT</td>
                  <td class="cabeceras" width="100">Importe VN</td>
                  <td class="cabeceras" width="100">No. Titulos</td>
                  <td class="cabeceras" width="100">Plazo</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:1400px;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblReg" dataInfo="arrTblDat" keys="idRc,eemiIdPrograma,eproNomPrograma,eemiIdFideicomiso,ctoNomContrato,eemiIdEmision,eemiCvePizarra,eemiNumSerie,eemiNumMoneda,eemiImpEmision,eemiImpNomEmision,eemiNumTitulos,eemiPlazo" fun="clickTabla" radioWidth="23px" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>