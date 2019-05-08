grammar Io;

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
    :fieldType 'd' ';'
;
messageType
    :'CS'
    |'SC'
    ;
number
    :
    ;

message
    :messageType number '{'
     field*
    '}';

WS : [ \t\r\n]+ -> skip ;




