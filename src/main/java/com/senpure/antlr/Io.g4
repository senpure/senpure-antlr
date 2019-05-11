grammar Io;
protocol
    :
    entity*EOF
    ;
entity:message|event|bean;
message
    : Message MessageType Identifier ProtocolId '{'
     field*
    '}';
event
    :Event  Identifier ProtocolId '{'
     field*
   '}'
   ;
bean
    :Bean Identifier '{'
     field*
    '}'
    ;

fieldType
    :'int'
    |'long'
    |'sint'
    |'slong'
    |'sfixed32'
    |'sfixed64'
    |'float'
    |'double'
    |'boolean'
    |'String'
    ;

field
    :fieldType Identifier ';'LINE_COMMENT?
    ;
Message:M E S S A G E;
Event:E V E N T;
Bean: B E A N;
MessageType:C S|S C;
ProtocolId:INT ;
Identifier
    	:	IoLetter IoLetterOrDigit*
    	;
fragment
IoLetter:	[a-zA-Z_] ;
fragment
IoLetterOrDigit
    :	[a-zA-Z0-9_]
    ;
fragment INT: [0-9]+ ;
fragment DIGIT : [0-9];

fragment A : [aA];
fragment B : [bB];
fragment C : [cC];
fragment D : [dD];
fragment E : [eE];
fragment F : [fF];
fragment G : [gG];
fragment H : [hH];
fragment I : [iI];
fragment J : [jJ];
fragment K : [kK];
fragment L : [lL];
fragment M : [mM];
fragment N : [nN];
fragment O : [oO];
fragment P : [pP];
fragment Q : [qQ];
fragment R : [rR];
fragment S : [sS];
fragment T : [tT];
fragment U : [uU];
fragment V : [vV];
fragment W : [wW];
fragment X : [xX];
fragment Y : [yY];
fragment Z : [zZ];


//WS      :  [ \t\r\n\u000C]+ -> skip ;
WS      :  [ \t\r\n]+ -> skip ;
COMMENT :   '/*' .*? '*/';
LINE_COMMENT:   '//' ~[\r\n]*;
/*
LINE_COMMENT
    :'//' .*? '\r'? '\n'//匹配//于换行中间的所有字符
    ;
*/




