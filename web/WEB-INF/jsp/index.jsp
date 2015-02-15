<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Spring Web MVC project</title>
        
     <!--
     Ejemplo de lo que és un objeto JSON
    <script type="text/javascript">
    var objetoJSON;
    objetoJSON = {"nombre" : "César Huaiquil", "edad": 33, "render": function(){
                    document.getElementById("content").innerHTML = objetoJSON.nombre + " " + objetoJSON.edad;
    }};
    objetoJSON.render();

    var objetos = {"Persona" : [
            {"nombre" : "César", "edad" : 33},
            {"nombre" : "Andrés", "edad" : 31}
        ]};
     document.getElementById('content').innerHTML  = objetos.Persona[1].nombre;
    </script>
     -->
    <style>
        .cuadro{
            display: inline-block;
            vertical-align: top;
            width: 300px;
        }
    </style>
    <script src="jquery-2.1.3.js"> </script>
    <script>
        $(document).on("ready", main);
        function main(){
            $("#buscar").on("click", function(){
                var texto="";
                var tag = $("#b").val();
                $.getJSON("http://api.flickr.com/services/feeds/photos_public.gne?tags=" + tag + "&tagmode=any&format=json&jsoncallback=?", function(datos){
                                $.each(datos.items, function(i, item){
                                    texto +="<div class = 'cuadro'>";
                                    texto +="<img src='" +item.media.m + "'/>";
                                    texto += "</div>";
                                });
                                $("#imagenes").html(texto);
                       });
            });
        }
    </script>
    </head>

    <body>        
    <input type="text" id="b">
    <input type="button" id="buscar" value="Buscar">
    <div id="imagenes"></div>

    
   <!-- <section id="tests">
        <div id="content">           
        </div>
    </section>
   -->
    
    </body>
</html>
