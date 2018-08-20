function testingChar(total_sample_images)

for no = 1:total_sample_images
    X=imread(['samples3/' int2str(no) '.jpg']);
    [In, vectS] = funcFeature(X);
    imwrite(In, ['output_sample/' int2str(no) '.jpg']);
    
    out=fopen('files/samples.xls','a+');
    fprintf(out,'%f\t',vectS);
    fprintf(out,'\n');
    fclose(out);
    
end
end