import java.util.List;

public class Pedido {
    private String clienteId;
    private List<Marmita> m;
    private List<Integer> qtd;

    public Pedido(String clienteId, List<Marmita> m, List<Integer> qtd) {
        this.clienteId = clienteId;
        this.m = m;
        this.qtd = qtd;
    }

    public String getClienteId() {
        return clienteId;
    }

    public List<Marmita> getM() {
        return m;
    }

    public List<Integer> getQtd() {
        return qtd;
    }
}
