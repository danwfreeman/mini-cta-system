import java.awt.*;
import java.sql.*;
import javax.swing.*;

public class LineDetail {

    public static ResultSet fetchAllLineNames(Connection conn) throws SQLException {
        String query = "SELECT name FROM Line ORDER BY name";
        Statement st = conn.createStatement();
        return st.executeQuery(query);
    }

    public static ResultSet fetchLineStops(Connection conn, String lineName) throws SQLException {
        CallableStatement cs = conn.prepareCall("{CALL sp_get_ordered_line_stops_by_line_name(?)}");
        cs.setString(1, lineName);
        return cs.executeQuery();
    }

    public static void renderLineDetail(JPanel panel, ResultSet rs, String lineName) throws SQLException {
        panel.removeAll();

        panel.add(Box.createVerticalStrut(20));

        // Line title
        JLabel titleLabel = new JLabel(lineName);
        titleLabel.setFont(new Font("SansSerif", Font.BOLD, 22));
        titleLabel.setAlignmentX(Component.CENTER_ALIGNMENT);
        panel.add(titleLabel);
        panel.add(Box.createVerticalStrut(15));

        int stopNum = 0;
        while (rs.next()) {
            stopNum++;
            String stationName = rs.getString("stationName");
            boolean accessible = rs.getBoolean("isAccessible");

            // Connector line between stops (skip before first)
            if (stopNum > 1) {
                JLabel connectorTop = new JLabel("\u25cf");
                connectorTop.setFont(new Font("Monospaced", Font.PLAIN, 12));
                connectorTop.setAlignmentX(Component.CENTER_ALIGNMENT);
                panel.add(connectorTop);

                JLabel connector = new JLabel("\u2502");
                connector.setFont(new Font("Monospaced", Font.PLAIN, 20));
                connector.setAlignmentX(Component.CENTER_ALIGNMENT);
                panel.add(connector);

                JLabel connectorBottom = new JLabel("\u25cf");
                connectorBottom.setFont(new Font("Monospaced", Font.PLAIN, 12));
                connectorBottom.setAlignmentX(Component.CENTER_ALIGNMENT);
                panel.add(connectorBottom);
            }

            // Station name
            String accessibleIcon = accessible ? "  \u267f" : "";
            JLabel stationLabel = new JLabel(stationName + accessibleIcon);
            stationLabel.setFont(new Font("SansSerif", Font.PLAIN, 16));
            stationLabel.setAlignmentX(Component.CENTER_ALIGNMENT);
            panel.add(stationLabel);
        }

        if (stopNum == 0) {
            JLabel emptyLabel = new JLabel("No stops found for this line.");
            emptyLabel.setFont(new Font("SansSerif", Font.ITALIC, 14));
            emptyLabel.setAlignmentX(Component.CENTER_ALIGNMENT);
            panel.add(emptyLabel);
        }

        panel.add(Box.createVerticalStrut(20));
        panel.revalidate();
        panel.repaint();
    }
}
