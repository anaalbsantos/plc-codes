import java.util.*;

public class MarmitaDoCliente extends Marmita {
    
    public MarmitaDoCliente() {
        super();
    }

    public boolean validation() {
        boolean valid = false;
        
        if(getI() >= 1) {
            int count = 0;
            Map<Ingrediente,Integer> ing = super.getIng();

            for(Ingrediente i : ing.keySet()) {
                if(i.getType().equals("Molho")) {
                    count++;
                }
            }

            if(count == getI()) {
                System.out.println("Marmita do cliente não pode conter apenas molho");
            } else {
                valid = true;
            }
        } else System.out.println("Marmita do cliente deve conter pelo menos um ingrediente");
        

        return valid;
    }
}
