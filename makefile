out: sql.tab.c lex.yy.c
	@cc -w -o out sql.tab.c lex.yy.c 
	@echo "Done Compiling run p5 arguments"
sql.tab.c: sql.y
	@bison -d sql.y
	@echo Just "Bisoned Now Compiling"
lex.yy.c: sql.lex
	@flex sql.lex
	@echo "Just Lexed now Bisoning"
all:
	@chmod +x *
