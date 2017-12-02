function [output]= erosion(I,str_ele)
    output=zeros(size(I));
    [f_row,f_col]=size(str_ele);
    I=padarray(I,[floor(f_row/2) floor(f_col/2)],1);
    
    [row,col]=size(I);
    I=double(I);
    for i=1:row-(f_row-1)
        for j=1:col-(f_col-1)
         C=(I(i:(i+f_row-1),j:(j+f_col-1),1)).*str_ele;
         if isequal(C,str_ele)
             output(i,j)=1;
         else
             output(i,j)=0;
         end
        end
    end
    
    
end