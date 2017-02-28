BIN1 := NoiseDirectionalityList
BIN2 := ExtractRayleighStrengthVariation
BINall := $(BIN1) $(BIN2)

all : $(BINall)

CC := g++
cflags := -std=c++11 -O3 -fopenmp -lSacRec -lfftw3 -I/projects/howa1663/local/fftw-3.3.5/include

LIBS = -lstdc++ -O3 -fopenmp -lfftw3 -L/projects/howa1663/local/fftw-3.3.5/lib #-lSacRec
OBJS= SacRec.o

# --- main rules --- #
define make-bin
$(1) : $(OBJS) $(1).o
	$(CC) $$^ -o $$@ $(LIBS)
endef
$(foreach bin,$(BINall),$(eval $(call make-bin,$(bin))))

# --- .cpp rules with dependencies assembled by gcc --- #
define make-cpp
$(shell $(CC) $(cflags) -MM -MT $(patsubst %.cpp,%.o,$(1)) $(1) | tr -d '\\\n' | awk '{print}' )
	$(CC) $(cflags) -c $$< -o $$@
endef
MOD_DIRS = .
FSRC = $(foreach moddir,$(MOD_DIRS) .,$(wildcard $(moddir)/*.cpp))
$(foreach fcpp,$(FSRC),$(eval $(call make-cpp,$(fcpp))))
