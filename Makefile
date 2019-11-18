include commands.mk

.PHONY: all clean

all: $(dffeas_objs)
	$(check_eq)
clean:
	rm -rf *.log

$(dffeas_objs):
	$(CMD_EQUIV) | tee $(OBJ)
