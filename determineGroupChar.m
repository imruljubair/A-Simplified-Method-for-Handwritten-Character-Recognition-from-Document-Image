function groupData = determineGroupChar(total_training_images, number_of_types, t)

per=total_training_images/number_of_types;

z = 0;

for e = 1:number_of_types
    t = char(t+1);
    for f = 1: per
        z = z+1;
        grp(z) = t;
    end
end

groupData = grp';

end