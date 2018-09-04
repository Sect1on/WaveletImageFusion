    x = imread('C:\study\ImageFusion\Pictures\007.jpg');  
      
    %转为灰度图像  
    X = rgb2gray(x);  
      
    %用db1小波函数分解,分解层数为2  
    %可利用X = waverec2(C, S, 'db1')进行重构  
    [C, S] = wavedec2(X, 2, 'db1');  
    %提取2层的低频系数  
    a = appcoef2(C, S, 'db1', 3);  
    %提取2层的所有高频系数  
    [h, v, d] = detcoef2('all', C, S, 2);  
    c = [a, h; v, d];  
      
      
    %将c里的数值拉伸到0-255；b=uint((a-min(a(:)))./(max(a(:))-min(a(:)))*255);   
    imshow(c,[]);  