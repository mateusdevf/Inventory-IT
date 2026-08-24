package br.com.inventory.dao;

import br.com.inventory.modelo.Laboratorio;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.util.List;

public class LaboratorioDAO {

    public void salvar(Laboratorio laboratorio) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction transacao = em.getTransaction();

        try {
            transacao.begin();
            em.persist(laboratorio);
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

    public List<Laboratorio> listarTodos() {
        EntityManager em = JPAUtil.getEntityManager();

        try {
            return em.createQuery(
                    "SELECT l FROM Laboratorio l ORDER BY l.id",
                    Laboratorio.class
            ).getResultList();
        } finally {
            em.close();
        }
    }
}
