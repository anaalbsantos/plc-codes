import java.util.*;

public class MarmitaTerceiros extends Marmita {
    
    public MarmitaTerceiros() {
        super();
    }

    public boolean validation() {
        boolean valid = false;
        
        if(getI() >= 1) {
            Map<Ingrediente, Integer> ing = super.getIng();
            for(Ingrediente i  : ing.keySet()) {

                if(i.getType().equals("Proteína") || 
                   i.getType().equals("Carboidrato") || 
                   i.getType().equals("Vitamina") ||
                   i.getType().equals("Molho")){

                    valid = true;
                    break;
                    
                } else System.out.println("Marmita de terceiros deve conter pelo menos um ingrediente de algum tipo");

            }
        } else System.out.println("Marmita de terceiros deve conter pelo menos um ingrediente");
        

        return valid;
    }
    
}
