<%-- 
    Document   : disciplinas.jsp
    Created on : 17 de abr. de 2023, 14:17:38
    Author     : Fatec
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Disciplinas</title>
        <script defer src="https://unpkg.com/alpinejs@3.5.0/dist/cdn.min.js"> </script>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <a href="index.jsp">Voltar</a>
        <div x-data="{data: null, fetchDados(){
    fetch('http://localhost:8080/TarefaFetch/endrews.json')
    .then((response) => response.json())
    .then((json) => this.data = json);
    }}" x-init="fetchDados()"> 
            <div class="card"> 
                <div class="card-body"> 
                    <h5 class="card-title" > Disciplinas </h5> 
                </div> 
                <template x-for="item in data.Materias">
                    <p x-text="item"></p>
                </template>
            </div> 
        </div>          
    </body>
</html>
