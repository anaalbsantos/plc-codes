public class Pilha < T > {
    private int max, topo;
    private T[] elements;

    public Pilha(int max){
        topo = -1;
        this.max = max;
        elements = ( T[] ) new Object[max];
    }

    public void push(T e) throws Error{
        if(topo < (max - 1)) elements[++topo] = e;
        else throw new Error();
    }

    public T pop() throws Error{
        if(topo >= 0) return elements[topo--];
        else throw new Error();
    }
}
