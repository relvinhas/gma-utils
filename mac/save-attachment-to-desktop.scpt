FasdUAS 1.101.10   ��   ��    k             i         I      �� 	���� 0 perform_mail_action   	  
�� 
 o      ���� 0 ruledata ruleData��  ��    k     �       l     ��������  ��  ��        l     ��  ��    A ; The folder to save the attachments in (must already exist)     �   v   T h e   f o l d e r   t o   s a v e   t h e   a t t a c h m e n t s   i n   ( m u s t   a l r e a d y   e x i s t )      r         c         l    	 ����  b     	    l     ����  I    ��  
�� .earsffdralis        afdr  m     ��
�� afdrcusr  �� ��
�� 
rtyp  m    ��
�� 
ctxt��  ��  ��    m         � ! !  D e s k t o p��  ��    m   	 
��
�� 
ctxt  o      ���� &0 attachmentsfolder attachmentsFolder   " # " l   ��������  ��  ��   #  $ % $ l   �� & '��   & A ; Save in a sub-folder based on the name of the rule in Mail    ' � ( ( v   S a v e   i n   a   s u b - f o l d e r   b a s e d   o n   t h e   n a m e   o f   t h e   r u l e   i n   M a i l %  ) * ) l   �� + ,��   + : 4 set subFolder to name of |Rule| of ruleData as text    , � - - h   s e t   s u b F o l d e r   t o   n a m e   o f   | R u l e |   o f   r u l e D a t a   a s   t e x t *  . / . l   �� 0 1��   0    tell application "Finder"    1 � 2 2 4   t e l l   a p p l i c a t i o n   " F i n d e r " /  3 4 3 l   �� 5 6��   5 I C 	if not (exists folder subFolder of folder attachmentsFolder) then    6 � 7 7 �   	 i f   n o t   ( e x i s t s   f o l d e r   s u b F o l d e r   o f   f o l d e r   a t t a c h m e n t s F o l d e r )   t h e n 4  8 9 8 l   �� : ;��   : N H 		make new folder at attachmentsFolder with properties {name:subFolder}    ; � < < �   	 	 m a k e   n e w   f o l d e r   a t   a t t a c h m e n t s F o l d e r   w i t h   p r o p e r t i e s   { n a m e : s u b F o l d e r } 9  = > = l   �� ? @��   ?   	end if    @ � A A    	 e n d   i f >  B C B l   �� D E��   D  	 end tell    E � F F    e n d   t e l l C  G H G l   ��������  ��  ��   H  I J I l   �� K L��   K 0 * Get incoming messages that match the rule    L � M M T   G e t   i n c o m i n g   m e s s a g e s   t h a t   m a t c h   t h e   r u l e J  N O N O    � P Q P k    � R R  S T S r     U V U n     W X W o    ���� 0 SelectedMessages   X o    ���� 0 ruledata ruleData V o      ���� $0 selectedmessages selectedMessages T  Y�� Y X    � Z�� [ Z k   ( � \ \  ] ^ ] l  ( (��������  ��  ��   ^  _ ` _ l  ( (�� a b��   a ( " Get the date the message was sent    b � c c D   G e t   t h e   d a t e   t h e   m e s s a g e   w a s   s e n t `  d e d r   ( J f g f n  ( + h i h 1   ) +��
�� 
drcv i o   ( )���� 0 
themessage 
theMessage g K       j j �� k l
�� 
year k o      ���� 0 y   l �� m n
�� 
mnth m o      ���� 0 m   n �� o p
�� 
day  o o      ���� 0 d   p �� q r
�� 
hour q o      ���� 0 h   r �� s��
�� 
min  s o      ���� 0 min  ��   e  t u t r   K � v w v l  K � x���� x b   K � y z y b   K y { | { b   K u } ~ } b   K n  �  b   K j � � � b   K c � � � b   K _ � � � b   K T � � � b   K P � � � m   K N � � � � �   � o   N O���� 0 y   � m   P S � � � � �  - � n  T ^ � � � I   U ^�� ����� 0 pad   �  ��� � c   U Z � � � o   U V���� 0 m   � m   V Y��
�� 
long��  ��   �  f   T U � m   _ b � � � � �  - � n  c i � � � I   d i�� ����� 0 pad   �  ��� � o   d e���� 0 d  ��  ��   �  f   c d � m   j m � � � � �  - ~ n  n t � � � I   o t�� ����� 0 pad   �  ��� � o   o p���� 0 h  ��  ��   �  f   n o | m   u x � � � � �  - z n  y  � � � I   z �� ����� 0 pad   �  ��� � o   z {���� 0 min  ��  ��   �  f   y z��  ��   w o      ���� 0 	timestamp 	timeStamp u  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   �   Save the attachment    � � � � (   S a v e   t h e   a t t a c h m e n t �  ��� � X   � � ��� � � k   � � � �  � � � r   � � � � � n   � � � � � 1   � ���
�� 
pnam � o   � ����� 0 theattachment theAttachment � o      ���� 0 originalname originalName �  � � � l  � ��� � ���   � a [ set savePath to attachmentsFolder & ":" & subFolder & ":" & timeStamp & " " & originalName    � � � � �   s e t   s a v e P a t h   t o   a t t a c h m e n t s F o l d e r   &   " : "   &   s u b F o l d e r   &   " : "   &   t i m e S t a m p   &   "   "   &   o r i g i n a l N a m e �  � � � r   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � o   � ����� &0 attachmentsfolder attachmentsFolder � m   � � � � � � �  : � o   � ����� 0 	timestamp 	timeStamp � m   � � � � � � �  - � o   � ����� 0 originalname originalName � o      ���� 0 savepath savePath �  ��� � Q   � � � ��� � I  � ��� � �
�� .coresavenull���     obj  � o   � ����� 0 theattachment theAttachment � �� ���
�� 
kfil � o   � ����� 0 savepath savePath��   � R      ������
�� .ascrerr ****      � ****��  ��  ��  ��  �� 0 theattachment theAttachment � n  � � � � � 2  � ���
�� 
attc � o   � ����� 0 
themessage 
theMessage��  �� 0 
themessage 
theMessage [ o    ���� $0 selectedmessages selectedMessages��   Q m     � ��                                                                                  emal  alis    F  Macintosh HD               �OiH+   0��Mail.app                                                        3,�-Ӓ        ����  	                Applications    �Oi      �-ł     0��  #Macintosh HD:Applications: Mail.app     M a i l . a p p    M a c i n t o s h   H D  Applications/Mail.app   / ��   O  ��� � l  � ���������  ��  ��  ��     � � � l     ��������  ��  ��   �  � � � l     �� � ���   � , & Adds leading zeros to date components    � � � � L   A d d s   l e a d i n g   z e r o s   t o   d a t e   c o m p o n e n t s �  � � � i     � � � I      �� ����� 0 pad   �  ��� � o      ���� 0 n  ��  ��   � L      � � n      � � � 7   �� � �
�� 
ctxt � m    	������ � m   
 ������ � l     ����� � b      � � � m      � � � � �  0 0 � o    ���� 0 n  ��  ��   �  ��� � l     ��������  ��  ��  ��       �� � � ���   � ����� 0 perform_mail_action  � 0 pad   � �~ �}�| � ��{�~ 0 perform_mail_action  �} �z ��z  �  �y�y 0 ruledata ruleData�|   � �x�w�v�u�t�s�r�q�p�o�n�m�l�x 0 ruledata ruleData�w &0 attachmentsfolder attachmentsFolder�v $0 selectedmessages selectedMessages�u 0 
themessage 
theMessage�t 0 y  �s 0 m  �r 0 d  �q 0 h  �p 0 min  �o 0 	timestamp 	timeStamp�n 0 theattachment theAttachment�m 0 originalname originalName�l 0 savepath savePath � �k�j�i�h   ��g�f�e�d�c�b�a�`�_�^ � ��]�\ � � ��[�Z � ��Y�X�W�V
�k afdrcusr
�j 
rtyp
�i 
ctxt
�h .earsffdralis        afdr�g 0 SelectedMessages  
�f 
kocl
�e 
cobj
�d .corecnte****       ****
�c 
drcv
�b 
year
�a 
mnth
�` 
day 
�_ 
hour
�^ 
min 
�] 
long�\ 0 pad  
�[ 
attc
�Z 
pnam
�Y 
kfil
�X .coresavenull���     obj �W  �V  �{ ����l �%�&E�O� ���,E�O ��[��l 	kh ��,E[�,E�Z[�,E�Z[�,E�Z[�,E�Z[�,E�ZOa �%a %)�a &k+ %a %)�k+ %a %)�k+ %a %)�k+ %E�O E�a -[��l 	kh 
�a ,E�O�a %�%a %�%E�O �a �l W X  h[OY��[OY�YUOP � �U ��T�S � ��R�U 0 pad  �T �Q ��Q  �  �P�P 0 n  �S   � �O�O 0 n   �  ��N�M
�N 
ctxt�M���R �%[�\[Z�\Zi2E ascr  ��ޭ