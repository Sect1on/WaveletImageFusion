
%求矩阵c1和c2的每个元素的乘积

function  out=mul_c(c1,c2)



[row,col]=size(c1);

c(row,col)=0;

for irow=1:row

    for jcol=1:col

        c(irow,jcol)=c1(irow,jcol)*c2(irow,jcol);

    end

end

out=c;