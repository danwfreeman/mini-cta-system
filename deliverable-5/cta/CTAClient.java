import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.JTableHeader;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.sql.*;

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
    private JComboBox<String> startStationDropdown;
    private JComboBox<String> endStationDropdown;

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

        // Radio button group: Administrator / User
        JRadioButton adminRadio = new JRadioButton("Administrator");
        JRadioButton userRadio = new JRadioButton("User");
        ButtonGroup roleGroup = new ButtonGroup();
        roleGroup.add(adminRadio);
        roleGroup.add(userRadio);
        adminRadio.setSelected(true);

        JPanel radioPanel = new JPanel();
        radioPanel.add(adminRadio);
        radioPanel.add(userRadio);
        headerPanel.add(radioPanel, BorderLayout.SOUTH);

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

        // CardLayout to swap center content between table and line detail
        centerCardLayout = new CardLayout();
        centerCards = new JPanel(centerCardLayout);
        centerCards.add(resultScroll, "table");
        centerCards.add(lineDetailScroll, "linedetail");

        JComboBox<String> manageDropdown = new JComboBox<>(new String[]{
            "Manage Fares", "Manage Alerts", "Manage Line Alerts", "Manage Station Alerts"
        });
        manageDropdown.addActionListener(e -> {
            String selected = (String) manageDropdown.getSelectedItem();
            cardLayout.show(buttonCards, selected);
            centerCardLayout.show(centerCards, "table");
            switch (selected) {
                case "Manage Fares":
                    onShowFares(null);
                    break;
                case "Manage Alerts":
                    onShowAlerts(null);
                    break;
                case "Manage Line Alerts":
                    onShowLineAlerts(null);
                    break;
                case "Manage Station Alerts":
                    onShowStationAlerts(null);
                    break;
            }
        });

        JPanel dropdownRow = new JPanel();
        dropdownRow.add(manageDropdown);

        JPanel adminPanel = new JPanel();
        adminPanel.setLayout(new BoxLayout(adminPanel, BoxLayout.Y_AXIS));
        adminPanel.add(dropdownRow);
        adminPanel.add(buttonCards);

        // Trip Planner section
        startStationDropdown = new JComboBox<>();
        endStationDropdown = new JComboBox<>();

        JComboBox<String> dayOfWeekDropdown = new JComboBox<>(new String[]{"Weekday", "Saturday", "Sunday/Holiday"});
        JComboBox<String> directionDropdown = new JComboBox<>(new String[]{"Northbound", "Southbound", "Eastbound", "Westbound"});
        JButton planTripButton = new JButton("Plan Trip");
        planTripButton.addActionListener(e -> onPlanTrip());

        JPanel tripTopRow = new JPanel();
        tripTopRow.add(new JLabel("Day of Week:"));
        tripTopRow.add(dayOfWeekDropdown);
        tripTopRow.add(Box.createHorizontalStrut(20));
        tripTopRow.add(new JLabel("Direction:"));
        tripTopRow.add(directionDropdown);
        tripTopRow.add(Box.createHorizontalStrut(20));
        tripTopRow.add(planTripButton);

        JPanel tripBottomRow = new JPanel();
        tripBottomRow.add(new JLabel("Start Station:"));
        tripBottomRow.add(startStationDropdown);
        tripBottomRow.add(Box.createHorizontalStrut(20));
        tripBottomRow.add(new JLabel("End Station:"));
        tripBottomRow.add(endStationDropdown);

        JPanel tripPlannerRow = new JPanel();
        tripPlannerRow.setLayout(new BoxLayout(tripPlannerRow, BoxLayout.Y_AXIS));
        tripPlannerRow.add(tripTopRow);
        tripPlannerRow.add(tripBottomRow);

        // User sub-panel card layout for switching between line detail row and trip planner row
        CardLayout userCardLayout = new CardLayout();
        JPanel userButtonCards = new JPanel(userCardLayout);
        userButtonCards.add(lineDetailRow, "View Line Detail");
        userButtonCards.add(tripPlannerRow, "Trip Planner");

        // User panel with View Line Detail and Trip Planner
        JComboBox<String> userDropdown = new JComboBox<>(new String[]{"View Line Detail", "Trip Planner"});
        userDropdown.addActionListener(e -> {
            String selected = (String) userDropdown.getSelectedItem();
            userCardLayout.show(userButtonCards, selected);
            if ("View Line Detail".equals(selected)) {
                centerCardLayout.show(centerCards, "linedetail");
                loadLineDropdown();
            } else if ("Trip Planner".equals(selected)) {
                centerCardLayout.show(centerCards, "table");
                loadStationDropdowns();
            }
        });
        JPanel userDropdownRow = new JPanel();
        userDropdownRow.add(new JLabel("Select:"));
        userDropdownRow.add(userDropdown);
        JPanel userPanel = new JPanel();
        userPanel.setLayout(new BoxLayout(userPanel, BoxLayout.Y_AXIS));
        userPanel.add(userDropdownRow);
        userPanel.add(userButtonCards);

        // CardLayout to swap between admin and user views
        CardLayout roleCardLayout = new CardLayout();
        JPanel roleCards = new JPanel(roleCardLayout);
        roleCards.add(adminPanel, "admin");
        roleCards.add(userPanel, "user");

        adminRadio.addActionListener(e2 -> {
            roleCardLayout.show(roleCards, "admin");
            onShowFares(null);
            centerCardLayout.show(centerCards, "table");
        });
        userRadio.addActionListener(e2 -> {
            roleCardLayout.show(roleCards, "user");
            centerCardLayout.show(centerCards, "linedetail");
            loadLineDropdown();
        });

        JPanel topPanel = new JPanel(new BorderLayout());
        topPanel.add(headerPanel, BorderLayout.NORTH);
        topPanel.add(roleCards, BorderLayout.SOUTH);

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
                Alert.showDialog(this, conn, alert, alertId, false, () -> onShowAlerts(null));
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Error loading alert: " + ex.getMessage(), "Error",
                    JOptionPane.ERROR_MESSAGE);
        }
    }

    private void onCreateAlert(ActionEvent e) {
        try {
            Alert.showDialog(this, conn, new Alert(), -1, true, () -> onShowAlerts(null));
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
                Fare.showDialog(this, conn, fare, fareId, false, () -> onShowFares(null));
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Error loading fare: " + ex.getMessage(), "Error",
                    JOptionPane.ERROR_MESSAGE);
        }
    }

    private void onCreateFare(ActionEvent e) {
        try {
            Fare.showDialog(this, conn, new Fare(), -1, true, () -> onShowFares(null));
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
            int lineId = Integer.parseInt(model.getValueAt(selectedRow, 0).toString());
            int alertId = Integer.parseInt(model.getValueAt(selectedRow, 2).toString());

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
            int lineId = Integer.parseInt(model.getValueAt(selectedRow, 0).toString());
            int alertId = Integer.parseInt(model.getValueAt(selectedRow, 2).toString());

            AlertLine.showDialog(this, conn, alertId, lineId, false, () -> onShowLineAlerts(null));
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Error loading line alert: " + ex.getMessage(), "Error",
                    JOptionPane.ERROR_MESSAGE);
        }
    }

    private void onCreateLineAlert(ActionEvent e) {
        try {
            AlertLine.showDialog(this, conn, -1, -1, true, () -> onShowLineAlerts(null));
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Error opening create dialog: " + ex.getMessage(), "Error",
                    JOptionPane.ERROR_MESSAGE);
        }
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
            int stationId = Integer.parseInt(model.getValueAt(selectedRow, 0).toString());
            int alertId = Integer.parseInt(model.getValueAt(selectedRow, 2).toString());

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
            int stationId = Integer.parseInt(model.getValueAt(selectedRow, 0).toString());
            int alertId = Integer.parseInt(model.getValueAt(selectedRow, 2).toString());

            AlertStation.showDialog(this, conn, alertId, stationId, false, () -> onShowStationAlerts(null));
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Error loading station alert: " + ex.getMessage(), "Error",
                    JOptionPane.ERROR_MESSAGE);
        }
    }

    private void onCreateStationAlert(ActionEvent e) {
        try {
            AlertStation.showDialog(this, conn, -1, -1, true, () -> onShowStationAlerts(null));
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Error opening create dialog: " + ex.getMessage(), "Error",
                    JOptionPane.ERROR_MESSAGE);
        }
    }

    private void loadLineDropdown() {
        try {
            lineSelectDropdown.removeAllItems();
            ResultSet rs = LineDetail.fetchAllLineNames(conn);
            while (rs.next()) {
                lineSelectDropdown.addItem(rs.getString("name"));
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Error loading lines: " + ex.getMessage(), "Error",
                    JOptionPane.ERROR_MESSAGE);
        }
    }

    private void onPlanTrip() {
        String startLabel = (String) startStationDropdown.getSelectedItem();
        String endLabel = (String) endStationDropdown.getSelectedItem();
        if (startLabel == null || endLabel == null) {
            JOptionPane.showMessageDialog(this, "Please select both a start and end station.");
            return;
        }
        String startStation = startLabel.replaceAll("\\s*\\(.*\\)$", "");
        String endStation = endLabel.replaceAll("\\s*\\(.*\\)$", "");
        if (startStation.equals(endStation)) {
            JOptionPane.showMessageDialog(this, "Start and end stations must be different.");
            return;
        }

        try {
            // 1. Check for a direct route (shared line)
            String directSql = "SELECT DISTINCT l.name AS lineName, l.mode " +
                    "FROM Line l " +
                    "JOIN StationLine sl1 ON sl1.lineID = l.lineID " +
                    "JOIN StationLine sl2 ON sl2.lineID = l.lineID " +
                    "JOIN Station s1 ON s1.stationID = sl1.stationID " +
                    "JOIN Station s2 ON s2.stationID = sl2.stationID " +
                    "WHERE s1.name = ? AND s2.name = ?";
            PreparedStatement pstmt = conn.prepareStatement(directSql);
            pstmt.setString(1, startStation);
            pstmt.setString(2, endStation);
            ResultSet rs = pstmt.executeQuery();
            if (rs.isBeforeFirst()) {
                populateTable(rs);
                return;
            }

            // 2. Check for one-transfer route
            String transferSql = "SELECT DISTINCT s.name AS transferStation, l1.name AS takeLine, l2.name AS transferToLine " +
                    "FROM Station s " +
                    "JOIN StationLine slA ON slA.stationID = s.stationID " +
                    "JOIN StationLine slB ON slB.stationID = s.stationID " +
                    "JOIN Line l1 ON l1.lineID = slA.lineID " +
                    "JOIN Line l2 ON l2.lineID = slB.lineID " +
                    "WHERE slA.lineID IN ( " +
                    "    SELECT sl.lineID FROM StationLine sl " +
                    "    JOIN Station st ON st.stationID = sl.stationID WHERE st.name = ? " +
                    ") " +
                    "AND slB.lineID IN ( " +
                    "    SELECT sl.lineID FROM StationLine sl " +
                    "    JOIN Station st ON st.stationID = sl.stationID WHERE st.name = ? " +
                    ") " +
                    "AND slA.lineID <> slB.lineID " +
                    "AND s.name NOT IN (?, ?) " +
                    "ORDER BY s.name";
            PreparedStatement pstmt2 = conn.prepareStatement(transferSql);
            pstmt2.setString(1, startStation);
            pstmt2.setString(2, endStation);
            pstmt2.setString(3, startStation);
            pstmt2.setString(4, endStation);
            ResultSet rs2 = pstmt2.executeQuery();
            if (rs2.isBeforeFirst()) {
                populateTable(rs2);
                return;
            }

            // 3. No route found
            JOptionPane.showMessageDialog(this, "Can't plan that trip — no direct or one-transfer route found.");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Error planning trip: " + ex.getMessage(), "Error",
                    JOptionPane.ERROR_MESSAGE);
        }
    }

    private void loadStationDropdowns() {
        try {
            startStationDropdown.removeAllItems();
            endStationDropdown.removeAllItems();
            String sql = "SELECT name, mode FROM Station ORDER BY name";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                String name = rs.getString("name");
                String mode = rs.getString("mode");
                String label = name + " (" + mode + ")";
                startStationDropdown.addItem(label);
                endStationDropdown.addItem(label);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Error loading stations: " + ex.getMessage(), "Error",
                    JOptionPane.ERROR_MESSAGE);
        }
    }

    private void onLineSelected(String lineName) {
        try {
            ResultSet rs = LineDetail.fetchLineStops(conn, lineName);
            LineDetail.renderLineDetail(lineDetailPanel, rs, lineName);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Error loading line detail: " + ex.getMessage(), "Error",
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
