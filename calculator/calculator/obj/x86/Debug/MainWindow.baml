   M S B A M L   `   `   `  ����  
calculator    calculator.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   �   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     6�   -   5          � Title$  
Calculator��5   	    � Icon$1 +/calculator;component/Images/calculator.png��63   
�������
�������$	��532��6"  $	��320��6/   � 
ResizeMode$ NoResize=�6;  $
��Left=�6Q  $	��Top=�6l  .��5      �  J� Opacity$	 100Q�6   ���	#FF233039.+�5   
   �� -   5        $��txtdis��5   D   $�� ��6   $	��200��6   $��Center=�6'   $��Center=�6S   $	��324��6n   $��-13,-27,-13,320q�6z   $��	Digital-7)�6�   $��55(�6�    �� TextAlignment$ Right=�6�   $��LeftToRight=�6�   $��Right=�6�   $��Bottom=�6  $��10q�6/  ���	#FF232D36
������� J� OpacityMask �	#FF8D8D8D$��3q�6~  |�.   J� IsHitTestVisible .  ��6�  Z� 6�  �� 5   
   -   5        $��clearbtn��5   �   ���	#FF233039$��CLEAR��6?   $��LeftToRight=�6O   $��Consolas)�6k   $��22(�6�   ���	#FFFDAD10$��55��6�   $��Center=�6�   $��9,180,153,258q�6�   $��Center=�6�   $	��136��6   �� 	ClickMode$ Release=�64  $
��Bold"�6H  ��6(   Z� 6H  �� 5   
   -   5        $��btnclr��5   S   $��CE��6   $��Center=�6   $��150,180,84,258q�6;   $��64��6a   ���	#FF233039���	#FFFDAD10$��22(�6�   $��Consolas)�6�   $��LeftToRight=�6�   $��55��6  $��Center=�6  $
��Bold"�6-  ��6�   Z� 6-  �� 5	   
   -   5        $
��btn7��5	   ]   $��7��6   $��55��6   $��Center=�6)   $��9,240,224,198q�6F   $��Center=�6i   $��65��6�   ���	#FF233039
�������$��Consolas)�6�   $
��Bold"�6  $��Normal$�6#  $��Normal&�66  $��22(�6K  $��LeftToRight=�6Y  $��0q�6u   � DataContext 6�   �� ��6�   Z� 6u  �� 5
   
   -   5        $
��btn8��5
   ^   $��8��6   $��55��6   $��Center=�6)   $��80,240,154,198q�6F   $��Center=�6j   $��65��6�   ���	#FF233039
�������$��22(�6�   $��Consolas)�6�   $��LeftToRight=�6  $��0q�6$  $
��Bold"�60  ��6�   Z� 60  �� 5   
   -   5        $
��btn9��5   ^   $��9��6   $��55��6   $��Center=�6)   $��150,240,84,198q�6F   $��Center=�6j   $��65��6�   ���	#FF233039
�������$��22(�6�   $��Consolas)�6�   $��LeftToRight=�6  $��0q�6$  $
��Bold"�60  ��6�   Z� 60  �� 5   
   -   5        $��btndiv��5   ^   $��/��6   $��55��6   $��Center=�6)   $��218,180,14,258q�6F   $��Center=�6l   $��65��6�   ���	#FF233039���	#FFFDAD10$��22(�6�   $��Consolas)�6�   $��LeftToRight=�6  $��0q�6,  $
��Bold"�68  ��6�   Z� 68  �� 5   
   -	   5        $
��btn4��5   ]   $��4��6   $��55��6   $��Center=�6)   $��9,300,224,138q�6F   $��Center=�6i   $��65��6�   ���	#FF233039
�������$��22(�6�   $��Consolas)�6�   $��LeftToRight=�6  $��0q�6#  $
��Bold"�6/  ��6�   Z� 6/  �� 5   
   -
   5        $
��btn5��5   ^   $��5��6   $��55��6   $��Center=�6)   $��80,302,154,136q�6F   $��Center=�6j   $��65��6�   ���	#FF233039
�������$��22(�6�   $��Consolas)�6�   $��LeftToRight=�6  $��0q�6$  $
��Bold"�60  ��6�   Z� 60  �� 5   
   -   5        $
��btn6��5   ^   $��6��6   $��55��6   $��Center=�6)   $��150,302,84,136q�6F   $��Center=�6j   $��65��6�   ���	#FF233039
�������$��22(�6�   $��Consolas)�6�   $��LeftToRight=�6  $��0q�6$  $
��Bold"�60  ��6�   Z� 60  �� 5   
   -   5        $��btnmul��5   ^   $��x��6   $��55��6   $��Center=�6)   $��218,242,14,196q�6F   $��Center=�6l   $��65��6�   ���	#FF233039���	#FFFDAD10$��22(�6�   $��Consolas)�6�   $��LeftToRight=�6  $��0q�6,  $
��Bold"�68  ��6�   Z� 68  �� 5   
   -   5        $
��btn1��5   \   $��1��6   $��55��6   $��Center=�6)   $��9,362,224,76q�6F   $��Center=�6h   $��65��6�   ���	#FF233039
�������$��22(�6�   $��Consolas)�6�   $��LeftToRight=�6  $��0q�6"  $
��Bold"�6.  ��6�   Z� 6.  �� 5   
   -   5        $
��btn2��5   ]   $��2��6   $��55��6   $��Center=�6)   $��80,362,154,76q�6F   $��Center=�6i   $��65��6�   ���	#FF233039
�������$��22(�6�   $��Consolas)�6�   $��LeftToRight=�6  $��0q�6#  $
��Bold"�6/  ��6�   Z� 6/  �� 5   
   -   5        $
��btn3��5   ]   $��3��6   $��55��6   $��Center=�6)   $��150,362,84,76q�6F   $��Center=�6i   $��65��6�   ���	#FF233039
�������$��22(�6�   $��Consolas)�6�   $��LeftToRight=�6  $��0q�6#  $
��Bold"�6/  ��6�   Z� 6/  �� 5   
   -   5        $��btnsub��5   ^   $��-��6   $��55��6   $��Center=�6)   $��218,302,14,136q�6F   $��Center=�6l   $��65��6�   ���	#FF233039���	#FFFDAD10$��22(�6�   $��Consolas)�6�   $��LeftToRight=�6  $��0q�6,  $
��Bold"�68  ��6�   Z� 68  �� 5   
   -   5        $
��btn0��5   \   $��0��6   $��55��6   $��Center=�6)   $��9,422,224,16q�6F   $��Center=�6h   $��65��6�   ���	#FF233039
�������$��22(�6�   $��Consolas)�6�   $��LeftToRight=�6  $��0q�6"  $
��Bold"�6.  ��6�   Z� 6.  �� 5   
   -   5        $��btn00��5   ^   $��00��6   $��55��6   $��Center=�6*   $��150,422,84,16q�6G   $��Center=�6k   $��64��6�   ���	#FF233039
�������$��22(�6�   $��Consolas)�6�   $��LeftToRight=�6
  $��0q�6&  $
��Bold"�62  ��6�   Z� 62  �� 5   
   -   5        $��	btnresult��5   ]   $��=��6   $��55��6   $��Center=�6)   $��218,422,14,16q�6F   $��Center=�6n   $��66��6�   ���	#FFFDAD10
�������$��22(�6�   $��Consolas)�6�   $��LeftToRight=�6  $��0q�6-  $
��Bold"�69  ��6�   Z� 69  �� 5   
   -   5        $��btnadd��5   ]   $��+��6   $��55��6   $��Center=�6)   $��218,362,14,76q�6F   $��Center=�6k   $��65��6�   ���	#FF233039���	#FFFDAD10$��22(�6�   $��Consolas)�6�   $��LeftToRight=�6  $��0q�6+  $
��Bold"�67  ��6�   Z� 67  �� 5   
   -   5        $��btnpoint��5   �   ���	#FF233039$��.��6?   $��LeftToRight=�6K   $��Consolas)�6g   $��22(�6}   $
��Bold"�6�   
�������$��55��6�   $��Center=�6�   $��80,422,154,16q�6�   $��0q�6   $��Center=�6  $��64��6'  ��6(   Z� 62  5      5      