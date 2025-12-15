<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
        <td height="100%">&nbsp;</td>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Redención</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table class="texto">
            <tr>
              <td width="15%" colspan="2">&nbsp;</td>
              <td nowrap width="15%">Fideicomiso</td>
              <td nowrap colspan="3">
                <select size="1" name="numFideicomiso" id="numFideicomiso" ref="cmbFideicomisoTrac" fun="loadComboElement" keyValue="femiNumFideicomiso" theValue="femiNomFideicomiso"  param="cmbFideicomisoTrac" next="numInstitucion" required message="El Fideicomiso es un campo obligatorio"/>
              <td nowrap colspan="2">
              &nbsp;
              </td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="5"><hr></td>
              <td width="10%">&nbsp;</td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Hora</td>
              <td nowrap colspan=3>
                <input type="text" id="fecHora" name="fecHora" maxlength="5" size="8" value="00:00" required message="La Hora es un campo obligatorio formato (hh:mm)"/>
              </td>
               <td nowrap width="10%" rowspan=5>
                <img src="imagenes/firmaTRACs.png" width=200 height=100/>
              </td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Fecha Redención</td>
              <td nowrap colspan=3>
                <input type="text" id="fecRedencion" name="fecRedencion" maxlength="10" size="10" tipo="Fecha" required message="La Fecha de Redención es un campo obligatorio"/>
              </td>
              
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Fecha Liquidación</td>
              <td nowrap colspan=3>
                <input type="text" id="fecLiquidacion" name="fecLiquidacion" maxlength="10" size="10" tipo="Fecha" required message="La Fecha de Liquidación es un campo obligatorio"/>
              </td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%">Casa de Bolsa</td>
              <td nowrap colspan="3">
                <select size="1" name="numInstitucion" id="numInstitucion" ref="cmbCasasBolsa" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave"  param="clavesCombo26" next="numAcreditado" onchange="cargaCombos(GI(this.id).value)" required message="La Casa de Bolsa es un campo obligatorio"/>
              </td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
               <td nowrap width="15%">Acreditado</td>
              <td nowrap colspan="3">
                <input type="text" name="textAcreditado" id="textAcreditado" size="18" maxlength="30" onblur="if(GI('numAcreditado').options[GI('numAcreditado').selectedIndex].text!=this.value)GI('numAcreditado').selectedIndex = 0;" required message="El Acreditado es un campo obligatorio"/>
                <select size="1" name="numAcreditado" id="numAcreditado" ref="cmbAcreditados" fun="loadComboElement" keyValue="actIdAcreditado" theValue="actNombreAcreditado"  param="cmbAcreditados" next="ctaIndevalIntermediario"  onchange="GI('textAcreditado').value = this.selectedIndex!=0?this.options[this.selectedIndex].text:'';"/>
              </td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
               <td nowrap>Unidades</td>
              <td nowrap colspan =3>
                <input type="text" name="numUnidades" id="numUnidades" tipo="Num" size="10" maxlength="10" required message="El número de Unidades es un campo obligatorio"/>
              </td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap width="15%">Cuenta Indeval</td>
              <td nowrap colspan="3">
                <select size="1" name="ctaIndevalIntermediario" id="ctaIndevalIntermediario" ref="cmbCtaIndeval" fun="loadComboElement" keyValue="acrCtaIndevalInt" theValue="acrCtaIndevalInt" param="cmbCtaIndeval" next="formsLoaded" required message="La Cuenta Indeval es un campo obligatorio"/>
              </td>
            </tr>
            <!--
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Status</td>
              <td nowrap>
                <select size="1" name="cveStatus" id="cveStatus" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="formsLoaded" param="clavesCombo31"/>
              </td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>Canastas</td>
              <td nowrap colspan =3>
                <input type="text" name="numCanastas" id="numCanastas" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>Precio Naftrac</td>
              <td nowrap>
                <input type="text" name="numPrecioNaftrac" id="numPrecioNaftrac" tipo="Money" size="10" maxlength="10"/>
              </td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>No. Naftrac</td>
              <td nowrap colspan =3>
                <input type="text" name="numNaftracs" id="numNaftracs" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>Efectivo</td>
              <td nowrap>
                <input type="text" name="numEfectivo" id="numEfectivo" tipo="Money" size="10" maxlength="10"/>
              </td>
            </tr>
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap>No. Certificados</td>
              <td nowrap>
                <input type="text" name="numCertificados" id="numCertificados" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td nowrap width="5%">&nbsp;</td>
              <td nowrap>Comisiones</td>
              <td nowrap>
                <input type="text" name="notCodigoPostal" id="notCodigoPostal" tipo="Money" size="10" maxlength="10"/>
              </td>
            </tr>-->
           
          </table>
        </td>
      </tr>
      <tr>
        <td width="60%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%" align="center">
          <input type="button" value="Aceptar " name="cmdAceptar" class="boton" onclick="consultaParamTrack();" ><!--style="visibility:hidden"/>-->
          <input type="button" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="RF(frmDatos);fechaTrack(GI('fecRedencion'));" ><!--style="visibility:hidden"/>-->
        </td>
      </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td colspan = 2 align="left">
        <div id="dvProcedimiento">
        </div>
        
      
      </td>
    </tr>
  </table>
</FORM>
