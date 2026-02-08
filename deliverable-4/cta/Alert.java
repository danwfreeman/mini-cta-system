import java.awt.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.swing.*;


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

    public static void showDialog(JFrame parent, Connection conn, Alert alert, int alertId, boolean isCreate, Runnable onSave) throws SQLException {
        JDialog dialog = new JDialog(parent, isCreate ? "Create Alert" : "Update Alert", true);
        dialog.setSize(500, 350);
        dialog.setLocationRelativeTo(parent);
        dialog.setLayout(new GridBagLayout());

        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(5, 5, 5, 5);
        gbc.anchor = GridBagConstraints.WEST;

        Map<String, JTextField> fieldMap = new HashMap<>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        int fieldIndex = 0;

        // Title
        gbc.gridx = 0;
        gbc.gridy = fieldIndex;
        dialog.add(new JLabel("Title:"), gbc);
        gbc.gridx = 1;
        JTextField titleField = new JTextField(!isCreate && alert.getTitle() != null ? alert.getTitle() : "", 20);
        fieldMap.put("Title", titleField);
        dialog.add(titleField, gbc);
        fieldIndex++;

        // Description
        gbc.gridx = 0;
        gbc.gridy = fieldIndex;
        dialog.add(new JLabel("Description:"), gbc);
        gbc.gridx = 1;
        JTextField descField = new JTextField(!isCreate && alert.getDescription() != null ? alert.getDescription() : "", 20);
        fieldMap.put("Description", descField);
        dialog.add(descField, gbc);
        fieldIndex++;

        // Start Time spinner
        gbc.gridx = 0;
        gbc.gridy = fieldIndex;
        dialog.add(new JLabel("Start Time:"), gbc);
        gbc.gridx = 1;
        Date startDate = new Date();
        if (!isCreate && alert.getStartTime() != null) {
            try { startDate = sdf.parse(alert.getStartTime()); } catch (Exception ignored) {}
        }
        SpinnerDateModel startModel = new SpinnerDateModel(startDate, null, null, Calendar.MINUTE);
        JSpinner startSpinner = new JSpinner(startModel);
        startSpinner.setEditor(new JSpinner.DateEditor(startSpinner, "yyyy-MM-dd HH:mm:ss"));
        ((JSpinner.DateEditor) startSpinner.getEditor()).getTextField().setFocusLostBehavior(JFormattedTextField.COMMIT_OR_REVERT);
        dialog.add(startSpinner, gbc);
        fieldIndex++;

        // End Time spinner
        gbc.gridx = 0;
        gbc.gridy = fieldIndex;
        dialog.add(new JLabel("End Time:"), gbc);
        gbc.gridx = 1;
        Date endDate = new Date();
        if (!isCreate && alert.getEndTime() != null) {
            try { endDate = sdf.parse(alert.getEndTime()); } catch (Exception ignored) {}
        }
        SpinnerDateModel endModel = new SpinnerDateModel(endDate, null, null, Calendar.MINUTE);
        JSpinner endSpinner = new JSpinner(endModel);
        endSpinner.setEditor(new JSpinner.DateEditor(endSpinner, "yyyy-MM-dd HH:mm:ss"));
        ((JSpinner.DateEditor) endSpinner.getEditor()).getTextField().setFocusLostBehavior(JFormattedTextField.COMMIT_OR_REVERT);
        dialog.add(endSpinner, gbc);
        fieldIndex++;

        // Severity
        gbc.gridx = 0;
        gbc.gridy = fieldIndex;
        dialog.add(new JLabel("Severity:"), gbc);
        gbc.gridx = 1;
        JComboBox<String> severityCombo = new JComboBox<>(new String[]{"info", "minor", "major", "critical"});
        if (!isCreate && alert.getSeverity() != null) {
            severityCombo.setSelectedItem(alert.getSeverity());
        }
        dialog.add(severityCombo, gbc);
        fieldIndex++;

        JButton saveBtn = new JButton("Save");
        gbc.gridx = 0;
        gbc.gridy = fieldIndex;
        gbc.gridwidth = 2;
        dialog.add(saveBtn, gbc);

        saveBtn.addActionListener(e -> {
            try {
                try {
                    startSpinner.commitEdit();
                } catch (java.text.ParseException pe) {
                    JOptionPane.showMessageDialog(dialog,
                            "Invalid Start Time format. Please use yyyy-MM-dd HH:mm:ss",
                            "Validation Error", JOptionPane.WARNING_MESSAGE);
                    return;
                }
                try {
                    endSpinner.commitEdit();
                } catch (java.text.ParseException pe) {
                    JOptionPane.showMessageDialog(dialog,
                            "Invalid End Time format. Please use yyyy-MM-dd HH:mm:ss",
                            "Validation Error", JOptionPane.WARNING_MESSAGE);
                    return;
                }

                Map<String, String> fieldValues = new HashMap<>();
                for (String columnName : fieldMap.keySet()) {
                    fieldValues.put(columnName, fieldMap.get(columnName).getText());
                }
                fieldValues.put("startTime", sdf.format(startSpinner.getValue()));
                fieldValues.put("endTime", sdf.format(endSpinner.getValue()));
                fieldValues.put("severity", (String) severityCombo.getSelectedItem());

                if (isCreate) {
                    Alert.createAlert(conn, fieldValues);
                } else {
                    Alert.updateAlert(conn, alertId, fieldValues);
                }
                dialog.dispose();
                onSave.run();
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(dialog, "Error saving alert: " + ex.getMessage(), "Error",
                        JOptionPane.ERROR_MESSAGE);
            }
        });

        dialog.setVisible(true);
    }


}
