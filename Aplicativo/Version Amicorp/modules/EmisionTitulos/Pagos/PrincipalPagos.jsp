<table align="center" class="texto">
  <tr>
    <td nowrap>Fecha Final del Primer Periodo</td>
    <td nowrap>
      <input type="text" name="eepaFecPago" id="eepaFecPago" size="10" maxlength="10" tipo="Fecha" required message="La Fecha Final del Primer Periodo es un campo obligatorio" operacion="El primer periodo finaliza la fecha ####"/>
    </td>
    <td nowrap width="15%">&nbsp;</td>
    <td nowrap>&nbsp;</td>
    <td nowrap width="5%" colspan="2">&nbsp;</td>
    <!--td nowrap>No. de D&iacute;as despu&eacute;s de Pago</td>
    <td nowrap width="5%" colspan="2">
      <input type="text" name="eepaDiasPago" id="eepaDiasPago" size="4" maxlength="4" tipo="Num"/>
    </td-->
  </tr>
  <tr>
    <td nowrap>&nbsp;</td>
    <td nowrap>
     <input name="eepaPeriodoPago" id="eepaPeriodoPago" type="HIDDEN" value="MENSUAL"/>
   
    </td>
    <td nowrap width="15%">&nbsp;</td>
    <td nowrap>
      &nbsp;
    </td>
    <td nowrap width="5%" colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2" nowrap>
      <input type="checkbox" name="eepaDiasPerPagoChk" id="eepaDiasPerPagoChk" class="check" tv="1" fv="0"/>Considerar d&iacute;as del periodo hasta Fecha de Pago
    </td>
        <td nowrap width="15%">&nbsp;</td>
    <td nowrap><!--No. D&iacute;as Periodo--></td>
    <td nowrap colspan="2">
      <!--input type="text" name="eepaNumDiaPerPago" id="eepaNumDiaPerPago" size="10" maxlength="10" tipo="Num" message="El No. Dias Periodo es un campo obligatorio"/-->
    </td>
  </tr>
  <tr>
    <td nowrap>
      <input type="checkbox" name="eepaDiasCalendChk" id="eepaDiasCalendChk" class="check" tv="1" fv="0"/>Mes Calendario
    </td>
    <td nowrap>&nbsp;</td>
    <td nowrap width="15%">&nbsp;</td>
    <td nowrap>D&iacute;as Adicionales al Periodo</td>
    <td nowrap colspan="2">
      <input type="text" name="eepaRecorre" id="eepaRecorre" size="4" maxlength="4" tipo="Num"/>
    </td>
  </tr>
  <tr>
    <td nowrap>
      <input type="checkbox" name="eepaAjustaPeriodoChk" id="eepaAjustaPeriodoChk" class="check" tv="1" fv="2"/>
    Ajusta Periodo Actual</td>
    <td nowrap>&nbsp;
    </td>
    <td nowrap width="15%">&nbsp;</td>
    <td nowrap style="visibility:hidden;">
      <input type="checkbox" name="eepaDiaFijoChk" id="eepaDiaFijoChk" onclick="accionChkDias(this)" class="check" tv="1" fv="0"/>D&iacute;a Fijo Dentro del Periodo
    </td>
    <td nowrap  style="visibility:hidden;">No. D&iacute;a Fijo</td>
      <td nowrap  style="visibility:hidden;">
        <input type="text" disabled name="eepaNumDiaFijo" id="eepaNumDiaFijo" size="10" maxlength="10" tipo="Num"/>
      </td>
  </tr>
  <tr>
    <td nowrap>
      <input type="checkbox" name="eepaCalculaSigPerChk" id="eepaCalculaSigPerChk" class="check" tv="1" fv="0" operacion="Se calcula el siguiente Periodo"/>Calcula Siguiente Periodo
      </td>
    <td nowrap>&nbsp;
    </td>
    <td nowrap width="15%">&nbsp;</td>
    <td nowrap>No. D&iacute;as Antes C&aacute;lculo</td>
    <td nowrap colspan="2">
      <input type="text" name="eepaDiasAntesCalc" id="eepaDiasAntesCalc" size="4" maxlength="4" tipo="Num" required message="El No. Dias Antes Cálculo es un campo obligatorio"/>
    </td>
  </tr>
  <tr>
    <td nowrap colspan="2">
      <input type="checkbox" name="eepaAjustaPeriodoSigChk" id="eepaAjustaPeriodoSigChk" class="check" tv="1" fv="2"/>Ajusta Periodo Siguiente
      <!--input type="checkbox" name="eepaAjustaPer1Per2Chk" id="eepaAjustaPer1Per2Chk" class="check" tv="1" fv="0"/>Ajusta Periodo 2 con Periodo 1  -->
    </td>
    <td nowrap width="15%">&nbsp;</td>
    <td nowrap>
      &nbsp;
    </td>
    <td nowrap colspan="2">&nbsp;
    </td>
  </tr>
  <tr>
    <td nowrap colspan="2">
      <input type="checkbox" name="eepaDiasInhCalcChk" id="eepaDiasInhCalcChk" onclick="accionChkDias(this)" class="check" tv="1" fv="0"/>Considera D&iacute;as H&aacute;biles
    </td>
    <td nowrap width="15%">&nbsp;</td>
    <td nowrap>
      <input type="checkbox" name="eepaDiasInhPagoChk" id="eepaDiasInhPagoChk"  onclick="accionChkDias(this)" class="check" tv="1" fv="0"/>D&iacute;as Inh&aacute;biles
      <!--input type="checkbox" name="eepaRevisablesChk" id="eepaRevisablesChk" class="check" tv="1" fv="2"/>
    Revisable--></td>
    <td nowrap colspan="2">&nbsp;
    </td>
  </tr>
  <tr>
    <td nowrap>
      <input type="checkbox" disabled name="eepaDiasTranscurridosChk" id="eepaDiasTranscurridosChk" class="check" tv="1" fv="0"/>
    D&iacute;as H&aacute;biles Posteriores</td>
    <td nowrap>&nbsp;
    </td>
    <td nowrap width="15%">&nbsp;</td>
    <td nowrap colspan="3">
      &nbsp;
    </td>
  </tr>
  <tr>
    <td nowrap>
      <input type="checkbox" disabled name="eepaDiasEfectivosChk" id="eepaDiasEfectivosChk" class="check" tv="1" fv="0"/>
    D&iacute;as H&aacute;biles Anteriores</td>
    <td nowrap>&nbsp;
    </td>
    <td nowrap width="15%">&nbsp;</td>
    <td nowrap colspan="3">
      &nbsp;
    </td>
  </tr>
  <tr>
    <td nowrap colspan="6">
      <input type="text" name="eepaStEmipago" id="eepaStEmipago" size="5" maxlength="25" value="ACTIVO" style="visibility:hidden"/>
    </td>
  </tr>
  <tr>
    <td nowrap colspan="6" align="center">
      <input type="BUTTON" value="Aceptar " name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionPagos();" style="visibility:hidden"/>
      <input type="BUTTON" value="Regresar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="cargaDetalleParametrosCalculo(2);" style="visibility:hidden"/>
    </td>
  </tr>
   <tr>
    <td nowrap  colspan="6">&nbsp;</td>
  </tr>
   
   <tr>
    <td nowrap  colspan="4" class="subtitulo">Periodicidad <hr/></td>
    <td nowrap  colspan="2">&nbsp;</td>
  </tr>
  
  <tr>
    <td nowrap valign="top">Fecha inicio</td>
    <td nowrap valign="top">
     <input type="text" name="paramFecIni" id="paramFecIni" size="15" maxlength="10" tipo="Fecha"/>
    </td>
    <td valign="top"   nowrap width="15%">Fecha fin</td>
    <td nowrap valign="top">
     <input type="text" name="paramFecFin" id="paramFecFin" size="15" maxlength="10" tipo="Fecha"/>
    </td>
    <td nowrap width="5%" colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td nowrap valign="top">Periodo Pago Intereses</td>
    <td nowrap valign="top">
      <select size="1" name="paramPeriodoPago" id="paramPeriodoPago" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbLoadParam504" next="asignaValues2ObjHTMLPagos"/>
    </td>
    <td valign="top"  nowrap width="15%">Comentario</td>
    <td nowrap valign="top">
     <textarea name="paramComentario" id="paramComentario" style="width:150px;height:50px;"></textarea>
    </td>
    <td nowrap width="5%" colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td nowrap  colspan="4" align="center">
      <input type="text" name="paramPrograma" id="paramPrograma" size="5" style="visibility:hidden;position:absolute;"/>
      <input type="text" name="paramFideicomiso" id="paramFideicomiso" size="5" style="visibility:hidden;position:absolute;"/>
      <input type="text" name="paramEmision" id="paramEmision" size="5" style="visibility:hidden;position:absolute;"/>
      <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden;position:absolute;"/>
    
      <input type="button" value="  Alta   " name="cmdAlta" id="cmdAlta" class="boton" onclick="ejecutaOperacionPeriodoPago('ALTA');" style="visibility:visible"/>
      <input type="button" value="Consultar" name="cmdConsultar" id="cmdConsultar" ref="emision.conETPeriodoPagos" fun="loadTableElement" tabla="tblReg" class="boton" onclick=" funConsultar(this)"/>
      <input type="button" value="  Baja   " name="cmdBaja" id="cmdBaja" class="boton" onclick="ejecutaOperacionPeriodoPago('BAJA');" style="visibility:hidden"/>
    </td>
    <td nowrap  colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td nowrap  colspan="4">
       <table cellspacing="0" cellpadding="0" border="0" class="texto">
        <tr align="left" class="cabeceras">
          <td width="23" nowrap>&nbsp;</td>
          <td width="50" nowrap>Id</td>
          <td width="100" nowrap>Periocidad</td>
          <td width="100" nowrap>Fecha Inicio</td>
          <td width="100" nowrap>Fecha Fin</td>
          <td width="200" nowrap>Comentario</td>
        </tr>
      </table>
      <div style="height:100px; overflow:auto; position:relative; vertical-align:top;width:573px">
        <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblReg" dataInfo="arrTblDat" keys="eperIdSecuencial,eperPeriodicidad,eperFecInicio, eperFecVencimiento,eperComentario" fun="clickTablaPagos" radioWidth="23px">
        </table>
      </div>
    </td>
    <td nowrap  colspan="2">&nbsp;</td>
  </tr>
  
</table>

<div id="dvOperacion"></div>