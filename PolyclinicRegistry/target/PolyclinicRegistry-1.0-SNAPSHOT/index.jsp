<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Регистратура поликлиники</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; }
        table { border-collapse: collapse; width: 100%; margin-top: 15px; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        .btn { padding: 6px 12px; background: #28a745; color: white; text-decoration: none; border-radius: 4px; }
    </style>
</head>
<body>
    <h2>Журнал записи пациентов на прием</h2>
    <a href="${pageContext.request.contextPath}/registry?action=new" class="btn">+ Записать пациента</a>
    <table>
        <tr>
            <th>ID</th>
            <th>ФИО Пациента</th>
            <th>Врач (Специальность)</th>
            <th>Дата и время</th>
            <th>Причина обращения / Диагноз</th>
            <th>Действия</th>
        </tr>
        <c:forEach var="item" items="${appointments}">
            <tr>
                <td>${item.id}</td>
                <td>${item.patientName}</td>
                <td>${item.doctorName}</td>
                <td>${item.visitDate}</td>
                <td>${item.diagnosis}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/registry?action=edit&id=${item.id}">Редактировать</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
