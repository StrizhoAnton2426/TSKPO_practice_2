package ru.polyclinic.controller;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ru.polyclinic.ejb.AppointmentService;
import ru.polyclinic.model.Appointment;
import java.io.IOException;

@WebServlet(name = "RegistryServlet", urlPatterns = {"/registry"})
public class RegistryServlet extends HttpServlet {

    @EJB
    private AppointmentService appointmentService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "edit":
                Long id = Long.parseLong(request.getParameter("id"));
                Appointment existing = appointmentService.findById(id);
                request.setAttribute("appointment", existing);
                request.getRequestDispatcher("/form.jsp").forward(request, response);
                break;
            case "new":
                request.getRequestDispatcher("/form.jsp").forward(request, response);
                break;
            default:
                request.setAttribute("appointments", appointmentService.findAll());
                request.getRequestDispatcher("/index.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String idParam = request.getParameter("id");
        String patientName = request.getParameter("patientName");
        String doctorName = request.getParameter("doctorName");
        String visitDate = request.getParameter("visitDate");
        String diagnosis = request.getParameter("diagnosis");

        if (idParam == null || idParam.isEmpty()) {
            appointmentService.create(new Appointment(patientName, doctorName, visitDate, diagnosis));
        } else {
            Appointment app = appointmentService.findById(Long.parseLong(idParam));
            app.setPatientName(patientName);
            app.setDoctorName(doctorName);
            app.setVisitDate(visitDate);
            app.setDiagnosis(diagnosis);
            appointmentService.update(app);
        }
        response.sendRedirect(request.getContextPath() + "/registry");
    }
}
