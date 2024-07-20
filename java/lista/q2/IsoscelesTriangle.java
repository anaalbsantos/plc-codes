public class IsoscelesTriangle implements Shape{
    private double base;
    private double height;

    public IsoscelesTriangle(double base, double height) {
        this.base = base;
        this.height = height;
    }

    public double getBase() {
        return base;
    }

    public double getHeight() {
        return height;
    }

    public double calculateArea() {
        return (base * height) / 2;
    }

    public double calculatePerimeter() {
        return base + 2 * Math.sqrt(Math.pow(base / 2, 2) + Math.pow(height, 2));
    }
}
