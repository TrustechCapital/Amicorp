var isParamScreen = 0;

var ctxRoot = (""+window.location+"").split("/Fiduciario")[0]+"/Fiduciario";

var indiceTablas = JSON.parse("{\"Indice\":583,\"orderDescripcion\":\"s\"}");


var genFormValidator = new FormValidator();

var expValidator = new FormValidator();

var docFormValidator = new FormValidator();



var nodoZero = {
    id : 0, categorias : ""
};

(function () {
    window.jsPlumbDemo = {
        init : function () {

            //Definimos la configuracion de JSPlumb
            jsPlumb.Defaults.Connector = ["Bezier", {curviness : 50}];
            jsPlumb.Defaults.DragOptions = { cursor : "pointer", zIndex : 2000 };            
            jsPlumb.Defaults.EndpointStyle = {  radius : 9, fillStyle : "#666666" };
            jsPlumb.Defaults.PaintStyle = { lineWidth : 3, strokeStyle : "#666666" };
            jsPlumb.Defaults.Anchors = ["BottomCenter", "TopCenter"];
            
            //Se obtiene la modalidad del arbol
            isParamScreen = parseInt($("#esParametrizacion").val());
            
            
            generaArbol();
            
            //Se agregan los validadores de cada formulario:
            
            //Valida el formulario para dar de alta categorias y criterios
            genFormValidator.setup({
              formName      : "genForm",
              tipoAlert     : 1,
              alertFunction : function(){},
              sendObjToAlert: true
            });
            
            //Valida el formulario para dar alta documentos
            docFormValidator.setup({
              formName      : "docForm",
              tipoAlert     : 1,
              alertFunction : function(){},
              sendObjToAlert: true
            });
            
            //Valida el formulario para consultar por expediente
            expValidator.setup({
              formName      : "expForm",
              tipoAlert     : 1,
              alertFunction : function(){},
              sendObjToAlert: true
            });
        }

    };

    $("#docTree").draggable({
        cursor : 'move', distance : 0
    });
    
    $("#miniTree").draggable({
        cursor : 'move', distance : 0
    });

    var hAnterior = 0;
    var aAnterior = 0;

    $("#miniTree").bind("drag", function (event, ui) {

        var topHelper = ui.position.top;
        var leftHelper = ui.position.left;

        if (leftHelper > 70)
            ui.position.left = 70;
        if (topHelper > 90)
            ui.position.top = 90;
        if (leftHelper < 0)
            ui.position.left = 0;
        if (topHelper < 0)
            ui.position.top = 0;
    })

    $("#miniTree").bind("dragstart", function (event, ui) {
        $('html,body').stop();
    });

    $("#miniTree").bind("dragstop", function (event, ui) {

        var topHelper = ui.position.top;
        var leftHelper = ui.position.left;
        var topHelperBody = $('html').scrollTop();
        var leftHelperBody = $('html').scrollLeft();

        if (topHelper > hAnterior)
            topHelperBody = topHelper * 20;
        if (topHelper < hAnterior)
            topHelperBody = topHelper * 20;
        if (leftHelper > aAnterior)
            leftHelperBody = leftHelper * 20;
        if (leftHelper < aAnterior)
            leftHelperBody = leftHelper * 20;

        hAnterior = topHelper;
        aAnterior = leftHelper;

        var topDuration = (topHelperBody > 0) ? (topHelperBody * 2) : (topHelperBody * 2);
        var leftDuration = (leftHelperBody > 0) ? (leftHelperBody * 2) : (leftHelperBody *  - 2);
        $('html,body').animate( {
            scrollTop : topHelperBody, scrollLeft : leftHelperBody
        },
2000);
        //$('html,body').animate({scrollLeft: leftHelperBody}, leftDuration);
        //$('html,body').scrollTop(topHelperBody);
        //$('html,body').scrollLeft(leftHelperBody);
    });

})();


var tipo_pantalla;

var CREAR = "N";
var CONSULTAR = "C";
var MODIFICAR = "M";


function setComboValue(idCombo,valor){
    //ES NECEASARIO HACERLO SIN USAR JQUERY    
    GI(idCombo).value=valor;    
}

function setScreenForNodeType(node, screen, modo) {
    tipo_pantalla = screen;

    var dataNode = treeHash[node];
    
    var disabled = "";
    var titulo = ""
    var name = "";
    
    if (modo == CONSULTAR) {
        disabled = "disabled";
    }

    var form;
    switch (screen){
        
        //Categorias
        case 0:
        
            var tabla = "";
            var categoriaPadre = "";
            
            titulo = "Nueva Categoria";
            if (modo == CONSULTAR) {
                name = dataNode.nombreLogico;
                tabla = dataNode.nombreFisico;
                titulo = dataNode.nombreLogico;
            }else
                categoriaPadre=(dataNode.id==0)?'':dataNode.id            
            
            form = '<h2 id="tituloAccion">' + titulo + '</h2>' + 
                    '<form name="genForm" id="genForm">' +
                        '<input type="hidden" name="tipopeticion" value="crearCategoria">'+
                        '<input type="hidden" name="catIdCategoriaPadre" id="catIdCategoriaPadre" value="'+categoriaPadre+'">'+
                        '<label>Nombre:</label><input id="catNombre" name="catNombre" type="text" value="' + name + '" ' + disabled + '/>' + 
                        '<label>Tabla:</label>' +
                        '<select ' + disabled + ' size="1" name="catTabla" id="catTabla" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion" param="indiceTablas" next="setComboValue(\'catTabla\',\''+tabla+'\')"></select>'+
                        '<div class="dvBotonesGenForm"><input id="btnRegresar" type="button" value="Regresar"/><input id="btnCreaNodo" type="button" value="Crear"/></div>' +
                    '</form>';

            $("#explanation").html(form);
            
            //Se cargan las tablas a las que se puede asociar una categoria  
            loadElement(GI('catTabla'));
            
            break;
            
            //Expedientes
            case 1:
            
                if (modo == CONSULTAR)
                    titulo = "Expediente";
                else
                    titulo = "Nuevo Expediente";
                    
                form = '<h2 id="tituloAccion">' + titulo + '</h2>' + 
                        '<form name="genForm" id="genForm">' +
                        '<input type="hidden" name="tipopeticion" value="crearExpediente">'+
                        '<label>Expediente:</label><input id="expIdExpediente" name="expIdExpediente" type="text" disabled value="">'+                                            
                        '<label>Fideicomiso:</label><input id="expIdFideicomiso" name="expIdFideicomiso" type="text" required>'+ 
                        '<div class="dvBotonesGenForm"><input id="btnRegresar" type="button" value="Regresar"/><input id="btnCreaNodo" type="button" value="Crear"/></div>' +
                        '</form>';
                
                $("#explanation").html(form);
                
                if (modo == CONSULTAR) 
                    $('#genForm :input[type="text"]').deserializeParameters(dataNode);
            
            break;
            
            //Criterios
            case 2:
            
                var tipoDato;
                var esObligatorio = "-1";
                titulo = "Nuevo Criterio";
                
                if (modo == CONSULTAR) {
                    name = dataNode.nombreLogico;
                    tipoDato = dataNode.criTipoDato;
                    idCategoria = treeHash[dataNode.padre].id;
                    titulo = dataNode.nombreLogico;
                    esObligatorio = dataNode.criObligatorio;
                }
                else{
                    idCategoria = dataNode.id;
                }

                form = '<h2 id="tituloAccion">' + titulo + '</h2>' + 
                        '<form name="genForm" id="genForm">' +
                        '<input type="hidden" name="tipopeticion" value="crearCriterio">'+
                        '<input type="hidden" name="catIdCategoria" value="' + idCategoria + '" >'+
                        '<label>Nombre:</label><input id="criNombre"  name="criNombre" type="text" value="' + name + '" ' + disabled + '/>' +
                        '<label>Tipo de Dato:</label>' +
                        '<select id="criTipoDato" name="criTipoDato" ' + disabled + '>' + 
                            '<option value="-1">--Seleccione--</option>' + 
                            '<option value="Alfanumerico">Alfanumerico</option>' + 
                            '<option value="Numerico">Numerico</option>' + 
                            '<option value="Fecha">Fecha</option>' + 
                        '</select>' +
                        '<label>Es Obligatorio:</label>' +
                        '<select id="criObligatorio" name="criObligatorio" ' + disabled + '>' + 
                            '<option value="-1">--Seleccione--</option>' + 
                            '<option value="S">SI</option>' + 
                            '<option value="N">No</option>' + 
                        '</select>' +
                        '<div class="dvBotonesGenForm"><input id="btnRegresar" type="button" value="Regresar"/><input id="btnCreaNodo" type="button" value="Guardar"/></div>' +
                        '</form>';
                        
                $("#explanation").html(form);
                
                                
                $("#criTipoDato").val(tipoDato);
                $("#criObligatorio").val(esObligatorio);

            break;
            
            //Documentos    
            case 3:
                                            
                var nombre = "";
                var expediente = $("#expIdExpediente").val();
                var folio="";
                var nodoCategoria = dataNode;
                var valor = "";
                var comentarios="";
                
                
                if (modo == CONSULTAR) {
                    nodoCategoria = treeHash[dataNode.padre];
                    criterios = nodoCategoria.criterios.split(',');
                    folio = dataNode.docFolio;
                    titulo = dataNode.docNombre;
                    nombre = dataNode.docNombre;                  
                    comentarios=dataNode.docComentarios;
                }
                else {
                    
                    if(!expValidator.checkForm())
                        return;
                    
                    criterios = dataNode.criterios.split(',');
                    titulo = 'Nuevo(a):  ' + nodoCategoria.nombreLogico
                }

                tipoDato = "";
                
                form = '<h2 id="tituloAccion">' + titulo + '</h2>' + 
                        '<form name="docForm" id="docForm" target="ifrmTarget" enctype="multipart/form-data" method="post" action="' + ctxRoot + '/treeFileHandler.do">'+
                        '<input type="hidden" name="catIdCategoria" value="' + dataNode.id + '">'+
                        '<input type="hidden" name="expIdExpediente" value="' + expediente + '">'+
                        '<label>Folio:</label><input id="docFolio" name="docFolio" type="text" required value="' + folio + '" ' + disabled + '>'+
                        '<label>Nombre:</label><input id="docNombre" name="docNombre" type="text" required value="' + nombre + '" ' + disabled + '>';
                        
                
                var k;                
                var camposFecha = "";
                
                //SE agregan los criterios de consulta de la categoria
                for (k = 0;k < criterios.length && criterios != "";k++) {
                   
                   var dataCriterio = treeHash[criterios[k]];
                   
                    if (modo == CONSULTAR) {
                        valor = dataNode[dataCriterio.nombreFisico];
                        tipoDato = dataNode[dataCriterio.criTipoDato];
                    }else
                        tipoDato = dataCriterio.criTipoDato;                    

                    var requerido=(dataCriterio.criObligatorio=="S")?"required":"";

                    form +='<label>' + dataCriterio.nombreLogico + ':</label><input id="criterio' + dataCriterio.nombreFisico + '" name="criterio' + dataCriterio.id + '" type="text" '+requerido+' value="' + valor + '" ' + disabled + '/>';

                    if (tipoDato === "Fecha")
                        camposFecha += " #criterio" + dataCriterio.nombreFisico + ",";
                    
                }

                form += '<label>Comentarios:</label><textarea id="docComentarios" name="docComentarios"' + disabled + '>'+comentarios+'</textarea>';
                
                if (modo == CONSULTAR) {
                    form += '<label>Ubicacion Fisica:</label><textarea>'+dataNode.docUrl+'</textarea>';
                    form += '<label>URL:</label><a id="docUrl" href="'+ctxRoot+'/archivoElectronico'+dataNode.docUrl+'" target="_blank">Descargar</a>';
                }else
                    form += '<label>Archivo:</label><input id="archivo" name="archivo" type="file" required multiple="multiple">';
                
                
                form += '<div class="dvBotonesGenForm"><input id="btnRegresar" type="button" value="Regresar"><input id="btnCreaNodo" name="btnCreaNodo" type="button" value="Guardar"></div>' +
                        '</form>' +
                        '<iframe id="ifrmTarget" width="1" height="1" name="ifrmTarget" style="display:none" src=""></iframe>';

                $("#explanation").html(form);
                
                //Se asignan los valores del documento en caso de estar en modo consulta
                if (modo == CONSULTAR)
                    $('#genForm :input[type="text"]').deserializeParameters(dataNode);                    
                
                //Se prepara el iFrame para recibir la respuesta del servlet
                $("#ifrmTarget").load(function () {
                    var respuesta = $(this).contents().find("#respuesta").html();
                    if (respuesta != "" && respuesta != null) {
                        //si se envio un documento
                        alert(respuesta)
                        $("#explanation").css("visibility", "hidden");
                        $("#cat" + dataNode.id + " div.categoria :input").click();
                        
                    }
                });

                $(camposFecha).datepicker( {
                    dateFormat : 'dd/mm/yy'
                });

                break;
                
            }

            $("#explanation").css("visibility", "visible");
            
            $("#btnRegresar").click(function () {
                $("#explanation").css("visibility", "hidden");
            });

            $("#btnCreaNodo").click(function () {
                                
                if (modo === 'N' && screen === 3){
                
                    if(!docFormValidator.checkForm())
                        return;
                        
                    if(GI("archivo").value == ""){
                        alert("seleccione un archivo")
                        return;
                    }
                    
                    $("#docForm").submit();   
                    
                }else {
                
                    if(!genFormValidator.checkForm())
                        return;
                        
                    var cadenaJSON = JSON.stringify($("#genForm").serializeObject());
                    
                    $.ajax( {
                        url : ctxRoot + "/treeFileHandler.do?json=" + cadenaJSON,
                        method : "GET",
                        success : function (resultado) {
                            alert(resultado.RESULTADO);
                            
                            $("#explanation").css("visibility", "hidden");
                            generaArbol();
                        }
                    });
                }

            });
        }

        var treeHash;        
        
        function  buscaExpedienteXFideicomiso(){
        
            
            
            if(!expValidator.checkForm()){
                $("#explanation").css("visibility", "hidden");
                $("#nodo0").find("div.borrar").css("visibility","hidden");                
                return;
            }
                     
            var fideicomiso=GI('tipoFideicomiso').value+GI('expIdFideicomiso').value;
            
            $.ajax({                        
                    url : ctxRoot + "/treeFileHandler.do?json={tipopeticion:\"consultarExpediente\",expIdFideicomiso:\""+fideicomiso+"\"}",
                    method : "GET", 
                    success : function (resultado) {
                    
                            var expediente = resultado.RESULTADO;  
                            
                            //Si el expediende existe
                            if(expediente != ""){
                                treeHash["nodo0"] = expediente;  
                                
                                //Se oculta el icono de borrado
                                $("#nodo0").find("div.borrar").css("visibility","visible"); 
                                
                                GI('expIdExpediente').value=expediente.expIdExpediente                            
                                setScreenForNodeType('nodo0', 1, 'C');  
                                
                                //Qutamos los documentos anteriormente consultados
                                $("div.documentoNon,div.documentoPar").remove();
                            }else{
                                alert("El "+GI("tipoFideicomiso").options[GI("tipoFideicomiso").selectedIndex].text+" #"+GI("expIdFideicomiso").value+" no existe")
                                GI('expIdExpediente').value = "";
                                GI('expIdFideicomiso').value = "";
                                GI('expIdFideicomiso').focus();
                            }
                    }
            });
        
        }
                    
        function generaArbol() {
            
            //Se vacia el arbol
            $("#docTree").empty();
            
            $.ajax( {
                url : ctxRoot + "/treeFileHandler.do?json={tipopeticion:\"obtenerArbolParametrizacion\"}",
                method : "GET",
                success : function (resultado) {
                    treeHash = resultado.RESULTADO[0];                    
                    var nodoCero='';
                    
                    if(isParamScreen){
                    
                        nodoCero = '<div id="nodo0" style="position:absolute; top:0;height:100px"> '+
                                        '<div class="lColumn boton borrar" style="visibility:hidden"></div>'+
                                        '<div class=" mColumn window categoria" style="height:80px" ><h1>Categorias</h1></div>'+
                                        '<div class=" rColumn boton agregarCategoria" onclick="setScreenForNodeType(\'nodo0\',0,\'N\')"></div>'+
                                    '</div>';
                                    
                        $("#docTree").append(nodoCero);
                        
                    }else{
                    
                        nodoCero = '<div id="nodo0" style="position:absolute;top:0;">'+
                                        '<div class="lColumn boton borrar" style="visibility:hidden" onclick="deleteSuperNode(\'nodo0\')"></div>'+
                                        '<div class="mColumn window categoria" onclick="if(GI(\'expIdFideicomiso\').value!=\'\'){setScreenForNodeType(\'nodo0\', 1, \'C\')}"><h1>EXPEDIENTES</h1><br>'+                                 
                                            '<form id="expForm" name="expForm"><input id="expIdExpediente" name="expIdExpediente" type="hidden">'+
                                            '<label>Todo: </label><input id="rdoModoLibre" name="rdoModo" type="radio" onclick="cambiaModoConsulta(\'todo\')">&nbsp;&nbsp;'+
                                            '<label>Por Contrato: </label><input id="rdoModoFiltrado" name="rdoModo" type="radio" checked onclick="cambiaModoConsulta(\'filtrado\')"><br>'+
                                            '<label>Tipo: </label><select id="tipoFideicomiso" name="tipoFideicomiso" required><option value="-1">--Seleccione--</option><option value="A_">Anteproyecto</option><option value="F_">Fideicomiso Interno</option><option value="FE_">Fideicomiso Emision</option></select><br>'+
                                            '<label>Numero: </label><input id="expIdFideicomiso" name="expIdFideicomiso" type="text" value="" required onblur="buscaExpedienteXFideicomiso()"></form>'+
                                        '</div>'+
                                        '<div class="rColumn boton" style="visibility:hidden"></div>   '+       
                                    '</div>';
                                    
                        $("#docTree").append(nodoCero);                        
                        
                        cambiaModoConsulta('filtrado');
                        
                        $("#expIdFideicomiso").click(function (){
                            var el =this;
                            $(document).keypress(function(e) {
                                //Al presionar enter
                                if(e.keyCode == 13)
                                    el.blur();
                            });                                    
                        });
                        
                        //Prevenimos que se haga el submit por default
                        $('#expForm').submit(function() {                                         
                              return false;
                        });
                                    
                    }
                    
                    //Centramos el nodo0
                    $("#nodo0").css({left:((screen.width-400)/2)+"px"});

                    nodoZero = treeHash["nodo0"];                                        
                    organiseTree("nodo0");
                    distributeTree("nodo0");
                }
            });

        }
        
        function cambiaModoConsulta(modo){
        
            if(modo=='todo'){
            
                GI('expIdFideicomiso').value = '';
                GI('tipoFideicomiso').value = '-1';
                SA(GI('expIdFideicomiso'),'disabled','disabled');
                SA(GI('tipoFideicomiso'),'disabled','disabled');
                $(".agregarDocumento").css("visibility","hidden");
                $("#nodo0").find("div.borrar").css("visibility","hidden");
                $("#explanation").css("visibility", "hidden");
                
            }else{
            
                RA(GI('expIdFideicomiso'),'disabled');
                RA(GI('tipoFideicomiso'),'disabled');
                $(".agregarDocumento").css("visibility","visible");
                $("div.documentoNon,div.documentoPar").remove();
                
            }
        
        }

        function organiseTree(idnode) {
            
            var node = treeHash[idnode];
            treeHash[idnode].hojas = 0;
            
            //solo el nodo0 tiene categorias, los demas tienen subcategorias
            var nHijos = (idnode=="nodo0")?node.ncategorias:node.nsubcategorias;
                       
            if (nHijos > 0) {

                var hijos = (idnode=="nodo0")?(node.categorias.split(",")):(node.subcategorias.split(","));
                
                var i;
                for (i = 0;i < nHijos;i++) {
                
                    newNode(0, hijos[i]);
                    
                    var childNode = treeHash[hijos[i]];
                    
                    //Se agrega el boton de buscar en caso de que el nodo sea una categoria con documentos                    
                    if(!isParamScreen && childNode.nsubcategorias == 0)
                        $("#" + hijos[i] + " div.categoria").append('<input class="btnBuscarDocumentos" onclick="generaDocumentos(\'' + hijos[i] + '\')" type="button" value="Buscar"/>');
                                         
                    organiseTree(hijos[i]);                    
                    node.hojas += childNode.hojas;                    
                }               
                
            }else{
                
                node.hojas++; 
                nHijos = node.ncriterios;                
                
                if(nHijos>0){
                    var criterios = node.criterios.split(",")
                    for (i = 0;i < nHijos;i++) {
                        newNode(2, criterios[i]);
                    }
                }
            }
        }
        
        
        function distributeTree(idnode) {
            
            var xInicial,yInicial;
            var node = treeHash[idnode];
            var domNode = $("#" + idnode);

            var anchoNodo = 300; 
            var anchoNodoCero = 400;
            var espaciadoVertical=250;
            var separacion=150;

            var nHijos = (idnode=="nodo0")?node.ncategorias:node.nsubcategorias;
            var nHojas = node.hojas;
                
            var espacioRequeridoNivel = (nHojas*anchoNodo);
                        
            if (nHijos > 0) {
                
                var hijos = (idnode=="nodo0")?(node.categorias.split(",")):(node.subcategorias.split(","));
                
                //Asignamos coordenadas de los hijos apartir del padre
                yInicial = parseInt((domNode.css("top")).replace("px", "")) + espaciadoVertical;

                xInicial = parseInt((domNode.css("left")).replace("px", ""));                
                
                if(idnode=="nodo0")                
                    xInicial += (anchoNodoCero/2);
                else
                    xInicial += (anchoNodo/2);                    
                   
                xInicial -= (espacioRequeridoNivel / 2)
                
                var i;
                for (i = 0;i < nHijos;i++) {                     
                     
                    var childNode = treeHash[hijos[i]];
                    var nHojasChild = childNode.hojas;
                    
                    var  espacioRequeridoNodo = 0;
                    
                    //El espacio ocupado por cada nodo es el mismo 
                    //que el de los nodos hoja de este mismo nodo 
                    //o el de un solo nodo en caso de no tener hijos
                    if(childNode.nsubcategorias == 0)                    
                        espacioRequeridoNodo = anchoNodo ;
                    else{                        
                        espacioRequeridoNodo = (nHojasChild*anchoNodo);
                    }
                    
                    //Se centra la posicion del nodo en el espacio requerido                   
                    espacioRequeridoNodo /= 2;                    
                    xInicial += (espacioRequeridoNodo-anchoNodo/2);
                                     
                   
                    $("#" + hijos[i]).css({ top: yInicial + "px", left: xInicial + "px" });                    
                    
                    xInicial += (espacioRequeridoNodo+anchoNodo/2);
                    
                    //Se conecta el nodo con su nodo padre    
                    jsPlumb.connect( {
                        source : childNode.padre, target : hijos[i], overlays : []
                    });    
                    
                    //aplicamos la funcion recursivamente
                    distributeTree(hijos[i]);                   
                    
                }                
                
            }
        }

        function newNode(tipo, idNodo) {

            var nodeData = treeHash[idNodo];
            var nombre = nodeData.nombreLogico;
            var nodoHijo;

            switch (tipo) {

                case 0:
                    
                    //Crear categoria	
                    nodoHijo = '<div id="' + idNodo + '" style="position:absolute;width:300px;">';
        
                    if (isParamScreen) {
                        nodoHijo += '<div class="lColumn boton borrar" title="Borrar Categoria" onclick="deleteSuperNode(\'' + idNodo + '\')"></div>'+
                                    '<div class="mColumn window categoria"  onclick="setScreenForNodeType(\'' + idNodo + '\',0,\'C\')">' + nombre + '</div>';
                    }
                    else {
                        nodoHijo += '<div class="lColumn" style="width:40px;"></div>'+
                                    '<div class="mColumn window categoria"><h3>' + nombre + '</h3><ul></ul></div>';
                    }
        
                    if (isParamScreen) {
                        if(nodeData.nsubcategorias == 0){
                            nodoHijo += '<div class="rColumn">' +
                                            '<div class="boton agregarCategoria" title="Agregar Categoria" onclick="setScreenForNodeType(\'' + idNodo + '\',0,\'N\')"></div>' + 
                                            '<div class="boton btnCriterioLibre" title="Agregar Criterio Libre" onclick="setScreenForNodeType(\'' + idNodo + '\',2,\'N\')">+</div>' +
                                        '</div>';
                        }else{
                            nodoHijo += '<div class="rColumn">' +
                                            '<div></div>' + 
                                            '<div class="boton agregarCategoria" title="Agregar Categoria" onclick="setScreenForNodeType(\'' + idNodo + '\',0,\'N\')"></div>' +
                                        '</div>';                        
                        }
                    }
                    else if(nodeData.nsubcategorias == 0){
                        nodoHijo += '<div class="rColumn boton agregarDocumento" title="Agregar Documento" onclick="setScreenForNodeType(\'' + idNodo + '\',3,\'N\')"></div>';
                    }else{
                        nodoHijo += '<div class="rColumn boton" style="visibility:hidden" onclick="setScreenForNodeType(\'' + idNodo + '\',3,\'N\')"></div>';
                    }
        
                    nodoHijo += '</div>';
                    $("#docTree").append(nodoHijo);
    
                break;          
                case 2:
                //Crear clasificacion libre
                    var tipoDato = nodeData.criTipoDato;
                    var ligadoATabla = nodeData.criLigadoATabla;
    
                    if (isParamScreen) {
                        
                        if(ligadoATabla=='N'){
                            nodoHijo = '<div id="' + idNodo + '">'+
                                            '<div class="lColumn boton borrar" title="Borrar Criterio" onclick="deleteSuperNode(\'' + idNodo + '\')"></div>'+
                                            '<div class="mColumn window libre" onclick="setScreenForNodeType(\'' + idNodo + '\',2,\'C\')">' + nombre + '</div>' +
                                        '</div>';
                        }else{
                            nodoHijo = '<div id="' + idNodo + '">'+
                                            '<div class="lColumn boton" style="visibility:hidden"></div>'+
                                            '<div class="mColumn window base" onclick="setScreenForNodeType(\'' + idNodo + '\',2,\'C\')">' + nombre + '</div>' +
                                        '</div>';
                        }
                        
                        $("#" + nodeData.padre).append(nodoHijo);
                        
                    }
                    else {
                        nodoHijo = '<li id="' + idNodo + '">' +
                                        '<input id="dataTypeNodo' + idNodo + '" name="' + nombre + '" placeholder="' + nombre + '" type="text" />' +
                                    '</li>';
                        $("#" + nodeData.padre + " div.categoria ul").append(nodoHijo);
                    }
    
                    if (tipoDato == "Fecha") {
                        $("#dataTypeNodo" + idNodo).datepicker( {
                            dateFormat : 'dd/mm/yy'
                        });
                    }
                    
                break;
                
                default :
                
                break;

            }

            $("input[placeholder]").applyPlaceholder();

        }

        function deleteSuperNode(idNode) {
            var dataNode = treeHash[idNode];
            var cadJSON = new Object();
            
            //Prefijo del id de cada nodo que indica su tipo
            var tipoNodo = idNode.substring(0, 3);

            if (tipoNodo === "cat") {
                cadJSON.tipopeticion = "eliminarCategoria"
                cadJSON.catIdCategoria = dataNode.id
                
                if(!confirm("Esta seguro que desea eliminar la categoria "+dataNode.nombreLogico+" ?"))
                    return; 
            }
            
            if (tipoNodo === "cri") {
                cadJSON.tipopeticion = "eliminarCriterio"
                cadJSON.criIdCriterio = dataNode.id
                
                if(!confirm("Esta seguro que desea eliminar el criterio "+dataNode.nombreLogico+" ?"))
                    return;
            }
            
            if (tipoNodo === "doc") {
                cadJSON.tipopeticion = "eliminarDocumento"
                cadJSON.docIdDocumento = dataNode.id
                
                if(!confirm("Esta seguro que desea eliminar el documento "+dataNode.docNombre+" ?"))
                    return;                
            }
            
            if (idNode === "nodo0") {
                cadJSON.tipopeticion = "eliminarExpediente"                
                cadJSON.expIdExpediente = dataNode.expIdExpediente
                
                if(!confirm("Esta seguro que desea expediente del fideicomiso "+dataNode.expIdFideicomiso+" ?"))
                    return;
            }
            
            $.ajax( {
                url : ctxRoot + "/treeFileHandler.do?json=" + JSON.stringify(cadJSON), method : "GET", success : function (resultado) {
                    alert(resultado.RESULTADO)
                    
                    if (isParamScreen || idNode === "nodo0")
                        generaArbol();                    
                    else
                        generaDocumentos(treeHash[idNode].padre);
                    
                }
            });

        }

        function generaDocumentos(idNodo) {
            
            var expediente = $("#expIdExpediente").val();
            var incluirExpediente="";
            
            
            if(GI('rdoModoFiltrado').checked){
            
                if(expValidator.checkForm())
                    incluirExpediente=",expIdExpediente:" + expediente;   
                else
                    return;                
            }                

            var documentos;
            var dataNode = treeHash[idNodo];

            var idCategoria = dataNode.id;

            var nodoCategoria = dataNode;
            var criterios = nodoCategoria.criterios.split(",");
            
            var parametrosConsulta = JSON.stringify($("#"+idNodo).serializeParameters());
            
            //Quitamos los documentos anteriores
           
            $("#" + idNodo).find("div.documentoNon,div.documentoPar").remove();
            
              
            $.ajax( {
                url : ctxRoot + "/treeFileHandler.do?json={tipopeticion:\"obtenerDocumentosCategoria\",catIdCategoria:" + idCategoria + incluirExpediente + ",parametros:"+parametrosConsulta+"}",
                method : "GET",
                success : function (resultado) {
                                         
                    var categoria = resultado.RESULTADO[0];
                                        
                    documentos = categoria.documentos;
                    
                    if(criterios!= ""){
                        for (var i = 0;i < criterios.length;i++) {
                            treeHash[criterios[i]].nhijos = categoria.nhijos;
                            treeHash[criterios[i]].hijos = categoria.hijos;
                        }
                    }
                    
                    var contador = 1;
                    var nivel = 0;
                    var marginTop = 0;
                    
                    //var myDocumentFragment = document.createDocumentFragment();
                    for (var i in documentos) {
                             
                        treeHash[i] = documentos[i];
                        
                        var nodeData = documentos[i];
                        
                        var nombre = nodeData.docNombre;
                        marginTop = nivel * 120;
                        marginTop+=10;
                        
                        if ( contador % 2 != 0) {
                            nodoHijo = '<div id="' + i + '" class="lColumn documentoNon" style="margin-top:5px;margin-left:-6px">' +
                                            '<div class="lColumn">' +
                                                '<div class=" boton btnSeleccionar"><input type="checkbox" id="chkDoc'+i+'"/></div>' +
                                                '<div class="boton borrar" title="Borrar Documento" onclick="deleteSuperNode(\'' + i + '\')"></div>' +
                                            '</div>' + 
                                            '<div class="mColumn window documento" onclick="setScreenForNodeType(\'' + i + '\',3,\'C\')">' + nombre + '</div>'+
                                        '</div>';

                        }else {
                            nodoHijo = '<div id="' + i + '" class="rColumn documentoPar" style="margin-top:5px;margin-left:36px">' +
                                            '<div class="mColumn window documento" onclick="setScreenForNodeType(\'' + i + '\',3,\'C\')">' + nombre + '</div>'+
                                            '<div class="rColumn">' +
                                                '<div class=" boton btnSeleccionar"><input type="checkbox" id="chkDoc'+i+'"/></div>' +
                                                '<div class="boton borrar" title="Borrar Documento" onclick="deleteSuperNode(\'' + i + '\')"></div>' +
                                            '</div>' +                                                     
                                        '</div>';
                        }
                        
                        //var myDocumentFragment.appendChild(nodoHijo);
                        
                        $("#" + nodeData.padre).append(nodoHijo);
                        
                        contador++;
                        if (contador == 3) {
                            contador = 1
                            nivel++;
                        }
                    }// Fin for documentos
                }//Fin AJAX callback
            });

        }// Fin funcion

        //*****************************Plug-ins JQuery*****************************

        $.fn.serializeObject = function () {
            var o = {
            };
            var a = this.serializeArray();

            $.each(a, function () {
                if (o[this.name] !== undefined) {
                    if (!o[this.name].push) {
                        o[this.name] = [o[this.name]];
                    }
                    o[this.name].push(this.value || '');
                }
                else {
                    o[this.name] = this.value || '';
                }
            });
            return o;
        };
                
        
        $.fn.serializeParameters = function() {
            if ( !this.length ) { return false; }
        
            var $el = this;
            var  o = {};
            
            $el.find(':input[type!="button"][type!="checkbox"]').each(function() {
            if(this.value!=this.name)
                o[this.name] = this.value || '';                        
            });
        
            return o;
          };
          
          $.fn.deserializeParameters = function(parameters) {
            var el = this;
            
            $(el).each(function() {
                this.value=parameters[this.name]; 
            });
            
          };
          
          $.fn.resetParameters = function() {
            var el = this;
            
            $(el).each(function() {
                this.value="";
            });
            
          };
          
          
          $.fn.applyPlaceholder = function() {
            this.each(function () {
                if ($(this).val() == "" && $(this).attr("placeholder") != "") {
                
                    $(this).val($(this).attr("placeholder"));
                    
                    $(this).focus(function () {
                        if ($(this).val() == $(this).attr("placeholder"))
                            $(this).val("");
                    });
                    
                    $(this).blur(function () {
                        if ($(this).val() == "")
                            $(this).val($(this).attr("placeholder"));
                    });
                }
            });
          };