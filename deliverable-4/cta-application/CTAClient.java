import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.JTableHeader;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class CTAClient extends JFrame {
    private Connection conn;
    private JTable resultTable;
    private JButton deleteAlertBtn;
    private JButton updateAlertBtn;
    private JButton deleteFareBtn;
    private JButton updateFareBtn;
    private JButton deleteLineAlertBtn;
    private JButton updateLineAlertBtn;
    private JButton deleteStationAlertBtn;
    private JButton updateStationAlertBtn;
    private int selectedRow = -1;
    private String currentTableType = null; // "alerts", "fares", "linealerts", or "stationalerts"
    private CardLayout centerCardLayout;
    private JPanel centerCards;
    private JPanel lineDetailPanel;
    private JComboBox<String> lineSelectDropdown;

    public CTAClient() {
        super("CTA");
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
            deleteLineAlertBtn.setEnabled(selectedRow >= 0);
            updateLineAlertBtn.setEnabled(selectedRow >= 0);
            deleteStationAlertBtn.setEnabled(selectedRow >= 0);
            updateStationAlertBtn.setEnabled(selectedRow >= 0);
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
                        } else if ("linealerts".equals(currentTableType)) {
                            onUpdateLineAlert(null);
                        } else if ("stationalerts".equals(currentTableType)) {
                            onUpdateStationAlert(null);
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

        JButton showSystemWideAlertsBtn = new JButton("Show System Wide Alerts");
        showSystemWideAlertsBtn.setEnabled(true);
        showSystemWideAlertsBtn.addActionListener(this::onShowSystemWideAlerts);

        JPanel alertButtonPanel = new JPanel();
        alertButtonPanel.add(showAlertsBtn);
        alertButtonPanel.add(showSystemWideAlertsBtn);
        alertButtonPanel.add(createAlertBtn);
        alertButtonPanel.add(deleteAlertBtn);
        alertButtonPanel.add(updateAlertBtn);

        // Line Alerts section
        JButton showLineAlertsBtn = new JButton("Show Line Alerts");
        showLineAlertsBtn.setEnabled(true);
        showLineAlertsBtn.addActionListener(this::onShowLineAlerts);

        deleteLineAlertBtn = new JButton("Delete Line Alert");
        deleteLineAlertBtn.setEnabled(false);
        deleteLineAlertBtn.addActionListener(this::onDeleteLineAlert);

        updateLineAlertBtn = new JButton("Update Line Alert");
        updateLineAlertBtn.setEnabled(false);
        updateLineAlertBtn.addActionListener(this::onUpdateLineAlert);

        JButton createLineAlertBtn = new JButton("Create Line Alert");
        createLineAlertBtn.addActionListener(this::onCreateLineAlert);

        JPanel lineAlertButtonPanel = new JPanel();
        lineAlertButtonPanel.add(showLineAlertsBtn);
        lineAlertButtonPanel.add(createLineAlertBtn);
        lineAlertButtonPanel.add(deleteLineAlertBtn);
        lineAlertButtonPanel.add(updateLineAlertBtn);

        // Station Alerts section
        JButton showStationAlertsBtn = new JButton("Show Station Alerts");
        showStationAlertsBtn.setEnabled(true);
        showStationAlertsBtn.addActionListener(this::onShowStationAlerts);

        deleteStationAlertBtn = new JButton("Delete Station Alert");
        deleteStationAlertBtn.setEnabled(false);
        deleteStationAlertBtn.addActionListener(this::onDeleteStationAlert);

        updateStationAlertBtn = new JButton("Update Station Alert");
        updateStationAlertBtn.setEnabled(false);
        updateStationAlertBtn.addActionListener(this::onUpdateStationAlert);

        JButton createStationAlertBtn = new JButton("Create Station Alert");
        createStationAlertBtn.addActionListener(this::onCreateStationAlert);

        JPanel stationAlertButtonPanel = new JPanel();
        stationAlertButtonPanel.add(showStationAlertsBtn);
        stationAlertButtonPanel.add(createStationAlertBtn);
        stationAlertButtonPanel.add(deleteStationAlertBtn);
        stationAlertButtonPanel.add(updateStationAlertBtn);

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
        faresRow.add(fareButtonPanel);

        JPanel alertsRow = new JPanel();
        alertsRow.add(alertButtonPanel);

        JPanel lineAlertsRow = new JPanel();
        lineAlertsRow.add(lineAlertButtonPanel);

        JPanel stationAlertsRow = new JPanel();
        stationAlertsRow.add(stationAlertButtonPanel);

        // View Line Detail section
        lineSelectDropdown = new JComboBox<>();
        lineSelectDropdown.addActionListener(e -> {
            if (lineSelectDropdown.getSelectedItem() != null) {
                onLineSelected((String) lineSelectDropdown.getSelectedItem());
            }
        });
        JPanel lineDetailButtonPanel = new JPanel();
        lineDetailButtonPanel.add(new JLabel("Select a Line:"));
        lineDetailButtonPanel.add(lineSelectDropdown);

        JPanel lineDetailRow = new JPanel();
        lineDetailRow.add(lineDetailButtonPanel);

        // Line detail vertical display panel
        lineDetailPanel = new JPanel();
        lineDetailPanel.setLayout(new BoxLayout(lineDetailPanel, BoxLayout.Y_AXIS));
        JScrollPane lineDetailScroll = new JScrollPane(lineDetailPanel);

        // CardLayout to swap button rows
        CardLayout cardLayout = new CardLayout();
        JPanel buttonCards = new JPanel(cardLayout);
        buttonCards.add(faresRow, "Manage Fares");
        buttonCards.add(alertsRow, "Manage Alerts");
        buttonCards.add(lineAlertsRow, "Manage Line Alerts");
        buttonCards.add(stationAlertsRow, "Manage Station Alerts");
        buttonCards.add(lineDetailRow, "View Line Detail");

        // CardLayout to swap center content between table and line detail
        centerCardLayout = new CardLayout();
        centerCards = new JPanel(centerCardLayout);
        centerCards.add(resultScroll, "table");
        centerCards.add(lineDetailScroll, "linedetail");

        JComboBox<String> manageDropdown = new JComboBox<>(new String[]{
            "Manage Fares", "Manage Alerts", "Manage Line Alerts", "Manage Station Alerts", "View Line Detail"
        });
        manageDropdown.addActionListener(e -> {
            String selected = (String) manageDropdown.getSelectedItem();
            cardLayout.show(buttonCards, selected);
            if ("View Line Detail".equals(selected)) {
                centerCardLayout.show(centerCards, "linedetail");
                loadLineDropdown();
            } else {
                centerCardLayout.show(centerCards, "table");
            }
        });

        JPanel dropdownRow = new JPanel();
        dropdownRow.add(manageDropdown);

        JPanel topButtonsPanel = new JPanel();
        topButtonsPanel.setLayout(new BoxLayout(topButtonsPanel, BoxLayout.Y_AXIS));
        topButtonsPanel.add(dropdownRow);
        topButtonsPanel.add(buttonCards);

        JPanel topPanel = new JPanel(new BorderLayout());
        topPanel.add(headerPanel, BorderLayout.NORTH);
        topPanel.add(topButtonsPanel, BorderLayout.SOUTH);

        add(topPanel, BorderLayout.NORTH);
        add(centerCards, BorderLayout.CENTER);
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

    private void onShowSystemWideAlerts(ActionEvent e) {
        try {
            currentTableType = "alerts";
            ResultSet rs = Alert.fetchSystemWideAlertsAsResultSet(conn);
            populateTable(rs);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Error loading system wide alerts: " + ex.getMessage(), "Error",
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
            int alertId = Integer.parseInt(model.getValueAt(selectedRow, 0).toString());

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
            int alertId = Integer.parseInt(model.getValueAt(selectedRow, 0).toString());

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
            int fareId = Integer.parseInt(model.getValueAt(selectedRow, 0).toString());

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
            int fareId = Integer.parseInt(model.getValueAt(selectedRow, 0).toString());

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

    // Line Alert handlers

    private void onShowLineAlerts(ActionEvent e) {
        try {
            currentTableType = "linealerts";
            ResultSet rs = AlertLine.fetchAllAlertLinesAsResultSet(conn);
            populateTable(rs);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Error loading line alerts: " + ex.getMessage(), "Error",
                    JOptionPane.ERROR_MESSAGE);
        }
    }

    private void onDeleteLineAlert(ActionEvent e) {
        if (selectedRow < 0) {
            JOptionPane.showMessageDialog(this, "Please select a line alert to delete");
            return;
        }

        int confirm = JOptionPane.showConfirmDialog(this, "Are you sure you want to delete this line alert?",
                "Confirm Delete", JOptionPane.YES_NO_OPTION);
        if (confirm != JOptionPane.YES_OPTION)
            return;

        try {
            DefaultTableModel model = (DefaultTableModel) resultTable.getModel();
            int alertId = Integer.parseInt(model.getValueAt(selectedRow, 0).toString());
            int lineId = Integer.parseInt(model.getValueAt(selectedRow, 2).toString());

            AlertLine.deleteAlertLine(conn, alertId, lineId);
            JOptionPane.showMessageDialog(this, "Line alert deleted successfully");
            onShowLineAlerts(null);
            selectedRow = -1;
            deleteLineAlertBtn.setEnabled(false);
            updateLineAlertBtn.setEnabled(false);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Error deleting line alert: " + ex.getMessage(), "Error",
                    JOptionPane.ERROR_MESSAGE);
        }
    }

    private void onUpdateLineAlert(ActionEvent e) {
        if (selectedRow < 0) {
            JOptionPane.showMessageDialog(this, "Please select a line alert to update");
            return;
        }

        try {
            DefaultTableModel model = (DefaultTableModel) resultTable.getModel();
            int alertId = Integer.parseInt(model.getValueAt(selectedRow, 0).toString());
            int lineId = Integer.parseInt(model.getValueAt(selectedRow, 2).toString());

            showLineAlertDialog(alertId, lineId, false);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Error loading line alert: " + ex.getMessage(), "Error",
                    JOptionPane.ERROR_MESSAGE);
        }
    }

    private void onCreateLineAlert(ActionEvent e) {
        try {
            showLineAlertDialog(-1, -1, true);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Error opening create dialog: " + ex.getMessage(), "Error",
                    JOptionPane.ERROR_MESSAGE);
        }
    }

    private void showLineAlertDialog(int currentAlertID, int currentLineID, boolean isCreate) throws SQLException {
        JDialog dialog = new JDialog(this, isCreate ? "Create Line Alert" : "Update Line Alert", true);
        dialog.setSize(450, 200);
        dialog.setLocationRelativeTo(this);
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
                onShowLineAlerts(null);
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(dialog, "Error saving line alert: " + ex.getMessage(), "Error",
                        JOptionPane.ERROR_MESSAGE);
            }
        });

        dialog.setVisible(true);
    }

    // Station Alert handlers

    private void onShowStationAlerts(ActionEvent e) {
        try {
            currentTableType = "stationalerts";
            ResultSet rs = AlertStation.fetchAllAlertStationsAsResultSet(conn);
            populateTable(rs);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Error loading station alerts: " + ex.getMessage(), "Error",
                    JOptionPane.ERROR_MESSAGE);
        }
    }

    private void onDeleteStationAlert(ActionEvent e) {
        if (selectedRow < 0) {
            JOptionPane.showMessageDialog(this, "Please select a station alert to delete");
            return;
        }

        int confirm = JOptionPane.showConfirmDialog(this, "Are you sure you want to delete this station alert?",
                "Confirm Delete", JOptionPane.YES_NO_OPTION);
        if (confirm != JOptionPane.YES_OPTION)
            return;

        try {
            DefaultTableModel model = (DefaultTableModel) resultTable.getModel();
            int alertId = Integer.parseInt(model.getValueAt(selectedRow, 0).toString());
            int stationId = Integer.parseInt(model.getValueAt(selectedRow, 2).toString());

            AlertStation.deleteAlertStation(conn, alertId, stationId);
            JOptionPane.showMessageDialog(this, "Station alert deleted successfully");
            onShowStationAlerts(null);
            selectedRow = -1;
            deleteStationAlertBtn.setEnabled(false);
            updateStationAlertBtn.setEnabled(false);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Error deleting station alert: " + ex.getMessage(), "Error",
                    JOptionPane.ERROR_MESSAGE);
        }
    }

    private void onUpdateStationAlert(ActionEvent e) {
        if (selectedRow < 0) {
            JOptionPane.showMessageDialog(this, "Please select a station alert to update");
            return;
        }

        try {
            DefaultTableModel model = (DefaultTableModel) resultTable.getModel();
            int alertId = Integer.parseInt(model.getValueAt(selectedRow, 0).toString());
            int stationId = Integer.parseInt(model.getValueAt(selectedRow, 2).toString());

            showStationAlertDialog(alertId, stationId, false);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Error loading station alert: " + ex.getMessage(), "Error",
                    JOptionPane.ERROR_MESSAGE);
        }
    }

    private void onCreateStationAlert(ActionEvent e) {
        try {
            showStationAlertDialog(-1, -1, true);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Error opening create dialog: " + ex.getMessage(), "Error",
                    JOptionPane.ERROR_MESSAGE);
        }
    }

    private void showStationAlertDialog(int currentAlertID, int currentStationID, boolean isCreate) throws SQLException {
        JDialog dialog = new JDialog(this, isCreate ? "Create Station Alert" : "Update Station Alert", true);
        dialog.setSize(450, 200);
        dialog.setLocationRelativeTo(this);
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
                onShowStationAlerts(null);
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(dialog, "Error saving station alert: " + ex.getMessage(), "Error",
                        JOptionPane.ERROR_MESSAGE);
            }
        });

        dialog.setVisible(true);
    }

    private void loadLineDropdown() {
        try {
            lineSelectDropdown.removeAllItems();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT name FROM Line ORDER BY name");
            while (rs.next()) {
                lineSelectDropdown.addItem(rs.getString("name"));
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Error loading lines: " + ex.getMessage(), "Error",
                    JOptionPane.ERROR_MESSAGE);
        }
    }

    private void onLineSelected(String lineName) {
        try {
            CallableStatement cs = conn.prepareCall("{CALL sp_get_ordered_line_stops_by_line_name(?)}");
            cs.setString(1, lineName);
            ResultSet rs = cs.executeQuery();
            renderLineDetail(rs, lineName);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Error loading line detail: " + ex.getMessage(), "Error",
                    JOptionPane.ERROR_MESSAGE);
        }
    }

    private void renderLineDetail(ResultSet rs, String lineName) throws SQLException {
        lineDetailPanel.removeAll();

        lineDetailPanel.add(Box.createVerticalStrut(20));

        // Line title
        JLabel titleLabel = new JLabel(lineName);
        titleLabel.setFont(new Font("SansSerif", Font.BOLD, 22));
        titleLabel.setAlignmentX(Component.CENTER_ALIGNMENT);
        lineDetailPanel.add(titleLabel);
        lineDetailPanel.add(Box.createVerticalStrut(15));

        int stopNum = 0;
        while (rs.next()) {
            stopNum++;
            String stationName = rs.getString("stationName");
            boolean accessible = rs.getBoolean("isAccessible");

            // Connector line between stops (skip before first)
            if (stopNum > 1) {
                JLabel connectorTop = new JLabel("●");
                connectorTop.setFont(new Font("Monospaced", Font.PLAIN, 12));
                connectorTop.setAlignmentX(Component.CENTER_ALIGNMENT);
                lineDetailPanel.add(connectorTop);

                JLabel connector = new JLabel("│");
                connector.setFont(new Font("Monospaced", Font.PLAIN, 20));
                connector.setAlignmentX(Component.CENTER_ALIGNMENT);
                lineDetailPanel.add(connector);

                JLabel connectorBottom = new JLabel("●");
                connectorBottom.setFont(new Font("Monospaced", Font.PLAIN, 12));
                connectorBottom.setAlignmentX(Component.CENTER_ALIGNMENT);
                lineDetailPanel.add(connectorBottom);
            }

            // Station dot and name
            String accessibleIcon = accessible ? "  ♿" : "";
            JLabel stationLabel = new JLabel(stationName + accessibleIcon);
            stationLabel.setFont(new Font("SansSerif", Font.PLAIN, 16));
            stationLabel.setAlignmentX(Component.CENTER_ALIGNMENT);
            lineDetailPanel.add(stationLabel);
        }

        if (stopNum == 0) {
            JLabel emptyLabel = new JLabel("No stops found for this line.");
            emptyLabel.setFont(new Font("SansSerif", Font.ITALIC, 14));
            emptyLabel.setAlignmentX(Component.CENTER_ALIGNMENT);
            lineDetailPanel.add(emptyLabel);
        }

        lineDetailPanel.add(Box.createVerticalStrut(20));
        lineDetailPanel.revalidate();
        lineDetailPanel.repaint();
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
                    colNames[i] = "alertID";
                    break;
                case "fareid":
                    colNames[i] = "fareID";
                    break;
                case "lineid":
                    colNames[i] = "lineID";
                    break;
                case "alerttitle":
                    colNames[i] = "Alert Title";
                    break;
                case "linename":
                    colNames[i] = "Line Name";
                    break;
                case "stationid":
                    colNames[i] = "stationID";
                    break;
                case "stationname":
                    colNames[i] = "Station Name";
                    break;
                case "starttime":
                    colNames[i] = "Start Time";
                    break;
                case "endtime":
                    colNames[i] = "End Time";
                    break;
                case "description":
                    colNames[i] = "Description";
                    break;
                case "severity":
                    colNames[i] = "Severity";
                    break;
                case "title":
                    colNames[i] = "Alert Title";
                    break;
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

        // Remove ID columns from view
        for (int i = cols - 1; i >= 0; i--) {
            String colName = colNames[i];
            if (colName.equalsIgnoreCase("alertID") || colName.equalsIgnoreCase("fareID") || colName.equalsIgnoreCase("lineID") || colName.equalsIgnoreCase("stationID")) {
                resultTable.getColumnModel().removeColumn(resultTable.getColumnModel().getColumn(i));
            }
        }
    }

    private void showAlertDialog(Alert alert, int alertId, boolean isCreate) throws SQLException {
        JDialog dialog = new JDialog(this, isCreate ? "Create Alert" : "Update Alert", true);
        dialog.setSize(500, 350);
        dialog.setLocationRelativeTo(this);
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
                onShowFares(null);
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
