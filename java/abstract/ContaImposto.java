public class ContaImposto extends ContaAbstrata{
    private static final double TAXA = 0.001; //final indica que não será alterado (constante)
    public ContaImposto(String numero) {
        super(numero);
    }

    public void debitar(double valor) {
        double imposto = valor * TAXA;
        double total = valor + imposto;
        super.setSaldo(this.getSaldo() - total);
    }
}
