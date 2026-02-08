import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    public void setFareID(int fareID) {
        this.fareID = fareID;
    }

    public String getFareCategory() {
        return fareCategory;
    }

    public void setFareCategory(String fareCategory) {
        this.fareCategory = fareCategory;
    }

    public String getRiderCategory() {
        return riderCategory;
    }

    public void setRiderCategory(String riderCategory) {
        this.riderCategory = riderCategory;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    // Database Operations
    public static List<Fare> fetchAllFares(Connection conn) throws SQLException {
        List<Fare> fares = new ArrayList<>();
        String query = "SELECT * FROM Fare";
        
        try (Statement st = conn.createStatement(); ResultSet rs = st.executeQuery(query)) {
            while (rs.next()) {
                Fare fare = new Fare(
                    rs.getInt("fareID"),
                    rs.getString("fareCategory"),
                    rs.getString("riderCategory"),
                    rs.getDouble("price")
                );
                fares.add(fare);
            }
        }
        return fares;
    }

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

    public static ResultSetMetaData getFareTableMetadata(Connection conn) throws SQLException {
        String query = "SELECT * FROM Fare LIMIT 0";
        try (Statement st = conn.createStatement(); ResultSet rs = st.executeQuery(query)) {
            return rs.getMetaData();
        }
    }
}
