<FORM name="frmPrincipalConceptos" id="frmPrincipalConceptos" onsubmit="">
<input type="hidden" id="personaSelected"/>
<input type="hidden" id="conceptoSelected" value="0"/>
<input type="hidden" id="sconceptoSelected" value="0"/>
<input type="hidden" id="ssconceptoSelected" value="0"/>
  <table cellspacing="0" cellpadding="0" border="0"  width="1200" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Conceptos Generales KYC</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>
        <table width="100%" align="center" class="texto" border="0">          
          <tr>            
            <td width="15%">Tipo Persona</td>
            <td colspan="4" align="left">
                <select size="1" name="paramTipoPersona" id="paramTipoPersona" ref="conETDatInd" fun=loadComboElement keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbTipoPersona" next="formsLoaded" onchange="limpiaConceptos();GI('personaSelected').value=this.options[this.selectedIndex].text;consultaConceptosGenerales('Concepto')"/>
            </td>            
          </tr>          
          <tr>
            <td colspan="2">
            <hr>
              <div style="overflow:auto; width:1200px; height:75px;">
                <table id="Conceptos" cellspacing="0" cellpadding="0">
                <div>Conceptos</div>
                </table>
              </div>
              <hr>        
              <div style="overflow:auto; width:1200px; height:75px;">
                <table id="Subconceptos" cellspacing="0" cellpadding="0" >
                <div>Subconceptos</div>
                </table>
              </div>
              <hr>
              <div style="overflow:auto; width:1200px; height:75px;">
                <table id="Subsubconceptos" cellspacing="0" cellpadding="0">
                <div>Subsubconceptos</div>
                </table>
              </div>
              <hr>
            </td>
          </tr>                   
        </table>
      </td>
    </tr>
  </table>
</FORM>
<table cellpadding="0" cellspacing="0" width="700" height="300" style="visibility:visible;">  
  <tr>    
    <td width="700" align="center" height="300" style="background-color: #E4E4E4;"><div id="divManejoConceptos" style="visibility:visible"><div style="color: #CCCCCC;font-size: 40px;font-weight: bold;"> CONCEPTOS GENERALES KYC</div></div></td>
  </tr>
</table>