# ================================= Target =================================== #
NAME				:= ft_turing

# ================================ Sources =================================== #

VPATH				:= src
SRC					:= types.ml parser.ml utils.ml machine.ml main.ml
SRCI				:= types.mli parser.mli utils.mli machine.mli main.mli

OCAMLC  		:= ocamlfind ocamlc
OCAMLOPT		:= ocamlfind ocamlopt
OBJI				:= $(addprefix obj/,$(notdir $(SRCI:.mli=.cmi)))
OBJX				:= $(addprefix obj/,$(notdir $(SRC:.ml=.cmx)))
FLAGS 			:= -package yojson -linkpkg -I src -I obj 

# ================================ Rules ===================================== #

.SILENT:

NATIVE_EXE	:=	$(NAME)

all: $(NATIVE_EXE)

$(NATIVE_EXE): $(OBJI) $(OBJX) 
	@$(OCAMLOPT) $(FLAGS) -o $@ $(OBJX)
	@echo "ft_turing is compiled"

obj/%.cmi: %.mli | obj
	$(OCAMLC) $(FLAGS) -c $< -o $@

obj/%.cmx: %.ml obj/%.cmi | obj
	$(OCAMLOPT) $(FLAGS) -c $< -o $@

obj/%.cmi: %.ml
	$(OCAMLC) $(FLAGS) -c $< -o $@

obj:
	mkdir -p obj

install deps:
	opam install --deps-only .
	eval $(opam env)

re : clean all

clean:
	rm -rf obj
	@echo "object files are removed"

fclean: clean
	rm -f $(NAME)
	echo "ft_turing is removed"

.PHONY: all install deps clean fclean re

# ocamlfind ocamlc -package yojson -linkpkg -I src -I obj -i src/parser.ml > src/parser.mli