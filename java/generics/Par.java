public class Par < T > {
    private T a,b;

    public Par(T a, T b){
        this.a = a;
        this.b = b;
    }

    public String toString(){
        return "(" + a + "," + b + ")";
    }
}
