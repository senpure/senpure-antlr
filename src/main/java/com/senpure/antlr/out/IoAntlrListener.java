package com.senpure.antlr.out;

/**
 * IoAntlrListener
 *
 * @author senpure
 * @time 2019-05-10 15:20:41
 */
public class IoAntlrListener extends IoBaseListener {

    private IoParser parser;

    private StringBuilder sb = new StringBuilder();

    public IoAntlrListener(IoParser parser) {
        this.parser = parser;
    }



    @Override
    public void enterOtherIo(IoParser.OtherIoContext ctx) {
        System.out.println( methodName()+"  "+ctx.getText() );
    }

    @Override
    public void enterJavaPackage(IoParser.JavaPackageContext ctx) {
        parser.getCurrentToken().getLine();

        System.out.println( methodName()+"  "+ctx.getText()+"  " );
    }

    @Override
    public void enterModel(IoParser.ModelContext ctx) {
        System.out.println( methodName()+"  "+ctx.getText() );
    }

    @Override
    public void enterMessage(IoParser.MessageContext ctx) {

        System.out.println( methodName()+"  "+ctx.getText() );
    }

    public String methodName() {
        StackTraceElement[] stackTraceElements = Thread.currentThread().getStackTrace();
        return stackTraceElements[2].getMethodName();

    }

}
