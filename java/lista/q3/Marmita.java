import java.util.*;

public abstract class Marmita {
    private Map<Ingrediente, Integer> ing;
    private int i = 0;
    private int custo = 0;
    private int countProt = 0, countCarb = 0, countVit = 0, countMol = 0;
    
    public Marmita() {
        this.ing = new HashMap<>();
    }
    
    public Map<Ingrediente, Integer> getIng() {
        return ing;
    }

    public int getI() {
        return i;
    }

    public int getCusto() {
        return custo;
    }

    public void insertIng(Ingrediente ing, int qtd){
        // checagem do limite da quantidade/ingrediente
        if(qtd < 1 || qtd > 99){
            System.out.println("Quantidade de ingrediente inválida");
            return;
        }

        // checagem do limite de ingredientes
        if(ing.getType() == "Proteína") countProt++;
        if(ing.getType() == "Carboidrato") countCarb++;
        if(ing.getType() == "Vitamina") countVit++;
        if(ing.getType() == "Molho") countMol++;

        if(countProt > 3 || countCarb > 3 || countVit > 3 || countMol > 3){
            System.out.println("Só é possível adicionar até 3 ingredientes de cada tipo");
            return;
        }

        // inserção do ingrediente
        this.ing.put(ing, qtd);
        custo += qtd * ing.getPrice();
        i++;
    }


    public abstract boolean validation();
    
}
