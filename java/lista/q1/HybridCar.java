public class HybridCar extends Car{
    private String state; // pode ser "terrestre" ou "aquatico"

    public HybridCar(String id, double max_speed, double power, String state) {
        super(id, max_speed, power);
        this.state = state;
    }

    public String getState() {
        return state;
    }

    public void changeState() {
        if (state.equals("terrestre")) {
            state = "aquatico";
        } else {
            state = "terrestre";
        }
    }
}
