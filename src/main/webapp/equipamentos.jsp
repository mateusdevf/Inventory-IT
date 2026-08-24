<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Equipamentos - Inventory-IT</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<nav class="navbar navbar-expand-lg bg-dark navbar-dark mb-4">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/laboratorios">Inventory-IT</a>
        <div class="navbar-nav">
            <a class="nav-link" href="${pageContext.request.contextPath}/laboratorios">Laboratórios</a>
            <a class="nav-link active" href="${pageContext.request.contextPath}/equipamentos">Equipamentos</a>
        </div>
    </div>
</nav>

<main class="container pb-5">
    <div class="card shadow-sm">
        <div class="card-body">
            <div class="d-flex flex-wrap justify-content-between align-items-center gap-2 mb-3">
                <h1 class="h4 mb-0">Equipamentos cadastrados</h1>
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/equipamentos?acao=novo">
                    Novo equipamento
                </a>
            </div>

            <div class="table-responsive">
                <table class="table table-striped align-middle mb-0">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Número de Série</th>
                        <th>Tipo</th>
                        <th>Laboratório</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="equipamento" items="${equipamentos}">
                        <tr>
                            <td>${equipamento.id}</td>
                            <td>${equipamento.numeroSerie}</td>
                            <td>${equipamento.tipo}</td>
                            <td>${equipamento.laboratorio.nome}</td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty equipamentos}">
                        <tr>
                            <td colspan="4" class="text-center text-secondary">Nenhum equipamento cadastrado.</td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>
</body>
</html>
