package com.senpure.antlr.out;

import org.antlr.v4.runtime.BailErrorStrategy;
import org.antlr.v4.runtime.Parser;
import org.antlr.v4.runtime.RecognitionException;
import org.antlr.v4.runtime.Token;

/**
 * IoErrorStrategy
 *
 * @author senpure
 * @time 2019-05-10 16:13:31
 */
public class IoErrorStrategy extends BailErrorStrategy {

    @Override
    public Token recoverInline(Parser recognizer) throws RecognitionException {


        System.out.println("recoverLine");
        return super.recoverInline(recognizer);
    }

    @Override
    public void recover(Parser recognizer, RecognitionException e) {
        System.out.println("recover");
        super.recover(recognizer, e);
    }

}
