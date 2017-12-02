function [output]= dilation(I,str_ele)
    output=zeros(size(I));
    [f_row,f_col]=size(str_ele);
    I=padarray(I,[floor(f_row/2) floor(f_col/2)]);
    I=double(I);
    [row,col]=size(I);
    
    k=zeros(f_row,f_col);
    
    for i=1:row-(f_row-1)
        for j=1:col-(f_col-1)
         C=(I(i:(i+f_row-1),j:(j+f_col-1),1)).*str_ele;
         if isequal(C,k)
             output(i,j)=0;
         else
             output(i,j)=1;
         end
        end
    end
    
    
end