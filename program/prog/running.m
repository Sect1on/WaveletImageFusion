%
close all
clc
I = imread('1.jpg');
[row,col]=size(I);
%
wname='bior4.4'
%
subplot(2,3,1);
imshow(I);
title('Ô­Í¼');
%
[ca1,ch1,cv1,cd1] = dwt2(I,wname);
[ca2,ch2,cv2,cd2] = dwt2(ca1,wname);
[ca3,ch3,cv3,cd3] = dwt2(ca2,wname);
thr=4;a0=1;n=7;
[edge_mf1,grads1] = local_max_mode(cv1,ch1,thr,a0,n);
thr=15;a0=1;n=5;
[edge_mf2,grads2] = local_max_mode(cv2,ch2,thr,a0,n);
thr=30;a0=1;n=3;
[edge_mf3,grads3] = local_max_mode(cv3,ch3,thr,a0,n);
% 
edge_mf1=guiyi(edge_mf1);
edge_mf2=guiyi(edge_mf2);
edge_mf3=guiyi(edge_mf3);
%
ca3=wthresh(ca3,'h',3000000);
ca2=wthresh(ca2,'h',3000000);
ca1=wthresh(ca1,'h',3000000);
ca2_ca3=idwt2(ca3,edge_mf3,edge_mf3,edge_mf3,wname,size(ca2));
ca2_ca3=guiyi(abs(ca2_ca3));
com_2=mul_c(ca2_ca3,edge_mf2);
ca1_ca3=idwt2(ca2,com_2,com_2,com_2,wname,size(ca1));
ca1_ca3=guiyi(abs(ca1_ca3));
com_1=mul_c(ca1_ca3,edge_mf1);
n=5;a0=0.01;
com_1=ada_thr(com_1,n,a0);
com_1=wthresh(com_1,'h',0.00001);
com_1=dayu_c(com_1,0);
subplot(2,3,3);
imshow(com_1*255);
title('¶à³ß¶È');
subplot(2,3,4);
imshow(edge_mf3*255);
title('²ã');
subplot(2,3,5);
imshow(edge_mf2*255);
title('²ã');
subplot(2,3,6);
imshow(edge_mf1*255);
title('²ã');

