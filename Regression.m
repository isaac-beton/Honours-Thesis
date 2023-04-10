Mean_Area=zeros(length(grouplist),1);
Median_Area=zeros(length(grouplist),1);
Mean_Adjacency=zeros(length(grouplist),1);
Median_Adjacency=zeros(length(grouplist),1);
Mean_Perimeter=zeros(length(grouplist),1);
Median_Perimeter=zeros(length(grouplist),1);
r_r0string=cell(length(grouplist),1);
GLMy_fit=zeros(length(grouplist),1);
GLM2y_fit=zeros(length(grouplist),1);
GLMresid=zeros(length(grouplist),1);
GLM2resid=zeros(length(grouplist),1);
for sample=1:length(grouplist)
    Mean_Area(sample)=mean(Area{sample,1});
    Median_Area(sample)=median(Area{sample,1});
    Mean_Adjacency(sample)=mean(Adjacency{sample,1});
    Median_Adjacency(sample)=median(Adjacency{sample,1});
    Mean_Perimeter(sample)=mean(Perimeter{sample,1});
    Median_Perimeter(sample)=median(Perimeter{sample,1});     
end
DATAcat=[];
energycat=[];
forcecat=[];
for x1=1:length(grouplist)
    DATA=cat(2,r_r0{x1,1},r_r1{x1,1});
    DATAcat=cat(1,DATAcat,DATA);
    energycat=cat(1,energycat,energy_absorbed{x1,1});
    forcecat=cat(1,forcecat,forces{x1,1});
end


for x1=1:length(energycat)
    if energycat(x1)==0
        energycat(x1)=10^-3;
    elseif energycat(x1)<0
        energycat(x1)=10^-3;
    end
    if forcecat(x1)==0
        forcecat(x1)=10^-2;
    elseif forcecat(x1)<0
        forcecat(x1)=10^-2;
    end
end
total_energy_modified=zeros(length(total_energy),1);
max_force_modified=zeros(length(max_force),1);
for x1=1:length(total_energy)
    if total_energy(x1)==0
        total_energy_modified(x1)=10^-3;
    elseif total_energy(x1)<0
        total_energy_modified(x1)=10^-3;
    else 
        total_energy_modified(x1)=total_energy(x1);
    end
    if max_force(x1)==0
        max_force_modified(x1)=10^-3;
    elseif total_energy(x1)<0
        max_force_modified(x1)=10^-3;
    else 
        max_force_modified(x1)=max_force(x1);
    end
end
% DATA=DATAcat; y1=log(energycat); y2=log(forcecat);
DATA=cat(2,r_r0final,r_r1final,total_ridge_length); y1=log(total_energy_modified); y2=log(max_force_modified);

GLM=fitglm(DATA,y1);
GLM2=fitglm(DATA,y2);

%% Adjusted Energy Coefficients
GLMcoeffs=zeros(height(GLM.Coefficients),3);
for row=1:height(GLM.Coefficients)
    GLMcoeffs(row,1)=table2array(GLM.Coefficients(row,1));
    if table2array(GLM.Coefficients(row,4))>0.05
        GLMcoeffs(row,3)=0;
        GLMcoeffs(row,2)=table2array(GLM.Coefficients(row,4));
    else
        GLMcoeffs(row,3)=table2array(GLM.Coefficients(row,1));
        GLMcoeffs(row,2)=table2array(GLM.Coefficients(row,4));
    end
end
%% Adjusted Force Coefficients
GLM2coeffs=zeros(height(GLM2.Coefficients),3);
for row=1:height(GLM2.Coefficients)
    GLM2coeffs(row,1)=table2array(GLM2.Coefficients(row,1));
    if table2array(GLM2.Coefficients(row,4))>0.05
        GLM2coeffs(row,3)=0;
        GLM2coeffs(row,2)=table2array(GLM2.Coefficients(row,4));
    else
        GLM2coeffs(row,3)=table2array(GLM2.Coefficients(row,1));
        GLM2coeffs(row,2)=table2array(GLM2.Coefficients(row,4));
    end
end

%% Energy Rsq
for point=1:length(y1)
        GLMy_fit(point)=GLMcoeffs(1,3);
    for row=1:(length(GLMcoeffs)-1)    
    GLMy_fit(point)=GLMy_fit(point)+GLMcoeffs((row+1),3)*DATA(point,row);
    end
    GLMresid(point)=y1(point)-GLMy_fit(point);
end
GLMSSresid=sum(GLMresid.^2);
GLMSStotal=(length(y1)-1)*var(y1);
GLMRsq=1-(GLMSSresid/GLMSStotal)
%% Force Rsq
for point=1:length(y2)
    GLM2y_fit(point)=GLM2coeffs(1,3);
    for row=1:(length(GLM2coeffs)-1)    
    GLM2y_fit(point)=GLM2y_fit(point)+GLM2coeffs((row+1),3)*DATA(point,row);
    end
        GLM2resid(point)=y2(point)-GLM2y_fit(point);
end
GLM2SSresid=sum(GLM2resid.^2);
GLM2SStotal=(length(y2)-1)*var(y2);
GLM2Rsq=1-(GLM2SSresid/GLM2SStotal)

