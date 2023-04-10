tic
%% Preallocation
Area_sorted=cell(length(groups),1);
Perimeter_sorted=cell(length(groups),1);
Adjacency_sorted=cell(length(groups),1);
Diameter_sorted=cell(length(groups),1);
MajorAxis_sorted=cell(length(groups),1);
MinorAxis_sorted=cell(length(groups),1);
Energy_sorted=cell(length(groups),1);
total_ridge_length_sorted=cell(length(groups),1);
max_force_sorted=cell(length(groups),1);
max_displacement_sorted=cell(length(groups),1);
total_energy_sorted=cell(length(groups),1);
r_r0final_sorted=cell(length(groups),1);
r_r1final_sorted=cell(length(groups),1);
for gr=1:length(groups)
%% Preallocation
Area_sorted{gr,1}=cell(length(groups),1);
Perimeter_sorted{gr,1}=cell(length(groups),1);
Adjacency_sorted{gr,1}=cell(length(groups),1);
Diameter_sorted{gr,1}=cell(length(groups),1);
MajorAxis_sorted{gr,1}=cell(length(groups),1);
MinorAxis_sorted{gr,1}=cell(length(groups),1);
Energy_sorted{gr,1}=cell(length(groups),1);
%% Area
sorted=[];
    figure
    hold on;
    for h=1:length(groupindex{gr,1}),
    
    sorted=sort(Area{groupindex{gr,1}(h,1),1},'descend');
    halp=histogram(sorted(2:length(sorted)),'Visible','off');
    plot([min(halp.BinLimits) (halp.BinEdges(2:length(halp.BinEdges))-0.5*halp.BinWidth) max(halp.BinLimits)],[0 halp.Values 0],plot_colour(gr))
    Area_sorted{gr,1}{h,1}=sorted(2:length(sorted));
    
    end
    figuretitle=cat(2,'Area group ',num2str(groups(gr)));
    title(figuretitle);
    hold off;
%% Perimeter
sorted=[];
    figure
    hold on;
    for h=1:length(groupindex{gr,1}),
    
    sorted=sort(Perimeter{groupindex{gr,1}(h,1),1},'descend');
    halp=histogram(sorted(2:length(sorted)),'Visible','off');
    plot([min(halp.BinLimits) (halp.BinEdges(2:length(halp.BinEdges))-0.5*halp.BinWidth) max(halp.BinLimits)],[0 halp.Values 0],plot_colour(gr))
    Perimeter_sorted{gr,1}{h,1}=sorted(2:length(sorted));
    
    end
    figuretitle=cat(2,'Perimeter group ',num2str(groups(gr)));
    title(figuretitle);
    hold off;
%% Adjacency
sorted=[];
    figure
    hold on;
    for h=1:length(groupindex{gr,1}),
    
    sorted=sort(Adjacency{groupindex{gr,1}(h,1),1},'descend');
    halp=histogram(sorted(2:length(sorted)),'Visible','off');
    plot([min(halp.BinLimits) (halp.BinEdges(2:length(halp.BinEdges))-0.5*halp.BinWidth) max(halp.BinLimits)],[0 halp.Values 0],plot_colour(gr))
    Adjacency_sorted{gr,1}{h,1}=sorted(2:length(sorted));
    
    end
    figuretitle=cat(2,'Adjacency group ',num2str(groups(gr)));
    title(figuretitle);
    hold off;
    %% Diameter
sorted=[];
    figure
    hold on;
    for h=1:length(groupindex{gr,1}),
    
    sorted=sort(EquivDiameter{groupindex{gr,1}(h,1),1},'descend');
    halp=histogram(sorted(2:length(sorted)),'Visible','off');
    plot([min(halp.BinLimits) (halp.BinEdges(2:length(halp.BinEdges))-0.5*halp.BinWidth) max(halp.BinLimits)],[0 halp.Values 0],plot_colour(gr))
    Diameter_sorted{gr,1}{h,1}=sorted(2:length(sorted));
    
    end
    figuretitle=cat(2,'Diameter group ',num2str(groups(gr)));
    title(figuretitle);
    hold off;
    %% Major Axis Length
sorted=[];
    figure
    hold on;
    for h=1:length(groupindex{gr,1}),
    
    sorted=sort(MajorAxisLength{groupindex{gr,1}(h,1),1},'descend');
    halp=histogram(sorted(2:length(sorted)),'Visible','off');
    plot([min(halp.BinLimits) (halp.BinEdges(2:length(halp.BinEdges))-0.5*halp.BinWidth) max(halp.BinLimits)],[0 halp.Values 0],plot_colour(gr))
    MajorAxis_sorted{gr,1}{h,1}=sorted(2:length(sorted));
    
    end
    figuretitle=cat(2,'Major Axis group ',num2str(groups(gr)));
    title(figuretitle);
    hold off;
     %% Minor Axis Length
sorted=[];
    figure
    hold on;
    for h=1:length(groupindex{gr,1}),
    
    sorted=sort(MinorAxisLength{groupindex{gr,1}(h,1),1},'descend');
    halp=histogram(sorted(2:length(sorted)),'Visible','off');
    plot([min(halp.BinLimits) (halp.BinEdges(2:length(halp.BinEdges))-0.5*halp.BinWidth) max(halp.BinLimits)],[0 halp.Values 0],plot_colour(gr))
    MinorAxis_sorted{gr,1}{h,1}=sorted(2:length(sorted));
    
    end
    figuretitle=cat(2,'Minor Axis group ',num2str(groups(gr)));
    title(figuretitle);
    hold off;
%% Total Ridge Length
sorted=[];
    figure
    hold on;
    for h=1:length(groupindex{gr,1}),
    
    sorted(h,1)=total_ridge_length(groupindex{gr,1}(h,1),1);
        
    end
    total_ridge_length_sorted{gr,1}=sorted;
    histogram(sorted);
    figuretitle=cat(2,'Total Ridge Length group ',num2str(groups(gr)));
    title(figuretitle);
    hold off;
%% Maximum Force
sorted=[];
    figure
    hold on;
    for h=1:length(groupindex{gr,1}),
    
    sorted(h,1)=max_force(groupindex{gr,1}(h,1),1);
        
    end
    max_force_sorted{gr,1}=sorted;
    histogram(sorted);
    figuretitle=cat(2,'Maximum Force group ',num2str(groups(gr)));
    title(figuretitle);
    hold off;
%% Maximum Displacement
sorted=[];
    figure
    hold on;
    for h=1:length(groupindex{gr,1}),
    
    sorted(h,1)=max_displacement(groupindex{gr,1}(h,1),1);
        
    end
    max_displacement_sorted{gr,1}=sorted;
    histogram(sorted);
    figuretitle=cat(2,'Maximum Displacement group ',num2str(groups(gr)));
    title(figuretitle);
    hold off;
%% Incremental Energy
sorted=[];
    for h=1:length(groupindex{gr,1}),
    
    sorted=energy{groupindex{gr,1}(h,1),1};
    Energy_sorted{gr,1}{h,1}=sorted;
    
    end
%% Total Energy
sorted=[];
    figure
    hold on;
    for h=1:length(groupindex{gr,1}),
    
    sorted(h,1)=total_energy(groupindex{gr,1}(h,1),1);
        
    end
    total_energy_sorted{gr,1}=sorted;
    histogram(sorted);
    figuretitle=cat(2,'Total Energy group ',num2str(groups(gr)));
    title(figuretitle);
    hold off;
%% r/r0 final
sorted=[];
    figure
    hold on;
    for h=1:length(groupindex{gr,1}),
    
    sorted(h,1)=r_r0final(groupindex{gr,1}(h,1),1);
        
    end
    r_r0final_sorted{gr,1}=sorted;
    histogram(sorted);
    figuretitle=cat(2,'r/r0 final group ',num2str(groups(gr)));
    title(figuretitle);
    hold off;
    %% r/r1 final
sorted=[];
    figure
    hold on;
    for h=1:length(groupindex{gr,1}),
    
    sorted(h,1)=r_r1final(groupindex{gr,1}(h,1),1);
        
    end
    r_r1final_sorted{gr,1}=sorted;
    histogram(sorted);
    figuretitle=cat(2,'r/r1 final group ',num2str(groups(gr)));
    title(figuretitle);
    hold off;
end
tilefigs
toc