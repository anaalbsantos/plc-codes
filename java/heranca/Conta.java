public class Conta {
    private String numero;
    private double saldo;

    public Conta(String numero, double saldo) {
        this.numero = numero;
        this.saldo = saldo;
    }

    public Conta(String numero) {
        this(numero, 0.0);
    }

    public void depositar(double valor) {
        saldo += valor;
    }

    public void creditar(double valor) {
        saldo -= valor;
    }

    public double getSaldo() {
        return saldo;
    }

    public String getNumero() {
        return numero;
    }

}