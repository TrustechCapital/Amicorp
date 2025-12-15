<FORM name="frmMantenimientoBienesGar" id="frmMantenimientoBienesGar" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento del Registro de Bienes en Garantia</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" align="center" class="texto">
          <tr>
            <td width="30%">Fideicomiso:</td>
            <td nowrap width="15%">
              <input type="text" name="fgrsIdFideicomiso" id="fgrsIdFideicomiso" tipo="Num" size = "10" maxlength="10" onblur="consultaNombreFideicomiso('nomFideicomiso',this);" required message = "Valor obligatorio"/>
            </td>
            <td width="45%"><div id="nomFideicomiso" class="textoNegrita" ref="conNomFid" fun="asignaValor2DivFideicomiso" param="divNombreFideicomisoParam" next="consultaConceptosAsignados">&nbsp;</div>     
            </td>
            <td width="15%"><input type="hidden" id="paramUsuario" name="paramUsuario" value="<%=session.getAttribute("userid").toString()%>"/>
                            <input type="text" name="fcoDiaDia" id="fcoDiaDia" size="2" style="visibility:hidden"/>
                            <input type="text" name="fcoMesDia" id="fcoMesDia" size="2" style="visibility:hidden"/>
                             <input type="text" name="fcoAnoDia" id="fcoAnoDia" size="4" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td width="30%">Id Garantia:</td>
            <td nowrap width="15%">
              <select size="1" name="forsCveTipoGarantia" id="forsCveTipoGarantia" ref="claves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" param="clavesCombo38" next="forsMoneda" onchange="cargaParamComboEstado(this,false);"  required message = "Valor obligatorio"/> <!--onchange="cargaParamComboProducto(this,false);"           fbifIdTipoBien-->
            </td>
            <td>SubCuenta:</td>
            <td width="45%">
              <input type="text" name="fgrsIdSubcuenta" id="fgrsIdSubcuenta" tipo="Num" size="10" maxlength="10" required message="Valor obligatorio"/>
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">Id Bien:</td>
            <td nowrap width="15%">
              <input type="text" name="forsIdGarantia" id="forsIdGarantia" tipo="Num" size = "10" maxlength="10" required message = "Valor obligatorio"/>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;
            </td>
            <td width="15%"><input type="hidden" id="paramMesAbierto" name="paramMesAbierto" value="<%=session.getAttribute("mesAbiertoLbl")%>"/></td>
          </tr>
           <tr>
            <td nowrap width="25%">Clave de Bien:</td>
            <td nowrap width="15%">
              <select size="1" name="forsCveTipoBien" id="forsCveTipoBien" ref="claves" fun="loadComboElement" keyValue="cveNumSecClave" theValue="cveDescClave" param="parametroComboEstado" next="formsLoaded" required message = "Valor obligatorio"><!--    fbifIdCveBien-->
              <option value="-1">-- Seleccione --</option>
              </select>
            </td>
            <td>Fecha Vencimiento</td>
            <td width="45%">
              <input type="text" name="forsFecVencimiento" id="forsFecVencimiento" tipo="Fecha" size="10" maxlength="10"/><!--onblur="asignaFec();"-->
            </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="25%">Bajo regimen en condominio</td>
            <td nowrap width="15%">
              <input type="checkbox" name="forsRegimenChk" id="forsRegimenChk" class="check" tv="1" fv="0"  onclick="esInmueble(this);"/>
            </td>
            <td>&nbsp;</td>
            <td width="45%">&nbsp;</td>
            <td width="15%">&nbsp;</td>
          </tr>
           <tr>
            <td width="30%">Descripci&oacute;n<!--Identificacion:--></td>
            <td nowrap width="15%">
              <textarea cols="30" name="forsTextoDescrip" id="forsTextoDescrip"></textarea>
            </td>
            <td>Revalua</td>
            <td width="45%"><input type="checkbox" name="forsCveRevaluaChk" id="forsCveRevaluaChk" class="check" tv="1" fv="0"  onclick="muestraValor(this);"/></td>
            <td width="15%">&nbsp;</td>
          <tr>
           <tr>
            <td width="30%">Importe:</td>
            <td nowrap width="15%">
              <input type="text" name="forsImpBien" id="forsImpBien" tipo="Money" value="0.0" prec="16.2" size = "20" maxlength="20"/>
            </td>
            <td>Importe &Uacute;ltima Valuaci&oacute;n</td>
            <td width="45%">
              <input type="text" name="forsImpUltValua" id="forsImpUltValua" tipo="Num" size="20" maxlength="16" value="0"/>
            </td>
            <td width="15%">&nbsp;</td>
          <tr>
           <tr>
            <td width="30%">Moneda:</td>
            <td nowrap width="15%">
              <select size="1" name="forsMoneda" id="forsMoneda" ref="conNumMonNomMon" fun="loadComboElement" keyValue="monNumPais" theValue="monNomMoneda" next="forsCveStatus"/><!--onchange="siCambiaLaMoneda(this);"-->
            </td>
            <td>Fecha Ultima Valuacion</td>
            <td width="45%">
              <input type="text" name="forsFecUltValua" id="forsFecUltValua" tipo="Fecha" size="10" maxlength="10"/>
            </td>
            <td width="15%">&nbsp;</td>
          <tr>
           <tr>
            <td width="30%">&nbsp;<div id="tipoCambio" style="visibility:hidden"> Tipo de Cambio </div></td>
            <td nowrap width="15%">&nbsp; <input type="text" name = "fbifTipoCambio" id="fbifTipoCambio" style="visibility:hidden"/>
            </td>
            <td>Periodicidad:</td>
            <td width="45%">
              <select size="1" name="forsCvePerValua" id="forsCvePerValua" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="clavesCombo53" next="forsNumNotario"/>
            </td>
            <td width="15%">&nbsp;</td>
          <tr>
           <tr>
            <!--td width="30%">Descripcion:</td>
            <td nowrap width="15%">
              <textarea cols="30" name="forsTextoDescrip" id="forsTextoDescrip" value="-"></textarea>
            </td-->
            <td width="30%">&nbsp;</td>
            <td nowrap width="15%">
              &nbsp;
            </td>
            <td nowrap width="15%">Escritura </td>
                <td>
                  <input type="text" name="forsNumEscritura" id="forsNumEscritura" tipo="Num" size="10" maxlength="10" required message="Valor obligatorio"/>
                </td>
            <td width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">Comentario:</td>
            <td nowrap width="10%">
              <textarea cols="30" name="forsTexComentario" id="forsTexComentario"></textarea>
            </td>
            <td>Notario</td>
            <td>
              <select size="1" name="forsNumNotario" id="forsNumNotario" ref="muestraDatosNotarios" fun="loadComboElement" keyValue="notNumNotario" theValue="notNomNotario" next="loadCatalogoBienesGar"/>
            </td>
            <td align="left" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">Estatus</td>
            <td nowrap width="15%">
              <select size="1" name="forsCveStatus" id="forsCveStatus" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="forsCvePerValua" param="clavesCombo31"/>
             </td>
            <td colspan="2"></td>
            <td align="left" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="15%"><div id="importeRevaluacion" style="visibility:hidden"> Importe Revaluaci&oacute;n: </div> </td>
            <td colspan="2">
              <input type="text" name = "txtImporteRevaluacion" id="txtImporteRevaluacion" style="visibility:hidden" value="0"/>
            </td>
            <td align="left" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="15%"><div id="divFecha" style="visibility:hidden"> Fecha  </div> </td>
            <td colspan="2">
              <input type="text" name = "txtFecha" id="txtFecha" tipo = "Date" style="visibility:hidden"/>
            </td>
            <td align="left" width="15%">&nbsp;</td>
          </tr>
          <tr>
            <td width="30%">&nbsp;</td>
            <td nowrap width="15%"> </td>
            <td colspan="2"></td>
            <td align="left" width="15%">&nbsp;</td>
          </tr>
           <tr>
            <td colspan="5" align="center"></td>
          </tr>
     <tr>
            <td colspan="5" align="center">
              <input type="button" value="Aceptar " name="cmdAceptar" class="boton" onclick="ejecutaFuncionParaSalidaDelBien();" style="visibility:hidden"/>
          <input type="button" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('Garantias.Garantias.PrincipalGarantias','')" style="visibility:hidden"/>
            </td>
          </tr>
    <tr>
    </tr>
  </table>
</FORM>