public class TestaConta {
    public static void main(String[] args) {
        Conta c = new Conta("123", 100.0);
        c.depositar(50.0);
        c.creditar(20.0);
        System.out.println(c.getSaldo());
    }
}
