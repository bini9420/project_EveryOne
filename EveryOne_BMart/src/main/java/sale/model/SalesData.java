package sale.model;

public class SalesData {
    private String month;
    private double totalSales;

    public SalesData(String month, double totalSales) {
        this.month = month;
        this.totalSales = totalSales;
    }

    // Getters and setters
    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public double getTotalSales() {
        return totalSales;
    }

    public void setTotalSales(double totalSales) {
        this.totalSales = totalSales;
    }
}
