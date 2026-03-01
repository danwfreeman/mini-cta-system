import java.awt.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.swing.*;

public class Fare {
    private int fareID;
    private String fareCategory;
    private String riderCategory;
    private double price;

    public Fare() {
    }

    public Fare(int fareID, String fareCategory, String riderCategory, double price) {
        this.fareID = fareID;
        this.fareCategory = fareCategory;
        this.riderCategory = riderCategory;
        this.price = price;
    }

    // Getters and Setters
    public int getFareID() {
        return fareID;
    }

    public String getFareCategory() {
        return fareCategory;
    }

    public String getRiderCategory() {
        return riderCategory;
    }

    public double getPrice() {
        return price;
    }

    // Database Operations
    public static ResultSet fetchAllFaresAsResultSet(Connection conn) throws SQLException {
        String query = "SELECT * FROM Fare";
        Statement st = conn.createStatement();
        return st.executeQuery(query);
    }

    public static Fare fetchFareByID(Connection conn, int fareID) throws SQLException {
        String query = "SELECT * FROM Fare WHERE fareID = ?";
        
        try (PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setInt(1, fareID);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    return new Fare(
                        rs.getInt("fareID"),
                        rs.getString("fareCategory"),
                        rs.getString("riderCategory"),
                        rs.getDouble("price")
                    );
                }
            }
        }
        return null;
    }

    public static void createFare(Connection conn, Map<String, String> fieldValues) throws SQLException {
        StringBuilder columns = new StringBuilder();
        StringBuilder placeholders = new StringBuilder();
        List<String> values = new ArrayList<>();
        int count = 0;

        for (String columnName : fieldValues.keySet()) {
            if (columnName.equalsIgnoreCase("fareID")) {
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

        String query = "INSERT INTO Fare (" + columns.toString() + ") VALUES (" + placeholders.toString() + ")";

        try (PreparedStatement pst = conn.prepareStatement(query)) {
            for (int i = 0; i < values.size(); i++) {
                String value = values.get(i);
                String columnName = (String) fieldValues.keySet().toArray()[i];
                
                if (columnName.equalsIgnoreCase("price")) {
                    if (value.isEmpty()) {
                        pst.setNull(i + 1, Types.DOUBLE);
                    } else {
                        pst.setDouble(i + 1, Double.parseDouble(value));
                    }
                } else {
                    if (value.isEmpty()) {
                        pst.setNull(i + 1, Types.VARCHAR);
                    } else {
                        pst.setString(i + 1, value);
                    }
                }
            }
            pst.executeUpdate();
        }
    }

    public static void updateFare(Connection conn, int fareID, Map<String, String> fieldValues) throws SQLException {
        StringBuilder query = new StringBuilder("UPDATE Fare SET ");
        List<String> values = new ArrayList<>();
        int count = 0;

        for (String columnName : fieldValues.keySet()) {
            if (columnName.equalsIgnoreCase("fareID")) {
                continue;
            }
            if (count > 0) {
                query.append(", ");
            }
            query.append(columnName).append(" = ?");
            values.add(fieldValues.get(columnName));
            count++;
        }

        query.append(" WHERE fareID = ?");

        try (PreparedStatement pst = conn.prepareStatement(query.toString())) {
            int paramIndex = 1;
            for (String columnName : fieldValues.keySet()) {
                if (columnName.equalsIgnoreCase("fareID")) {
                    continue;
                }
                
                String value = fieldValues.get(columnName);
                if (columnName.equalsIgnoreCase("price")) {
                    if (value.isEmpty()) {
                        pst.setNull(paramIndex, Types.DOUBLE);
                    } else {
                        pst.setDouble(paramIndex, Double.parseDouble(value));
                    }
                } else {
                    if (value.isEmpty()) {
                        pst.setNull(paramIndex, Types.VARCHAR);
                    } else {
                        pst.setString(paramIndex, value);
                    }
                }
                paramIndex++;
            }
            pst.setInt(paramIndex, fareID);
            pst.executeUpdate();
        }
    }

    public static void deleteFare(Connection conn, int fareID) throws SQLException {
        String query = "DELETE FROM Fare WHERE fareID = ?";
        
        try (PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setInt(1, fareID);
            pst.executeUpdate();
        }
    }

    public static void showDialog(JFrame parent, Connection conn, Fare fare, int fareId, boolean isCreate, Runnable onSave) throws SQLException {
        JDialog dialog = new JDialog(parent, isCreate ? "Create Fare" : "Update Fare", true);
        dialog.setSize(400, 300);
        dialog.setLocationRelativeTo(parent);
        dialog.setLayout(new GridBagLayout());

        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(5, 5, 5, 5);
        gbc.anchor = GridBagConstraints.WEST;

        Map<String, JTextField> fieldMap = new HashMap<>();
        int fieldIndex = 0;

        // Fare Category
        gbc.gridx = 0;
        gbc.gridy = fieldIndex;
        dialog.add(new JLabel("Fare Category:"), gbc);
        gbc.gridx = 1;
        JTextField fareCategoryField = new JTextField(!isCreate && fare.getFareCategory() != null ? fare.getFareCategory() : "", 20);
        fieldMap.put("fareCategory", fareCategoryField);
        dialog.add(fareCategoryField, gbc);
        fieldIndex++;

        // Rider Category dropdown
        gbc.gridx = 0;
        gbc.gridy = fieldIndex;
        dialog.add(new JLabel("Rider Category:"), gbc);
        gbc.gridx = 1;
        JComboBox<String> riderCategoryCombo = new JComboBox<>(new String[]{"regular", "reduced", "student"});
        if (!isCreate && fare.getRiderCategory() != null) {
            riderCategoryCombo.setSelectedItem(fare.getRiderCategory());
        }
        dialog.add(riderCategoryCombo, gbc);
        fieldIndex++;

        // Price
        gbc.gridx = 0;
        gbc.gridy = fieldIndex;
        dialog.add(new JLabel("Price:"), gbc);
        gbc.gridx = 1;
        JTextField priceField = new JTextField(!isCreate ? String.valueOf(fare.getPrice()) : "", 20);
        fieldMap.put("price", priceField);
        dialog.add(priceField, gbc);
        fieldIndex++;

        JButton saveBtn = new JButton("Save");
        gbc.gridx = 0;
        gbc.gridy = fieldIndex;
        gbc.gridwidth = 2;
        dialog.add(saveBtn, gbc);

        saveBtn.addActionListener(e -> {
            try {
                Map<String, String> fieldValues = new HashMap<>();
                for (String columnName : fieldMap.keySet()) {
                    fieldValues.put(columnName, fieldMap.get(columnName).getText());
                }
                fieldValues.put("riderCategory", (String) riderCategoryCombo.getSelectedItem());

                if (isCreate) {
                    Fare.createFare(conn, fieldValues);
                } else {
                    Fare.updateFare(conn, fareId, fieldValues);
                }
                dialog.dispose();
                onSave.run();
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(dialog, "Database error: " + ex.getMessage(), "Error",
                        JOptionPane.ERROR_MESSAGE);
            } catch (NumberFormatException ex) {
                JOptionPane.showMessageDialog(dialog, "Invalid number format: " + ex.getMessage(), "Validation Error",
                        JOptionPane.WARNING_MESSAGE);
            } catch (Exception ex) {
                JOptionPane.showMessageDialog(dialog, "Unexpected error: " + ex.getMessage(), "Error",
                        JOptionPane.ERROR_MESSAGE);
            }
        });

        dialog.setVisible(true);
    }

}
