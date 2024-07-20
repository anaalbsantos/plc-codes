public class Main {
    public static void main(String[] args) {
        Pilha<Par<Character>> p1 = new Pilha<Par<Character>>(10);
        p1.push(new Par<Character>('a', 'z'));
        p1.push(new Par<Character>('b', 'r'));
        p1.push(new Par<Character>('K', 'A'));

        System.out.println(p1.pop() + "\n" + p1.pop() + "\n" + p1.pop());

    }
}
