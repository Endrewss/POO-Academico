<%-- 
    Document   : Juros_Compostos
    Created on : 27 de mar. de 2023, 21:02:15
    Author     : Endrews Nunes de Azevedo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file = "WEB-INF/jspf/header.jspf" %>
        <h2>Juros Compostos</h2>
	<%
		if (request.getParameter("valorDepositado") != null) {
			double valorDepositado = Double.parseDouble(request.getParameter("valorDepositado"));
			double taxaJuros = Double.parseDouble(request.getParameter("taxaJuros"));
			double tempoDeposito = Double.parseDouble(request.getParameter("tempoDeposito"));

			double jurosCompostos = valorDepositado * Math.pow(1 + (taxaJuros/100), tempoDeposito) - valorDepositado;
			double totalComJuros = valorDepositado + jurosCompostos;

			DecimalFormat df = new DecimalFormat("#.##");

			%>
			<h2>Resultado do cálculo de juros compostos</h2>
			<p>Valor Depositado: R$ <%= df.format(valorDepositado) %></p>
			<p>Tempo de deposito <%= df.format(tempoDeposito) %> meses</p>
                        <p>Taxa de juros: <%= df.format(taxaJuros) %>%</p>
			<p>Juros compostos: R$ <%= df.format(jurosCompostos) %></p>
			<p>Total com juros: R$ <%= df.format(totalComJuros) %></p>
		<%
		} else {
	%>
	<form action="" method="post">
		<label for="valorEmprestado">Valor para depositar:</label>
		<input type="number" step="0.01" id="valorDepositado" name="valorDepositado" required><br><br>

		<label for="taxaJuros">Taxa de juros:</label>
		<input type="number" step="0.01" id="taxaJuros" name="taxaJuros" required><br><br>

		<label for="tempoEmprestimo">Tempo de deposito:</label>
		<input type="number" id="tempoDeposito" name="tempoDeposito" required><br><br>

		<button type="submit">Calcular</button>
	</form>
	<%
		}
	%>
    </body>
</html>
