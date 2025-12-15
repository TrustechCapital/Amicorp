<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
        <td height="100%">&nbsp;</td>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Mantenimiento Programas</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;
        <input type="text" name="eproTipoNegocio" id="eproTipoNegocio" value="1" style="visibility:hidden;"/>
              
        </td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
          <tr valign="middle">
              <td width="20%" valign="middle" class="textoRP" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap>Id RC</td>
              <td width="20%" valign="middle">
                <input type="text" name="eproEmisor" id="eproEmisor" class="idRC" tipo="Texto" size="10" maxlength="5" required message="El Id RC es un campo obligatorio" onblur="upperRC(this);cargaDatosRC(this);"/>
              </td>
              <td width="10%" valign="middle" nowrap>Emisor</td>
              <td width="20%" valign="middle" nowrap colspan="2">&nbsp;
                <input size="50" type="text" disabled name="nomEmisor" id="nomEmisor"/>
              </td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td width="20%" valign="middle" class="textoRP" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="20%" valign="middle">
                &nbsp;
              </td>
              <td width="10%" valign="middle" nowrap>Fideicomiso</td>
              <td width="20%" valign="middle" nowrap colspan="2">&nbsp;
                <input  size="50"  type="text"  disabled name="nomFideicomiso" id="nomFideicomiso"/>
              </td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            
            <tr valign="middle">
              <td width="20%" valign="middle" class="textoRP" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap>N&uacute;m. de Programa</td>
              <td width="20%" valign="middle">
                <input type="text" name="eproIdPrograma" id="eproIdPrograma" tipo="Num" size="10" maxlength="10" required message="El No. de Programa es un campo obligatorio" onblur="consultaExistePrograma(this,GI('eproEmisor'));" />
              </td>
              <td width="10%" valign="middle" nowrap>Nombre Programa</td>
              <td width="20%" valign="middle" nowrap colspan="2">&nbsp;
                <!--select size="1" name="eproNomPrograma" id="eproNomPrograma" ref="conETCmbEmisor" fun="loadComboElement" keyValue="esorNombre" theValue="esorNombre" param="cmbEmisor" next="eproInstrumento" required message="El Nombre de Emisora es un campo obligatorio"/-->
                <input type="text" name="eproNomPrograma" id="eproNomPrograma" />
              </td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td width="20%" valign="middle" class="textoRP" nowrap>&nbsp;</td>
              <td width="12%" valign="middle" class="textoRP" nowrap>&nbsp;</td>
              <td width="20%" valign="middle">&nbsp;</td>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            <!--tr>
              <td valign="middle" height="6" width="20%" nowrap>&nbsp;</td>
              <td valign="middle" height="6" width="12%" nowrap>Tipo de Negocio</td>
              <td valign="middle" height="6" width="20%" colspan="4">
                <select size="1" name="eproTipoNegocio" id="eproTipoNegocio" ref="conETDatInd" fun="loadComboElement" keyValue="eindIdSubindice" theValue="eindDescripcion" param="cmbLoadParam512" next="" required message="El Tipo de Negocio es un campo obligatorio"/>
              </td>
              <td valign="middle" height="6" width="15%" nowrap>&nbsp;</td>
            </tr-->
            <tr valign="middle">
              <td width="20%" height="24" valign="middle" nowrap>&nbsp;</td>
              <td width="12%" height="24" valign="middle" nowrap>Tipo de Instrumento</td>
              <td width="20%" height="24" valign="middle" colspan="4">
                <select size="1" name="eproInstrumento" id="eproInstrumento" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbLoadParam510" next="eproModalidadEmision" required message="El Tipo de Instrumento es un campo obligatorio"/>
              </td>
              <td width="15%" height="24" valign="middle" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="12%" valign="middle" nowrap>Modalidad de la Emisi&oacute;n</td>
              <td width="20%" valign="middle" colspan="4">
                <select size="1" name="eproModalidadEmision" id="eproModalidadEmision" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbLoadParam511" next="eproMoneda" required message="La Modalidad de la Emisión es un campo obligatorio"/>
              </td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="12%" valign="middle" nowrap>Monto del Programa</td>
              <td width="20%" valign="middle">
                <input type="text" name="eproImpPrograma" id="eproImpPrograma" size="19" maxlength="19" tipo="Money" style="text-align:right;" prec="16.2" reqPrecValue onblur="calcularMontoDisponible();"/>
              </td>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap>Moneda del Programa</td>
              <td width="20%" valign="middle" nowrap>
                <select size="1" name="eproMoneda" id="eproMoneda" ref="conNumMonNomMon" fun="loadComboElement" keyValue="monNumPais" theValue="monNomMoneda" next="asignaValues2ObjHTML"/>
              </td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="12%" valign="middle" nowrap>Fecha de Inicio</td>
              <td width="20%" valign="middle">
                <input type="text" name="eproFecInicio" id="eproFecInicio" tipo="Fecha" size="10" maxlength="10" onblur="plazoAniosDias(this,GI('eproFecVencimiento'));" required message="La Fecha de Inicio es un campo obligatorio"/>
              </td>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td valign="middle" width="10%" nowrap>Fecha de Vencimiento</td>
              <td valign="middle" width="20%" nowrap>
                <input type="text" name="eproFecVencimiento" id="eproFecVencimiento" tipo="Fecha" size="10" maxlength="10" onblur="plazoAniosDias(GI('eproFecInicio'),this);" required message="La Fecha de Vencimiento es un campo obligatorio"/>
              </td>
              <td valign="middle" width="15%" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="12%" valign="middle" nowrap>Plazo en d&iacute;as</td>
              <td width="20%" valign="middle">
                <input type="text" name="eproDiasPlazo" id="eproDiasPlazo" tipo="Num" size="4" maxlength="4" required message="El Plazo en Días es un campo obligatorio"/>
              </td>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td align="left" valign="middle" width="10%" nowrap>
                <P>Plazo en a&ntilde;os</P>
              </td>
              <td align="left" valign="middle" width="20%" nowrap>
                <input type="text" name="eproAnoPlazo" id="eproAnoPlazo" tipo="Num" size="4" maxlength="4" required message="El Plazo en Años es un campo obligatorio"/>
              </td>
              <td align="left" valign="middle" width="15%" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td valign="middle" nowrap width="20%">&nbsp;</td>
              <td valign="middle" nowrap width="12%">&nbsp;</td>
              <td valign="middle" width="20%">&nbsp;</td>
              <td valign="middle" nowrap width="10%">&nbsp;</td>
              <td valign="middle" nowrap width="10%">&nbsp;</td>
              <td valign="middle" nowrap width="20%">&nbsp;</td>
              <td valign="middle" nowrap width="15%">&nbsp;</td>
            </tr>
            <tr>
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="12%" valign="middle" nowrap>Autorizaci&oacute;n CNBV</td>
              <td width="20%" valign="middle">
                <input type="text" name="eproAutorizacionCnbv" id="eproAutorizacionCnbv" size="25" maxlength="25"/>
              </td>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap>Fecha de Autorizaci&oacute;n</td>
              <td width="20%" valign="middle">
                <input type="text" name="eproFecCnbv" id="eproFecCnbv" tipo="Fecha" size="10" maxlength="10"/>
              </td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="12%" valign="middle" nowrap>&nbsp;</td>
              <td width="20%" valign="middle">&nbsp;</td>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="12%" valign="middle" nowrap>Autorizaci&oacute;n BANXICO</td>
              <td width="20%" valign="middle" nowrap>
                <input type="text" name="eproAutorizacionBanxico" id="eproAutorizacionBanxico" size="25" maxlength="25"/>
              </td>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap>Fecha de Autorizaci&oacute;n</td>
              <td width="20%" valign="middle" nowrap>
                <input type="text" name="eproFecBanxico" id="eproFecBanxico" tipo="Fecha" size="10" maxlength="10"/>
              </td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="12%" valign="middle" nowrap>&nbsp;</td>
              <td width="20%" valign="middle">&nbsp;</td>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="12%" valign="middle">Num. Reg. Nacional de Valores</td>
              <td width="20%" valign="middle">
                <input type="text" name="eproAutorizacionRegval" id="eproAutorizacionRegval" size="25" maxlength="25"/>
              </td>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap>Fecha de Autorizaci&oacute;n</td>
              <td width="20%" valign="middle" nowrap>
                <input type="text" name="eproFecRegval" id="eproFecRegval" tipo="Fecha" size="10" maxlength="10"/>
              </td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap>Monto Disponible</td>
              <td width="20%" valign="middle" nowrap>
                <input type="text" name="eproImpDisponible" id="eproImpDisponible" style="text-align:right;" tipo="Money" size="19" maxlength="19" prec="16.2" reqPrecValue/>
              </td>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
            <tr>
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="12%" valign="middle" nowrap><!--Status--></td>
              <td width="20%" valign="middle">
                <!--select size="1" name="eproStPrograma" id="eproStPrograma" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbStatusParam" next="asignaValues2ObjHTML"/-->
                <input  type="text" name="eproStPrograma" id="eproStPrograma" value="ACTIVO" style="visibility:hidden;"/>
                
              
              </td>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="10%" valign="middle" nowrap>&nbsp;</td>
              <td width="20%" valign="middle" nowrap>&nbsp;</td>
              <td width="15%" valign="middle" nowrap>&nbsp;</td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td height="100%" align="center">
            <br/>
            <table>
               <tr>
                     <td>
                         <input type="BUTTON" value="Aceptar " name="cmdAceptar" id="cmdAceptar" class="boton" onclick="ejecutaOperacionIndice();" style="visibility:hidden"/>
                        </td>
                     <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     </td>
                     <td>
                        <input type="BUTTON" value="Cancelar" name="cmdCancelar" id="cmdCancelar" class="boton_x" onclick="onButtonClickPestania('EmisionTitulos.Programas.PrincipalProgramas','')" style="visibility:hidden"/>
                     </td>
               </tr>
            </table>
         
        </td>
      </tr>
      <tr>
        <td width="60%" height="100%">&nbsp;&nbsp;</td>
      </tr>
      <!--- DATOS EMISION -->
      <tr>
        <td width="60%" height="100%" id="datEmision" style="visibility:hidden;">
            <input type="text" name="paramNumPrograma" id="paramNumPrograma" size="10" maxlength="10" style="visibility:hidden;"/>
            <input type="button" value="Consulta Emision" name="cmdConsultaEmision" id="cmdConsultaEmision" class="boton" ref="conETPriDatGen2" fun="loadTableElement" tabla="tblReg" onclick="consultar(this, frmDatos, false);" style="visibility:hidden;"/>
            <div class="subtitulo" align="center">
               EMISIONES LIGADAS
            </div>
             <table border="0" cellpadding="0" cellspacing="0">
                <tr class="cabeceras" align="left">
                  <td align="center" width="23" nowrap>&nbsp;</td>
                  <td width="150" nowrap>Programa</td>
                  <td width="100" nowrap>Pizarra</td>
                  <td width="100" nowrap>Serie</td>
                  <td width="100" nowrap>Contrato</td>
                  <td width="150" nowrap>Importe</td>
                  <td width="70" nowrap>Fecha Inicio</td>
                  <td width="70" nowrap>Fecha Fin</td>
                  <td width="100" nowrap>Plazo (Años)</td>
                  <td width="100" nowrap>Plazo (Días)</td>
                  <!--td width="80" nowrap>Status</td-->
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblReg" dataInfo="arrTblEmiDat" keys="eemiIdPrograma"  radioWidth="23px"/>
              </div>
              
        </td>
      </tr>
      <!--DATOS EMISION-->
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
  </table>
</FORM>
