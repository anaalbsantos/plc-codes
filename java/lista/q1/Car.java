public class Car {
    private String id;
    private double max_speed; // não pode ser negativo
    private double power; // não pode ser negativo

    public Car(String id, double max_speed, double power) {
        this.id = id;
        this.max_speed = max_speed;
        this.power = power;
    }

    public String getId() {
        return id;
    }

    public double getMaxSpeed() {
        return max_speed;
    }

    public double getPower() {
        return power;
    }

    public void setMaxSpeed(double max_speed) {
        this.max_speed = max_speed;
    }

    public void setPower(double power) {
        this.power = power;
    }
}
