package com.senpure.antlr;

import com.senpure.antlr.java8.Java8Lexer;
import com.senpure.antlr.java8.Java8Parser;
import com.senpure.antlr.out.*;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.ParseTreeWalker;
import org.junit.Test;

import java.io.IOException;

/**
 * AntlrTest
 *
 * @author senpure
 * @time 2019-05-10 09:44:19
 */
public class AntlrTest {

    Lexer lexer;
    IoParser parser;


    private void before() throws IOException {
        lexer = new IoLexer(CharStreams.fromStream(getClass().
                getResourceAsStream("/com/senpure/antlr/hello.io")));
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        parser = new IoParser(tokens);
    }

    @Test
    public void ioWalk() throws IOException {
        before();

        parser.addErrorListener(new DiagnosticErrorListener(false));


        ParseTreeWalker walker = new ParseTreeWalker();
        IoListener listener = new IoBaseListener();
        walker.walk(listener, parser.protocol());


    }

    @Test
    public void ioVisit() throws IOException {
        before();
        parser.addErrorListener(new DiagnosticErrorListener());
        IoBaseVisitor visitor = new IoBaseVisitor();
        System.out.println(  visitor.visit(parser.protocol()));
    }

    @Test
    public void java8() throws IOException {
        Lexer lexer = new Java8Lexer(CharStreams.fromStream(getClass().
                getResourceAsStream("/com/senpure/antlr/Boot.java")));
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        Java8Parser parser = new Java8Parser(tokens);
        System.out.println(parser);
        //  parser.addErrorListener(new DiagnosticErrorListener());
        parser.setErrorHandler(new BailErrorStrategy());


        System.out.println(parser.typeName());
    }

    public static void main(String[] args) throws IOException {
        AntlrTest antlrTest = new AntlrTest();
        System.out.println("===");
    }
}
