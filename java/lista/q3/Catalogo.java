import java.util.*;

public class Catalogo <T> {
    private Map<String, List<T>> marmitas;

    public Catalogo() {
        this.marmitas = new HashMap<>();
    }

    public Map<String, List<T>> getMarmitas() {
        return marmitas;
    }
}
