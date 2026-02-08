import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.JTableHeader;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.sql.*;
import java.util.HashMap;
import java.util.Map;

public class CTAClient extends JFrame {
    private Connection conn;
    private JTable resultTable;
    private JButton deleteAlertBtn;
    private JButton updateAlertBtn;
    private JButton deleteFareBtn;
    private JButton updateFareBtn;
    private int selectedRow = -1;
    private String currentTableType = null; // "alerts" or "fares"

    public CTAClient() {
        super("CTA MySQL Client");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(2000, 1200);
        setLayout(new BorderLayout());

        // Result table (shared by both alerts and fares)
        resultTable = new JTable();
        // Make table headings larger and bold
        JTableHeader header = resultTable.getTableHeader();
        header.setFont(new Font("SansSerif", Font.BOLD, 16));
        resultTable.getSelectionModel().addListSelectionListener(e -> {
            selectedRow = resultTable.getSelectedRow();
            deleteAlertBtn.setEnabled(selectedRow >= 0);
            updateAlertBtn.setEnabled(selectedRow >= 0);
            deleteFareBtn.setEnabled(selectedRow >= 0);
            updateFareBtn.setEnabled(selectedRow >= 0);
        });
        resultTable.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                if (e.getClickCount() == 2) {
                    selectedRow = resultTable.getSelectedRow();
                    if (selectedRow >= 0) {
                        if ("alerts".equals(currentTableType)) {
                            onUpdateAlert(null);
                        } else if ("fares".equals(currentTableType)) {
                            onUpdateFare(null);
                        }
                    }
                }
            }
        });
        JScrollPane resultScroll = new JScrollPane(resultTable);

        // Alerts section
        JButton showAlertsBtn = new JButton("Show Alerts");
        showAlertsBtn.setEnabled(true);
        showAlertsBtn.addActionListener(this::onShowAlerts);

        deleteAlertBtn = new JButton("Delete Alert");
        deleteAlertBtn.setEnabled(false);
        deleteAlertBtn.addActionListener(this::onDeleteAlert);

        updateAlertBtn = new JButton("Update Alert");
        updateAlertBtn.setEnabled(false);
        updateAlertBtn.addActionListener(this::onUpdateAlert);

        JButton createAlertBtn = new JButton("Create Alert");
        createAlertBtn.addActionListener(this::onCreateAlert);

        JPanel alertButtonPanel = new JPanel();
        alertButtonPanel.add(showAlertsBtn);
        alertButtonPanel.add(createAlertBtn);
        alertButtonPanel.add(deleteAlertBtn);
        alertButtonPanel.add(updateAlertBtn);

        // Fares section
        JButton showFaresBtn = new JButton("Show Fares");
        showFaresBtn.setEnabled(true);
        showFaresBtn.addActionListener(this::onShowFares);

        deleteFareBtn = new JButton("Delete Fare");
        deleteFareBtn.setEnabled(false);
        deleteFareBtn.addActionListener(this::onDeleteFare);

        updateFareBtn = new JButton("Update Fare");
        updateFareBtn.setEnabled(false);
        updateFareBtn.addActionListener(this::onUpdateFare);

        JButton createFareBtn = new JButton("Create Fare");
        createFareBtn.addActionListener(this::onCreateFare);

        JPanel fareButtonPanel = new JPanel();
        fareButtonPanel.add(showFaresBtn);
        fareButtonPanel.add(createFareBtn);        
        fareButtonPanel.add(deleteFareBtn);
        fareButtonPanel.add(updateFareBtn);

        JPanel headerPanel = new JPanel(new BorderLayout());
        JLabel welcomeLabel = new JLabel("Welcome to the Chicago Transit System");
        welcomeLabel.setFont(new Font("Arial", Font.BOLD, 18));
        welcomeLabel.setHorizontalAlignment(JLabel.CENTER);
        headerPanel.add(welcomeLabel, BorderLayout.NORTH);

        JPanel faresRow = new JPanel();
        faresRow.add(new JLabel("Fares:"));
        faresRow.add(fareButtonPanel);

        JPanel alertsRow = new JPanel();
        alertsRow.add(new JLabel("Alerts:"));
        alertsRow.add(alertButtonPanel);

        JPanel topButtonsPanel = new JPanel();
        topButtonsPanel.setLayout(new BoxLayout(topButtonsPanel, BoxLayout.Y_AXIS));
        topButtonsPanel.add(faresRow);
        topButtonsPanel.add(alertsRow);

        JPanel topPanel = new JPanel(new BorderLayout());
        topPanel.add(headerPanel, BorderLayout.NORTH);
        topPanel.add(topButtonsPanel, BorderLayout.SOUTH);

        add(topPanel, BorderLayout.NORTH);
        add(resultScroll, BorderLayout.CENTER);
    }

    private void onShowAlerts(ActionEvent e) {
        try {
            currentTableType = "alerts";
            ResultSet rs = Alert.fetchAllAlertsAsResultSet(conn);
            populateTable(rs);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Error loading alerts: " + ex.getMessage(), "Error",
                    JOptionPane.ERROR_MESSAGE);
        }
    }

    private void onDeleteAlert(ActionEvent e) {
        if (selectedRow < 0) {
            JOptionPane.showMessageDialog(this, "Please select an alert to delete");
            return;
        }

        int confirm = JOptionPane.showConfirmDialog(this, "Are you sure you want to delete this alert?",
                "Confirm Delete", JOptionPane.YES_NO_OPTION);
        if (confirm != JOptionPane.YES_OPTION)
            return;

        try {
            DefaultTableModel model = (DefaultTableModel) resultTable.getModel();
            int alertId = (int) model.getValueAt(selectedRow, 0);

            Alert.deleteAlert(conn, alertId);
            JOptionPane.showMessageDialog(this, "Alert deleted successfully");
            onShowAlerts(null);
            selectedRow = -1;
            deleteAlertBtn.setEnabled(false);
            updateAlertBtn.setEnabled(false);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Error deleting alert: " + ex.getMessage(), "Error",
                    JOptionPane.ERROR_MESSAGE);
        }
    }

    private void onUpdateAlert(ActionEvent e) {
        if (selectedRow < 0) {
            JOptionPane.showMessageDialog(this, "Please select an alert to update");
            return;
        }

        try {
            DefaultTableModel model = (DefaultTableModel) resultTable.getModel();
            int alertId = (int) model.getValueAt(selectedRow, 0);

            Alert alert = Alert.fetchAlertByID(conn, alertId);
            if (alert != null) {
                showAlertDialog(alert, alertId, false);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Error loading alert: " + ex.getMessage(), "Error",
                    JOptionPane.ERROR_MESSAGE);
        }
    }

    private void onCreateAlert(ActionEvent e) {
        try {
            showAlertDialog(new Alert(), -1, true);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Error opening create dialog: " + ex.getMessage(), "Error",
                    JOptionPane.ERROR_MESSAGE);
        }
    }

    private void onShowFares(ActionEvent e) {
        try {
            currentTableType = "fares";
            ResultSet rs = Fare.fetchAllFaresAsResultSet(conn);
            populateTable(rs);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Error loading fares: " + ex.getMessage(), "Error",
                    JOptionPane.ERROR_MESSAGE);
        }
    }

    private void onDeleteFare(ActionEvent e) {
        if (selectedRow < 0) {
            JOptionPane.showMessageDialog(this, "Please select a fare to delete");
            return;
        }

        int confirm = JOptionPane.showConfirmDialog(this, "Are you sure you want to delete this fare?",
                "Confirm Delete", JOptionPane.YES_NO_OPTION);
        if (confirm != JOptionPane.YES_OPTION)
            return;

        try {
            DefaultTableModel model = (DefaultTableModel) resultTable.getModel();
            int fareId = (int) model.getValueAt(selectedRow, 0);

            Fare.deleteFare(conn, fareId);
            JOptionPane.showMessageDialog(this, "Fare deleted successfully");
            onShowFares(null);
            selectedRow = -1;
            deleteFareBtn.setEnabled(false);
            updateFareBtn.setEnabled(false);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Error deleting fare: " + ex.getMessage(), "Error",
                    JOptionPane.ERROR_MESSAGE);
        }
    }

    private void onUpdateFare(ActionEvent e) {
        if (selectedRow < 0) {
            JOptionPane.showMessageDialog(this, "Please select a fare to update");
            return;
        }

        try {
            DefaultTableModel model = (DefaultTableModel) resultTable.getModel();
            int fareId = (int) model.getValueAt(selectedRow, 0);

            Fare fare = Fare.fetchFareByID(conn, fareId);
            if (fare != null) {
                showFareDialog(fare, fareId, false);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Error loading fare: " + ex.getMessage(), "Error",
                    JOptionPane.ERROR_MESSAGE);
        }
    }

    private void onCreateFare(ActionEvent e) {
        try {
            showFareDialog(new Fare(), -1, true);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Error opening create dialog: " + ex.getMessage(), "Error",
                    JOptionPane.ERROR_MESSAGE);
        }
    }

    private void populateTable(ResultSet rs) throws SQLException {
        ResultSetMetaData md = rs.getMetaData();
        int cols = md.getColumnCount();
        String[] colNames = new String[cols];
        for (int i = 0; i < cols; i++) {
            String dbCol = md.getColumnLabel(i + 1);
            switch (dbCol.toLowerCase()) {
                case "farecategory":
                    colNames[i] = "Fare Category";
                    break;
                case "ridercategory":
                    colNames[i] = "Rider Category";
                    break;
                case "price":
                    colNames[i] = "Price ($)";
                    break;
                case "alertid":
                    colNames[i] = "";
                    break; // hidden
                // Add more mappings as needed
                default:
                    colNames[i] = dbCol;
            }
        }

        DefaultTableModel model = new DefaultTableModel(colNames, 0) {
            @Override
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };
        while (rs.next()) {
            Object[] row = new Object[cols];
            for (int i = 0; i < cols; i++)
                row[i] = rs.getObject(i + 1);
            model.addRow(row);
        }
        resultTable.setModel(model);

        // Remove ID columns (alertID and fareID) from view
        for (int i = cols - 1; i >= 0; i--) {
            String colName = colNames[i];
            if (colName.equalsIgnoreCase("alertID") || colName.equalsIgnoreCase("fareID")) {
                resultTable.getColumnModel().removeColumn(resultTable.getColumnModel().getColumn(i));
            }
        }
    }

    private void showAlertDialog(Alert alert, int alertId, boolean isCreate) throws SQLException {
        JDialog dialog = new JDialog(this, isCreate ? "Create Alert" : "Update Alert", true);
        dialog.setSize(400, 300);
        dialog.setLocationRelativeTo(this);
        dialog.setLayout(new GridBagLayout());

        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(5, 5, 5, 5);
        gbc.anchor = GridBagConstraints.WEST;

        // Get column names from Alert table metadata
        ResultSetMetaData md = Alert.getAlertTableMetadata(conn);
        int columnCount = md.getColumnCount();

        Map<String, JTextField> fieldMap = new HashMap<>();
        int fieldIndex = 0;

        for (int i = 1; i <= columnCount; i++) {
            String columnName = md.getColumnLabel(i);

            // Skip alertID (it's the primary key)
            if (columnName.equalsIgnoreCase("alertID")) {
                continue;
            }

            gbc.gridx = 0;
            gbc.gridy = fieldIndex;
            dialog.add(new JLabel(columnName + ":"), gbc);

            gbc.gridx = 1;
            String value = "";

            if (!isCreate) {
                // Get value from Alert object
                if (columnName.equalsIgnoreCase("title"))
                    value = alert.getTitle() == null ? "" : alert.getTitle();
                else if (columnName.equalsIgnoreCase("description"))
                    value = alert.getDescription() == null ? "" : alert.getDescription();
                else if (columnName.equalsIgnoreCase("startTime"))
                    value = alert.getStartTime() == null ? "" : alert.getStartTime();
                else if (columnName.equalsIgnoreCase("endTime"))
                    value = alert.getEndTime() == null ? "" : alert.getEndTime();
                else if (columnName.equalsIgnoreCase("severity"))
                    value = alert.getSeverity() == null ? "" : alert.getSeverity();
            }

            JTextField field = new JTextField(value, 20);
            fieldMap.put(columnName, field);
            dialog.add(field, gbc);

            fieldIndex++;
        }

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

                if (isCreate) {
                    Alert.createAlert(conn, fieldValues);
                } else {
                    Alert.updateAlert(conn, alertId, fieldValues);
                }
                dialog.dispose();
                onShowAlerts(null);
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(dialog, "Error saving alert: " + ex.getMessage(), "Error",
                        JOptionPane.ERROR_MESSAGE);
            }
        });

        dialog.setVisible(true);
    }

    private void showFareDialog(Fare fare, int fareId, boolean isCreate) throws SQLException {
        JDialog dialog = new JDialog(this, isCreate ? "Create Fare" : "Update Fare", true);
        dialog.setSize(400, 300);
        dialog.setLocationRelativeTo(this);
        dialog.setLayout(new GridBagLayout());

        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(5, 5, 5, 5);
        gbc.anchor = GridBagConstraints.WEST;

        // Get column names from Fare table metadata
        ResultSetMetaData md = Fare.getFareTableMetadata(conn);
        int columnCount = md.getColumnCount();

        Map<String, JTextField> fieldMap = new HashMap<>();
        int fieldIndex = 0;

        for (int i = 1; i <= columnCount; i++) {
            String columnName = md.getColumnLabel(i);

            // Skip fareID (it's the primary key)
            if (columnName.equalsIgnoreCase("fareID")) {
                continue;
            }

            gbc.gridx = 0;
            gbc.gridy = fieldIndex;
            dialog.add(new JLabel(columnName + ":"), gbc);

            gbc.gridx = 1;
            String value = "";

            if (!isCreate) {
                // Get value from Fare object
                if (columnName.equalsIgnoreCase("fareCategory"))
                    value = fare.getFareCategory() == null ? "" : fare.getFareCategory();
                else if (columnName.equalsIgnoreCase("riderCategory"))
                    value = fare.getRiderCategory() == null ? "" : fare.getRiderCategory();
                else if (columnName.equalsIgnoreCase("price"))
                    value = String.valueOf(fare.getPrice());
            }

            JTextField field = new JTextField(value, 20);
            fieldMap.put(columnName, field);
            dialog.add(field, gbc);

            fieldIndex++;
        }

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

                if (isCreate) {
                    Fare.createFare(conn, fieldValues);
                } else {
                    Fare.updateFare(conn, fareId, fieldValues);
                }
                dialog.dispose();
                onShowFares(null);
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(dialog, "Error saving fare: " + ex.getMessage(), "Error",
                        JOptionPane.ERROR_MESSAGE);
            }
        });

        dialog.setVisible(true);
    }

    private boolean connect(String host, int port, String user, String password, String database) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url;
            if (database == null || database.isEmpty()) {
                url = String.format("jdbc:mysql://%s:%d?serverTimezone=UTC", host, port);
                conn = DriverManager.getConnection(url, user, password);
            } else {
                url = String.format("jdbc:mysql://%s:%d/%s?serverTimezone=UTC&allowMultiQueries=true", host, port,
                        database);
                conn = DriverManager.getConnection(url, user, password);
            }
            return true;
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(this, "Connection failed: " + ex.getMessage(), "Connection Error",
                    JOptionPane.ERROR_MESSAGE);
            return false;
        }
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            CTAClient app = new CTAClient();

            String host = "127.0.0.1";
            int port = 3306;
            String user = "root";
            String password = "";
            String database = "chicago_cta";

            boolean ok = app.connect(host, port, user, password, database);
            if (!ok)
                System.exit(1);

            app.setVisible(true);
        });
    }
}
