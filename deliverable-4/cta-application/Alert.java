import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


public class Alert {
    private int alertID;
    private String title;
    private String description;
    private String startTime;
    private String endTime;
    private String severity;

    public Alert() {
    }

    public Alert(int alertID, String title, String description, String startTime, String endTime, String severity) {
        this.alertID = alertID;
        this.title = title;
        this.description = description;
        this.startTime = startTime;
        this.endTime = endTime;
        this.severity = severity;
    }

    // Getters and Setters
    public int getAlertID() {
        return alertID;
    }

    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    public String getStartTime() {
        return startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public String getSeverity() {
        return severity;
    }

    // Database Operations
    public static ResultSet fetchAllAlertsAsResultSet(Connection conn) throws SQLException {
        String query = "SELECT * FROM Alert";
        Statement st = conn.createStatement();
        return st.executeQuery(query);
    }

    public static ResultSet fetchSystemWideAlertsAsResultSet(Connection conn) throws SQLException {
        String query = "SELECT * FROM Alert a " +
                        "WHERE NOT EXISTS (SELECT 1 FROM AlertLine al WHERE al.alertID = a.alertID) " +
                        "AND NOT EXISTS (SELECT 1 FROM AlertStation ast WHERE ast.alertID = a.alertID)";
        Statement st = conn.createStatement();
        return st.executeQuery(query);
    }

    public static Alert fetchAlertByID(Connection conn, int alertID) throws SQLException {
        String query = "SELECT * FROM Alert WHERE alertID = ?";
        
        try (PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setInt(1, alertID);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    return new Alert(
                        rs.getInt("alertID"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getString("startTime"),
                        rs.getString("endTime"),
                        rs.getString("severity")
                    );
                }
            }
        }
        return null;
    }

    public static void createAlert(Connection conn, Map<String, String> fieldValues) throws SQLException {
        StringBuilder columns = new StringBuilder();
        StringBuilder placeholders = new StringBuilder();
        List<String> values = new ArrayList<>();
        int count = 0;

        for (String columnName : fieldValues.keySet()) {
            if (columnName.equalsIgnoreCase("alertID")) {
                continue;
            }
            if (count > 0) {
                columns.append(", ");
                placeholders.append(", ");
            }
            columns.append(columnName);
            placeholders.append("?");
            values.add(fieldValues.get(columnName));
            count++;
        }

        String query = "INSERT INTO Alert (" + columns.toString() + ") VALUES (" + placeholders.toString() + ")";

        try (PreparedStatement pst = conn.prepareStatement(query)) {
            for (int i = 0; i < values.size(); i++) {
                String value = values.get(i);
                if (value.isEmpty()) {
                    pst.setNull(i + 1, Types.VARCHAR);
                } else {
                    pst.setString(i + 1, value);
                }
            }
            pst.executeUpdate();
        }
    }

    public static void updateAlert(Connection conn, int alertID, Map<String, String> fieldValues) throws SQLException {
        StringBuilder query = new StringBuilder("UPDATE Alert SET ");
        List<String> values = new ArrayList<>();
        int count = 0;

        for (String columnName : fieldValues.keySet()) {
            if (columnName.equalsIgnoreCase("alertID")) {
                continue;
            }
            if (count > 0) {
                query.append(", ");
            }
            query.append(columnName).append(" = ?");
            values.add(fieldValues.get(columnName));
            count++;
        }

        query.append(" WHERE alertID = ?");

        try (PreparedStatement pst = conn.prepareStatement(query.toString())) {
            for (int i = 0; i < values.size(); i++) {
                String value = values.get(i);
                if (value.isEmpty()) {
                    pst.setNull(i + 1, Types.VARCHAR);
                } else {
                    pst.setString(i + 1, value);
                }
            }
            pst.setInt(values.size() + 1, alertID);
            pst.executeUpdate();
        }
    }

    public static void deleteAlert(Connection conn, int alertID) throws SQLException {
        String query = "DELETE FROM Alert WHERE alertID = ?";
        
        try (PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setInt(1, alertID);
            pst.executeUpdate();
        }
    }


}
