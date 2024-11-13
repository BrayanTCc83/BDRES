.PHONY: build test

# Carpetas de recursos
DIST_DIR=dist
SRC_DIR=src
BASES_DATOS=$(addprefix $(SRC_DIR)/basedatos/, permisos procedimientos roles tablas tipos usuarios vistas)
ENCRIPTACION=$(SRC_DIR)/encriptacion
ESTRUCTURAS=$(addprefix $(SRC_DIR)/estructuras/, arboles listas mapas)
LENGUAJES=$(addprefix $(SRC_DIR)/lenguaje/, gramatica interprete)
OBJETOS=$(SRC_DIR)/objetos
CABECERAS=$(SRC_DIR)/cabecera
TEST=$(SRC_DIR)/test/main.c
BUILD=$(SRC_DIR)/build/main.c
# Nombre del archivo de salida
OUTPUT=$(DIST_DIR)/BDRES

test: $(OUTPUT)_test
	@echo Ejecutando programa.
	./$(OUTPUT)
	@echo Ejecucion de prueba finalizada.

$(OUTPUT)_test: $(addsuffix /*.c, $(BASES_DATOS) $(ENCRIPTACION) $(ESTRUCTURAS) $(LENGUAJES) $(OBJETOS)) $(TEST) | $(DIST_DIR)
	@echo Compilando programa.
	gcc -o $(OUTPUT) $(addsuffix /*.c, $(BASES_DATOS) $(ENCRIPTACION) $(ESTRUCTURAS) $(LENGUAJES) $(OBJETOS)) $(TEST) -L$(HEADERS) -lm

build: $(OUTPUT)
	@echo La compilacion ha sido terminada.

$(OUTPUT): $(addsuffix /*.c, $(BASES_DATOS) $(ENCRIPTACION) $(ESTRUCTURAS) $(LENGUAJES) $(OBJETOS)) $(BUILD) | $(DIST_DIR)
	@echo Compilando programa.
	gcc -o $(OUTPUT) $(addsuffix /*.c, $(BASES_DATOS) $(ENCRIPTACION) $(ESTRUCTURAS) $(LENGUAJES) $(OBJETOS)) $(BUILD) -L$(HEADERS) -lm

$(DIST_DIR):
	@echo Creando carpeta $(DIST_DIR).
	mkdir $(DIST_DIR)