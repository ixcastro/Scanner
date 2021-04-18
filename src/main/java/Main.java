
public class Main {

    private static String filePath = "prueba.txt";

    public static void main(String[] args) {
        TokenTable tokenTable = new TokenTable();
        tokenTable.scanFile(filePath);
        tokenTable.printTable();
    }
}
