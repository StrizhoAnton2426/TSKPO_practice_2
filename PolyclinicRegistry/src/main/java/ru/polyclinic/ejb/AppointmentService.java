package ru.polyclinic.ejb;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import ru.polyclinic.model.Appointment;
import java.util.List;

@Stateless
public class AppointmentService {

    @PersistenceContext(unitName = "PolyclinicPU")
    private EntityManager em;

    public List<Appointment> findAll() {
        return em.createQuery("SELECT a FROM Appointment a", Appointment.class).getResultList();
    }

    public Appointment findById(Long id) {
        return em.find(Appointment.class, id);
    }

    public void create(Appointment appointment) {
        em.persist(appointment);
    }

    public void update(Appointment appointment) {
        em.merge(appointment);
    }
}
