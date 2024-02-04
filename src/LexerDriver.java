package src;

import java.io.FileReader;

public class LexerDriver {
    public static void main(String[] args) {
        try {
            MyLexer lexer = new MyLexer(new FileReader("src/grammar.txt"));
            TokenTypes token;

            while ((token = lexer.yylex()) != null) {
                System.out.println("Token: " + token);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
