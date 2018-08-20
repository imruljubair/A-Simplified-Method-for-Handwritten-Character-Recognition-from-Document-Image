function trainingChar(total_training_images)

for no = 1: total_training_images
    X=imread(['images4/' int2str(no) '.jpg']);
    [Im vectP] = funcFeature(X);
    imwrite(Im, ['output_training/' int2str(no) '.jpg']);
    
    out=fopen('files/base.xls','a+');
    fprintf(out,'%f\t',vectP);
    fprintf(out,'\n');
    fclose(out);
end
    
end

