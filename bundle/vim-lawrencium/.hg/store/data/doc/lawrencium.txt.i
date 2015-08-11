        d  �        ����������_5��}�4�v���������            4�  �@*lawrencium.txt*  Mercurial wrapper for VIM

Author:  Ludovic Chabant <http://l ".c � .com>
License: Same terms as Vim itself (see |l( �"|)

This plugin is only available if 'compatible'" �not set.

INTRODUCTION  �*

When a file from a�repository� Ppen i. �buffer, that � gets
new commands defined.

COMMANDS� � -O m*

All^ V by |/ �| are local to each� >.

 � � :Hg*
:Hg [args]) �Run an arbitraryC� �. Similar� O:!hg� ` �but the '--���automaticallyG �specified withK rroot of �  currentN �belongs toL/!M!N�Like |:Hg|,Uoutpu� T 3aced in� ba temp�  5 Aedit2 K �|preview-window|� /!cd� �cd [direcd� �|:cd| relative�� /l� l� ?|:l� Y�status*
 / [Shows�B'hg - '�� � o
ABOUT� $�about*

Grab� �latest version or!rt�g on BitBucket:

Abitb D.org+*/n �


 vim:tw=78:et:ft=help:norl:
    d    �  .           �������cAg��Qe�k��^�e�            4�  �  <  �   L:Hg {args}  �5Run an arbitrary Mercurial command. Similar to :!hg
  �  �   O:Hg!Y �Like |:Hg|, but the output of _ � is placed in
  d  �   F:Hgcd[!] {path_ �|:cd| relative�  O 5roo[ �repository.R ��  6  s:HglS ?|:lS /
  �*lawrencium-:Hgedit*
	 g {file= |: | � Y!� !� � !� B  � / Q� � You can navigatT �next/previous x �  with "n"/"p".
    �    Q  �          �����>�m��x<g���@���            4�
  �   -   �  ��   �   S  � LAWRENCIUM REFE �E MANUAL
   �by Ludovic Chabant
   �    3
  �*lawrencium*

1.  Introduction* |*  -i$ �|
2.  CommandsY / c$ _|


= 9� � � �,*
  t  �  <This plugin is only available if 'compatible'" �not set.

Grab the latest vers� �or report a bug on BitBucket:

http://bitb b.org/l�c�V/vim-� 
E>�E�H��  <   6�0:HgB �G  �   7B !!C �!  d   8C !!cdD ��  �   9D !lE �7  |   :E !AeditF ��     ;F %�c  �   <G !Qstatu��  d  Y0 �You can navigate to�next/previous file with <C-N> �0and# �P>, open a; �cr>, diffyAocal N 7  , pparent � �� $D>r ?V>,G �dependin�� whether you wan��horizontal��verticalO �split window.ee / ��! #*
	 " QDiffs1curP�against its� �f  �   �� %_� �{revspec}�    / Zified� ��  �   �� !v*v+�Same as |� �| but uses a��� ��    �� &_� %� _� 
�"0ommv $ @Openm 3new� � d3 a 2 �message into a� �temporary��nd, upon quittZ �pbuffer,yOthatN D �has been written to,� \changes� � �ositoryN$vO a  �j� *he�Pe.


    	5     �  �          ����$�u�����m.��8�+��            4  �  �  �   {  � file belongs to, and it will auto-complete any
G �standard commC �or option.
  	�  	�   �@ !plu �ndow, add an untracked� �with <C-A>� � �refresh theR ; P-R>.
    	�    �  �          �����̅�p�en��%t�ӺU{�q            4 	  B  " � 73.  Status Window  �|lawrencium-s$ !-w$ � |
  �  
k   �  �|preview5 �. Some extra-commands, along with some
O �default mappin9 �re available in this m N. SeK � b.
  � ?�= 9
k *� �*

The `hg  `� � opened by L< � has a few special }` 
defi2 �in it. Also, unless the global `� _3 _��gs` is set to
`0`,�b  � + �ed to keyboard shortcut��s detail� �the
following descriptions.


  B*:Hg$iedit*
 ( 1Ope{ � file menr Bed o �current line.� M� _<cr>.� )�addremove*
 - 1Run ?` o� � � D, orF   s �ly select�L cvisual+ � ion mode (see |  �Ort|)F?C-AG+idiff*
 �!a  AB/SbetweNAwork�� irectory versioB1and: !paS  B 0 8 �. Similar running�0:Hg� |� !at� zDz+v{v|� |��|, but use a� 0ticQOplit� V v� &V� +�refresh*
 + R ee# �%by� �1Ogain� R� "��1*
AXdother  �� :� \<C-N>o @Jump�  4 2nex�Sname.3 P3 
t:ous7 q� LQuit� Pow.

    �    m  s       "   ����B�nl�F�4-�l�M����]�            4�  B  � ?�  �*:Hgstatuscommit*
 * �Runs |:Hg �| on the files currently mentioned in
w  9 �buffer, or iK E ` selecE 1. Tb Orst L  op+ � means you can delete lines froms J Quntil) �remaining� � names are thosee want toL &.  �Mapped to <C-S>.

�'v�v�pSimilarn |��|, but use a vertical� �split, as withM k |� RNot m� �byd default.

         �  4       &   ����G�v^��m��j��R�wh�F            4�  B  � ��:Hgrevert {files}  *1 /*
$ R  �s the given [ � (in repo-relative paths). If noP  > 3 arM 7, r` qcurrent$ 5.

� !� � !� �Same as |- �| but with� �--no-backup optionL @to pJ �nt a .orig ? � �from beingH �created.
        j  *       (   ���� ��(��D�:a� �c��eo�            4  B  � ?�  �*:Hgstatusqnew*
 � {patch} {message}.
I �&If you have the 'mq' extension enabled, creates a newN x Q withM �file currently mentioned in  buffer,O $or* E ` selecE �. You must give a| OnameQ �and may opD �ally writ? scommit 2A fory V P (� �out surrounding quotes).

�(�refresh*
 �6  es& � `� s�P 
��Pon.

    y     �  d       +   ���������+�))ݹ�$(���K�            4F  B  a ?:  
 �'Also, unless the `lawrencium_auto_cd` global is set toO �	`0`, it will temporarily8 �he current directory to beQ  4 rroot of Qeposi9 �so that � �-completedJ �filenames work ouT Pbox.
    P    P  .`       .   �����\#a�З�yi_I���!            4)  B   . 7�  L   ")~
O : O �P � 3� � r   O )  5rrrrO /	 r� +E   P O � r O 1�O ) ))rO �  O e	 O u \O R
  Y � 94.  Global Settings+ �|lawrencium-g$ #-s$ �|
  z  �   Ol �Also, unless theR �_auto_cd| [ � is set to
  "  j  �[ �
a temp file and edited inh � preview-window|� 
O � �hg_bang_W v_comman� M �specifie� �at another type of � � or buffer shouldO �be used.
" AOnce� `outputK@openae 5, L� _ willRry to�"heb� �according   �MercuriaL :�was run. Sem)  s_o _o �s|.
  �  �   Ndefin�>it.[�X 3 Q_mapp�	c"H O	
= 9
R �
*f@*

T�Pollowy
�Ps can�your |vimrc|�Qchang� 
default behavi( 'of`�  ��executable*
g: f D� �/  � �run when	 nz/s.o 	 s��imply `hg`,�  - S2whe� he current work� �directory 	��`reposi9 �'s root wh�9_|:Hg|53 so��uto-completion� �s magically withN � � relative path�/`1�- � j �J�L  bK �keyboard7 _rtcutV��# �6Vim��!us, ZO:Hg!w  (O1  � )�Qorder�7how�8Q |p�  |,!ch-sA!of2� n� . A good altern�L i� Suse |� "to�� �Onorm��(/� *%  ,|0 -�cM/us.Y ([�e� based on�
@�k	^$By���overridden, t�>N 4map�6 �	/s:�Odiff 1 �graphlog Pog


    �    �  1k       0   	����^�Sm��TH� {2	�΂�r            4#	  �  J  �   m4.  Log Window  �|lawrencium-log-w$ �|
5.  Global Settings4 g$ #-s$ � |
  L  X   B  �a temp file and edited in a split � �.
  �  u   �:HgstatusN �	Shows the output of 'hg - 'W � �Some extra-commands, along with s  �default mapp� ,O �are available� Dthis� � See
  � ?*  �*:Hglog*
 � BOpen �history (log) for �currently� �N N6L O7�/ee�?.

]$$_f_  {}q �ame as |! @|, b}n 5 d�specified� pinstead��� .

  �  �   (P �Mapped to <CR>J��     ,4 QTRL-A8 oc  �8 D8 o`  �8 V8 o  D8 S8 o �  !8 �%v  %�  �)%o*��
The `hg`�1ued by LN � has a few:4al Zr 
defin/� it. Also, unlesx�_3 _c�| is set to
`0`,�b  �m+�keyboard shortcut��s detail� �the
following descriptionsz'0rev�)*
 ( �Looks at� �revisioni8 onD_ line�%nd�&atO  �x �   p ?ousI ��(although ��read-only buffer).
�|�|A ��1*
ARUotheron�� :� qi  KQuit. o.



= 9�� ��*
  )�  +�        �    �  5       1   
�����xf]y�Q�U�W�c�[ݖ1            4�  �  )�  )�  �  �Mapped to |<CR>|.

  �*:Hglogdiff*
 
% �Looks at the revision specified on �current line,� �and runs an `hg o �` betweeH &atc  , ?theL p* �ously listed; "(i�  � � below). ItK Ropens ? b � window.@ �It doesn' � anything ifdsor is,?las�  � /.
�/-D�-)_r�T{rev}' �Same as |! c|, but/a,��.�P work,�directory� -�  !1} .2}Z � ?=two� Pons.
    )    �  ;�       3   �����+~�%g$��!'ňh�K�            4r  B  � ? �  �This splits the current window to show both  
H 8 �file andM !pa �revision �, using Vim'sO �|diff| abilities.
  �  !   �:Hg  � {revspec}6 �Same as |! Q| but� As a 3 )of�  � � "wi�  d Uified� V. Any� �number, hashO !orI � that can b"@ssedg�`hg cat` is valid� �]  �   {:Hgv�  � 0use� �vertical�� instead of� �a horizont6  � "( ?  *� Vsum*
 � � ~"� �summary" ( `output� # ! /`)d�@ aga�  ��?.

� ()_f� 	��:sum�� /of_�O ��uM �M)m*B .
�  �n � �|�@| reH �tively, O  �Bopen��S in a�s��6 |$v}/v~ 	  �#; �v |J 
� }#� window.

    �     �  =       8   ���������.f;S��S� �R.            4`  B  � ?T  �*:Hgrepolog*
 
% �Opens the history (log) for `whole ; !si _in a
s �#split window. Some extra-commands, along with someK � default mapping: �re available� Dthism H �See |lawrencium-log-window|.

     �    A  F4       <   ����
�Ep/
����i�(�Ӡ��            4�	  �  ~  �   r5.  Annotate Window  �|lawrencium-a$ !-w$ �|
6.  Global Settings9 g$ #-s$ b|
  ! ?�  D*:Hg� '*
 	& �Splits the current � � to show 7 pions in* 
s 4lef? w. These> � are retrieved with `hgM � /`.# )If� �file has local edits," �full outputM  of� w � will be opened instead, which i5� Ad pa� �revision� �Some extra-commands, along-s  �default mapp$,� �re available�$is�� /ee�
r.

  '$ /�!� statusdiffsum*
 � `imilar�|$ c|, but�  � summaryAlike
1one: nT Z x $|,�? ofI �running aT1Vim� Q`Mapped� �<CTRL-U>.

7'v8 8�  ;u�� vertical� s� !H>�6K  6�  �0 � x@*

T�Pollow�"�7a |�|�I ��specified keyboardSb unles�_define_( #| �0
is  
?`0`�!� � ��: (s��_) for�
�@ men��ed underX?sorP|<CR>?

= 9:CNb*
  <� � ��_width_offset*
g:$ v�t-  O �@when� pu� ! T �	 % �(��&)�Drs� 0' T^ is� 1fulyPexamp��	f you have |'listchars'|z� �display / �acters at� 0bor� #L Bunwr�Bline1`extendO�outside.
    $�     �  G�       ?   �����@$Ɏx��9��Ğd~� T�            4�  B  F ?u  �*lawrencium_auto_close_buffers*
g:! 

X �Specifies whether to @ -@  @ � opened byJ L� �. For instance, any diff summaryU T O �by `Hglog` will be deleted� �n the log windowG �disappears.

    %�    �  G�       B   �����/Y�rX!���0 ZB���            4  �    �   �  �Opens the history (log) for �current reposi! 
K !in2 �0|preview-window|. Some extra-commands, along with 
  �       K^ �file or direcotry instead ofx Wwhole� � .
     !T   �  �*:Hglogthis*
 
% �Same as |! | but oR?j�ly edited� � �6U  6   �[ T� � is only valid iP �logged path maps to az � �(i.e. not a� � Q, and � ? asO A/).( `Mapped� p|<C-E>|� �8K  8v   *7 PR>|.
    'n     �  Ig       F   ����r�ZP�3#��*%���4�I            4u  B  #o ?i  �*:Hgvimgrep*
 
% �Runs a |: �| command inside the current
j � repository. The files in which to search can beH �provided withV �-relative names. If nog ? isO agiven,� � �will be run�   Uwholel Pry.

    (R    �  N�       G   �������YK�U޵�,�Y��^V�            4  �  �  �   r6.  MQ Series Window  � |lawrencium-mqs# !-w# �|
7.  Global Settings 9 g$ #-s$ b|
  $� ?  C*:Hg� &*
 
% �If you have the 'mq' extension enabled, show! 
n �current patch k �, with indicators about whichJ B �es are appli� 2and7 3 on �not.

  ?  ?l  c�"
��	*

The following command� @vailv in a |^"| @ b along  7�specified keyboard mapp��, unless��_define_( #| 0
is � to `0`.

� Hgoto  (  God  � �Qunder cursor.z `Mapped> |<C-g>|� *�editmessage�  r   Edit� dommit  "fo� 2top� �, if any� e� ,Yrenam�    { }Z R& ^p given / � !u�*
A few other� � #MQ�:� qt  OQuit4 o.



= 9}�Pngs*
    +    �  T       I   �����65��1�s���dB)0"U            4R  B  7� ?t  �*:Hglogdiffsum*
 ( �Splits the previous window to show a 7 � summary (as
v � returned by `hg9 Q`) ofa �change specified onJ 0 �urrent line.* `Mapped� �|<C-U>|.

.+,_r0a{rev1} /2}^ �Same as |= Q| butJsK/of 0qbetween 7two@ ��sions. IK Donly� &is? ,e uat thatS �qwill be� nk'v� N@openN�vertical s�� pinstead��a horizontal oXpH>| and ?R>|� /dve1/_r?�
  :  ;�  `B  u 2Vim��R+ /it=�first pa��@This��rvalid i_�logged path maps�oa fileM �(i.e. not��rectory,�    V �whole reposi  �Dwith�/|)[DP�  ;�  <�  �<�  =+  NC ���M �*	 �/|,�?� )��'�<Pone.
    -�      [�       W   ����-�%��'��4���7���            4  B  ) ?|  �*:Hgtabdiff*
 
% �Same as |:Hg �| but opens the 2 �with a vertical
r �split in a new tab page.

� (_� �{revspec}� _� EB  H /�� (1sumd /*
E 0
   4w ; ]| and ?_f|J  rej tively,�ssummary�H ��
q+  +.  ",/ /?\!hstatus/	 (�imilar to |$ 8� � � .�� �running |��| on that filF `MappedE �<CTRL-D>W".@ / �K._sum*
  NOsum|=�	U=b0�  0�=";� /E� !'los/*
C .L_r*
  �!1} 2�$lo�� !_r=J �]"B� /A+N-K
 E'B+_r|N ��Pge.

    /�    �  ]�       [   �����H���_�p@����v����X            4|  �  "?  "t   �  �(See |lawrencium-log-window|. In addition, you can pass
O �1the usual hg log arguments like -u username, -l limit, etc.
  $$ ?�  � *:Hglogexport*
 ' E s� �commit under cursor to directory specified by� �env variable HG_EXPORT_PATCH_DIR. If this& ois notR @set,� @n it, �  ed� � �urrent working� R �of vim. On Unix, if�'er� �an absolute path,�	nB 	� �is ignored.

    1h    c  b!       _   ������^2�iGAq���7��y�T            47  B  (� ?+  �*:Hgannotate_f*
 r {file}( �Same as |! �|, but opens- �first with
s  C �edit|.

� )!� !� � /_f� � !� %w} (*
 ' [�runs the command in� �`verbose` mode to get full user names E �time of day.O �	This results in a wider � � ion column nexto ?theN  ky (hence�  � Q: "Hg^ ] ?e")o-w�
w�lw�w�� �-P!|.

    2�      n�       m   ����ЯZ��<������            4�  B  /� ?8  �*:Hgrecord*
 $ �Starts a " �" operation on the current buffer,
o wi.e. anA �where you can commit a selectedJ �subset of all� �hanges made to a file.
C �This actually doesn't run `hg � �`, but servesg N �
exact same purpose, hence� ?nam� 	3WheI�ommand is� �, a diff window will be?nobetwee� \   !pa �revision'sM Avers�f9 � Y# Y�t� s%E :Eing"��(by using |do| from� K � �, or |dpA @workW �directory� C). C� � �ed" into,N ��Rted w�$at# �is closed*"so7 �you're done ED,9?jus3�un |:wq|�Calso �� |QJ . �abort| if� Awantt  .?  Arunn� � ���&a\�show up� rAs with�ZormalG X omessag� `should�entered,��   �_again� R(4q!|]e� 1 ha�?bee�Rsaved�H �B	�o summarize:' *�|'-- ak B 2Use(5!]cH Bmove&@hunk   K  ' ,MYthose�K.� 	�,�F $If&Bing,�/in�
 �YK�* Done!

  b ?g  �*lawrencium_status_win_split_above*
g:% � QIf se�b1, |Hg? |�   !a K L j 	4pinstead�_below5�Defaults� ?`0`�J:OevenI $ H(
E/ b:(  �L  ��half. Otherwi	/it8� �of roughly{�ize needed toi	w
�modified�s��*_�C_in_�_�	�- �[J0leaOocus9*	�'thzt
9 eP0`.

    7�     �  o�       v   ������!�X4)Z�s!m��m�            4  B  DD ?  �*:Hgstatusrevert*
 * �Runs |:Hg �| on the file under �cursor, or in
w * �rent selection. The |<bang>| op � is usedK �just like in� Pt|.

