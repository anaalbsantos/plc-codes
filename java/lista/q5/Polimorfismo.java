public interface Polimorfismo {
    /*
    O polimorfismo de sobrescrita pode ser aplicado tanto diante da herança de classes concretas quanto de classes
    abstratas ou interfaces. Portanto, já que é possível sobrescrever comportamentos em todos os casos, quando é 
    necessário tornar um método concreto em um método abstrato ou criar uma interface?
    */

    // Resposta: Um método abstrato é usado quando quer-se implentar parcialmente uma classe, ou seja, quando é feita
    // a implementação de alguns métodos e outros não. Isso porque, as classes que herdam de uma classe abstrata possuem
    // características em comum, que serão os métodos implementados na classe abstrata, e características específicas, que
    // serão os métodos abstratos. Já uma interface é usada quando quer-se definir um contrato, ou seja, um conjunto de
    // atributos e/ou métodos que uma classe deve implementar obrigatoriamente. No entanto, a interface em si não possui a
    // implementação de métodos, apenas suas assinaturas. Além disso, uma classe pode implementar várias interfaces, mas só
    // pode herdar de uma classe abstrata. Portanto, a escolha entre um método abstrato e uma interface depende do contexto
    // em que serão utilizados.


}
