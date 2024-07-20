
public class MarmitaDoDia extends MarmitaTerceiros {
    private double descount;

    public MarmitaDoDia(double descount) {
        super();
        this.descount = descount;
    }

    public double getDescount() {
        return descount;
    }

    public boolean finalValidation() {
        boolean valid = false;
    
        if(validation()){ 
            if(descount >= 0.1 && descount <= 0.75) valid = true;
            else System.out.println("Desconto inválido");
        } 

        return valid;
    }

    public double finalPrice() {
        return getCusto() - getCusto() * descount;
    }
    
}
