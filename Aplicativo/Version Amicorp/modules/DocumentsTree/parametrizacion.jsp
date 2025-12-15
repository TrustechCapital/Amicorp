<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Parametrizacion de Archiveros</title>		
    <style type="text/css">
      <%@include file="css/tree.css" %>
      <%@include file="css/cupertino/jquery-ui-1.8.16.custom.css" %>
    </style>	
	</head>
	<body onunload="jsPlumb.unload();">
                <input type="hidden" id="esParametrizacion" value="1"/>
                
		<div id="docTree">
                   
		</div>	
		
                <div id="miniTreeContainer">
                    <div class="tituloPantalla">Parametrizaci&oacute;n de Expedientes</div>
                    <br>
                    <div id="miniTree">
                            <div id="miniTree"></div>
                            <div id="miniTreeBackground"></div>
                    </div>	
                </div>
		
		<div id="explanation"></div>
                
                
		<script type="text/javascript" src="../../js/generic_functions.js" charset="iso-8859-1"></script>
    <script type="text/javascript" src="../../js/funciones_cliente.js"></script>
    <script type="text/javascript" src="../../js/handling_objects_functions.js"></script>
    <script type="text/javascript" src="../../js/formValidator.js"></script>
		<script type="text/javascript" src="js/jquery/jquery.min.js"></script>
		<script type="text/javascript" src="js/jquery/jquery-ui.min.js"></script>		
		<script type="text/javascript" src="js/jquery/jquery.jsPlumb-1.3.2-all-min.js"></script>		
    <script type="text/javascript" src="../../js/JSON.js"></script>
		<script type="text/javascript" src="js/tree.js"></script>
		<script type="text/javascript" src="js/tree-conf-helper.js"></script>
    
	</body>
</html>
