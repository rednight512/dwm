# dwm version
VERSION = 6.1

# Customize below to fit your system

# paths
PREFIX = /usr/pkg
MANPREFIX = ${PREFIX}/man

X11INC = /usr/X11R7/include
X11LIB = /usr/X11R7/lib

# Xinerama, comment if you don't want it
XINERAMALIBS  = -lXinerama
XINERAMAFLAGS = -DXINERAMA

#mpdclient
MPDINC = /usr/pkg/include
MPDLIB = /usr/pkg/lib

# freetype
FREETYPELIBS = -lfontconfig -lXft
FREETYPEINC != freetype-config --cflags
# OpenBSD (uncomment)
FREETYPEINC != freetype-config --cflags

# includes and libs
INCS = -I${X11INC} ${FREETYPEINC} -I${MPDINC} 
LIBS = -L${X11LIB} -lX11 ${XINERAMALIBS} ${FREETYPELIBS} -L${MPDLIB} -lmpdclient -R${X11LIB} -R${MPDLIB}

# flags
CPPFLAGS += -D_BSD_SOURCE -D_POSIX_C_SOURCE=2 -DVERSION=\"${VERSION}\" ${XINERAMAFLAGS}
#CFLAGS   = -g -std=c99 -pedantic -Wall -O0 ${INCS} ${CPPFLAGS}
CFLAGS += -std=c99 -pedantic -Wall -Wno-deprecated-declarations -Os ${INCS} ${CPPFLAGS}
LDFLAGS += -s ${LIBS}

# Solaris
#CFLAGS = -fast ${INCS} -DVERSION=\"${VERSION}\"
#LDFLAGS = ${LIBS}

# compiler and linker
CC = gcc
