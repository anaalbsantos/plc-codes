public class Game {
    private Car[] cars;
    private int index;

    public Game(int size) { //recebe quantidade máxima de carros no jogo
        cars = new Car[size];
        index = 0;
    }

    public void showCars() {
        for (int i = 0; i < index; i++) {
            System.out.println( "Carro "+ i + ": " + cars[i].getClass());
        }
    }

    public int getIndex() {
        return index;
    }
    // adicionar carro de acordo com id
    public void addCar(Car car) {
        cars[index++] = car;
    }
    // remover carro de acordo com id
    public void removeCar(String id) {
        int found = -1;
        for (int i = 0; i < index; i++) {
            if (cars[i].getId().equals(id)) {
                found = i;
                break;
            }
        }

        if(found != -1) {
            for (int i = found; i < index - 1; i++) {
                cars[i] = cars[i + 1];
            }
            index--;
        }else {
            throw new IllegalArgumentException("Carro não encontrado!");
        }
    }
}
