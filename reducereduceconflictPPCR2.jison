%lex
%%
\s+                                  {}
[a-zA-Z_]\w*(?=\s*[:])               { return 'NAME'; }
[a-zA-Z_]\w*(?=\s*","\s*[a-zA-Z_])   { return 'NAME'; }
[a-zA-Z_]\w*                         { return 'TYPE'; }
.                                    { return yytext; }
/lex

%token ID

%%
s:           s ';' def | def
        ;
def:    param_spec return_spec ',' 
           { 
              console.log("accepted\n"+yy.lexer.showPosition());
           }
        ;
param_spec:
             type
        |    name_list ':' type
        ;
return_spec:
             type
        |    name ':' type
        ;
type:        
             TYPE
        ;
name:        
             NAME
        ;
name_list:
             name
        |    name ',' name_list
        ;
%%



