public class Main {
    public static void main(String[] args) {
        //iniciando jogo
        Game game = new Game(10);

        // um carro simples e um híbrido
        Car simpleCar = new Car("1", 100.0, 100.0);
        HybridCar hybridCar = new HybridCar("2", 200.0, 200.0, "terrestre");

        // adicionando carros ao jogo
        game.addCar(simpleCar);
        game.addCar(hybridCar);
        
        // atualizar max_speed de um dos carros do jogo
        System.out.println("Velocidade maxima inicial do carro simples: " + simpleCar.getMaxSpeed());
        simpleCar.setMaxSpeed(180.0);
        System.out.println("Velocidade maxima final do carro simples: " + simpleCar.getMaxSpeed());


        // atualizar estado ded um carro híbrido
        System.out.println("Estado inicial do carro híbrido: " + hybridCar.getState());
        hybridCar.changeState();
        System.out.println("Estado final do carro híbrido: " + hybridCar.getState());

        // remover carro simples do jogo
        game.showCars();
        game.removeCar("4");
        System.out.println("Carro simples removido do jogo! ");
        game.showCars();
    }

}
