import java.nio.charset.StandardCharsets;
import java.util.Hashtable;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.PrintStream;
import java.io.UnsupportedEncodingException;

public class TokenTable {
    private Hashtable<String, Token> tokenList = new Hashtable<>();
    
    public TokenTable() {
    }

    public void scanFile(String filePath) {
        try {
            BufferedReader buffer = new BufferedReader(new FileReader(filePath));
            LexScanner scanner = new LexScanner(buffer);

            Token token = scanner.yylex();

            while (token != null) {

                if (this.tokenList.get(token.getLexeme()) == null){
                    this.tokenList.put(token.getLexeme(), token);
                } else {
                    int line = (int) token.occurrencies.keySet().toArray()[0];
                    tokenList.get(token.getLexeme()).insertOccurrenceLine(line);
                }
                token = scanner.yylex();
            }
        } catch (Exception e) {
            System.out.println(e.getStackTrace());
        }
    }

    public void printTable() {
        System.out.println("╔═══════════════════════════════════════════════════════════════════════════════════════════════╗");
        System.out.println("║                                       TABLE DE TOKEN                                          ║");
        System.out.println("╠═══════════════╦═════════════════════════════════════╦═════════════════════════════════════════╣");
        System.out.println("║ Lexema        ║ Token                               ║ Linea                                   ║");

        for (String key : this.tokenList.keySet()) {
            String lexeme = this.tokenList.get(key).getLexeme();
            lexeme += getNSpaces(13 - lexeme.length());
            String token = this.tokenList.get(key).getToken();
            token += getNSpaces(35 - token.length());
            String line = this.tokenList.get(key).getStringOccurrences();
            line += getNSpaces(39 - line.length());
            String str = "║ " + lexeme + " ║ " + token + " ║ " + line + " ║";
            System.out.println("╠═══════════════╬═════════════════════════════════════╬═════════════════════════════════════════╣");
            System.out.println(str);
        }
        System.out.println("╚═══════════════╩═════════════════════════════════════╩═════════════════════════════════════════╝");
    }

    private String getNSpaces(int n) {
        String str = "";
        for (; n > 0; n--) {
            str += " ";
        }
        return str;
    }
}
