public class Token {
    String token;
    String lexeme;
    int line;

    Token(String token, String lexeme, int line) {
        this.token = token;
        this.lexeme = lexeme;
        this.line = line;
    }

    public String getToken() {
        return this.token;
    }

    public String getLexeme() {
        return this.lexeme;
    }

    public int getLine() {
        return this.line;
    }

}
