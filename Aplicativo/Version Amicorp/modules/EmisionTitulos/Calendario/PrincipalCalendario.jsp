<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table width="100%" style="height:auto;">
    <tr>
      <td align="center" class="titulo">Calendario</td>
    </tr>
    <tr>
      <td height="100%">
        <br>
        <table align="center" class="texto" border="0" cellspacing="1" cellpadding="2">
           <TR>
              <TD COLSPAN=7>
                <TABLE align="center" class="texto" border="0" cellspacing="2" cellpadding="2">
                  <tr valign="middle">
                    <td nowrap>Programa</td>
                    <td WIDTH=150>
                      <select size="1" name="paramNumPrograma" id="paramNumPrograma" ref="conETCmbProgs" fun="loadComboElement" keyValue="eproIdPrograma" theValue="eproNomPrograma" next="paramNumFiso" onchange="cargaComboFideicomiso(this,GI('paramNumFiso'),false,0);" required message="El Número de Programa es un campo Obligatirio"/>
                    </td>
                    <td width="50">&nbsp;</td>
                    <td nowrap>Fideicomiso</td>
                    <td WIDTH=150>
                      <select size="1" name="paramNumFiso" id="paramNumFiso" ref="conETCmbFisoAsigProg" fun="loadComboElement" keyValue="efidIdFideicomiso" theValue="ctoNomContrato" next="paramNumEmision" param="paramCmbProg" onchange="cargaComboFideicomiso(this,GI('paramNumEmision'),false,0);" required message="El Número de Fideicomiso es un campo Obligatirio">
                        <option value="-1">-- Seleccione --</option>
                      </select>
                    </td>
                    <td width="50">&nbsp;</td>
                    <td nowrap>Emisi&oacute;n</td>
                    <td WIDTH=150>
                      <select size="1" name="paramNumEmision" id="paramNumEmision" ref="conETCmbEmiAsgPrgFid" fun="loadComboElement" keyValue="eemiIdEmision" theValue="pizarraSerie" next="formsLoaded" param="paramCmbProg" required message="El Número de Emisión es un campo Obligatirio">
                        <option value="-1">-- Seleccione --</option>
                      </select>
                    </td>
                  </tr>
                </TABLE>
                <br><br>
            </TD>
          </TR>
          <tr>
            <td colspan="7" align="center">
              <input type="button" value="Aceptar" name="cmdAceptar" id = "cmdAceptar" class="boton" ref="conCalendarioEmis" fun="loadTableElementEmision" tabla="tblReg" onclick="consultaCal();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" value="Limpiar" name="cmdLimpiar" class="boton" onclick="limpiar(frmDatos);"/>
            </td>
          </tr>
          <tr>
            <td colspan="7" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
            </td>
          </tr>
          <tr align="center">
            <td colspan="7">
            
            <div style="width:1100px;overflow:auto;">
                <div id="encabezados"></div>
                <div style="height:350px;position:relative; vertical-align:top;">
                  <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblReg" dataInfo="arrTblDat" keys="" fun="clickTabla" radioWidth="23px">
                  </table>
                </div>
            </div>
            
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>