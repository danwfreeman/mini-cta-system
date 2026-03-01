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
    private JTable tripResultTable;
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
    private JPanel transferLineDetailPanel;
    private JLabel startLineLabel;
    private JLabel transferLineLabelValue;
    private JComboBox<String> startStationDropdown;
    private JComboBox<String> endStationDropdown;
    private JComboBox<String> dayOfWeekDropdown;

    private JTable scheduleTable1;
    private JTable scheduleTable2;
    private JLabel scheduleLabel1;
    private JLabel scheduleLabel2;

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

        roleGroup.add(userRadio);
        roleGroup.add(adminRadio);
        userRadio.setSelected(true);

        JPanel radioPanel = new JPanel();

        radioPanel.add(userRadio);
        radioPanel.add(adminRadio);
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
        startLineLabel = new JLabel("");
        startLineLabel.setFont(new Font("SansSerif", Font.BOLD, 14));
        JPanel lineDetailButtonPanel = new JPanel();
        lineDetailButtonPanel.add(new JLabel("Start Line:"));
        lineDetailButtonPanel.add(startLineLabel);

        JPanel lineDetailRow = new JPanel();
        lineDetailRow.add(lineDetailButtonPanel);

        // Line detail vertical display panel
        lineDetailPanel = new JPanel();
        lineDetailPanel.setLayout(new BoxLayout(lineDetailPanel, BoxLayout.Y_AXIS));
        JScrollPane lineDetailScroll = new JScrollPane(lineDetailPanel);

        // Transfer line detail section (second line, shown on transfers)
        transferLineLabelValue = new JLabel("");
        transferLineLabelValue.setFont(new Font("SansSerif", Font.BOLD, 14));
        JPanel transferLineButtonPanel = new JPanel();
        transferLineButtonPanel.add(new JLabel("Transfer Line:"));
        transferLineButtonPanel.add(transferLineLabelValue);

        JPanel transferLineRow = new JPanel();
        transferLineRow.add(transferLineButtonPanel);

        transferLineDetailPanel = new JPanel();
        transferLineDetailPanel.setLayout(new BoxLayout(transferLineDetailPanel, BoxLayout.Y_AXIS));
        JScrollPane transferLineDetailScroll = new JScrollPane(transferLineDetailPanel);

        // CardLayout to swap button rows
        CardLayout cardLayout = new CardLayout();
        JPanel buttonCards = new JPanel(cardLayout);
        buttonCards.add(faresRow, "Manage Fares");
        buttonCards.add(alertsRow, "Manage Alerts");
        buttonCards.add(lineAlertsRow, "Manage Line Alerts");
        buttonCards.add(stationAlertsRow, "Manage Station Alerts");

        // Trip result table (for the user trip planner, separate from admin table)
        tripResultTable = new JTable();
        JTableHeader tripHeader = tripResultTable.getTableHeader();
        tripHeader.setFont(new Font("SansSerif", Font.BOLD, 16));
        JScrollPane tripResultScroll = new JScrollPane(tripResultTable);

        JComboBox<String> manageDropdown = new JComboBox<>(new String[]{
            "Manage Fares", "Manage Alerts", "Manage Line Alerts", "Manage Station Alerts"
        });
        manageDropdown.addActionListener(e -> {
            String selected = (String) manageDropdown.getSelectedItem();
            cardLayout.show(buttonCards, selected);
            centerCardLayout.show(centerCards, "admin");
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

        dayOfWeekDropdown = new JComboBox<>(new String[]{"Weekday", "Saturday", "Sunday/Holiday"});
        JButton planTripButton = new JButton("Plan Trip");
        planTripButton.addActionListener(e -> onPlanTrip());

        JPanel tripTopRow = new JPanel();
        tripTopRow.add(new JLabel("Day of Week:"));
        tripTopRow.add(dayOfWeekDropdown);
        tripTopRow.add(Box.createHorizontalStrut(20));
        tripTopRow.add(planTripButton);

        JPanel tripBottomRow = new JPanel();
        tripBottomRow.add(new JLabel("Start Station:"));
        tripBottomRow.add(startStationDropdown);
        tripBottomRow.add(Box.createHorizontalStrut(20));
        tripBottomRow.add(new JLabel("End Station:"));
        tripBottomRow.add(endStationDropdown);

        JPanel tripPlannerControls = new JPanel();
        tripPlannerControls.setLayout(new BoxLayout(tripPlannerControls, BoxLayout.Y_AXIS));
        tripPlannerControls.add(tripTopRow);
        tripPlannerControls.add(tripBottomRow);

        // Schedule tables for trip schedule results
        scheduleTable1 = new JTable();
        JTableHeader sched1Header = scheduleTable1.getTableHeader();
        sched1Header.setFont(new Font("SansSerif", Font.BOLD, 14));
        JScrollPane scheduleScroll1 = new JScrollPane(scheduleTable1);

        scheduleLabel1 = new JLabel(" ");
        scheduleLabel1.setFont(new Font("SansSerif", Font.BOLD, 12));
        JPanel schedulePanel1 = new JPanel(new BorderLayout());
        schedulePanel1.add(scheduleLabel1, BorderLayout.NORTH);
        schedulePanel1.add(scheduleScroll1, BorderLayout.CENTER);

        scheduleTable2 = new JTable();
        JTableHeader sched2Header = scheduleTable2.getTableHeader();
        sched2Header.setFont(new Font("SansSerif", Font.BOLD, 14));
        JScrollPane scheduleScroll2 = new JScrollPane(scheduleTable2);

        scheduleLabel2 = new JLabel(" ");
        scheduleLabel2.setFont(new Font("SansSerif", Font.BOLD, 12));
        JPanel schedulePanel2 = new JPanel(new BorderLayout());
        schedulePanel2.add(scheduleLabel2, BorderLayout.NORTH);
        schedulePanel2.add(scheduleScroll2, BorderLayout.CENTER);

        // Side-by-side schedule tables panel
        JSplitPane scheduleSplitPane = new JSplitPane(JSplitPane.HORIZONTAL_SPLIT, schedulePanel1, schedulePanel2);
        scheduleSplitPane.setResizeWeight(0.5);

        // Trip result table top 40%, schedule tables bottom 60%
        JSplitPane tripContentSplit = new JSplitPane(JSplitPane.VERTICAL_SPLIT, tripResultScroll, scheduleSplitPane);
        tripContentSplit.setResizeWeight(0.4);

        // Left side: trip planner controls + trip content (table + schedules)
        JPanel tripPlannerPanel = new JPanel(new BorderLayout());
        tripPlannerPanel.add(tripPlannerControls, BorderLayout.NORTH);
        tripPlannerPanel.add(tripContentSplit, BorderLayout.CENTER);

        // Left side: first line detail + transfer line detail stacked vertically
        JPanel firstLinePanel = new JPanel(new BorderLayout());
        firstLinePanel.add(lineDetailRow, BorderLayout.NORTH);
        firstLinePanel.add(lineDetailScroll, BorderLayout.CENTER);

        JPanel secondLinePanel = new JPanel(new BorderLayout());
        secondLinePanel.add(transferLineRow, BorderLayout.NORTH);
        secondLinePanel.add(transferLineDetailScroll, BorderLayout.CENTER);

        JSplitPane linesSplitPane = new JSplitPane(JSplitPane.VERTICAL_SPLIT, firstLinePanel, secondLinePanel);
        linesSplitPane.setResizeWeight(0.5);

        // User split pane: left = trip planner, right = line details
        JSplitPane userSplitPane = new JSplitPane(JSplitPane.HORIZONTAL_SPLIT, tripPlannerPanel, linesSplitPane);
        userSplitPane.setResizeWeight(0.75);
        userSplitPane.setDividerLocation(1500);

        // CardLayout to swap center content between admin table and user split view
        centerCardLayout = new CardLayout();
        centerCards = new JPanel(centerCardLayout);
        centerCards.add(resultScroll, "admin");
        centerCards.add(userSplitPane, "user");

        // CardLayout to swap between admin and user top controls
        CardLayout roleCardLayout = new CardLayout();
        JPanel roleCards = new JPanel(roleCardLayout);
        roleCards.add(adminPanel, "admin");

        // Empty placeholder for user (controls are in the split pane)
        JPanel userTopPlaceholder = new JPanel();
        roleCards.add(userTopPlaceholder, "user");

        adminRadio.addActionListener(e2 -> {
            roleCardLayout.show(roleCards, "admin");
            centerCardLayout.show(centerCards, "admin");
            onShowFares(null);
        });
        userRadio.addActionListener(e2 -> {
            roleCardLayout.show(roleCards, "user");
            centerCardLayout.show(centerCards, "user");
            loadLineDropdown();
            loadStationDropdowns();
        });

        JPanel topPanel = new JPanel(new BorderLayout());
        topPanel.add(headerPanel, BorderLayout.NORTH);
        topPanel.add(roleCards, BorderLayout.SOUTH);

        add(topPanel, BorderLayout.NORTH);
        add(centerCards, BorderLayout.CENTER);

        // Show user view on startup since userRadio is selected
        roleCardLayout.show(roleCards, "user");
        centerCardLayout.show(centerCards, "user");
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
        // No dropdowns to populate; clear labels and panels
        startLineLabel.setText("");
        transferLineLabelValue.setText("");
        lineDetailPanel.removeAll();
        lineDetailPanel.revalidate();
        lineDetailPanel.repaint();
        transferLineDetailPanel.removeAll();
        transferLineDetailPanel.revalidate();
        transferLineDetailPanel.repaint();
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
            String[] colNames = {"Type", "Station", "Line"};
            DefaultTableModel model = new DefaultTableModel(colNames, 0) {
                @Override
                public boolean isCellEditable(int row, int column) {
                    return false;
                }
            };

            // simple case, there is one line that serves both start and end station, show and return
            // self join pattern to find lines that have both stations, group by line and count distinct stations to ensure both are served by the same line
            // this is a relational division pattern, find entities related to all of a set (two stations in this case)
            String directSql = "SELECT l.name AS lineName " +
                    "FROM Line l " +
                    "JOIN StationLine sl ON sl.lineID = l.lineID " +
                    "JOIN Station s ON s.stationID = sl.stationID " +
                    "WHERE s.name IN (?, ?) " +
                    "GROUP BY l.lineID, l.name " +
                    "HAVING COUNT(DISTINCT s.name) = 2";
            PreparedStatement pstmt = conn.prepareStatement(directSql);
            pstmt.setString(1, startStation);
            pstmt.setString(2, endStation);
            ResultSet rs = pstmt.executeQuery();
            if (rs.isBeforeFirst()) {
                // Use the first shared line for a clean 2-row display
                rs.next();
                String lineName = rs.getString("lineName");
                model.addRow(new Object[]{"Start Station", startStation, lineName});
                model.addRow(new Object[]{"End Station", endStation, lineName});
                tripResultTable.setModel(model);
                startLineLabel.setText(lineName);
                onLineSelected(lineName, lineDetailPanel);
                // Clear transfer line for direct route
                transferLineLabelValue.setText("");
                transferLineDetailPanel.removeAll();
                transferLineDetailPanel.revalidate();
                transferLineDetailPanel.repaint();
                // Load trip schedule for the single line
                String dayType = getDayTypeParam();
                loadTripSchedule(lineName, startStation, endStation, dayType, "northbound", scheduleTable1, scheduleLabel1);
                clearTable(scheduleTable2);
                scheduleLabel2.setText(" ");
                return;
            }

            // no direct rooute, check if we have a shared station between 2 lines (1 transfer only)
            // if s.name exists and the lines are different, and the name is not that same as the start or end name (station), then we are good
            // this would be a set membership query using IN
            // this enforces 1 transfer because we are looking at one station to server 2 distinct lines
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
                    "AND s.name NOT IN (?, ?) ";
            PreparedStatement pstmt2 = conn.prepareStatement(transferSql);
            pstmt2.setString(1, startStation);
            pstmt2.setString(2, endStation);
            pstmt2.setString(3, startStation);
            pstmt2.setString(4, endStation);
            ResultSet rs2 = pstmt2.executeQuery();
            if (rs2.isBeforeFirst()) {
                // we force 4 lines here, since we know we have a start, transfer from, transfer to, and end station, basically duplicating the transfer station for to/from clarity for display purposes
                rs2.next();
                String transferStation = rs2.getString("transferStation");
                String takeLine = rs2.getString("takeLine");
                String transferToLine = rs2.getString("transferToLine");
                model.addRow(new Object[]{"Start Station", startStation, takeLine});
                model.addRow(new Object[]{"Transfer From", transferStation, takeLine});
                model.addRow(new Object[]{"Transfer To", transferStation, transferToLine});
                model.addRow(new Object[]{"End Station", endStation, transferToLine});
                tripResultTable.setModel(model);
                startLineLabel.setText(takeLine);
                onLineSelected(takeLine, lineDetailPanel);
                transferLineLabelValue.setText(transferToLine);
                onLineSelected(transferToLine, transferLineDetailPanel);
                // Load trip schedules for both legs
                String dayType = getDayTypeParam();
                loadTripSchedule(takeLine, startStation, transferStation, dayType, "northbound", scheduleTable1, scheduleLabel1);
                loadTripSchedule(transferToLine, transferStation, endStation, dayType, "northbound", scheduleTable2, scheduleLabel2);
                return;
            }

            // no direct route, and no one transfer route, show message and return
            JOptionPane.showMessageDialog(this, "Can't plan that trip — no direct or one-transfer route found.");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Error planning trip: " + ex.getMessage(), "Error",
                    JOptionPane.ERROR_MESSAGE);
        }
    }

    private String getDayTypeParam() {
        String selected = (String) dayOfWeekDropdown.getSelectedItem();
        return switch (selected) {
            case "Saturday" -> "saturday";
            case "Sunday/Holiday" -> "sunday_holiday";
            default -> "weekday";
        };
    }



    private void loadTripSchedule(String lineName, String startStation, String endStation,
                                   String dayType, String direction, JTable targetTable, JLabel infoLabel) {
        try {
            String usedDirection = direction;
            DefaultTableModel model = callTripSchedule(lineName, startStation, endStation, dayType, usedDirection);
            // If no results, flip direction and retry
            if (model.getRowCount() == 0) {
                usedDirection = direction.equals("northbound") ? "southbound" : "northbound";
                model = callTripSchedule(lineName, startStation, endStation, dayType, usedDirection);
            }
            targetTable.setModel(model);
            infoLabel.setText(lineName + "  |  " + startStation + " → " + endStation + "  |  " + usedDirection);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Error loading trip schedule: " + ex.getMessage(), "Error",
                    JOptionPane.ERROR_MESSAGE);
        }
    }

    private DefaultTableModel callTripSchedule(String lineName, String startStation, String endStation,
                                                String dayType, String direction) throws SQLException {
        CallableStatement cs = conn.prepareCall("{CALL sp_get_trip_schedule(?, ?, ?, ?, ?)}");
        cs.setString(1, lineName);
        cs.setString(2, startStation);
        cs.setString(3, endStation);
        cs.setString(4, dayType);
        cs.setString(5, direction);
        ResultSet rs = cs.executeQuery();

        String[] colNames = {"Trip #", "Depart", "Arrive", "Duration (min)"};
        DefaultTableModel model = new DefaultTableModel(colNames, 0) {
            @Override
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };
        while (rs.next()) {
            model.addRow(new Object[]{
                rs.getInt("tripNumber"),
                rs.getTime("departTime"),
                rs.getTime("arriveTime"),
                rs.getInt("tripDurationMinutes")
            });
        }
        return model;
    }

    private void clearTable(JTable table) {
        table.setModel(new DefaultTableModel());
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

    private void onLineSelected(String lineName, JPanel targetPanel) {
        try {
            ResultSet rs = LineDetail.fetchLineStops(conn, lineName);
            LineDetail.renderLineDetail(targetPanel, rs, lineName);
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

            app.loadStationDropdowns();
            app.setVisible(true);
        });
    }
}
