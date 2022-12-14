#!/bin/sed -Enuf

# Name    : sedmines.sed
# Purpose : Minesweeper game written in GNU sed
#
# Author  : KUSANAGI Mitsuhisa <mikkun@mbg.nifty.com>
# License : GPL-3.0-or-later <https://gnu.org/licenses/gpl.html>

# Usage : ./sedmines.sed

b loop

:menu

i\
\c[[1;1H\c[[2J\c[[7m 1 2 3 4 5 6 7 8 9 |   \c[[0m\
\c[[7m-------------------+---\c[[0m          \c[[7m sedmines \c[[0m\
 . . . . . . . . . \c[[7m| 1 \c[[0m\
 . . . . . . . . . \c[[7m| 2 \c[[0m\
 . . . . . . . . . \c[[7m| 3 \c[[0m\
 . . . . . . . . . \c[[7m| 4 \c[[0m\
 . . . . . . . . . \c[[7m| 5 \c[[0m        [difficulties]\
 . . . . . . . . . \c[[7m| 6 \c[[0m \c[[7m(n)\c[[0mormal -- default, 10 mines\
 . . . . . . . . . \c[[7m| 7 \c[[0m \c[[7m(h)\c[[0mard ------------- 15 mines\
 . . . . . . . . . \c[[7m| 8 \c[[0m \c[[7m(m)\c[[0maniac ----------- 20 mines\
 . . . . . . . . . \c[[7m| 9 \c[[0m\
\
please select a difficulty:

d

:setup

y/NHM/nhm/
s/[^nhm]//g
s/^$/n/

:reset

# 3 difficulties: normal (default), hard and maniac
/n$/ { x; s/$/n/; x; s/.*/ seq 81 | sed 's\/.*\/0\/;1,10s\/.*\/M\/' | shuf | sed -Ez 's\/\\n\/\/g;s\/(.{9})\/\\1\\n\/g' /e; }
/h$/ { x; s/$/h/; x; s/.*/ seq 81 | sed 's\/.*\/0\/;1,15s\/.*\/M\/' | shuf | sed -Ez 's\/\\n\/\/g;s\/(.{9})\/\\1\\n\/g' /e; }
/m$/ { x; s/$/m/; x; s/.*/ seq 81 | sed 's\/.*\/0\/;1,20s\/.*\/M\/' | shuf | sed -Ez 's\/\\n\/\/g;s\/(.{9})\/\\1\\n\/g' /e; }

s/^/0000000000\n/
s/$/\n0000000000/
s/\n/0\n0/g
s/\n//g

:scan_1_01; s/(....{8}.)0(..{8}..M)/\11\2/; t scan_1_01
:scan_1_02; s/(....{8}.)0(..{8}.M.)/\11\2/; t scan_1_02
:scan_1_03; s/(....{8}.)0(..{8}M..)/\11\2/; t scan_1_03
:scan_1_04; s/(....{8}.)0(M.{8}...)/\11\2/; t scan_1_04
:scan_1_05; s/(....{8}M)0(..{8}...)/\11\2/; t scan_1_05
:scan_1_06; s/(..M.{8}.)0(..{8}...)/\11\2/; t scan_1_06
:scan_1_07; s/(.M..{8}.)0(..{8}...)/\11\2/; t scan_1_07
:scan_1_08; s/(M...{8}.)0(..{8}...)/\11\2/; t scan_1_08

:scan_2_01; s/(....{8}.)[01](..{8}.MM)/\12\2/; t scan_2_01
:scan_2_02; s/(....{8}.)[01](..{8}M.M)/\12\2/; t scan_2_02
:scan_2_03; s/(....{8}.)[01](..{8}MM.)/\12\2/; t scan_2_03
:scan_2_04; s/(....{8}.)[01](M.{8}..M)/\12\2/; t scan_2_04
:scan_2_05; s/(....{8}.)[01](M.{8}.M.)/\12\2/; t scan_2_05
:scan_2_06; s/(....{8}.)[01](M.{8}M..)/\12\2/; t scan_2_06
:scan_2_07; s/(....{8}M)[01](..{8}..M)/\12\2/; t scan_2_07
:scan_2_08; s/(....{8}M)[01](..{8}.M.)/\12\2/; t scan_2_08
:scan_2_09; s/(....{8}M)[01](..{8}M..)/\12\2/; t scan_2_09
:scan_2_10; s/(....{8}M)[01](M.{8}...)/\12\2/; t scan_2_10
:scan_2_11; s/(..M.{8}.)[01](..{8}..M)/\12\2/; t scan_2_11
:scan_2_12; s/(..M.{8}.)[01](..{8}.M.)/\12\2/; t scan_2_12
:scan_2_13; s/(..M.{8}.)[01](..{8}M..)/\12\2/; t scan_2_13
:scan_2_14; s/(..M.{8}.)[01](M.{8}...)/\12\2/; t scan_2_14
:scan_2_15; s/(..M.{8}M)[01](..{8}...)/\12\2/; t scan_2_15
:scan_2_16; s/(.M..{8}.)[01](..{8}..M)/\12\2/; t scan_2_16
:scan_2_17; s/(.M..{8}.)[01](..{8}.M.)/\12\2/; t scan_2_17
:scan_2_18; s/(.M..{8}.)[01](..{8}M..)/\12\2/; t scan_2_18
:scan_2_19; s/(.M..{8}.)[01](M.{8}...)/\12\2/; t scan_2_19
:scan_2_20; s/(.M..{8}M)[01](..{8}...)/\12\2/; t scan_2_20
:scan_2_21; s/(.MM.{8}.)[01](..{8}...)/\12\2/; t scan_2_21
:scan_2_22; s/(M...{8}.)[01](..{8}..M)/\12\2/; t scan_2_22
:scan_2_23; s/(M...{8}.)[01](..{8}.M.)/\12\2/; t scan_2_23
:scan_2_24; s/(M...{8}.)[01](..{8}M..)/\12\2/; t scan_2_24
:scan_2_25; s/(M...{8}.)[01](M.{8}...)/\12\2/; t scan_2_25
:scan_2_26; s/(M...{8}M)[01](..{8}...)/\12\2/; t scan_2_26
:scan_2_27; s/(M.M.{8}.)[01](..{8}...)/\12\2/; t scan_2_27
:scan_2_28; s/(MM..{8}.)[01](..{8}...)/\12\2/; t scan_2_28

:scan_3_01; s/(....{8}.)[0-2](..{8}MMM)/\13\2/; t scan_3_01
:scan_3_02; s/(....{8}.)[0-2](M.{8}.MM)/\13\2/; t scan_3_02
:scan_3_03; s/(....{8}.)[0-2](M.{8}M.M)/\13\2/; t scan_3_03
:scan_3_04; s/(....{8}.)[0-2](M.{8}MM.)/\13\2/; t scan_3_04
:scan_3_05; s/(....{8}M)[0-2](..{8}.MM)/\13\2/; t scan_3_05
:scan_3_06; s/(....{8}M)[0-2](..{8}M.M)/\13\2/; t scan_3_06
:scan_3_07; s/(....{8}M)[0-2](..{8}MM.)/\13\2/; t scan_3_07
:scan_3_08; s/(....{8}M)[0-2](M.{8}..M)/\13\2/; t scan_3_08
:scan_3_09; s/(....{8}M)[0-2](M.{8}.M.)/\13\2/; t scan_3_09
:scan_3_10; s/(....{8}M)[0-2](M.{8}M..)/\13\2/; t scan_3_10
:scan_3_11; s/(..M.{8}.)[0-2](..{8}.MM)/\13\2/; t scan_3_11
:scan_3_12; s/(..M.{8}.)[0-2](..{8}M.M)/\13\2/; t scan_3_12
:scan_3_13; s/(..M.{8}.)[0-2](..{8}MM.)/\13\2/; t scan_3_13
:scan_3_14; s/(..M.{8}.)[0-2](M.{8}..M)/\13\2/; t scan_3_14
:scan_3_15; s/(..M.{8}.)[0-2](M.{8}.M.)/\13\2/; t scan_3_15
:scan_3_16; s/(..M.{8}.)[0-2](M.{8}M..)/\13\2/; t scan_3_16
:scan_3_17; s/(..M.{8}M)[0-2](..{8}..M)/\13\2/; t scan_3_17
:scan_3_18; s/(..M.{8}M)[0-2](..{8}.M.)/\13\2/; t scan_3_18
:scan_3_19; s/(..M.{8}M)[0-2](..{8}M..)/\13\2/; t scan_3_19
:scan_3_20; s/(..M.{8}M)[0-2](M.{8}...)/\13\2/; t scan_3_20
:scan_3_21; s/(.M..{8}.)[0-2](..{8}.MM)/\13\2/; t scan_3_21
:scan_3_22; s/(.M..{8}.)[0-2](..{8}M.M)/\13\2/; t scan_3_22
:scan_3_23; s/(.M..{8}.)[0-2](..{8}MM.)/\13\2/; t scan_3_23
:scan_3_24; s/(.M..{8}.)[0-2](M.{8}..M)/\13\2/; t scan_3_24
:scan_3_25; s/(.M..{8}.)[0-2](M.{8}.M.)/\13\2/; t scan_3_25
:scan_3_26; s/(.M..{8}.)[0-2](M.{8}M..)/\13\2/; t scan_3_26
:scan_3_27; s/(.M..{8}M)[0-2](..{8}..M)/\13\2/; t scan_3_27
:scan_3_28; s/(.M..{8}M)[0-2](..{8}.M.)/\13\2/; t scan_3_28
:scan_3_29; s/(.M..{8}M)[0-2](..{8}M..)/\13\2/; t scan_3_29
:scan_3_30; s/(.M..{8}M)[0-2](M.{8}...)/\13\2/; t scan_3_30
:scan_3_31; s/(.MM.{8}.)[0-2](..{8}..M)/\13\2/; t scan_3_31
:scan_3_32; s/(.MM.{8}.)[0-2](..{8}.M.)/\13\2/; t scan_3_32
:scan_3_33; s/(.MM.{8}.)[0-2](..{8}M..)/\13\2/; t scan_3_33
:scan_3_34; s/(.MM.{8}.)[0-2](M.{8}...)/\13\2/; t scan_3_34
:scan_3_35; s/(.MM.{8}M)[0-2](..{8}...)/\13\2/; t scan_3_35
:scan_3_36; s/(M...{8}.)[0-2](..{8}.MM)/\13\2/; t scan_3_36
:scan_3_37; s/(M...{8}.)[0-2](..{8}M.M)/\13\2/; t scan_3_37
:scan_3_38; s/(M...{8}.)[0-2](..{8}MM.)/\13\2/; t scan_3_38
:scan_3_39; s/(M...{8}.)[0-2](M.{8}..M)/\13\2/; t scan_3_39
:scan_3_40; s/(M...{8}.)[0-2](M.{8}.M.)/\13\2/; t scan_3_40
:scan_3_41; s/(M...{8}.)[0-2](M.{8}M..)/\13\2/; t scan_3_41
:scan_3_42; s/(M...{8}M)[0-2](..{8}..M)/\13\2/; t scan_3_42
:scan_3_43; s/(M...{8}M)[0-2](..{8}.M.)/\13\2/; t scan_3_43
:scan_3_44; s/(M...{8}M)[0-2](..{8}M..)/\13\2/; t scan_3_44
:scan_3_45; s/(M...{8}M)[0-2](M.{8}...)/\13\2/; t scan_3_45
:scan_3_46; s/(M.M.{8}.)[0-2](..{8}..M)/\13\2/; t scan_3_46
:scan_3_47; s/(M.M.{8}.)[0-2](..{8}.M.)/\13\2/; t scan_3_47
:scan_3_48; s/(M.M.{8}.)[0-2](..{8}M..)/\13\2/; t scan_3_48
:scan_3_49; s/(M.M.{8}.)[0-2](M.{8}...)/\13\2/; t scan_3_49
:scan_3_50; s/(M.M.{8}M)[0-2](..{8}...)/\13\2/; t scan_3_50
:scan_3_51; s/(MM..{8}.)[0-2](..{8}..M)/\13\2/; t scan_3_51
:scan_3_52; s/(MM..{8}.)[0-2](..{8}.M.)/\13\2/; t scan_3_52
:scan_3_53; s/(MM..{8}.)[0-2](..{8}M..)/\13\2/; t scan_3_53
:scan_3_54; s/(MM..{8}.)[0-2](M.{8}...)/\13\2/; t scan_3_54
:scan_3_55; s/(MM..{8}M)[0-2](..{8}...)/\13\2/; t scan_3_55
:scan_3_56; s/(MMM.{8}.)[0-2](..{8}...)/\13\2/; t scan_3_56

:scan_4_01; s/(....{8}.)[0-3](M.{8}MMM)/\14\2/; t scan_4_01
:scan_4_02; s/(....{8}M)[0-3](..{8}MMM)/\14\2/; t scan_4_02
:scan_4_03; s/(....{8}M)[0-3](M.{8}.MM)/\14\2/; t scan_4_03
:scan_4_04; s/(....{8}M)[0-3](M.{8}M.M)/\14\2/; t scan_4_04
:scan_4_05; s/(....{8}M)[0-3](M.{8}MM.)/\14\2/; t scan_4_05
:scan_4_06; s/(..M.{8}.)[0-3](..{8}MMM)/\14\2/; t scan_4_06
:scan_4_07; s/(..M.{8}.)[0-3](M.{8}.MM)/\14\2/; t scan_4_07
:scan_4_08; s/(..M.{8}.)[0-3](M.{8}M.M)/\14\2/; t scan_4_08
:scan_4_09; s/(..M.{8}.)[0-3](M.{8}MM.)/\14\2/; t scan_4_09
:scan_4_10; s/(..M.{8}M)[0-3](..{8}.MM)/\14\2/; t scan_4_10
:scan_4_11; s/(..M.{8}M)[0-3](..{8}M.M)/\14\2/; t scan_4_11
:scan_4_12; s/(..M.{8}M)[0-3](..{8}MM.)/\14\2/; t scan_4_12
:scan_4_13; s/(..M.{8}M)[0-3](M.{8}..M)/\14\2/; t scan_4_13
:scan_4_14; s/(..M.{8}M)[0-3](M.{8}.M.)/\14\2/; t scan_4_14
:scan_4_15; s/(..M.{8}M)[0-3](M.{8}M..)/\14\2/; t scan_4_15
:scan_4_16; s/(.M..{8}.)[0-3](..{8}MMM)/\14\2/; t scan_4_16
:scan_4_17; s/(.M..{8}.)[0-3](M.{8}.MM)/\14\2/; t scan_4_17
:scan_4_18; s/(.M..{8}.)[0-3](M.{8}M.M)/\14\2/; t scan_4_18
:scan_4_19; s/(.M..{8}.)[0-3](M.{8}MM.)/\14\2/; t scan_4_19
:scan_4_20; s/(.M..{8}M)[0-3](..{8}.MM)/\14\2/; t scan_4_20
:scan_4_21; s/(.M..{8}M)[0-3](..{8}M.M)/\14\2/; t scan_4_21
:scan_4_22; s/(.M..{8}M)[0-3](..{8}MM.)/\14\2/; t scan_4_22
:scan_4_23; s/(.M..{8}M)[0-3](M.{8}..M)/\14\2/; t scan_4_23
:scan_4_24; s/(.M..{8}M)[0-3](M.{8}.M.)/\14\2/; t scan_4_24
:scan_4_25; s/(.M..{8}M)[0-3](M.{8}M..)/\14\2/; t scan_4_25
:scan_4_26; s/(.MM.{8}.)[0-3](..{8}.MM)/\14\2/; t scan_4_26
:scan_4_27; s/(.MM.{8}.)[0-3](..{8}M.M)/\14\2/; t scan_4_27
:scan_4_28; s/(.MM.{8}.)[0-3](..{8}MM.)/\14\2/; t scan_4_28
:scan_4_29; s/(.MM.{8}.)[0-3](M.{8}..M)/\14\2/; t scan_4_29
:scan_4_30; s/(.MM.{8}.)[0-3](M.{8}.M.)/\14\2/; t scan_4_30
:scan_4_31; s/(.MM.{8}.)[0-3](M.{8}M..)/\14\2/; t scan_4_31
:scan_4_32; s/(.MM.{8}M)[0-3](..{8}..M)/\14\2/; t scan_4_32
:scan_4_33; s/(.MM.{8}M)[0-3](..{8}.M.)/\14\2/; t scan_4_33
:scan_4_34; s/(.MM.{8}M)[0-3](..{8}M..)/\14\2/; t scan_4_34
:scan_4_35; s/(.MM.{8}M)[0-3](M.{8}...)/\14\2/; t scan_4_35
:scan_4_36; s/(M...{8}.)[0-3](..{8}MMM)/\14\2/; t scan_4_36
:scan_4_37; s/(M...{8}.)[0-3](M.{8}.MM)/\14\2/; t scan_4_37
:scan_4_38; s/(M...{8}.)[0-3](M.{8}M.M)/\14\2/; t scan_4_38
:scan_4_39; s/(M...{8}.)[0-3](M.{8}MM.)/\14\2/; t scan_4_39
:scan_4_40; s/(M...{8}M)[0-3](..{8}.MM)/\14\2/; t scan_4_40
:scan_4_41; s/(M...{8}M)[0-3](..{8}M.M)/\14\2/; t scan_4_41
:scan_4_42; s/(M...{8}M)[0-3](..{8}MM.)/\14\2/; t scan_4_42
:scan_4_43; s/(M...{8}M)[0-3](M.{8}..M)/\14\2/; t scan_4_43
:scan_4_44; s/(M...{8}M)[0-3](M.{8}.M.)/\14\2/; t scan_4_44
:scan_4_45; s/(M...{8}M)[0-3](M.{8}M..)/\14\2/; t scan_4_45
:scan_4_46; s/(M.M.{8}.)[0-3](..{8}.MM)/\14\2/; t scan_4_46
:scan_4_47; s/(M.M.{8}.)[0-3](..{8}M.M)/\14\2/; t scan_4_47
:scan_4_48; s/(M.M.{8}.)[0-3](..{8}MM.)/\14\2/; t scan_4_48
:scan_4_49; s/(M.M.{8}.)[0-3](M.{8}..M)/\14\2/; t scan_4_49
:scan_4_50; s/(M.M.{8}.)[0-3](M.{8}.M.)/\14\2/; t scan_4_50
:scan_4_51; s/(M.M.{8}.)[0-3](M.{8}M..)/\14\2/; t scan_4_51
:scan_4_52; s/(M.M.{8}M)[0-3](..{8}..M)/\14\2/; t scan_4_52
:scan_4_53; s/(M.M.{8}M)[0-3](..{8}.M.)/\14\2/; t scan_4_53
:scan_4_54; s/(M.M.{8}M)[0-3](..{8}M..)/\14\2/; t scan_4_54
:scan_4_55; s/(M.M.{8}M)[0-3](M.{8}...)/\14\2/; t scan_4_55
:scan_4_56; s/(MM..{8}.)[0-3](..{8}.MM)/\14\2/; t scan_4_56
:scan_4_57; s/(MM..{8}.)[0-3](..{8}M.M)/\14\2/; t scan_4_57
:scan_4_58; s/(MM..{8}.)[0-3](..{8}MM.)/\14\2/; t scan_4_58
:scan_4_59; s/(MM..{8}.)[0-3](M.{8}..M)/\14\2/; t scan_4_59
:scan_4_60; s/(MM..{8}.)[0-3](M.{8}.M.)/\14\2/; t scan_4_60
:scan_4_61; s/(MM..{8}.)[0-3](M.{8}M..)/\14\2/; t scan_4_61
:scan_4_62; s/(MM..{8}M)[0-3](..{8}..M)/\14\2/; t scan_4_62
:scan_4_63; s/(MM..{8}M)[0-3](..{8}.M.)/\14\2/; t scan_4_63
:scan_4_64; s/(MM..{8}M)[0-3](..{8}M..)/\14\2/; t scan_4_64
:scan_4_65; s/(MM..{8}M)[0-3](M.{8}...)/\14\2/; t scan_4_65
:scan_4_66; s/(MMM.{8}.)[0-3](..{8}..M)/\14\2/; t scan_4_66
:scan_4_67; s/(MMM.{8}.)[0-3](..{8}.M.)/\14\2/; t scan_4_67
:scan_4_68; s/(MMM.{8}.)[0-3](..{8}M..)/\14\2/; t scan_4_68
:scan_4_69; s/(MMM.{8}.)[0-3](M.{8}...)/\14\2/; t scan_4_69
:scan_4_70; s/(MMM.{8}M)[0-3](..{8}...)/\14\2/; t scan_4_70

:scan_5_01; s/(....{8}M)[0-4](M.{8}MMM)/\15\2/; t scan_5_01
:scan_5_02; s/(..M.{8}.)[0-4](M.{8}MMM)/\15\2/; t scan_5_02
:scan_5_03; s/(..M.{8}M)[0-4](..{8}MMM)/\15\2/; t scan_5_03
:scan_5_04; s/(..M.{8}M)[0-4](M.{8}.MM)/\15\2/; t scan_5_04
:scan_5_05; s/(..M.{8}M)[0-4](M.{8}M.M)/\15\2/; t scan_5_05
:scan_5_06; s/(..M.{8}M)[0-4](M.{8}MM.)/\15\2/; t scan_5_06
:scan_5_07; s/(.M..{8}.)[0-4](M.{8}MMM)/\15\2/; t scan_5_07
:scan_5_08; s/(.M..{8}M)[0-4](..{8}MMM)/\15\2/; t scan_5_08
:scan_5_09; s/(.M..{8}M)[0-4](M.{8}.MM)/\15\2/; t scan_5_09
:scan_5_10; s/(.M..{8}M)[0-4](M.{8}M.M)/\15\2/; t scan_5_10
:scan_5_11; s/(.M..{8}M)[0-4](M.{8}MM.)/\15\2/; t scan_5_11
:scan_5_12; s/(.MM.{8}.)[0-4](..{8}MMM)/\15\2/; t scan_5_12
:scan_5_13; s/(.MM.{8}.)[0-4](M.{8}.MM)/\15\2/; t scan_5_13
:scan_5_14; s/(.MM.{8}.)[0-4](M.{8}M.M)/\15\2/; t scan_5_14
:scan_5_15; s/(.MM.{8}.)[0-4](M.{8}MM.)/\15\2/; t scan_5_15
:scan_5_16; s/(.MM.{8}M)[0-4](..{8}.MM)/\15\2/; t scan_5_16
:scan_5_17; s/(.MM.{8}M)[0-4](..{8}M.M)/\15\2/; t scan_5_17
:scan_5_18; s/(.MM.{8}M)[0-4](..{8}MM.)/\15\2/; t scan_5_18
:scan_5_19; s/(.MM.{8}M)[0-4](M.{8}..M)/\15\2/; t scan_5_19
:scan_5_20; s/(.MM.{8}M)[0-4](M.{8}.M.)/\15\2/; t scan_5_20
:scan_5_21; s/(.MM.{8}M)[0-4](M.{8}M..)/\15\2/; t scan_5_21
:scan_5_22; s/(M...{8}.)[0-4](M.{8}MMM)/\15\2/; t scan_5_22
:scan_5_23; s/(M...{8}M)[0-4](..{8}MMM)/\15\2/; t scan_5_23
:scan_5_24; s/(M...{8}M)[0-4](M.{8}.MM)/\15\2/; t scan_5_24
:scan_5_25; s/(M...{8}M)[0-4](M.{8}M.M)/\15\2/; t scan_5_25
:scan_5_26; s/(M...{8}M)[0-4](M.{8}MM.)/\15\2/; t scan_5_26
:scan_5_27; s/(M.M.{8}.)[0-4](..{8}MMM)/\15\2/; t scan_5_27
:scan_5_28; s/(M.M.{8}.)[0-4](M.{8}.MM)/\15\2/; t scan_5_28
:scan_5_29; s/(M.M.{8}.)[0-4](M.{8}M.M)/\15\2/; t scan_5_29
:scan_5_30; s/(M.M.{8}.)[0-4](M.{8}MM.)/\15\2/; t scan_5_30
:scan_5_31; s/(M.M.{8}M)[0-4](..{8}.MM)/\15\2/; t scan_5_31
:scan_5_32; s/(M.M.{8}M)[0-4](..{8}M.M)/\15\2/; t scan_5_32
:scan_5_33; s/(M.M.{8}M)[0-4](..{8}MM.)/\15\2/; t scan_5_33
:scan_5_34; s/(M.M.{8}M)[0-4](M.{8}..M)/\15\2/; t scan_5_34
:scan_5_35; s/(M.M.{8}M)[0-4](M.{8}.M.)/\15\2/; t scan_5_35
:scan_5_36; s/(M.M.{8}M)[0-4](M.{8}M..)/\15\2/; t scan_5_36
:scan_5_37; s/(MM..{8}.)[0-4](..{8}MMM)/\15\2/; t scan_5_37
:scan_5_38; s/(MM..{8}.)[0-4](M.{8}.MM)/\15\2/; t scan_5_38
:scan_5_39; s/(MM..{8}.)[0-4](M.{8}M.M)/\15\2/; t scan_5_39
:scan_5_40; s/(MM..{8}.)[0-4](M.{8}MM.)/\15\2/; t scan_5_40
:scan_5_41; s/(MM..{8}M)[0-4](..{8}.MM)/\15\2/; t scan_5_41
:scan_5_42; s/(MM..{8}M)[0-4](..{8}M.M)/\15\2/; t scan_5_42
:scan_5_43; s/(MM..{8}M)[0-4](..{8}MM.)/\15\2/; t scan_5_43
:scan_5_44; s/(MM..{8}M)[0-4](M.{8}..M)/\15\2/; t scan_5_44
:scan_5_45; s/(MM..{8}M)[0-4](M.{8}.M.)/\15\2/; t scan_5_45
:scan_5_46; s/(MM..{8}M)[0-4](M.{8}M..)/\15\2/; t scan_5_46
:scan_5_47; s/(MMM.{8}.)[0-4](..{8}.MM)/\15\2/; t scan_5_47
:scan_5_48; s/(MMM.{8}.)[0-4](..{8}M.M)/\15\2/; t scan_5_48
:scan_5_49; s/(MMM.{8}.)[0-4](..{8}MM.)/\15\2/; t scan_5_49
:scan_5_50; s/(MMM.{8}.)[0-4](M.{8}..M)/\15\2/; t scan_5_50
:scan_5_51; s/(MMM.{8}.)[0-4](M.{8}.M.)/\15\2/; t scan_5_51
:scan_5_52; s/(MMM.{8}.)[0-4](M.{8}M..)/\15\2/; t scan_5_52
:scan_5_53; s/(MMM.{8}M)[0-4](..{8}..M)/\15\2/; t scan_5_53
:scan_5_54; s/(MMM.{8}M)[0-4](..{8}.M.)/\15\2/; t scan_5_54
:scan_5_55; s/(MMM.{8}M)[0-4](..{8}M..)/\15\2/; t scan_5_55
:scan_5_56; s/(MMM.{8}M)[0-4](M.{8}...)/\15\2/; t scan_5_56

:scan_6_01; s/(..M.{8}M)[0-5](M.{8}MMM)/\16\2/; t scan_6_01
:scan_6_02; s/(.M..{8}M)[0-5](M.{8}MMM)/\16\2/; t scan_6_02
:scan_6_03; s/(.MM.{8}.)[0-5](M.{8}MMM)/\16\2/; t scan_6_03
:scan_6_04; s/(.MM.{8}M)[0-5](..{8}MMM)/\16\2/; t scan_6_04
:scan_6_05; s/(.MM.{8}M)[0-5](M.{8}.MM)/\16\2/; t scan_6_05
:scan_6_06; s/(.MM.{8}M)[0-5](M.{8}M.M)/\16\2/; t scan_6_06
:scan_6_07; s/(.MM.{8}M)[0-5](M.{8}MM.)/\16\2/; t scan_6_07
:scan_6_08; s/(M...{8}M)[0-5](M.{8}MMM)/\16\2/; t scan_6_08
:scan_6_09; s/(M.M.{8}.)[0-5](M.{8}MMM)/\16\2/; t scan_6_09
:scan_6_10; s/(M.M.{8}M)[0-5](..{8}MMM)/\16\2/; t scan_6_10
:scan_6_11; s/(M.M.{8}M)[0-5](M.{8}.MM)/\16\2/; t scan_6_11
:scan_6_12; s/(M.M.{8}M)[0-5](M.{8}M.M)/\16\2/; t scan_6_12
:scan_6_13; s/(M.M.{8}M)[0-5](M.{8}MM.)/\16\2/; t scan_6_13
:scan_6_14; s/(MM..{8}.)[0-5](M.{8}MMM)/\16\2/; t scan_6_14
:scan_6_15; s/(MM..{8}M)[0-5](..{8}MMM)/\16\2/; t scan_6_15
:scan_6_16; s/(MM..{8}M)[0-5](M.{8}.MM)/\16\2/; t scan_6_16
:scan_6_17; s/(MM..{8}M)[0-5](M.{8}M.M)/\16\2/; t scan_6_17
:scan_6_18; s/(MM..{8}M)[0-5](M.{8}MM.)/\16\2/; t scan_6_18
:scan_6_19; s/(MMM.{8}.)[0-5](..{8}MMM)/\16\2/; t scan_6_19
:scan_6_20; s/(MMM.{8}.)[0-5](M.{8}.MM)/\16\2/; t scan_6_20
:scan_6_21; s/(MMM.{8}.)[0-5](M.{8}M.M)/\16\2/; t scan_6_21
:scan_6_22; s/(MMM.{8}.)[0-5](M.{8}MM.)/\16\2/; t scan_6_22
:scan_6_23; s/(MMM.{8}M)[0-5](..{8}.MM)/\16\2/; t scan_6_23
:scan_6_24; s/(MMM.{8}M)[0-5](..{8}M.M)/\16\2/; t scan_6_24
:scan_6_25; s/(MMM.{8}M)[0-5](..{8}MM.)/\16\2/; t scan_6_25
:scan_6_26; s/(MMM.{8}M)[0-5](M.{8}..M)/\16\2/; t scan_6_26
:scan_6_27; s/(MMM.{8}M)[0-5](M.{8}.M.)/\16\2/; t scan_6_27
:scan_6_28; s/(MMM.{8}M)[0-5](M.{8}M..)/\16\2/; t scan_6_28

:scan_7_01; s/(.MM.{8}M)[0-6](M.{8}MMM)/\17\2/; t scan_7_01
:scan_7_02; s/(M.M.{8}M)[0-6](M.{8}MMM)/\17\2/; t scan_7_02
:scan_7_03; s/(MM..{8}M)[0-6](M.{8}MMM)/\17\2/; t scan_7_03
:scan_7_04; s/(MMM.{8}.)[0-6](M.{8}MMM)/\17\2/; t scan_7_04
:scan_7_05; s/(MMM.{8}M)[0-6](..{8}MMM)/\17\2/; t scan_7_05
:scan_7_06; s/(MMM.{8}M)[0-6](M.{8}.MM)/\17\2/; t scan_7_06
:scan_7_07; s/(MMM.{8}M)[0-6](M.{8}M.M)/\17\2/; t scan_7_07
:scan_7_08; s/(MMM.{8}M)[0-6](M.{8}MM.)/\17\2/; t scan_7_08

:scan_8_01; s/(MMM.{8}M)[0-7](M.{8}MMM)/\18\2/; t scan_8_01

s/.{11}/&\n/g
s/.\n./\n/g
s/^[^\n]{10}\n//
s/\n[^\n]{10}\n$//
s/\n//g
s/./&\cH#/g

x
/n$/ { s/.$//; x; s/$/n/; }
/h$/ { s/.$//; x; s/$/h/; }
/m$/ { s/.$//; x; s/$/m/; }

x
/^ *c *[1-9] *[1-9] *$/ { b loop; }

x
h

:draw

g

s/.\cH./ &/g
s/( .\cH.){9}/&\n/g

# Game over - lose (1/2)
/C\cHM/ {
    s/(C\cH)(M)/\1\c[[7m\2\c[[zm/
    s/(M)\cH[#F]/C\cH\1/g
}

s/0/./g
s/M/*/g
s/(F)/\c[[7m\1\c[[0m/g

i\
\c[[1;1H\c[[2J\c[[7m 1 2 3 4 5 6 7 8 9 |   \c[[0m\
\c[[7m-------------------+---\c[[0m          \c[[7m sedmines \c[[0m\
 . . . . . . . . . \c[[7m| 1 \c[[0m\
 . . . . . . . . . \c[[7m| 2 \c[[0m\
 . . . . . . . . . \c[[7m| 3 \c[[0m\
 . . . . . . . . . \c[[7m| 4 \c[[0m\
 . . . . . . . . . \c[[7m| 5 \c[[0m          [commands]\
 . . . . . . . . . \c[[7m| 6 \c[[0m c <X> <Y> --------- clear X Y\
 . . . . . . . . . \c[[7m| 7 \c[[0m f <X> <Y> --- flag/unflag X Y\
 . . . . . . . . . \c[[7m| 8 \c[[0m q ---------------------- quit\
 . . . . . . . . . \c[[7m| 9 \c[[0m\
\
please enter any command:\c[[2;1H

s/\c[[[]zm/\c[[0m/g
s/$/\cH /
s/$/\n/
p
s/\n//g
s/\cH $//
s/ //g

s/\./0/g
s/\*/M/g
s/\c[[[][07]m//g

# Game over - lose (2/2)
/C\cHM/ {
    i\
\c[[13;1H\c[[2K** kaboom! you lose. ********************************

    q
}

# Game over - win
/^(C\cH[0-8]|M\cHF)+.$/ {
    i\
\c[[13;1H\c[[2K\c[[7m== congratulations! you win! ========================\c[[0m

    q
}

h
d

:loop

1 b menu
2 b setup

y/CFQ/cfq/
s/[^ 1-9cfq]//g

#   c  X  Y
/^ *c *1 *1 *$/ { x; s/^(.)\cH#/C\cH\1/;                }
/^ *c *2 *1 *$/ { x; s/^(.\cH.)(.)\cH#/\1C\cH\2/;       }
/^ *c *3 *1 *$/ { x; s/^((.\cH.){2})(.)\cH#/\1C\cH\3/;  }
/^ *c *4 *1 *$/ { x; s/^((.\cH.){3})(.)\cH#/\1C\cH\3/;  }
/^ *c *5 *1 *$/ { x; s/^((.\cH.){4})(.)\cH#/\1C\cH\3/;  }
/^ *c *6 *1 *$/ { x; s/^((.\cH.){5})(.)\cH#/\1C\cH\3/;  }
/^ *c *7 *1 *$/ { x; s/^((.\cH.){6})(.)\cH#/\1C\cH\3/;  }
/^ *c *8 *1 *$/ { x; s/^((.\cH.){7})(.)\cH#/\1C\cH\3/;  }
/^ *c *9 *1 *$/ { x; s/^((.\cH.){8})(.)\cH#/\1C\cH\3/;  }
/^ *c *1 *2 *$/ { x; s/^((.\cH.){9})(.)\cH#/\1C\cH\3/;  }
/^ *c *2 *2 *$/ { x; s/^((.\cH.){10})(.)\cH#/\1C\cH\3/; }
/^ *c *3 *2 *$/ { x; s/^((.\cH.){11})(.)\cH#/\1C\cH\3/; }
/^ *c *4 *2 *$/ { x; s/^((.\cH.){12})(.)\cH#/\1C\cH\3/; }
/^ *c *5 *2 *$/ { x; s/^((.\cH.){13})(.)\cH#/\1C\cH\3/; }
/^ *c *6 *2 *$/ { x; s/^((.\cH.){14})(.)\cH#/\1C\cH\3/; }
/^ *c *7 *2 *$/ { x; s/^((.\cH.){15})(.)\cH#/\1C\cH\3/; }
/^ *c *8 *2 *$/ { x; s/^((.\cH.){16})(.)\cH#/\1C\cH\3/; }
/^ *c *9 *2 *$/ { x; s/^((.\cH.){17})(.)\cH#/\1C\cH\3/; }
/^ *c *1 *3 *$/ { x; s/^((.\cH.){18})(.)\cH#/\1C\cH\3/; }
/^ *c *2 *3 *$/ { x; s/^((.\cH.){19})(.)\cH#/\1C\cH\3/; }
/^ *c *3 *3 *$/ { x; s/^((.\cH.){20})(.)\cH#/\1C\cH\3/; }
/^ *c *4 *3 *$/ { x; s/^((.\cH.){21})(.)\cH#/\1C\cH\3/; }
/^ *c *5 *3 *$/ { x; s/^((.\cH.){22})(.)\cH#/\1C\cH\3/; }
/^ *c *6 *3 *$/ { x; s/^((.\cH.){23})(.)\cH#/\1C\cH\3/; }
/^ *c *7 *3 *$/ { x; s/^((.\cH.){24})(.)\cH#/\1C\cH\3/; }
/^ *c *8 *3 *$/ { x; s/^((.\cH.){25})(.)\cH#/\1C\cH\3/; }
/^ *c *9 *3 *$/ { x; s/^((.\cH.){26})(.)\cH#/\1C\cH\3/; }
/^ *c *1 *4 *$/ { x; s/^((.\cH.){27})(.)\cH#/\1C\cH\3/; }
/^ *c *2 *4 *$/ { x; s/^((.\cH.){28})(.)\cH#/\1C\cH\3/; }
/^ *c *3 *4 *$/ { x; s/^((.\cH.){29})(.)\cH#/\1C\cH\3/; }
/^ *c *4 *4 *$/ { x; s/^((.\cH.){30})(.)\cH#/\1C\cH\3/; }
/^ *c *5 *4 *$/ { x; s/^((.\cH.){31})(.)\cH#/\1C\cH\3/; }
/^ *c *6 *4 *$/ { x; s/^((.\cH.){32})(.)\cH#/\1C\cH\3/; }
/^ *c *7 *4 *$/ { x; s/^((.\cH.){33})(.)\cH#/\1C\cH\3/; }
/^ *c *8 *4 *$/ { x; s/^((.\cH.){34})(.)\cH#/\1C\cH\3/; }
/^ *c *9 *4 *$/ { x; s/^((.\cH.){35})(.)\cH#/\1C\cH\3/; }
/^ *c *1 *5 *$/ { x; s/^((.\cH.){36})(.)\cH#/\1C\cH\3/; }
/^ *c *2 *5 *$/ { x; s/^((.\cH.){37})(.)\cH#/\1C\cH\3/; }
/^ *c *3 *5 *$/ { x; s/^((.\cH.){38})(.)\cH#/\1C\cH\3/; }
/^ *c *4 *5 *$/ { x; s/^((.\cH.){39})(.)\cH#/\1C\cH\3/; }
/^ *c *5 *5 *$/ { x; s/^((.\cH.){40})(.)\cH#/\1C\cH\3/; }
/^ *c *6 *5 *$/ { x; s/^((.\cH.){41})(.)\cH#/\1C\cH\3/; }
/^ *c *7 *5 *$/ { x; s/^((.\cH.){42})(.)\cH#/\1C\cH\3/; }
/^ *c *8 *5 *$/ { x; s/^((.\cH.){43})(.)\cH#/\1C\cH\3/; }
/^ *c *9 *5 *$/ { x; s/^((.\cH.){44})(.)\cH#/\1C\cH\3/; }
/^ *c *1 *6 *$/ { x; s/^((.\cH.){45})(.)\cH#/\1C\cH\3/; }
/^ *c *2 *6 *$/ { x; s/^((.\cH.){46})(.)\cH#/\1C\cH\3/; }
/^ *c *3 *6 *$/ { x; s/^((.\cH.){47})(.)\cH#/\1C\cH\3/; }
/^ *c *4 *6 *$/ { x; s/^((.\cH.){48})(.)\cH#/\1C\cH\3/; }
/^ *c *5 *6 *$/ { x; s/^((.\cH.){49})(.)\cH#/\1C\cH\3/; }
/^ *c *6 *6 *$/ { x; s/^((.\cH.){50})(.)\cH#/\1C\cH\3/; }
/^ *c *7 *6 *$/ { x; s/^((.\cH.){51})(.)\cH#/\1C\cH\3/; }
/^ *c *8 *6 *$/ { x; s/^((.\cH.){52})(.)\cH#/\1C\cH\3/; }
/^ *c *9 *6 *$/ { x; s/^((.\cH.){53})(.)\cH#/\1C\cH\3/; }
/^ *c *1 *7 *$/ { x; s/^((.\cH.){54})(.)\cH#/\1C\cH\3/; }
/^ *c *2 *7 *$/ { x; s/^((.\cH.){55})(.)\cH#/\1C\cH\3/; }
/^ *c *3 *7 *$/ { x; s/^((.\cH.){56})(.)\cH#/\1C\cH\3/; }
/^ *c *4 *7 *$/ { x; s/^((.\cH.){57})(.)\cH#/\1C\cH\3/; }
/^ *c *5 *7 *$/ { x; s/^((.\cH.){58})(.)\cH#/\1C\cH\3/; }
/^ *c *6 *7 *$/ { x; s/^((.\cH.){59})(.)\cH#/\1C\cH\3/; }
/^ *c *7 *7 *$/ { x; s/^((.\cH.){60})(.)\cH#/\1C\cH\3/; }
/^ *c *8 *7 *$/ { x; s/^((.\cH.){61})(.)\cH#/\1C\cH\3/; }
/^ *c *9 *7 *$/ { x; s/^((.\cH.){62})(.)\cH#/\1C\cH\3/; }
/^ *c *1 *8 *$/ { x; s/^((.\cH.){63})(.)\cH#/\1C\cH\3/; }
/^ *c *2 *8 *$/ { x; s/^((.\cH.){64})(.)\cH#/\1C\cH\3/; }
/^ *c *3 *8 *$/ { x; s/^((.\cH.){65})(.)\cH#/\1C\cH\3/; }
/^ *c *4 *8 *$/ { x; s/^((.\cH.){66})(.)\cH#/\1C\cH\3/; }
/^ *c *5 *8 *$/ { x; s/^((.\cH.){67})(.)\cH#/\1C\cH\3/; }
/^ *c *6 *8 *$/ { x; s/^((.\cH.){68})(.)\cH#/\1C\cH\3/; }
/^ *c *7 *8 *$/ { x; s/^((.\cH.){69})(.)\cH#/\1C\cH\3/; }
/^ *c *8 *8 *$/ { x; s/^((.\cH.){70})(.)\cH#/\1C\cH\3/; }
/^ *c *9 *8 *$/ { x; s/^((.\cH.){71})(.)\cH#/\1C\cH\3/; }
/^ *c *1 *9 *$/ { x; s/^((.\cH.){72})(.)\cH#/\1C\cH\3/; }
/^ *c *2 *9 *$/ { x; s/^((.\cH.){73})(.)\cH#/\1C\cH\3/; }
/^ *c *3 *9 *$/ { x; s/^((.\cH.){74})(.)\cH#/\1C\cH\3/; }
/^ *c *4 *9 *$/ { x; s/^((.\cH.){75})(.)\cH#/\1C\cH\3/; }
/^ *c *5 *9 *$/ { x; s/^((.\cH.){76})(.)\cH#/\1C\cH\3/; }
/^ *c *6 *9 *$/ { x; s/^((.\cH.){77})(.)\cH#/\1C\cH\3/; }
/^ *c *7 *9 *$/ { x; s/^((.\cH.){78})(.)\cH#/\1C\cH\3/; }
/^ *c *8 *9 *$/ { x; s/^((.\cH.){79})(.)\cH#/\1C\cH\3/; }
/^ *c *9 *9 *$/ { x; s/^((.\cH.){80})(.)\cH#/\1C\cH\3/; }

#   f  X  Y
/^ *f *1 *1 *$/ { x; s/^(.\cH)#/\1F/;            t end_f11; s/^(.\cH)F/\1#/;            :end_f11; }
/^ *f *2 *1 *$/ { x; s/^(.\cH..\cH)#/\1F/;       t end_f21; s/^(.\cH..\cH)F/\1#/;       :end_f21; }
/^ *f *3 *1 *$/ { x; s/^((.\cH.){2}.\cH)#/\1F/;  t end_f31; s/^((.\cH.){2}.\cH)F/\1#/;  :end_f31; }
/^ *f *4 *1 *$/ { x; s/^((.\cH.){3}.\cH)#/\1F/;  t end_f41; s/^((.\cH.){3}.\cH)F/\1#/;  :end_f41; }
/^ *f *5 *1 *$/ { x; s/^((.\cH.){4}.\cH)#/\1F/;  t end_f51; s/^((.\cH.){4}.\cH)F/\1#/;  :end_f51; }
/^ *f *6 *1 *$/ { x; s/^((.\cH.){5}.\cH)#/\1F/;  t end_f61; s/^((.\cH.){5}.\cH)F/\1#/;  :end_f61; }
/^ *f *7 *1 *$/ { x; s/^((.\cH.){6}.\cH)#/\1F/;  t end_f71; s/^((.\cH.){6}.\cH)F/\1#/;  :end_f71; }
/^ *f *8 *1 *$/ { x; s/^((.\cH.){7}.\cH)#/\1F/;  t end_f81; s/^((.\cH.){7}.\cH)F/\1#/;  :end_f81; }
/^ *f *9 *1 *$/ { x; s/^((.\cH.){8}.\cH)#/\1F/;  t end_f91; s/^((.\cH.){8}.\cH)F/\1#/;  :end_f91; }
/^ *f *1 *2 *$/ { x; s/^((.\cH.){9}.\cH)#/\1F/;  t end_f12; s/^((.\cH.){9}.\cH)F/\1#/;  :end_f12; }
/^ *f *2 *2 *$/ { x; s/^((.\cH.){10}.\cH)#/\1F/; t end_f22; s/^((.\cH.){10}.\cH)F/\1#/; :end_f22; }
/^ *f *3 *2 *$/ { x; s/^((.\cH.){11}.\cH)#/\1F/; t end_f32; s/^((.\cH.){11}.\cH)F/\1#/; :end_f32; }
/^ *f *4 *2 *$/ { x; s/^((.\cH.){12}.\cH)#/\1F/; t end_f42; s/^((.\cH.){12}.\cH)F/\1#/; :end_f42; }
/^ *f *5 *2 *$/ { x; s/^((.\cH.){13}.\cH)#/\1F/; t end_f52; s/^((.\cH.){13}.\cH)F/\1#/; :end_f52; }
/^ *f *6 *2 *$/ { x; s/^((.\cH.){14}.\cH)#/\1F/; t end_f62; s/^((.\cH.){14}.\cH)F/\1#/; :end_f62; }
/^ *f *7 *2 *$/ { x; s/^((.\cH.){15}.\cH)#/\1F/; t end_f72; s/^((.\cH.){15}.\cH)F/\1#/; :end_f72; }
/^ *f *8 *2 *$/ { x; s/^((.\cH.){16}.\cH)#/\1F/; t end_f82; s/^((.\cH.){16}.\cH)F/\1#/; :end_f82; }
/^ *f *9 *2 *$/ { x; s/^((.\cH.){17}.\cH)#/\1F/; t end_f92; s/^((.\cH.){17}.\cH)F/\1#/; :end_f92; }
/^ *f *1 *3 *$/ { x; s/^((.\cH.){18}.\cH)#/\1F/; t end_f13; s/^((.\cH.){18}.\cH)F/\1#/; :end_f13; }
/^ *f *2 *3 *$/ { x; s/^((.\cH.){19}.\cH)#/\1F/; t end_f23; s/^((.\cH.){19}.\cH)F/\1#/; :end_f23; }
/^ *f *3 *3 *$/ { x; s/^((.\cH.){20}.\cH)#/\1F/; t end_f33; s/^((.\cH.){20}.\cH)F/\1#/; :end_f33; }
/^ *f *4 *3 *$/ { x; s/^((.\cH.){21}.\cH)#/\1F/; t end_f43; s/^((.\cH.){21}.\cH)F/\1#/; :end_f43; }
/^ *f *5 *3 *$/ { x; s/^((.\cH.){22}.\cH)#/\1F/; t end_f53; s/^((.\cH.){22}.\cH)F/\1#/; :end_f53; }
/^ *f *6 *3 *$/ { x; s/^((.\cH.){23}.\cH)#/\1F/; t end_f63; s/^((.\cH.){23}.\cH)F/\1#/; :end_f63; }
/^ *f *7 *3 *$/ { x; s/^((.\cH.){24}.\cH)#/\1F/; t end_f73; s/^((.\cH.){24}.\cH)F/\1#/; :end_f73; }
/^ *f *8 *3 *$/ { x; s/^((.\cH.){25}.\cH)#/\1F/; t end_f83; s/^((.\cH.){25}.\cH)F/\1#/; :end_f83; }
/^ *f *9 *3 *$/ { x; s/^((.\cH.){26}.\cH)#/\1F/; t end_f93; s/^((.\cH.){26}.\cH)F/\1#/; :end_f93; }
/^ *f *1 *4 *$/ { x; s/^((.\cH.){27}.\cH)#/\1F/; t end_f14; s/^((.\cH.){27}.\cH)F/\1#/; :end_f14; }
/^ *f *2 *4 *$/ { x; s/^((.\cH.){28}.\cH)#/\1F/; t end_f24; s/^((.\cH.){28}.\cH)F/\1#/; :end_f24; }
/^ *f *3 *4 *$/ { x; s/^((.\cH.){29}.\cH)#/\1F/; t end_f34; s/^((.\cH.){29}.\cH)F/\1#/; :end_f34; }
/^ *f *4 *4 *$/ { x; s/^((.\cH.){30}.\cH)#/\1F/; t end_f44; s/^((.\cH.){30}.\cH)F/\1#/; :end_f44; }
/^ *f *5 *4 *$/ { x; s/^((.\cH.){31}.\cH)#/\1F/; t end_f54; s/^((.\cH.){31}.\cH)F/\1#/; :end_f54; }
/^ *f *6 *4 *$/ { x; s/^((.\cH.){32}.\cH)#/\1F/; t end_f64; s/^((.\cH.){32}.\cH)F/\1#/; :end_f64; }
/^ *f *7 *4 *$/ { x; s/^((.\cH.){33}.\cH)#/\1F/; t end_f74; s/^((.\cH.){33}.\cH)F/\1#/; :end_f74; }
/^ *f *8 *4 *$/ { x; s/^((.\cH.){34}.\cH)#/\1F/; t end_f84; s/^((.\cH.){34}.\cH)F/\1#/; :end_f84; }
/^ *f *9 *4 *$/ { x; s/^((.\cH.){35}.\cH)#/\1F/; t end_f94; s/^((.\cH.){35}.\cH)F/\1#/; :end_f94; }
/^ *f *1 *5 *$/ { x; s/^((.\cH.){36}.\cH)#/\1F/; t end_f15; s/^((.\cH.){36}.\cH)F/\1#/; :end_f15; }
/^ *f *2 *5 *$/ { x; s/^((.\cH.){37}.\cH)#/\1F/; t end_f25; s/^((.\cH.){37}.\cH)F/\1#/; :end_f25; }
/^ *f *3 *5 *$/ { x; s/^((.\cH.){38}.\cH)#/\1F/; t end_f35; s/^((.\cH.){38}.\cH)F/\1#/; :end_f35; }
/^ *f *4 *5 *$/ { x; s/^((.\cH.){39}.\cH)#/\1F/; t end_f45; s/^((.\cH.){39}.\cH)F/\1#/; :end_f45; }
/^ *f *5 *5 *$/ { x; s/^((.\cH.){40}.\cH)#/\1F/; t end_f55; s/^((.\cH.){40}.\cH)F/\1#/; :end_f55; }
/^ *f *6 *5 *$/ { x; s/^((.\cH.){41}.\cH)#/\1F/; t end_f65; s/^((.\cH.){41}.\cH)F/\1#/; :end_f65; }
/^ *f *7 *5 *$/ { x; s/^((.\cH.){42}.\cH)#/\1F/; t end_f75; s/^((.\cH.){42}.\cH)F/\1#/; :end_f75; }
/^ *f *8 *5 *$/ { x; s/^((.\cH.){43}.\cH)#/\1F/; t end_f85; s/^((.\cH.){43}.\cH)F/\1#/; :end_f85; }
/^ *f *9 *5 *$/ { x; s/^((.\cH.){44}.\cH)#/\1F/; t end_f95; s/^((.\cH.){44}.\cH)F/\1#/; :end_f95; }
/^ *f *1 *6 *$/ { x; s/^((.\cH.){45}.\cH)#/\1F/; t end_f16; s/^((.\cH.){45}.\cH)F/\1#/; :end_f16; }
/^ *f *2 *6 *$/ { x; s/^((.\cH.){46}.\cH)#/\1F/; t end_f26; s/^((.\cH.){46}.\cH)F/\1#/; :end_f26; }
/^ *f *3 *6 *$/ { x; s/^((.\cH.){47}.\cH)#/\1F/; t end_f36; s/^((.\cH.){47}.\cH)F/\1#/; :end_f36; }
/^ *f *4 *6 *$/ { x; s/^((.\cH.){48}.\cH)#/\1F/; t end_f46; s/^((.\cH.){48}.\cH)F/\1#/; :end_f46; }
/^ *f *5 *6 *$/ { x; s/^((.\cH.){49}.\cH)#/\1F/; t end_f56; s/^((.\cH.){49}.\cH)F/\1#/; :end_f56; }
/^ *f *6 *6 *$/ { x; s/^((.\cH.){50}.\cH)#/\1F/; t end_f66; s/^((.\cH.){50}.\cH)F/\1#/; :end_f66; }
/^ *f *7 *6 *$/ { x; s/^((.\cH.){51}.\cH)#/\1F/; t end_f76; s/^((.\cH.){51}.\cH)F/\1#/; :end_f76; }
/^ *f *8 *6 *$/ { x; s/^((.\cH.){52}.\cH)#/\1F/; t end_f86; s/^((.\cH.){52}.\cH)F/\1#/; :end_f86; }
/^ *f *9 *6 *$/ { x; s/^((.\cH.){53}.\cH)#/\1F/; t end_f96; s/^((.\cH.){53}.\cH)F/\1#/; :end_f96; }
/^ *f *1 *7 *$/ { x; s/^((.\cH.){54}.\cH)#/\1F/; t end_f17; s/^((.\cH.){54}.\cH)F/\1#/; :end_f17; }
/^ *f *2 *7 *$/ { x; s/^((.\cH.){55}.\cH)#/\1F/; t end_f27; s/^((.\cH.){55}.\cH)F/\1#/; :end_f27; }
/^ *f *3 *7 *$/ { x; s/^((.\cH.){56}.\cH)#/\1F/; t end_f37; s/^((.\cH.){56}.\cH)F/\1#/; :end_f37; }
/^ *f *4 *7 *$/ { x; s/^((.\cH.){57}.\cH)#/\1F/; t end_f47; s/^((.\cH.){57}.\cH)F/\1#/; :end_f47; }
/^ *f *5 *7 *$/ { x; s/^((.\cH.){58}.\cH)#/\1F/; t end_f57; s/^((.\cH.){58}.\cH)F/\1#/; :end_f57; }
/^ *f *6 *7 *$/ { x; s/^((.\cH.){59}.\cH)#/\1F/; t end_f67; s/^((.\cH.){59}.\cH)F/\1#/; :end_f67; }
/^ *f *7 *7 *$/ { x; s/^((.\cH.){60}.\cH)#/\1F/; t end_f77; s/^((.\cH.){60}.\cH)F/\1#/; :end_f77; }
/^ *f *8 *7 *$/ { x; s/^((.\cH.){61}.\cH)#/\1F/; t end_f87; s/^((.\cH.){61}.\cH)F/\1#/; :end_f87; }
/^ *f *9 *7 *$/ { x; s/^((.\cH.){62}.\cH)#/\1F/; t end_f97; s/^((.\cH.){62}.\cH)F/\1#/; :end_f97; }
/^ *f *1 *8 *$/ { x; s/^((.\cH.){63}.\cH)#/\1F/; t end_f18; s/^((.\cH.){63}.\cH)F/\1#/; :end_f18; }
/^ *f *2 *8 *$/ { x; s/^((.\cH.){64}.\cH)#/\1F/; t end_f28; s/^((.\cH.){64}.\cH)F/\1#/; :end_f28; }
/^ *f *3 *8 *$/ { x; s/^((.\cH.){65}.\cH)#/\1F/; t end_f38; s/^((.\cH.){65}.\cH)F/\1#/; :end_f38; }
/^ *f *4 *8 *$/ { x; s/^((.\cH.){66}.\cH)#/\1F/; t end_f48; s/^((.\cH.){66}.\cH)F/\1#/; :end_f48; }
/^ *f *5 *8 *$/ { x; s/^((.\cH.){67}.\cH)#/\1F/; t end_f58; s/^((.\cH.){67}.\cH)F/\1#/; :end_f58; }
/^ *f *6 *8 *$/ { x; s/^((.\cH.){68}.\cH)#/\1F/; t end_f68; s/^((.\cH.){68}.\cH)F/\1#/; :end_f68; }
/^ *f *7 *8 *$/ { x; s/^((.\cH.){69}.\cH)#/\1F/; t end_f78; s/^((.\cH.){69}.\cH)F/\1#/; :end_f78; }
/^ *f *8 *8 *$/ { x; s/^((.\cH.){70}.\cH)#/\1F/; t end_f88; s/^((.\cH.){70}.\cH)F/\1#/; :end_f88; }
/^ *f *9 *8 *$/ { x; s/^((.\cH.){71}.\cH)#/\1F/; t end_f98; s/^((.\cH.){71}.\cH)F/\1#/; :end_f98; }
/^ *f *1 *9 *$/ { x; s/^((.\cH.){72}.\cH)#/\1F/; t end_f19; s/^((.\cH.){72}.\cH)F/\1#/; :end_f19; }
/^ *f *2 *9 *$/ { x; s/^((.\cH.){73}.\cH)#/\1F/; t end_f29; s/^((.\cH.){73}.\cH)F/\1#/; :end_f29; }
/^ *f *3 *9 *$/ { x; s/^((.\cH.){74}.\cH)#/\1F/; t end_f39; s/^((.\cH.){74}.\cH)F/\1#/; :end_f39; }
/^ *f *4 *9 *$/ { x; s/^((.\cH.){75}.\cH)#/\1F/; t end_f49; s/^((.\cH.){75}.\cH)F/\1#/; :end_f49; }
/^ *f *5 *9 *$/ { x; s/^((.\cH.){76}.\cH)#/\1F/; t end_f59; s/^((.\cH.){76}.\cH)F/\1#/; :end_f59; }
/^ *f *6 *9 *$/ { x; s/^((.\cH.){77}.\cH)#/\1F/; t end_f69; s/^((.\cH.){77}.\cH)F/\1#/; :end_f69; }
/^ *f *7 *9 *$/ { x; s/^((.\cH.){78}.\cH)#/\1F/; t end_f79; s/^((.\cH.){78}.\cH)F/\1#/; :end_f79; }
/^ *f *8 *9 *$/ { x; s/^((.\cH.){79}.\cH)#/\1F/; t end_f89; s/^((.\cH.){79}.\cH)F/\1#/; :end_f89; }
/^ *f *9 *9 *$/ { x; s/^((.\cH.){80}.\cH)#/\1F/; t end_f99; s/^((.\cH.){80}.\cH)F/\1#/; :end_f99; }

# Game over - quit
/^ *q *$/ {
    i\
\c[[13;1H\c[[2K-- the game has quit. -------------------------------

    q
}

/^[^\cH]\cH[^\cH]/ {
    s/(.\cH.){9}/&\n/g

    /C\cHM/ {
        /C\cH[0-8]/ { b scan_C^H0; }
        /.\cHF/     { b scan_C^H0; }

        b reset
    }

    :scan_C^H0

    # c X-1 Y-1
    s/([0-8])\cH#(.\cH.\n?(.\cH.\n?){7}.\cH.C\cH0)/C\cH\1\2/

    # c X Y-1
    s/([0-8])\cH#(\n?(.\cH.\n?){8}C\cH0)/C\cH\1\2/

    # c X+1 Y-1
    s/([0-8])\cH#((.\cH.){7}\nC\cH0)/C\cH\1\2/
    s/([0-8])\cH#((.\cH.){6}\n.\cH.C\cH0)/C\cH\1\2/
    s/([0-8])\cH#((.\cH.){5}\n(.\cH.){2}C\cH0)/C\cH\1\2/
    s/([0-8])\cH#((.\cH.){4}\n(.\cH.){3}C\cH0)/C\cH\1\2/
    s/([0-8])\cH#((.\cH.){3}\n(.\cH.){4}C\cH0)/C\cH\1\2/
    s/([0-8])\cH#((.\cH.){2}\n(.\cH.){5}C\cH0)/C\cH\1\2/
    s/([0-8])\cH#(.\cH.\n(.\cH.){6}C\cH0)/C\cH\1\2/
    s/([0-8])\cH#(\n(.\cH.){7}C\cH0)/C\cH\1\2/

    # c X-1 Y
    s/([0-8])\cH#(C\cH0)/C\cH\1\2/

    # c X+1 Y
    s/(C\cH0)([0-8])\cH#/\1C\cH\2/

    # c X-1 Y+1
    s/(C\cH0(.\cH.){7}\n)([0-8])\cH#/\1C\cH\3/
    s/(C\cH0(.\cH.){6}\n.\cH.)([0-8])\cH#/\1C\cH\3/
    s/(C\cH0(.\cH.){5}\n(.\cH.){2})([0-8])\cH#/\1C\cH\4/
    s/(C\cH0(.\cH.){4}\n(.\cH.){3})([0-8])\cH#/\1C\cH\4/
    s/(C\cH0(.\cH.){3}\n(.\cH.){4})([0-8])\cH#/\1C\cH\4/
    s/(C\cH0(.\cH.){2}\n(.\cH.){5})([0-8])\cH#/\1C\cH\4/
    s/(C\cH0.\cH.\n(.\cH.){6})([0-8])\cH#/\1C\cH\3/
    s/(C\cH0\n(.\cH.){7})([0-8])\cH#/\1C\cH\3/

    # c X Y+1
    s/(C\cH0\n?(.\cH.\n?){8})([0-8])\cH#/\1C\cH\3/

    # c X+1 Y+1
    s/(C\cH0.\cH.\n?(.\cH.\n?){7}.\cH.)([0-8])\cH#/\1C\cH\3/

    t scan_C^H0

    s/\n//g
    h
}

b draw
