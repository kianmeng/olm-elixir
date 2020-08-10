UNAME := $(shell uname -s)

# Creates directory for object files.
$(shell mkdir priv/native)

ifeq ($(UNAME), Linux) 
ERL_INCLUDE_PATH=$ERL_ROOT/usr/include/

all::
	cc -fPIC -shared -I$(ERL_INCLUDE_PATH) \
		-o priv/native/olm_nifs.so native/src/olm_nifs.c -lolm
endif

ifeq ($(UNAME), Darwin) 
ERL_INCLUDE_PATH=$(ERL_ROOT)/include

all::
	cc -fPIC -shared -I$(ERL_INCLUDE_PATH) \
		-dynamiclib -undefined dynamic_lookup \
		-o priv/native/olm_nifs.so native/src/olm_nifs.c -lolm
endif
