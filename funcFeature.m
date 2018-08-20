function [sk, vectProp] = funcFeature(X)

Y= X;
B = im2bw(Y);

[R, C] = size(B);

x=1;
for i=1:R
    for j = 1:C
        if B(i,j)== 0
            mat1(x)= i;
            mat2(x)= j;
            x=x+1;
        end
    end
end



B2 = B(min(mat1):max(mat1),min(mat2):max(mat2));


par =32;
cell_size=4;
no_of_blocks=par/cell_size;


S= imresize(B2, [par par]);
sk = bwmorph(~S,'thin',Inf);




x=ones(1,no_of_blocks)*cell_size;
cell_array=mat2cell(sk,x,x);

for i= 1:no_of_blocks
    for j=1:no_of_blocks
        temp_mat=cell_array{i,j};
        n_black=0;
        n_white=0;
        for k=1:cell_size
            for l=1:cell_size
                if temp_mat(k,l)==0
                    n_black=n_black+1;
                else
                    n_white=n_white+1;
                end
                
            end
        end
        prop(i,j)= n_white/n_black;
        
        
    end
end


m = 0;
for i =1:no_of_blocks
    for j=1:no_of_blocks
        
        m = m+1;
        vectProp(m) = prop(i,j);
        
    end
end


end
