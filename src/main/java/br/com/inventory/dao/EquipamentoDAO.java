package br.com.inventory.dao;

import br.com.inventory.modelo.Equipamento;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.util.List;

public class EquipamentoDAO {

    public void salvar(Equipamento equipamento) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction transacao = em.getTransaction();

        try {
            transacao.begin();
            em.persist(equipamento);
            transacao.commit();
        } catch (RuntimeException e) {
            if (transacao.isActive()) {
                transacao.rollback();
            }
            throw e;
        } finally {
            em.close();
        }
    }

    public List<Equipamento> listarTodos() {
        EntityManager em = JPAUtil.getEntityManager();

        try {
            return em.createQuery(
                    "SELECT e FROM Equipamento e JOIN FETCH e.laboratorio ORDER BY e.id",
                    Equipamento.class
            ).getResultList();
        } finally {
            em.close();
        }
    }
}
