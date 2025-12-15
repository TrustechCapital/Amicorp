<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Mantenimiento Perfiles</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table cellspacing="3" cellpadding="2" border="0" width="100%" class="texto">
          <tr>
            <td class="subtitulo" width="10%">&nbsp;</td>
            <td width="15%" align="right">Perfil</td>
            <td nowrap width="1%" colspan="2">&nbsp;
            <!--<select size="1" name="fperIdPerfil" id="fperIdPerfil" ref="clavePerfil" fun="loadComboElement" keyValue="fperIdPerfil" theValue="fperNombrePerfil" next="txtFunciones" param="paramOrderPerfil" required message="El Perfil es un dato obligatorio" onchange="cargaParamComboFuncionesAsignadas(this);"/></td>-->
            <select size="1" name="fperIdPerfil" id="fperIdPerfil" ref="clavePerfil" fun="loadComboElement" keyValue="pueNumPuesto" theValue="pueNomPuesto" next="txtFunciones" param="paramOrderPerfil" required message="El Perfil es un dato obligatorio" onchange="cargaParamComboFuncionesAsignadas(this);"/></td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="5">
              <hr/>
            </td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">&nbsp;</td>
            <td nowrap width="1%">&nbsp;</td>
            <td width="15%">&nbsp;
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">Funciones</td>
            <td nowrap width="1%">&nbsp;</td>
            <td width="15%">Funciones Asignadas</td>
            <td width="10%">&nbsp;</td>
          </tr>
          <tr>
            <td width="10%">&nbsp;</td>
            <td width="15%">
              <select size="11" name="txtFunciones" id="txtFunciones" ref="muestraDatosModulos" fun="loadComboElement" keyValue="ffunIdFuncion" theValue="ffunNomMenu" next="loadCatalogo"/>
            </td>
            <td align="center" rowspan="1" width="1%">
              <P align="center">
                <input type="BUTTON" value="Agregar" name="cmdAgregar" id="cmdAgregar" onclick="agregarClave(GI('txtFunciones'),GI('txtFuncionesAsignadas'));"/>
              </P>
              <P>
                <input type="BUTTON" value="Quitar " name="cmdQuitar" id="cmdQuitar" onclick="quitarClave(GI('txtFuncionesAsignadas'));"/>
              </P>
            </td>
            <td width="15%">
              <select size="11" name="txtFuncionesAsignadas" id="txtFuncionesAsignadas" ref="muestraDatosFuncionesXPuestoPerfil" fun="loadComboElement" keyValue="ffunIdFuncion" theValue="ffunNomMenu" next="formsLoaded" param="parametroComboFuncionesAsignadas"/>
            </td>
            <td width="10%">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%" align="center">
        <input type="BUTTON" value="Aceptar " name="cmdAceptar" class="boton" onclick="ejecutaOperacionFunciones();" style="visibility:hidden"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="BUTTON" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="showWaitLayer(); cargaPrincipalSeguridadFuncionesXPuesto();" style="visibility:hidden"/>
      </td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>
