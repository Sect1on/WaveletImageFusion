%小波图像融合Demo
%版本1.00
%总体来说本算法就是将小波变换后的多层中每层的对应系数绝对值取大， 然后再将两张图像的对应原矩阵元素取均值，最后再利用小波重构，最终实现两张图像的融合。
clear all;
close all;
%用基于系数绝对值最大准则
%小波名 bior2.4双正交小波
wavelet='bior2.4';
%分解层数为两层
level = 2;
%将两张图像转为数据矩阵
im1=imread('C:\study\ImageFusion\Pictures\007.jpg');
im2=imread('C:\study\ImageFusion\Pictures\007TI.jpg');
%分别取三维矩阵的第一维
a=im1(:,:,1);
b=im2(:,:,1);

[Ca,Sa] = wavedec2(a,level,wavelet);
[Cb,Sb] = wavedec2(b,level,wavelet);
%取第2层高频的分解系数大小


x=Sa(2,:);
y=Sa(1,:);
z=Sa(3,:);
Ra = zeros(size(Ca));

%将高频取均方差取大
for n=1:2
     %将第n层水平,垂直，对角高频的两张图均方差取大
for m=1:3
    if n==1
        ylow=y(1)*y(2)+(m-1)*x(1)*x(2);
        Ta = zeros(x(1),x(2));
        Tb = zeros(x(1),x(2));
        cl=Ta;
    elseif n==2
        ylow=y(1)*y(2)+3*x(1)*x(2)+(m-1)*z(1)*z(2);
        Ta = zeros(z(1),z(2));
        Tb = zeros(z(1),z(2));
        cl=Ta;
    end
    
%将第二层水平高频还原为矩阵分别为Ta，Tb
    [Taline,Tarow]=size(Ta);
for i=1:Taline
    for j=1:Tarow
        Ta(i,j)=Ca((i-1)*Tarow+j+ylow);
        Tb(i,j)=Cb((i-1)*Tarow+j+ylow);
    end
end


%分别对两个矩阵的掩摸进行比较

for i=1:(Taline)
    for j=1:(Tarow)
 Tta=0;
Ttb=0;
Tta2=0;
Ttb2=0;
       %对每一个小矩阵元素求和
       if i>=2 && i<=(Taline-1) && j>=2 && j<=(Tarow-1)
        for k=1:3
            for p=1:3
                Tta=Tta+Ta(i+k-2,j+p-2);
                Ttb=Ttb+Tb(i+k-2,j+p-2);
            end
        end
        %求均方差
        for k=1:3
            for p=1:3
                Tta2=Tta2+[Ta(i+k-2,j+p-2)-(Tta/9)].^2;
                Ttb2=Ttb2+[Tb(i+k-2,j+p-2)-(Ttb/9)].^2;
            end
        end
        %进行比较，并将最后结果赋予一个新矩阵Ra
        if Tta2>=Ttb2
            cl(i,j)=Ta(i,j);
%         else
%             cl(i,j)=Tb(i,j);
        end
       else
           cl(i,j)=Ta(i,j);
       end
    end
end
%将处理后的矩阵转变成行向量
for i=1:Taline
    for j=1:Tarow
        Ra((i-1)*Tarow+j+ylow)=cl(i,j);
    end
end
     
end
end

 

%取一个与分解系数矩阵Ca中的行向量长度同的0矩阵

%对于第2层低频取两张图像对应两个元素的平均值，作为生成矩阵的元素。
for p=1:y(1)*y(2)
Ra(p)=(Ca(p)+Cb(p))/2;
end


%二维离散小波的多层重构， 在此为5层重构。
result = waverec2(Ra,Sa,wavelet);
%将融合后图像取整后变成unit8单位制
res= uint8(round(result));
%显示，并以“小波系数取均方差大”为标题
figure;
imshow(res);
title('小波系数取均方差大');