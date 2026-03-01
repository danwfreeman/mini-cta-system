import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.JTableHeader;

import java.awt.*;
import java.sql.*;

public class TripPlan {
    private Connection conn;
    private JFrame parent;

    private JTable tripResultTable;
    private JComboBox<String> startStationDropdown;
    private JComboBox<String> endStationDropdown;
    private JComboBox<String> dayOfWeekDropdown;

    private JPanel lineDetailPanel;
    private JPanel transferLineDetailPanel;
    private JLabel startLineLabel;
    private JLabel transferLineLabelValue;

    private JTable scheduleTable1;
    private JTable scheduleTable2;
    private JLabel scheduleLabel1;
    private JLabel scheduleLabel2;

    private JPanel panel;

    public TripPlan(JFrame parent) {
        this.parent = parent;
        buildPanel();
    }

    public void setConnection(Connection conn) {
        this.conn = conn;
    }

    public JPanel getPanel() {
        return panel;
    }

    private void buildPanel() {
        // Trip result table
        tripResultTable = new JTable();
        JTableHeader tripHeader = tripResultTable.getTableHeader();
        tripHeader.setFont(new Font("SansSerif", Font.BOLD, 16));
        JScrollPane tripResultScroll = new JScrollPane(tripResultTable);

        // Trip Planner controls
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

        // Transfer line detail section
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

        panel = new JPanel(new BorderLayout());
        panel.add(userSplitPane, BorderLayout.CENTER);
    }

    public void loadLineDropdown() {
        startLineLabel.setText("");
        transferLineLabelValue.setText("");
        lineDetailPanel.removeAll();
        lineDetailPanel.revalidate();
        lineDetailPanel.repaint();
        transferLineDetailPanel.removeAll();
        transferLineDetailPanel.revalidate();
        transferLineDetailPanel.repaint();
    }

    public void loadStationDropdowns() {
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
            JOptionPane.showMessageDialog(parent, "Error loading stations: " + ex.getMessage(), "Error",
                    JOptionPane.ERROR_MESSAGE);
        }
    }

    private void onPlanTrip() {
        String startLabel = (String) startStationDropdown.getSelectedItem();
        String endLabel = (String) endStationDropdown.getSelectedItem();
        if (startLabel == null || endLabel == null) {
            JOptionPane.showMessageDialog(parent, "Please select both a start and end station.");
            return;
        }
        String startStation = startLabel.replaceAll("\\s*\\(.*\\)$", "");
        String endStation = endLabel.replaceAll("\\s*\\(.*\\)$", "");
        if (startStation.equals(endStation)) {
            JOptionPane.showMessageDialog(parent, "Start and end stations must be different.");
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

            // no direct route, check if we have a shared station between 2 lines (1 transfer only)
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
            JOptionPane.showMessageDialog(parent, "Can't plan that trip — no direct or one-transfer route found.");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(parent, "Error planning trip: " + ex.getMessage(), "Error",
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
            JOptionPane.showMessageDialog(parent, "Error loading trip schedule: " + ex.getMessage(), "Error",
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

    private void onLineSelected(String lineName, JPanel targetPanel) {
        try {
            ResultSet rs = LineDetail.fetchLineStops(conn, lineName);
            LineDetail.renderLineDetail(targetPanel, rs, lineName);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(parent, "Error loading line detail: " + ex.getMessage(), "Error",
                    JOptionPane.ERROR_MESSAGE);
        }
    }
}
