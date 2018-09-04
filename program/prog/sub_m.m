%以row，col为点子矩阵的左上角的点，求矩阵C的大小为n*n的子矩阵

function  [out]= sub_m(c,row,col,n)
s_c(n , n)=0;
iirow=1;
jjcol=1;
for irow=row:(row+n-1)
   for jcol=col:(col+n-1)
        s_c(iirow,jjcol)=c(irow,jcol); 
        jjcol=jjcol+1;      
   end
   jjcol=1;
   iirow=iirow+1;
end
out=s_c;




