# define the C compiler to use
CC = gcc
# define any compile-time flags
CFLAGS = -Wall -g

INCLUDES += -I./src/maxproto

SRCS = src/maxproto/max.c src/maxapp/maxapp.c

OBJS = $(SRCS:.c=.o)

MAIN = maxapp

#
# The following part of the makefile is generic; it can be used to 
# build any executable just by changing the definitions above and by
# deleting dependencies appended to the file from 'make depend'
#

 .PHONY: depend clean

all:    $(MAIN)
	@echo  maxapp has been compiled

$(MAIN): $(OBJS) 
	$(CC) $(CFLAGS) $(INCLUDES) -o $(MAIN) $(OBJS) $(LFLAGS) $(LIBS)

.c.o:
	$(CC) $(CFLAGS) $(INCLUDES) -c $<  -o $@

clean:
	$(RM) *.o *~ $(MAIN)

# DO NOT DELETE THIS LINE -- make depend needs it

