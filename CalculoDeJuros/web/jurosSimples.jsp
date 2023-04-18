<%-- 
    Document   : Juros_Simples
    Created on : 27 de mar. de 2023, 19:32:50
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
        <h2>Juros Simples</h2>
	<%
		if (request.getParameter("valorDepositado") != null) {
			double valorDepositado = Double.parseDouble(request.getParameter("valorDepositado"));
			double taxaJuros = Double.parseDouble(request.getParameter("taxaJuros"));
			double tempoDeposito = Double.parseDouble(request.getParameter("tempoDeposito"));

			double jurosSimples = (valorDepositado * (taxaJuros/100) * tempoDeposito);
			double totalComJuros = valorDepositado + jurosSimples;

			DecimalFormat df = new DecimalFormat("#.##");

			%>
			<h3>Resultado do cálculo de juros simples</h3>
			<p>Valor Depositado R$ <%= df.format(valorDepositado) %></p>
			<p>Taxa de juros: <%= df.format(taxaJuros) %>%</p>
			<p>Tempo de Deposito: <%= df.format(tempoDeposito) %> meses</p>
			<p>Juros simples: R$ <%= df.format(jurosSimples) %></p>
			<p>Total com juros: R$ <%= df.format(totalComJuros) %></p>
		<%
		} else {
	%>
	<form action="" method="post">
		<label for="valorDepositado">Valor do Deposito:</label>
		<input type="number" step="0.01" id="valorDepositado" name="valorDepositado" required><br><br>

		<label for="taxaJuros">Taxa de juros:</label>
		<input type="number" step="0.01" id="taxaJuros" name="taxaJuros" required><br><br>

		<label for="tempoEmprestimo">Tempo de empréstimo:</label>
		<input type="number" id="tempoDeposito" name="tempoDeposito" required><br><br>

		<button type="submit">Calcular</button>
	</form>
	<%
		}
	%>
    </body>
</html>
