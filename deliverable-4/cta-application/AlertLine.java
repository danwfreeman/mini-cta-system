import java.sql.*;

public class AlertLine {
    // Database Operations

    public static ResultSet fetchAllAlertLinesAsResultSet(Connection conn) throws SQLException {
        String query = "SELECT al.alertID, a.title AS alertTitle, al.lineID, l.name AS lineName, a.description, a.severity, a.startTime, a.endTime " +
                        "FROM AlertLine al " +
                        "JOIN Alert a ON al.alertID = a.alertID " +
                        "JOIN Line l ON al.lineID = l.lineID " +
                        "ORDER BY l.name";
        Statement st = conn.createStatement();
        return st.executeQuery(query);
    }


    public static void createAlertLine(Connection conn, int alertID, int lineID) throws SQLException {
        String query = "INSERT INTO AlertLine (alertID, lineID) VALUES (?, ?)";
        try (PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setInt(1, alertID);
            pst.setInt(2, lineID);
            pst.executeUpdate();
        }
    }

    public static void updateAlertLine(Connection conn, int oldAlertID, int oldLineID, int newAlertID, int newLineID) throws SQLException {
        String query = "UPDATE AlertLine SET alertID = ?, lineID = ? WHERE alertID = ? AND lineID = ?";
        try (PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setInt(1, newAlertID);
            pst.setInt(2, newLineID);
            pst.setInt(3, oldAlertID);
            pst.setInt(4, oldLineID);
            pst.executeUpdate();
        }
    }

    public static void deleteAlertLine(Connection conn, int alertID, int lineID) throws SQLException {
        String query = "DELETE FROM AlertLine WHERE alertID = ? AND lineID = ?";
        try (PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setInt(1, alertID);
            pst.setInt(2, lineID);
            pst.executeUpdate();
        }
    }

    // Helper methods to fetch alerts and lines for dropdowns

    public static ResultSet fetchAllAlerts(Connection conn) throws SQLException {
        String query = "SELECT alertID, title FROM Alert ORDER BY alertID";
        Statement st = conn.createStatement();
        return st.executeQuery(query);
    }

    public static ResultSet fetchAllLines(Connection conn) throws SQLException {
        String query = "SELECT lineID, name FROM Line ORDER BY lineID";
        Statement st = conn.createStatement();
        return st.executeQuery(query);
    }
}
