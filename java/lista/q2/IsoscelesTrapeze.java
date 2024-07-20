public class IsoscelesTrapeze implements Shape{
    private double greater_base;
    private double smaller_base;
    private double height;

    public IsoscelesTrapeze(double greater_base, double smaller_base, double height) {
        this.greater_base = greater_base;
        this.smaller_base = smaller_base;
        this.height = height;
    }

    public double getGreaterBase() {
        return greater_base;
    }

    public double getSmallerBase() {
        return smaller_base;
    }

    public double getHeight() {
        return height;
    }

    public double calculateArea() {
        return ((greater_base + smaller_base) * height) / 2;
    }

    public double calculatePerimeter() {
        return greater_base + smaller_base + 2 * Math.sqrt(Math.pow((greater_base - smaller_base) / 2, 2) + Math.pow(height, 2));
    }

}
