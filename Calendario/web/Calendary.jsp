<%-- 
    Document   : Calendary
    Created on : 20 de mar. de 2023, 19:16:20
    Author     : Endrews Nunes de Azevedo
    RA         : 1290482123011
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" >
        <title> Gerador de Calendário</title>
    </head>

    <body>
        <div class="container">
            <center><h2 class="mt-3">Gerador de Calendário</h2></center>

            <center>

                <form class="mt-5" action="/Servlets/Calendary.jsp">
                    <label for="mm">Mês</label>
                    <input type="number" value="<%%>" name="mes" id="mm" placeholder="11"/> <br>

                    <label for="aa">Ano</label>
                    <input type="number" value="<%%>" name="ano" id="aa" placeholder="2023"/> <br>

                    <center><input type="submit" class="mt-4" value="Gerar Calendario"/></center>

                </form>
                    <%
                    Integer ano = 0;
                    Integer mes = 0;
                    String error = null;

                    try{

                    mes = Integer.parseInt(request.getParameter("mes"));
                    ano = Integer.parseInt(request.getParameter("ano"));

                    }catch(Exception e){
                            error = e.getMessage();
                    }
                    
                if(error != null){%>
                <div class="mt-3" style="background:#ffaa00"><%=error%></div>
                <%}else{%>
                    
                <table class="table mt-3">  
                    <tr>
                        <% 
                        String diasSemana[] = {"Domingo","Segunda-Feira","Terça-Feira","Quarta-Feira","Quinta-Feira","Sexta-Feira","Sábado"};
                        for(int i = 0; i< diasSemana.length;i++) {%>
                        <th><%=diasSemana[i]%></th>
                            <%}%>
                    </tr>

                    <tr>
                    <%
                    if (mes != null && (mes > 0 && mes < 13) && ano != null && (ano > 0 && ano < 10000) ){
                        Calendar c = Calendar.getInstance();
                        c.set(ano, mes-1,1);
                        
                        int diaMes = c.getActualMaximum(Calendar.DAY_OF_MONTH);
                        int diaSemana = c.get(Calendar.DAY_OF_WEEK);
                        
                        for(int i = 1; i < diaSemana;i++) {
                            out.println("<td class=\"text-center\" style='background-color:#000000'> </td>");
                        }
                        
                        for(int i = 1; i <= diaMes;i++) {
                            out.println("<td class=\"text-center\" style='background-color:#8525d9'>" + i + "</td>");
                            if((i + diaSemana - 1) % 7 == 0){
                            out.println("</tr><tr>");
                            }
                        }
                        
                        for(int i = diaSemana + diaMes - 1; i % 7 != 0;i++) {
                            out.println("<td class=\"text-center\" style='background-color:#000000'> </td>");
                        }
                    }
                    %>
                    
                    <%--
                    Endrews Nunes de Azevedo -------> RA: 1290482123011
                    --%>
                    
                    </tr>
                    

                </table>
                <%}%>

            </center>

        </div>
    </body>
</html>
