<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Laboratórios - Inventory-IT</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<nav class="navbar navbar-expand-lg bg-dark navbar-dark mb-4">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/laboratorios">Inventory-IT</a>
        <div class="navbar-nav">
            <a class="nav-link active" href="${pageContext.request.contextPath}/laboratorios">Laboratórios</a>
            <a class="nav-link" href="${pageContext.request.contextPath}/equipamentos">Equipamentos</a>
        </div>
    </div>
</nav>

<main class="container pb-5">
    <div class="card shadow-sm mb-4">
        <div class="card-body">
            <h1 class="h4 mb-3">Cadastrar laboratório</h1>

            <form action="${pageContext.request.contextPath}/laboratorios" method="post" class="row g-3">
                <div class="col-md-6">
                    <label for="nome" class="form-label">Nome</label>
                    <input type="text" class="form-control" id="nome" name="nome" required>
                </div>
                <div class="col-md-6">
                    <label for="bloco" class="form-label">Bloco</label>
                    <input type="text" class="form-control" id="bloco" name="bloco" required>
                </div>
                <div class="col-12">
                    <button type="submit" class="btn btn-primary">Salvar laboratório</button>
                </div>
            </form>
        </div>
    </div>

    <div class="card shadow-sm">
        <div class="card-body">
            <div class="d-flex flex-wrap justify-content-between align-items-center gap-2 mb-3">
                <h2 class="h4 mb-0">Laboratórios cadastrados</h2>
                <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/equipamentos?acao=novo">
                    Novo equipamento
                </a>
            </div>

            <div class="table-responsive">
                <table class="table table-striped align-middle mb-0">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Bloco</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="lab" items="${laboratorios}">
                        <tr>
                            <td>${lab.id}</td>
                            <td>${lab.nome}</td>
                            <td>${lab.bloco}</td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty laboratorios}">
                        <tr>
                            <td colspan="3" class="text-center text-secondary">Nenhum laboratório cadastrado.</td>
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
