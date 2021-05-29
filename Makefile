.SUFFIXES : .c .o

CC = gcc

INC =
LIBS_SEM = synch_semaphore.h threading_variables.h
LIBS_MUTEX = synch_mutex.h threading_variables.h
CFLAGS = -g $(INC)

OBJ_SEM= synch_semaphore.o
SRC_SEM = synch_semaphore.c

OBJ_MUTEX= synch_mutex.o
SRC_MUTEX = synch_mutex.c

TARGET_SEM = synch_semaphore.exe
TARGET_MUTEX = synch_mutex.exe

all : $(TARGET_SEM) $(TARGET_MUTEX)

$(TARGET_SEM) : $(OBJ_SEM)
				$(CC) -pthread -o $@ $(OBJ_SEM) $(LIBS_SEM)
$(TARGET_MUTEX) : $(OBJ_MUTEX)
				$(CC) -pthread -o  $@ $(OBJ_MUTEX) $(LIBS_MUTEX)

dep :
				gccmakedep $(INC) $(SRC_SEM)
				gccmakedep $(INC) $(SRC_MUTEX)

clean :
				rm -rf $(OBJ_SEM) $(TARGET_SEM) core
				rm -rf $(OBJ_MUTEX) $(TARGET_MUTEX) core

new : 
				$(MAKE) clean
				$(MAKE)