<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table width="100%" style="height:auto;">
    <tr>
      <td align="center" class="titulo">Emisiones</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table align="center" class="texto" border="0" cellspacing="1" cellpadding="2">
          <tr valign="middle">
            <td width="20%">&nbsp;</td>
            <td nowrap>Id RC</td>
            <td width="25%">
            
               <!--select size="1" name="numEmision" id="numEmision" ref="conETCmbEmisor" fun="loadComboElement" keyValue="esorIdEmsisor" theValue="esorNombre" next="paramNumPrograma" param="paramEmisor" onchange="cargaProgFid(this,GI('paramNumPrograma'),GI('paramNumFiso'))" required message="El Emisor es un campo obligatorio">
                  <option value="-1">-- Seleccione --</option>
                </select-->
                <input type="text" name="paramIdRC" id="paramIdRC" tipo="Texto" class="idRC" size="10" maxlength="5" onblur="upperRC(this);cargaProgFid(this,GI('paramNumPrograma'),GI('paramNumFiso'));"/>
              
              <!--select size="1" name="paramNumPrograma" id="paramNumPrograma" ref="conETCmbProgs" fun="loadComboElement" keyValue="eproIdPrograma" theValue="eproNomPrograma" next="paramInstrumento" onchange="cargaComboFideicomiso(this,GI('paramNumFiso'),false,0);"/-->
            </td>
            <td width="5">&nbsp;</td>
            <td nowrap>Fecha de Inicio</td>
            <td>
              <input type="text" name="paramFechaInicio" id="paramFechaInicio" size="10" maxlength="10" tipo="Fecha"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap>Programa</td>
            <td width="25%">
               <select size="1" disabled name="paramNumPrograma" id="paramNumPrograma" ref="conETCmbProgs" fun="loadComboElement" keyValue="eproIdPrograma" theValue="eproNomPrograma" param="cmbPrograma"  next="paramNumFiso"  ><!--required message="El Programa es un campo obligatorio"-->
                <option value="0">-- Seleccione --</option><!--onchange="cargaComboFideicomiso(this,GI('eemiIdFideicomiso'),false,0);"-->
                </select>
            
              <!--select size="1" name="paramNumFiso" id="paramNumFiso" ref="conETCmbFisoAsigProg" fun="loadComboElement" keyValue="efidIdFideicomiso" theValue="ctoNomContrato" next="formsLoaded" param="paramCmbProg" onchange="cargaComboFideicomiso(this,GI('paramNumEmision'),false,0);">
                <option value="-1">-- Seleccione --</option>
              </select-->
            </td>
            <td width="5">&nbsp;</td>
            <td nowrap>Pizarra</td>
            <td>
              <input type="text" name="paramPizarra" id="paramPizarra" size="10" maxlength="50"/>
              <!--select size="1" name="paramPizarra" id="paramPizarra" ref="conETCmbPizarraSerie" fun="loadComboElement" keyValue="eemiCvePizarra" theValue="eemiPizarraSerie" next="formsLoaded" /-->
            
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap>Fideicomiso</td>
            <td width="25%">
               <select size="1" name="paramNumFiso" id="paramNumFiso" ref="emision.conETEmisorFideicomiso" fun="loadComboElement" keyValue="idFideicomiso" theValue="descFideicomiso" next="paramInstrumento" param="cmbFideicomiso" ><!--   onblur="determinaNumEmision(GI('eemiIdPrograma'),this,this);" onchange="cargaComboFideicomiso(this,GI('eemiNomEmisor'),false,0);" required message="El Fideicomiso es un campo obligatorio"-->
                  <option value="0">-- Seleccione --</option>
                </select>
            
            
              <!--select size="1" name="paramNumEmision" id="paramNumEmision" ref="conETCmbEmiAsgPrgFid" fun="loadComboElement" keyValue="eemiIdEmision" theValue="pizarraSerie" next="formsLoaded" param="paramCmbProg">
                <option value="-1">-- Seleccione --</option>
              </select-->
            </td>
            <td width="5">&nbsp;</td>
            <td nowrap>Serie&nbsp;</td>
            <td>
                <input type="text" name="paramSerie" id="paramSerie" size="10" maxlength="50"/>
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap>Instrumento</td>
            <td width="25%">
              <select size="1" name="paramInstrumento" id="paramInstrumento" ref="conETDatInd" fun="loadComboElement" keyValue="eindIdSubindice" theValue="eindDescripcion" param="cmbInstrumento" next="formsLoaded" required message="El Instrumento es un campo obligatorio"/>
              <!--select size="1" name="paramInstrumento" id="paramInstrumento" ref="conETCmbInstrEmision" fun="loadComboElement" keyValue="eproInstrumento" theValue="eproInstrumento" next="paramStatus"/-->
            </td>
            <td width="5">&nbsp;</td>
            <td nowrap><!--Status--></td>
            <td>
              <!--select size="1" name="paramStatus" id="paramStatus" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbStatusParam" next="formsLoaded"/-->
            </td>
            <td width="5%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="7" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="7" align="center">
              <input type="button" value="Aceptar" name="cmdAceptar" class="boton" ref="conETPriDatGen" fun="loadTableElement" tabla="tblReg" onclick="consultar(this, frmDatos, false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" value="Limpiar" name="cmdLimpiar" class="boton" onclick="limpiar(frmDatos);"/>
            </td>
          </tr>
          <tr>
            <td colspan="7" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="7" align="center">
              <input type="BUTTON" value="   Alta  " name="cmdAlta" class="boton" onclick="cargaMantenimientoDatosGenerales(1)"/>
              <input type="BUTTON" value="Modificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoDatosGenerales(2)"/>
              <input type="BUTTON" value="   Baja  " name="cmdBaja" class="boton" onclick="cargaMantenimientoDatosGenerales(3)"/>
              <input type="BUTTON" value="Consultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoDatosGenerales(4)"/>
              &nbsp;&nbsp;&nbsp;&nbsp;
              <input type="BUTTON" value="Clonar Emisión" name="cmdClonar" class="boton" onclick="clonarEmision()"/>
            </td>
          </tr>
          <tr>
            <td colspan="7" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="7" align="center">
              <table border="0" cellpadding="0" cellspacing="0">
                <tr class="cabeceras">
                  <td align="center" width="23" nowrap>&nbsp;</td>
                  <td width="80" >Id RC</td>
                  <td width="150" >Programa</td>
                  <td width="100" >Pizarra</td>
                  <td width="100" >Serie</td>
                  <td width="150" >Fideicomiso</td>
                  <td width="200" >&nbsp;</td>
                  <td width="150" >Importe</td>
                  <td width="70" >Fecha Inicio</td>
                  <!--td width="80" nowrap>Status</td-->
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top;width:1023px;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblReg" dataInfo="arrTblDat" keys="eemiIdPrograma,eemiIdFideicomiso,eemiIdEmision" fun="clickTabla" radioWidth="23px">
                </table>
              </div>
              
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
