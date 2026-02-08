import java.sql.*;

public class AlertStation {
    private int alertID;
    private int stationID;
    private String alertTitle;
    private String stationName;

    public AlertStation() {
    }

    public AlertStation(int alertID, int stationID, String alertTitle, String stationName) {
        this.alertID = alertID;
        this.stationID = stationID;
        this.alertTitle = alertTitle;
        this.stationName = stationName;
    }

    // Getters and Setters
    public int getAlertID() { return alertID; }
    public void setAlertID(int alertID) { this.alertID = alertID; }
    public int getStationID() { return stationID; }
    public void setStationID(int stationID) { this.stationID = stationID; }
    public String getAlertTitle() { return alertTitle; }
    public void setAlertTitle(String alertTitle) { this.alertTitle = alertTitle; }
    public String getStationName() { return stationName; }
    public void setStationName(String stationName) { this.stationName = stationName; }

    // Database Operations

    public static ResultSet fetchAllAlertStationsAsResultSet(Connection conn) throws SQLException {
        String query = "SELECT ast.alertID, a.title AS alertTitle, ast.stationID, s.name AS stationName, a.startTime, a.endTime " +
                        "FROM AlertStation ast " +
                        "JOIN Alert a ON ast.alertID = a.alertID " +
                        "JOIN Station s ON ast.stationID = s.stationID " +
                        "ORDER BY s.name";
        Statement st = conn.createStatement();
        return st.executeQuery(query);
    }

    // public static AlertStation fetchAlertStationByIDs(Connection conn, int alertID, int stationID) throws SQLException {
    //     String query = "SELECT ast.alertID, a.title AS alertTitle, ast.stationID, s.name AS stationName " +
    //                     "FROM AlertStation ast " +
    //                     "JOIN Alert a ON ast.alertID = a.alertID " +
    //                     "JOIN Station s ON ast.stationID = s.stationID " +
    //                     "WHERE ast.alertID = ? AND ast.stationID = ?";
    //     try (PreparedStatement pst = conn.prepareStatement(query)) {
    //         pst.setInt(1, alertID);
    //         pst.setInt(2, stationID);
    //         try (ResultSet rs = pst.executeQuery()) {
    //             if (rs.next()) {
    //                 return new AlertStation(
    //                     rs.getInt("alertID"),
    //                     rs.getInt("stationID"),
    //                     rs.getString("alertTitle"),
    //                     rs.getString("stationName")
    //                 );
    //             }
    //         }
    //     }
    //     return null;
    // }

    public static void createAlertStation(Connection conn, int alertID, int stationID) throws SQLException {
        String query = "INSERT INTO AlertStation (alertID, stationID) VALUES (?, ?)";
        try (PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setInt(1, alertID);
            pst.setInt(2, stationID);
            pst.executeUpdate();
        }
    }

    public static void updateAlertStation(Connection conn, int oldAlertID, int oldStationID, int newAlertID, int newStationID) throws SQLException {
        String query = "UPDATE AlertStation SET alertID = ?, stationID = ? WHERE alertID = ? AND stationID = ?";
        try (PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setInt(1, newAlertID);
            pst.setInt(2, newStationID);
            pst.setInt(3, oldAlertID);
            pst.setInt(4, oldStationID);
            pst.executeUpdate();
        }
    }

    public static void deleteAlertStation(Connection conn, int alertID, int stationID) throws SQLException {
        String query = "DELETE FROM AlertStation WHERE alertID = ? AND stationID = ?";
        try (PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setInt(1, alertID);
            pst.setInt(2, stationID);
            pst.executeUpdate();
        }
    }

    // Helper methods to fetch alerts and stations for dropdowns

    public static ResultSet fetchAllAlerts(Connection conn) throws SQLException {
        String query = "SELECT alertID, title FROM Alert ORDER BY alertID";
        Statement st = conn.createStatement();
        return st.executeQuery(query);
    }

    public static ResultSet fetchAllStations(Connection conn) throws SQLException {
        String query = "SELECT stationID, name FROM Station ORDER BY stationID";
        Statement st = conn.createStatement();
        return st.executeQuery(query);
    }
}
