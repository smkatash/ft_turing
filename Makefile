# ================================= Target =================================== #
NAME		:= ft_turing

# ================================ Sources =================================== #

VPATH		:= src
SRC			:= types.ml main.ml parser.ml 

OCAMLC  := ocamlfind ocamlc -package yojson -linkpkg
OBJ			:= $(addprefix obj/,$(notdir $(SRC:.ml=.cmo)))

# ================================ Rules ===================================== #
all: $(NAME)

$(NAME): $(OBJ)
		$(OCAMLC) $(OBJ) -o $(NAME)

obj/%.cmo: %.ml | obj
		$(OCAMLC) -o $@ -c $< 

obj:
		mkdir -p obj

clean:
	rm -f *.cmo *.o
	rm -rf obj

fclean: clean
	rm -f $(NAME)