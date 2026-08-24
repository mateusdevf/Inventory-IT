package br.com.inventory.dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public final class JPAUtil {

    private static final EntityManagerFactory EMF =
            Persistence.createEntityManagerFactory("inventory-pu");

    private JPAUtil() {
    }

    public static EntityManager getEntityManager() {
        return EMF.createEntityManager();
    }
}
