<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Карточка записи на прием</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; }
        .form-group { margin-bottom: 12px; }
        label { display: block; font-weight: bold; }
        input[type="text"] { width: 350px; padding: 6px; }
    </style>
</head>
<body>
    <h2>${appointment != null ? 'Редактирование записи' : 'Новая запись на прием'}</h2>
    <form action="${pageContext.request.contextPath}/registry" method="post">
        <input type="hidden" name="id" value="${appointment.id}"/>
        <div class="form-group">
            <label>ФИО Пациента:</label>
            <input type="text" name="patientName" value="${appointment.patientName}" required/>
        </div>
        <div class="form-group">
            <label>Врач (например, Терапевт Иванов И.И.):</label>
            <input type="text" name="doctorName" value="${appointment.doctorName}" required/>
        </div>
        <div class="form-group">
            <label>Дата и время приема:</label>
            <input type="text" name="visitDate" value="${appointment.visitDate}" placeholder="2026-11-15 10:30" required/>
        </div>
        <div class="form-group">
            <label>Жалобы / Предварительный диагноз:</label>
            <input type="text" name="diagnosis" value="${appointment.diagnosis}"/>
        </div>
        <button type="submit">Сохранить</button>
        <a href="${pageContext.request.contextPath}/registry">Отмена</a>
    </form>
</body>
</html>
