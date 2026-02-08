import java.awt.*;
import java.sql.*;
import javax.swing.*;

public class AlertStation {
    // Database Operations

    public static ResultSet fetchAllAlertStationsAsResultSet(Connection conn) throws SQLException {
        String query = "SELECT * FROM v_alerts_by_station ORDER BY stationName";
        Statement st = conn.createStatement();
        return st.executeQuery(query);
    }

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

    public static void showDialog(JFrame parent, Connection conn, int currentAlertID, int currentStationID, boolean isCreate, Runnable onSave) throws SQLException {
        JDialog dialog = new JDialog(parent, isCreate ? "Create Station Alert" : "Update Station Alert", true);
        dialog.setSize(450, 200);
        dialog.setLocationRelativeTo(parent);
        dialog.setLayout(new GridBagLayout());

        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(5, 5, 5, 5);
        gbc.anchor = GridBagConstraints.WEST;

        // Alert dropdown
        gbc.gridx = 0;
        gbc.gridy = 0;
        dialog.add(new JLabel("Alert:"), gbc);

        JComboBox<String> alertCombo = new JComboBox<>();
        java.util.List<int[]> alertIds = new java.util.ArrayList<>();
        ResultSet alertRs = AlertStation.fetchAllAlerts(conn);
        int selectedAlertIndex = -1;
        int idx = 0;
        while (alertRs.next()) {
            int id = alertRs.getInt("alertID");
            String title = alertRs.getString("title");
            alertCombo.addItem(title);
            alertIds.add(new int[]{id});
            if (id == currentAlertID) selectedAlertIndex = idx;
            idx++;
        }
        if (selectedAlertIndex >= 0) alertCombo.setSelectedIndex(selectedAlertIndex);

        gbc.gridx = 1;
        dialog.add(alertCombo, gbc);

        // Station dropdown
        gbc.gridx = 0;
        gbc.gridy = 1;
        dialog.add(new JLabel("Station:"), gbc);

        JComboBox<String> stationCombo = new JComboBox<>();
        java.util.List<int[]> stationIds = new java.util.ArrayList<>();
        ResultSet stationRs = AlertStation.fetchAllStations(conn);
        int selectedStationIndex = -1;
        idx = 0;
        while (stationRs.next()) {
            int id = stationRs.getInt("stationID");
            String name = stationRs.getString("name");
            stationCombo.addItem(name);
            stationIds.add(new int[]{id});
            if (id == currentStationID) selectedStationIndex = idx;
            idx++;
        }
        if (selectedStationIndex >= 0) stationCombo.setSelectedIndex(selectedStationIndex);

        gbc.gridx = 1;
        dialog.add(stationCombo, gbc);

        // Save button
        JButton saveBtn = new JButton("Save");
        gbc.gridx = 0;
        gbc.gridy = 2;
        gbc.gridwidth = 2;
        dialog.add(saveBtn, gbc);

        final int origAlertID = currentAlertID;
        final int origStationID = currentStationID;
        final java.util.List<int[]> finalAlertIds = alertIds;
        final java.util.List<int[]> finalStationIds = stationIds;

        saveBtn.addActionListener(ev -> {
            try {
                int newAlertID = finalAlertIds.get(alertCombo.getSelectedIndex())[0];
                int newStationID = finalStationIds.get(stationCombo.getSelectedIndex())[0];

                if (isCreate) {
                    AlertStation.createAlertStation(conn, newAlertID, newStationID);
                } else {
                    AlertStation.updateAlertStation(conn, origAlertID, origStationID, newAlertID, newStationID);
                }
                dialog.dispose();
                onSave.run();
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(dialog, "Error saving station alert: " + ex.getMessage(), "Error",
                        JOptionPane.ERROR_MESSAGE);
            }
        });

        dialog.setVisible(true);
    }
}
