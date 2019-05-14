package com.senpure.antlr.out;

/**
 * IoAntlrVisitor
 *
 * @author senpure
 * @time 2019-05-13 16:18:49
 */
public class IoAntlrVisitor<T> extends  IoBaseVisitor<T> {

    @Override
    public T visitMessage(IoParser.MessageContext ctx) {


        return super.visitMessage(ctx);
    }
}
