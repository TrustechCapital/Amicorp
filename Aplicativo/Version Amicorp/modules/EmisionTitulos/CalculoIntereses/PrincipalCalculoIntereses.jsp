<form name="frmDatos" id="frmDatos" onsubmit="">
  <table width="100%">
    <tr>
      <td align="center" class="titulo">C&aacute;lculo de Intereses</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table align="center" class="texto">
          <!--tr>
            <td align="center">&nbsp;
              <input type="text" name="paramFechaCalculo" id="paramFechaCalculo" size="10" maxlength="10" tipo="Num" value="<%=session.getAttribute("fechaContable").toString()%>"/>
              <input type="text" name="paramFechaCalculo2" id="paramFechaCalculo2" size="10" maxlength="10" tipo="Num" value="<%=session.getAttribute("fechaContable").toString()%>"/>
              <input type="text" name="paramFechaCalculo3" id="paramFechaCalculo3" size="10" maxlength="10" tipo="Num" value="<%=session.getAttribute("fechaContable").toString()%>"/>
              <input type="text" name="paramFechaCalculo4" id="paramFechaCalculo4" size="10" maxlength="10" tipo="Num" value="<%=session.getAttribute("fechaContable").toString()%>"/>
              <input type="text" name="paramFechaCalculo5" id="paramFechaCalculo5" size="10" maxlength="10" tipo="Num" value="<%=session.getAttribute("fechaContable").toString()%>"/>
            </td>
          </tr-->
          <tr>
            <td align="center">
              <input type="BUTTON" value="Consultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoCalculoIntereses();"/>
            </td>
          </tr>
          <tr>
            <td align="center">
              <input type="button" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" ref="emision.conETPriInteres" fun="loadTableElement" tabla="tblReg" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td>
              <table cellspacing="0" cellpadding="0" border="0" align="center" class="texto">
                <tr align="left" class="cabeceras">
                  <td width="23" align="center" nowrap>&nbsp;</td>
                  <td width="65" nowrap>Programa</td>
                  <td width="250" nowrap>Nombre Emisor</td>
                  <td width="90" nowrap>Emisi&oacute;n</td>
                  <td width="90" nowrap>Fideicomiso</td>
                  <td width="90" nowrap>Pizarra</td>
                  <td width="90" nowrap>Serie</td>
                  <td width="90" nowrap>Tipo C&aacute;lculo</td>
                  <td width="90" nowrap>Fecha</td>
                  <td width="90" nowrap>F&oacute;rmula</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top; width:968px;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblReg" dataInfo="arrTblDat" 
                keys="fintIdCalcSecuencial,fintIdPrograma,fintNomPrograma,fintIdEmision,fintIdTipoCalculo,fintIdFecCalcPer,fintIdFormula,fintNomFormula,fintNomEmisor,fintNomContrato,fintStEmipcal,fintIdFideicomiso,fintCvePizarra,fintNumSerie,fintImpEmision,fintNumTitulos,fintImpNomEmision,fintNumMoneda,fintDestinoRecurso,fintAnoPlazo,fintDiasPlazo,fintFecInicio,fintFecVencimiento,fintRepComun,fintIntColocador,fintAutorizacionCnbv,fintFecCnbv,fintAutorizacionBanxico,fintFecBanxico,
                fintFecSerie,fintFecSubasta,fintFecOfrecimiento,fintFecEmision,fintFecBolsa,fintFecCruce,fintFecLiquidacion,fintTipoSubasta,fintActoConstitutivo,fintComiteTecnico,fintRepoDist,fintFecAlta,fintFecMod,fintInicioPeriodo,fintFinDePeriodo,fintFechaDePago,fintValNomTot,fintValNomTitulos,fintPorcTasaFija,fintTasaPromedio,fintTasa,fintTasaBase,fintSobretasa,fintTasaBruta,fintIsr,fintTasaNeta,fintDolarInicio,fintDolarFin,fintIsr2,fintTasaAbsoluta,fintTasaEquibalente,fintFechaCalculo,
                fintInteresesPer,fintInteresesCap,fintImpAmortizacion,fintAmortExt,fintStEmision,fintElaboro,fintFirmaVobo" 
                fun="clickTabla" radioWidth="23px">
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
