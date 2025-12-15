<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table width="100%" style="height:auto;">
    <tr>
      <td align="center" class="titulo">Productos</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table align="center" class="texto" width="90%">
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="20%">Id Producto Estándar</td>
            <td>
              <input type="text" name="paramNumProdesta" id="paramNumProdesta" size="5" maxlength="5" tipo="Num"/>
            </td>
            <td width="25%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="20%">Nombre Producto Estándar</td>
            <td>
              <input type="text" name="paramNomProdesta" id="paramNomProdesta" size="20" maxlength="50" tipo="Texto"/>
            </td>
            <td width="25%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="20%">Tipo Negocio</td>
            <td>
              <select name="paramTipoNegocio" id="paramTipoNegocio" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" next="paramClasifProd" param="clavesCombo36"/>
            </td>
            <td width="25%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="20%">Clasificación Producto</td>
            <td>
              <select name="paramClasifProd" id="paramClasifProd" ref="claves" fun="loadComboElement" keyValue="cveDescClave" theValue="cveDescClave" param="clavesCombo37" next="paramStatus"/>
            </td>
            <td width="25%">&nbsp;</td>
          </tr>
          <tr>
            <td width="25%">&nbsp;</td>
            <td width="20%">Status</td>
            <td>
              <select size="1" name="paramStatus" id="paramStatus" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="cmbStatusParam" next="formsLoaded"/>
            </td>
            <td width="25%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="button" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" ref="qryProdesta" fun="loadTableElement" tabla="tblReg" onclick="consultaProd(this);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" value="Limpiar" name="cmdLimpiar" class="boton" onclick="limpiar(frmDatos);"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="text" name="paramorder" id="paramorder" size="2" value="s" style="visibility:hidden"/>
              <input type="text" name="paramNumProdestaProd" id="paramNumProdestaProd" size="2" value="" style="visibility:hidden"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">
              <input type="BUTTON" value="   Alta  " name="cmdAlta" class="boton" onclick="cargaMantenimientoProdesta(1);"/>
              <input type="BUTTON" value="Modificar" name="cmdModificar" class="boton" onclick="cargaMantenimientoProdesta(2);"/>
              <input type="BUTTON" value="   Baja  " name="cmdBaja" class="boton" onclick="cargaMantenimientoProdesta(3);"/>
              <input type="BUTTON" value="Consultar" name="cmdConsultar" class="boton" onclick="cargaMantenimientoProdesta(4);"/>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center" class="subtitulo">Prodesta<hr width="70%"/></td>
          </tr>
          <tr align="center">
            <td colspan="4">
              <table border="0" cellpadding="0" cellspacing="0">
                <tr class="cabeceras" align="left">
                  <td align="center" width="23" nowrap>&nbsp;</td>
                  <td width="50" nowrap>Id</td>
                  <td width="200" nowrap>Producto Estándar</td>
                  <td width="200" nowrap>Tipo Negocio</td>
                  <td width="200" nowrap>Clasif. Prod.</td>
                  <td width="100" nowrap>Status</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:773px;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblReg" dataInfo="arrTblDat" keys="proNumProdEsta" fun="clickTabla" radioWidth="23px"  ondblclick="hideWaitLayer();">
                </table>
              </div>
            </td>
          </tr>
          <tr>
            <td colspan="4" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center" class="subtitulo" id="hdProductos" style="visibility:hidden;">
              Productos
                <input type="BUTTON" value="   Alta  " name="cmdAltaProd" class="boton" onclick="cargaMantenimientoProducto(1);"/>
                <input type="BUTTON" value="Modificar" name="cmdModificarProd" class="boton" onclick="cargaMantenimientoProducto(2);"/>
                <input type="BUTTON" value="   Baja  " name="cmdBajaProd" class="boton" onclick="cargaMantenimientoProducto(3);"/>
                <input type="BUTTON" value="Consultar" name="cmdConsultarProd" class="boton" onclick="cargaMantenimientoProducto(4);"/>
              <hr width="70%"/>
            </td>
          </tr>
          <tr align="center">
            <td colspan="4" id="tbProductos" style="visibility:hidden;">
              <table border="0" cellpadding="0" cellspacing="0">
                <tr class="cabeceras" align="left">
                  <td align="center" width="23" nowrap>&nbsp;</td>
                  <td width="50" nowrap>Id</td>
                  <td width="200" nowrap>Producto</td>
                  <td width="200" nowrap>Tipo Negocio</td>
                  <td width="200" nowrap>Clasif. Prod.</td>
                  <td width="100" nowrap>Nomenclatura</td>
                  <td width="100" nowrap>Status</td>
                </tr>
              </table>
              <div style="height:250px; overflow:auto; position:relative; vertical-align:top; width:873px;">
                <table border="0" cellpadding="0" cellspacing="0" class="texto" id="tblRegProd" dataInfo="arrTblDatProd" keys="prlNumProducto" fun="clickTablaProd" radioWidth="23px" ondblclick="GI('cmdConsultarProd').click();hideWaitLayer();">
                </table>
              </div>
              <input type="button" value="Aceptar" id="cmdAceptarProd" name="cmdAceptarProd" class="boton" ref="qryProducto" fun="loadTableElement" tabla="tblRegProd" onclick="consultar(this, frmDatos, false);" style="visibility:hidden;"/>
              
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</FORM>
