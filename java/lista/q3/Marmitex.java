import java.util.*;

public class Marmitex {
    private List<Ingrediente> ing;
    private Catalogo<MarmitaTerceiros> mT;
    private Catalogo<MarmitaDoDia> mD;
    private Queue<Pedido> fila;

    public Marmitex() {
        createTable();
        mT = new Catalogo<>();
        mD = new Catalogo<>();
        fila = new LinkedList<>();
    }

    private void createTable(){
        ing = new ArrayList<>(12);
        ing.add(new Ingrediente("Bife", 8, "Proteína"));
        ing.add(new Ingrediente("Frango", 5, "Proteína"));
        ing.add(new Ingrediente("Peixe", 6, "Proteína"));
        ing.add(new Ingrediente("Arroz", 3, "Carboidrato"));
        ing.add(new Ingrediente("Macarrão", 4, "Carboidrato"));
        ing.add(new Ingrediente("Feijão", 4, "Carboidrato"));
        ing.add(new Ingrediente("Tomate", 4, "Vitamina"));
        ing.add(new Ingrediente("Alface", 3, "Vitamina"));
        ing.add(new Ingrediente("Pepino", 4, "Vitamina"));
        ing.add(new Ingrediente("Azeite", 2, "Molho"));
        ing.add(new Ingrediente("Pimenta", 3, "Molho"));
        ing.add(new Ingrediente("Mostarda", 3, "Molho"));
    }

    public Ingrediente getIng(String name){
        for(Ingrediente i : ing){
            if(i.getName().equals(name)) return i;
        }
        return null;
    }

    public void InserirMarmitaDeTerceiros(String loja,Marmita m){
        if(m instanceof MarmitaTerceiros && m.validation()){
            if(mT.getMarmitas().containsKey(loja)){
                mT.getMarmitas().get(loja).add((MarmitaTerceiros) m);
            }else{
                List<MarmitaTerceiros> l = new ArrayList<>();
                l.add((MarmitaTerceiros) m);
                mT.getMarmitas().put(loja,l);
            }
            System.out.println("Marmita de terceiros inserida com sucesso!!");

        }else System.out.println("Marmita de terceiros inválida");
    }

    public void InserirMarmitaDoDia(String loja,Marmita m){
        // if(m instanceof MarmitaDoDia && ((MarmitaDoDia) m).finalValidation()){
        //     mD.getMarmitas().add((MarmitaDoDia) m);
        //     l.updateQtd_max_mD();
        //     System.out.println("Marmita do dia inserida com sucesso!!");

        // }else System.out.println("Marmita do dia inválida");
    }

    // public void InserirMarmitaDoCliente(ClienteID,Marmita){
    //     // Inserir marmita do cliente na loja
    // }

    public Catalogo<MarmitaDoDia> ConsultaDoDia(){
        // System.out.println("------ MARMITAS DO DIA ------");
        
        // for(MarmitaDoDia m : mD.getMarmitas()){
        //     for(Ingrediente i : m.getIng()){
        //         System.out.println("  " + i.getName() + " " + i.getQtd());
        //     }
            
        //     System.out.println("  Desconto: " + m.getDescount() + "\n");

        // }
    
        // System.out.println("-----------------------------");

        return mD;
    }

    public Catalogo<MarmitaTerceiros> ConsultaDeTerceiros(){
        // System.out.println("--- MARMITAS DE TERCEIROS ---");
        // for(MarmitaTerceiros m : mT.getMarmitas()){
            
        //     for(Ingrediente i : m.getIng()){
        //         System.out.println("  " + i.getName() + " " + i.getQtd());
        //     }

        // }
        // System.out.println("-----------------------------");
        
        return mT;
    }

    public void SimularPedido(String ClienteID,List<Marmita> lM,List<Integer> lI) {
        // Inserir pedido na fila
        Pedido p = new Pedido(ClienteID,lM,lI);
        fila.add(p);

        // removendo quantidades dos catálogos
        for(int i = 0; i < lM.size(); i++){
            if(lM.get(i) instanceof MarmitaDoDia){
                mD.getMarmitas().remove(lM.get(i));
            }else{
                mT.getMarmitas().remove(lM.get(i));
            }
        }  

    }

    

    public static void main(String[] args) {
        // Marmitex m = new Marmitex();
        // Loja l = new Loja("Loja 1");
        // MarmitaTerceiros mT = new MarmitaTerceiros();
        // mT.insertIng(m.getIng("Bife"), 2);
        // mT.insertIng(m.getIng("Arroz"), 1);
        // mT.insertIng(m.getIng("Tomate"), 1);
        // MarmitaDoDia mD = new MarmitaDoDia(0.5);
        // mD.insertIng(m.getIng("Frango"), 2);
        // mD.insertIng(m.getIng("Macarrão"), 1);
        // mD.insertIng(m.getIng("Alface"), 1);

        // m.InserirMarmitaDeTerceiros(l, mT);
        // m.InserirMarmitaDoDia(l, mD);
        // m.ConsultaDoDia();
        // m.ConsultaDeTerceiros();
    }
}
