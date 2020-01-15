(* 
 ** Project : atsaudio
 ** Author  : Mark Bellaire
 ** Year    : 2020
 ** License : BSD3
*)
#ifndef _ATSAUDIO_INFIX_HATS
#define _ATSAUDIO_INFIX_HATS

infixr -->
#define --> audioproc_cons
#define OUT audioproc_out
#define DYN audionode_dyn
#define PURE audionode_pure
#define PAR audionode_par
#define SING audionode_sing
#define REC audionode_rec
#define IF  audionode_if

infixr :::
#define ::: audioproc_list_cons 
#define apnil audioproc_list_nil 

(** Additional bitwise ops **)
infixl lhas
infixl landnot

#endif
