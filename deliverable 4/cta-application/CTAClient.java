import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.sql.*;

public class CTAClient extends JFrame {
    private Connection conn;
    private JTextArea sqlArea;
    private JButton execBtn;
    private JTable resultTable;

    public CTAClient() {
        super("CTA MySQL Client");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(800, 600);
        setLayout(new BorderLayout());

        sqlArea = new JTextArea("SELECT * FROM Line LIMIT 10;");
        JScrollPane sqlScroll = new JScrollPane(sqlArea);
        sqlScroll.setPreferredSize(new Dimension(800, 120));

        execBtn = new JButton("Execute SQL");
        execBtn.setEnabled(false);
        execBtn.addActionListener(this::onExecute);

        JPanel top = new JPanel(new BorderLayout());
        top.add(sqlScroll, BorderLayout.CENTER);
        top.add(execBtn, BorderLayout.SOUTH);

        resultTable = new JTable();
        JScrollPane tableScroll = new JScrollPane(resultTable);

        add(top, BorderLayout.NORTH);
        add(tableScroll, BorderLayout.CENTER);
    }

    private void onExecute(ActionEvent e) {
        String sql = sqlArea.getText().trim();
        if (sql.isEmpty()) return;

        try (Statement st = conn.createStatement()) {
            boolean isResultSet = st.execute(sql);
            if (isResultSet) {
                try (ResultSet rs = st.getResultSet()) {
                    populateTable(rs);
                }
            } else {
                int updateCount = st.getUpdateCount();
                JOptionPane.showMessageDialog(this, "Statement executed. Affected rows: " + updateCount);
                resultTable.setModel(new DefaultTableModel());
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "SQL error: " + ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    private void populateTable(ResultSet rs) throws SQLException {
        ResultSetMetaData md = rs.getMetaData();
        int cols = md.getColumnCount();
        String[] colNames = new String[cols];
        for (int i = 0; i < cols; i++) colNames[i] = md.getColumnLabel(i + 1);

        DefaultTableModel model = new DefaultTableModel(colNames, 0);
        while (rs.next()) {
            Object[] row = new Object[cols];
            for (int i = 0; i < cols; i++) row[i] = rs.getObject(i + 1);
            model.addRow(row);
        }
        resultTable.setModel(model);
    }

    private boolean connect(String host, int port, String user, String password, String database) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url;
            if (database == null || database.isEmpty()) {
                url = String.format("jdbc:mysql://%s:%d?serverTimezone=UTC", host, port);
                conn = DriverManager.getConnection(url, user, password);
            } else {
                url = String.format("jdbc:mysql://%s:%d/%s?serverTimezone=UTC&allowMultiQueries=true", host, port, database);
                conn = DriverManager.getConnection(url, user, password);
            }
            return true;
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(this, "Connection failed: " + ex.getMessage(), "Connection Error", JOptionPane.ERROR_MESSAGE);
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
            if (!ok) System.exit(1);

            app.execBtn.setEnabled(true);
            app.setVisible(true);
        });
    }
}
