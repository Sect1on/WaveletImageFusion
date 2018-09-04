function out=zhengxing(c,up,down)

[row,col]=size(c);

for irow=1:row

    for jcol=1:col

        if c(irow,jcol)>up

           c(irow,jcol)=up;

        elseif c(irow,jcol)<down

           c(irow,jcol)=down;

        end

    end

end

out=c;