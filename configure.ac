AC_PREREQ(2.52)

AC_INIT([Apertium Livvi], [0.0.0], [flammie@iki.fi], [apertium-olo], [https://wiki.apertium.org/wiki/Apertium-olo])
AM_INIT_AUTOMAKE

AC_PROG_LN_S
AC_PROG_AWK

m4_define([required_apertium_version], [3.4.0])
m4_define([required_lttoolbox_version], [3.3.2])

PKG_CHECK_MODULES(APERTIUM, apertium >= required_apertium_version)
PKG_CHECK_MODULES(LTTOOLBOX, lttoolbox >= required_lttoolbox_version)

AC_PATH_PROG([ZCAT], [zcat])
AC_PATH_PROG([CGCOMP], [cg-comp], [false], [$PATH$PATH_SEPARATOR$with_cg_comp/bin])
AS_IF([test x$CGCOMP = xfalse], [AC_MSG_ERROR([You don't have cg-comp installed])])

PKG_CHECK_MODULES([GIELLA_OLO], [giella-olo])
AC_SUBST([AP_LIB], [`pkg-config --variable=dir giella-olo`])
AC_SUBST([AP_SRC], [`pkg-config --variable=srcdir giella-olo`])
PKG_CHECK_MODULES(REGTEST, apertium-regtest >= 0.0.1, [],
                  [AC_MSG_WARN([Running tests requires apertium-regtest])])

AP_MKINCLUDE

AC_OUTPUT([Makefile apertium-olo.pc])

