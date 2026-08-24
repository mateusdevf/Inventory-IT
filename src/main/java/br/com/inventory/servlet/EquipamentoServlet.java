package br.com.inventory.servlet;

import br.com.inventory.dao.EquipamentoDAO;
import br.com.inventory.dao.JPAUtil;
import br.com.inventory.dao.LaboratorioDAO;
import br.com.inventory.modelo.Equipamento;
import br.com.inventory.modelo.Laboratorio;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "EquipamentoServlet", urlPatterns = "/equipamentos")
public class EquipamentoServlet extends HttpServlet {

    private final EquipamentoDAO equipamentoDAO = new EquipamentoDAO();
    private final LaboratorioDAO laboratorioDAO = new LaboratorioDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if ("novo".equals(request.getParameter("acao"))) {
            request.setAttribute("laboratorios", laboratorioDAO.listarTodos());
            request.getRequestDispatcher("/novo-equipamento.jsp").forward(request, response);
            return;
        }

        request.setAttribute("equipamentos", equipamentoDAO.listarTodos());
        request.getRequestDispatcher("/equipamentos.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        request.setCharacterEncoding("UTF-8");

        String numeroSerie = request.getParameter("numeroSerie");
        String tipo = request.getParameter("tipo");
        String laboratorioIdTexto = request.getParameter("laboratorio_id");

        final Long laboratorioId;
        try {
            laboratorioId = Long.valueOf(laboratorioIdTexto);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Laboratório inválido.");
            return;
        }

        EntityManager em = JPAUtil.getEntityManager();
        Laboratorio laboratorio;
        try {
            laboratorio = em.find(Laboratorio.class, laboratorioId);
        } finally {
            em.close();
        }

        if (laboratorio == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Laboratório não encontrado.");
            return;
        }

        Equipamento equipamento = new Equipamento();
        equipamento.setNumeroSerie(numeroSerie);
        equipamento.setTipo(tipo);
        equipamento.setLaboratorio(laboratorio);

        equipamentoDAO.salvar(equipamento);
        response.sendRedirect(request.getContextPath() + "/equipamentos");
    }
}
