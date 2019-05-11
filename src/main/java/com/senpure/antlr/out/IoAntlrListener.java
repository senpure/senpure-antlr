package com.senpure.antlr.out;

/**
 * IoAntlrListener
 *
 * @author senpure
 * @time 2019-05-10 15:20:41
 */
public class IoAntlrListener extends  IoBaseListener {

   private  IoParser parser ;

    public IoAntlrListener(IoParser parser) {
        this.parser = parser;
    }

    @Override
    public void enterMessage(IoParser.MessageContext ctx) {
        System.out.println("enter message "+ctx.toStringTree(parser));
    }

    @Override
    public void exitMessage(IoParser.MessageContext ctx) {

        System.out.println("exit message "+ctx.toStringTree(parser));
    }

    @Override
    public void enterProtocol(IoParser.ProtocolContext ctx) {
        System.out.println("enter protocol "+ctx.toStringTree(parser));
    }

    @Override
    public void exitProtocol(IoParser.ProtocolContext ctx) {
        System.out.println("exit protocol "+ctx.toStringTree(parser));
    }
}
