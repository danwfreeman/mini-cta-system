import java.awt.*;
import java.sql.*;
import javax.swing.*;

public class AlertLine {
    // Database Operations

    public static ResultSet fetchAllAlertLinesAsResultSet(Connection conn) throws SQLException {
        String query = "SELECT * FROM v_alerts_by_line ORDER BY lineName";
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

    public static void showDialog(JFrame parent, Connection conn, int currentAlertID, int currentLineID, boolean isCreate, Runnable onSave) throws SQLException {
        JDialog dialog = new JDialog(parent, isCreate ? "Create Line Alert" : "Update Line Alert", true);
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
        ResultSet alertRs = AlertLine.fetchAllAlerts(conn);
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

        // Line dropdown
        gbc.gridx = 0;
        gbc.gridy = 1;
        dialog.add(new JLabel("Line:"), gbc);

        JComboBox<String> lineCombo = new JComboBox<>();
        java.util.List<int[]> lineIds = new java.util.ArrayList<>();
        ResultSet lineRs = AlertLine.fetchAllLines(conn);
        int selectedLineIndex = -1;
        idx = 0;
        while (lineRs.next()) {
            int id = lineRs.getInt("lineID");
            String name = lineRs.getString("name");
            lineCombo.addItem(name);
            lineIds.add(new int[]{id});
            if (id == currentLineID) selectedLineIndex = idx;
            idx++;
        }
        if (selectedLineIndex >= 0) lineCombo.setSelectedIndex(selectedLineIndex);

        gbc.gridx = 1;
        dialog.add(lineCombo, gbc);

        // Save button
        JButton saveBtn = new JButton("Save");
        gbc.gridx = 0;
        gbc.gridy = 2;
        gbc.gridwidth = 2;
        dialog.add(saveBtn, gbc);

        final int origAlertID = currentAlertID;
        final int origLineID = currentLineID;
        final java.util.List<int[]> finalAlertIds = alertIds;
        final java.util.List<int[]> finalLineIds = lineIds;

        saveBtn.addActionListener(ev -> {
            try {
                int newAlertID = finalAlertIds.get(alertCombo.getSelectedIndex())[0];
                int newLineID = finalLineIds.get(lineCombo.getSelectedIndex())[0];

                if (isCreate) {
                    AlertLine.createAlertLine(conn, newAlertID, newLineID);
                } else {
                    AlertLine.updateAlertLine(conn, origAlertID, origLineID, newAlertID, newLineID);
                }
                dialog.dispose();
                onSave.run();
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(dialog, "Error saving line alert: " + ex.getMessage(), "Error",
                        JOptionPane.ERROR_MESSAGE);
            }
        });

        dialog.setVisible(true);
    }
}
