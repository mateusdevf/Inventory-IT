<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Novo Equipamento - Inventory-IT</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<main class="container py-5">
    <div class="card shadow-sm mx-auto" style="max-width: 850px;">
        <div class="card-body p-4">
            <h1 class="h3 mb-4">Cadastrar equipamento</h1>

            <form action="${pageContext.request.contextPath}/equipamentos" method="post" class="row g-3">
                <div class="col-md-6">
                    <label for="numeroSerie" class="form-label">Número de Série</label>
                    <input type="text" class="form-control" id="numeroSerie" name="numeroSerie" required>
                </div>

                <div class="col-md-6">
                    <label for="tipo" class="form-label">Tipo</label>
                    <input type="text" class="form-control" id="tipo" name="tipo" placeholder="Ex.: PC, notebook, projetor" required>
                </div>

                <div class="col-12">
                    <label for="laboratorio_id" class="form-label">Laboratório</label>
                    <select class="form-select" id="laboratorio_id" name="laboratorio_id" required>
                        <option value="">Selecione um laboratório</option>
                        <c:forEach var="lab" items="${laboratorios}">
                            <option value="${lab.id}">${lab.nome} - Bloco ${lab.bloco}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="col-12 d-flex gap-2">
                    <c:choose>
                        <c:when test="${empty laboratorios}">
                            <button type="submit" class="btn btn-primary" disabled>Salvar</button>
                        </c:when>
                        <c:otherwise>
                            <button type="submit" class="btn btn-primary">Salvar</button>
                        </c:otherwise>
                    </c:choose>
                    <a href="${pageContext.request.contextPath}/equipamentos" class="btn btn-secondary">Voltar</a>
                </div>
            </form>

            <c:if test="${empty laboratorios}">
                <div class="alert alert-warning mt-4 mb-0">
                    Cadastre pelo menos um laboratório antes de cadastrar um equipamento.
                </div>
            </c:if>
        </div>
    </div>
</main>
</body>
</html>
