tic
%% Preallocation
p_reference=cell(length(groups),1);
p_cat=cell(length(groups),1);
perimeter_p=zeros(length(groups),1);
a_reference=cell(length(groups),1);
a_cat=cell(length(groups),1);
area_p=zeros(length(groups),1);
ad_reference=cell(length(groups),1);
ad_cat=cell(length(groups),1);
adjacency_p=zeros(length(groups),1);
d_reference=cell(length(groups),1);
d_cat=cell(length(groups),1);
diameter_p=zeros(length(groups),1);
majax_reference=cell(length(groups),1);
majax_cat=cell(length(groups),1);
majoraxis_p=zeros(length(groups),1);
minax_reference=cell(length(groups),1);
minax_cat=cell(length(groups),1);
minoraxis_p=zeros(length(groups),1);
max_length=zeros(length(groups),1);
for gr=1:length(groups)
%% Perimeter 
max_length(gr)=max(max([cellfun('length',Perimeter_sorted{gr,1}),cellfun('length',Area_sorted{gr,1}) cellfun('length',Adjacency_sorted{gr,1}) cellfun('length',Diameter_sorted{gr,1}) cellfun('length',MajorAxis_sorted{gr,1}) cellfun('length',MinorAxis_sorted{gr,1})]));
hold on
groupnumber=cell(length(Perimeter_sorted{gr,1}),1);
data_interp=cell(length(Perimeter_sorted{gr,1}),1);
for blah=1:length(Perimeter_sorted{gr,1})
    groupnumber{blah,1}=blah*ones(max_length(gr),1);
    data_interp{blah,1}=interp1(1:length(Perimeter_sorted{gr,1}{blah,1}),Perimeter_sorted{gr,1}{blah,1},1:max_length(gr));
end
p_reference{gr,1}=cat(1,groupnumber{1:length(groupnumber),1});
p_cat{gr,1}=cat(2,data_interp{1:length(data_interp),1});
perimeter_p(gr)=anova1(p_cat{gr,1},p_reference{gr,1});
title(cat(2,'Perimeter Anova Group ',num2str(gr)));
hold off
%% Area 

hold on
groupnumber=cell(length(Area_sorted{gr,1}),1);
for blah=1:length(Area_sorted{gr,1})
     groupnumber{blah,1}=blah*ones(max_length(gr),1);
       data_interp{blah,1}=interp1(1:length(Area_sorted{gr,1}{blah,1}),Area_sorted{gr,1}{blah,1},1:max_length(gr));
end
a_reference{gr,1}=cat(1,groupnumber{1:length(groupnumber),1});
a_cat{gr,1}=cat(2,data_interp{1:length(data_interp),1});
area_p(gr)=anova1(a_cat{gr,1},a_reference{gr,1});
title(cat(2,'Area Anova Group ',num2str(gr)));
hold off
figure
hold on
for blah=1:length(Area_sorted{gr,1})
    cdfplot(Area_sorted{gr,1}{blah,1})
end
title(cat(2,'Area CDF Group ',num2str(gr)))
hold off
%% Incremental Energy
figure
hold on
for blah=1:length(Energy_sorted{gr,1})
    cdfplot(Energy_sorted{gr,1}{blah,1})
end
title(cat(2,'Energy CDF Group ',num2str(gr)))
hold off
%% Adjacency

hold on
groupnumber=cell(length(Adjacency_sorted{gr,1}),1);
for blah=1:length(Adjacency_sorted{gr,1})
     groupnumber{blah,1}=blah*ones(max_length(gr),1);
       data_interp{blah,1}=interp1(1:length(Adjacency_sorted{gr,1}{blah,1}),Adjacency_sorted{gr,1}{blah,1},1:max_length(gr));
end
ad_reference{gr,1}=cat(1,groupnumber{1:length(groupnumber),1});
ad_cat{gr,1}=cat(2,data_interp{1:length(data_interp),1});
adjacency_p(gr)=anova1(ad_cat{gr,1},ad_reference{gr,1});
title(cat(2,'Adjacency Anova Group ',num2str(gr)));
hold off
%% Diameter

hold on
groupnumber=cell(length(Diameter_sorted{gr,1}),1);
for blah=1:length(Diameter_sorted{gr,1})
     groupnumber{blah,1}=blah*ones(max_length(gr),1);
       data_interp{blah,1}=interp1(1:length(Diameter_sorted{gr,1}{blah,1}),Diameter_sorted{gr,1}{blah,1},1:max_length(gr));
end
d_reference{gr,1}=cat(1,groupnumber{1:length(groupnumber),1});
d_cat{gr,1}=cat(2,data_interp{1:length(data_interp),1});
diameter_p(gr)=anova1(d_cat{gr,1},d_reference{gr,1});
title(cat(2,'Diameter Anova Group ',num2str(gr)));
hold off
%% Major Axis

hold on
groupnumber=cell(length(MajorAxis_sorted{gr,1}),1);
for blah=1:length(MajorAxis_sorted{gr,1})
     groupnumber{blah,1}=blah*ones(max_length(gr),1);
       data_interp{blah,1}=interp1(1:length(MajorAxis_sorted{gr,1}{blah,1}),MajorAxis_sorted{gr,1}{blah,1},1:max_length(gr));
end
majax_reference{gr,1}=cat(1,groupnumber{1:length(groupnumber),1});
majax_cat{gr,1}=cat(2,data_interp{1:length(data_interp),1});
majoraxis_p(gr)=anova1(majax_cat{gr,1},majax_reference{gr,1});
title(cat(2,'Major Axis Anova Group ',num2str(gr)));
hold off
%% Minor Axis

hold on
groupnumber=cell(length(MinorAxis_sorted{gr,1}),1);
for blah=1:length(MinorAxis_sorted{gr,1})
     groupnumber{blah,1}=blah*ones(max_length(gr),1);
       data_interp{blah,1}=interp1(1:length(MinorAxis_sorted{gr,1}{blah,1}),MinorAxis_sorted{gr,1}{blah,1},1:max_length(gr));
end
minax_reference{gr,1}=cat(1,groupnumber{1:length(groupnumber),1});
minax_cat{gr,1}=cat(2,data_interp{1:length(data_interp),1});
minoraxis_p(gr)=anova1(minax_cat{gr,1},minax_reference{gr,1});
title(cat(2,'Minor Axis Anova Group ',num2str(gr)));
hold off
end
%% Total Ridge Length
hold on
groupnumber=cell(length(total_ridge_length_sorted),1);
for blah=1:length(total_ridge_length_sorted)
    groupnumber{blah,1}=blah*ones(length(total_ridge_length_sorted{blah,1}),1);
end
totalridge_reference=cat(1,groupnumber{1:length(groupnumber),1});
totalridge_cat=cat(1,total_ridge_length_sorted{1:length(total_ridge_length_sorted),1});
totalridge_p=anova1(totalridge_cat,totalridge_reference);
title('Total Ridge Length Anova');
hold off
%% Total Energy
hold on
groupnumber=cell(length(total_energy_sorted),1);
for blah=1:length(total_energy_sorted)
    groupnumber{blah,1}=blah*ones(length(total_energy_sorted{blah,1}),1);
end
totalenergy_reference=cat(1,groupnumber{1:length(groupnumber),1});
totalenergy_cat=cat(1,total_energy_sorted{1:length(total_energy_sorted),1});
totalenergy_p=anova1(totalenergy_cat,totalenergy_reference);
title('Total Energy Anova');
hold off
%% Maximum Force
hold on
groupnumber=cell(length(max_force_sorted),1);
for blah=1:length(max_force_sorted)
    groupnumber{blah,1}=blah*ones(length(max_force_sorted{blah,1}),1);
end
maxforce_reference=cat(1,groupnumber{1:length(groupnumber),1});
maxforce_cat=cat(1,max_force_sorted{1:length(max_force_sorted),1});
maxforce_p=anova1(totalridge_cat,totalridge_reference);
title('Maximum Force Anova');
hold off
%% Maximum Displacement
hold on
groupnumber=cell(length(max_displacement_sorted),1);
for blah=1:length(max_displacement_sorted)
    groupnumber{blah,1}=blah*ones(length(max_displacement_sorted{blah,1}),1);
end
maxdisp_reference=cat(1,groupnumber{1:length(groupnumber),1});
maxdisp_cat=cat(1,max_displacement_sorted{1:length(max_displacement_sorted),1});
maxdisp_p=anova1(maxdisp_cat,maxdisp_reference);
title('Maximum Displacement Anova');
hold off
%% p-values
perimeter_p
area_p
adjacency_p
diameter_p
majoraxis_p
minoraxis_p
totalridge_p
totalenergy_p
maxforce_p
maxdisp_p
tilefigs
toc