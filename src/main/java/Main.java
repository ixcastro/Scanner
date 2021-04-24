
public class Main {

    private static String filePath = "Prueba3.txt";

    public static void main(String[] args) {
        TokenTable tokenTable = new TokenTable();
        tokenTable.scanFile(filePath);
        tokenTable.printTokenTable();
        tokenTable.printErrorTable();
    }
}
