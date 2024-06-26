public class Main {
    public static void main(String[] args) {
        ContaAbstrata c1 = new Conta("123");
        ContaAbstrata c2 = new ContaImposto("456");
        c1.creditar(100);
        c2.creditar(100);
        c1.debitar(50);
        c2.debitar(50);
        System.out.println(c1.getSaldo());
        System.out.println(c2.getSaldo());
    }
}
