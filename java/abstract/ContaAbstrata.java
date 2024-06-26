/*
    classe abstrata
    * criada para ser herdada
    * não pode ser instanciada (não pode ser criado um objeto a partir dela)
    * pode ter métodos abstratos ou concretos
    * pelo menos um método abstrato que é apenas declarado e não implementado
    * método protegido (protected) é acessado somente pela classe ou por classes filhas
 */
public abstract class ContaAbstrata {
    private String numero;
    private double saldo;

    public ContaAbstrata (String numero) {
        this.numero = numero;
        this.saldo = 0.0;
    }
    public void creditar(double valor) {
        this.saldo = this.saldo + valor;
    }
    public double getSaldo() {
        return this.saldo;
    }

    public String getNumero() {
        return this.numero;
    }
    protected void setSaldo(double saldo) {
        this.saldo = saldo;
    }

    public abstract void debitar(double valor); // método abstrato
}
