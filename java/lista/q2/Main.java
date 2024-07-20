public class Main {
    public static void main(String[] args) {
        Square sqr = new Square(5);
        IsoscelesTriangle trg = new IsoscelesTriangle(5, 3);
        IsoscelesTrapeze trp = new IsoscelesTrapeze(8, 6, 4);

        System.out.println("--- SQUARE ---");
        System.out.println("Side: " + sqr.side);
        System.out.println("Square area: " + sqr.calculateArea());
        System.out.println("Square perimeter: " + sqr.calculatePerimeter() + "\n");

        System.out.println("--- TRIANGLE ---");
        System.out.println("Base: " + trg.getBase());
        System.out.println("Height: " + trg.getHeight());
        System.out.println("Triangle area: " + trg.calculateArea());
        System.out.println("Triangle perimeter: " + trg.calculatePerimeter() + "\n");

        System.out.println("--- TRAPEZE ---");
        System.out.println("Greater base: " + trp.getGreaterBase());
        System.out.println("Smaller base: " + trp.getSmallerBase());
        System.out.println("Height: " + trp.getHeight());
        System.out.println("Trapeze area: " + trp.calculateArea());
        System.out.println("Trapeze perimeter: " + trp.calculatePerimeter());
        
    }
}
