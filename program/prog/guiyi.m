function [out]=guiyi(c)



[row,col]=size(c);

max_c=max(c);

max_cc=max(max_c);

min_c=min(c);

min_cc=min(min_c);



for irow=1:row

    for jcol=1:col

        c(irow,jcol)= (c(irow,jcol)-min_cc)/(max_cc-min_cc+eps);

    end

end

out=c;