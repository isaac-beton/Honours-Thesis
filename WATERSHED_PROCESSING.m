%% PREPARATION
Pixel_length=input('What width does 1 pixel in the photo represent in reality?');
tic;
Pixel_area=Pixel_length^2;

% list all data files in current directory
f = dir('*.png'); 


%% PREALLOCATION
%functional vectors
M=cell(length(f),1);
M_water=cell(length(f),1);
masked_M_comp=cell(length(f),1);
STATS=cell(length(f),1);
adj=cell(length(f),1);

% Data Vectors
Area=cell(length(f),1);
Perimeter=cell(length(f),1);
Extent=cell(length(f),1);
EquivDiameter=cell(length(f),1);
MajorAxisLength=cell(length(f),1);
MinorAxisLength=cell(length(f),1);
total_ridge_length=zeros(length(f),1);
% total_ridge_length_per_facet=zeros(length(f),1);
Adjacency=cell(length(f),1);
% average_adjacency=zeros(length(f),1);
% average_facet_ridge_length=cell(length(f),1);
% average_ridge_length=zeros(length(f),1);

%% ANALYSIS
for i=1:length(f),
    % echo i;
    tempread=imread(f(i).name); 
    
    %convert to greyscale image
    M{i}=rgb2gray(tempread);
    
    %Mountain watershed segmentation
    M_water_mountain=watershed(M{i});
    M_water_mountain=M_water_mountain ==0;
    
    %Valley watershed segmentation
        %invert image
        M_comp=imcomplement(M{i});

        %binary image mask
        bw=im2bw(M_comp,0.9999);
        bw2=bwareaopen(bw,15000);
        bw3=imcomplement(bw2);
        masked_M_comp{i}=bsxfun(@times,M_comp,cast(bw3,'uint8'));
    
    M_water_valley=watershed(masked_M_comp{i});
    M_water_valley=M_water_valley ==0;

    
    %prepare filepaths
    filename11=cat(2,'mountain_watershed',num2str(i));
    filename1=cat(2,filename11,'.png');
    filepath1=cat(2,'/Users/Beton/Documents/MATLAB/3d data/watershed/mountain/',filename1);
    imwrite(M_water_mountain,filepath1,'png');
    
    filename22=cat(2,'valley_watershed',num2str(i));
    filename2=cat(2,filename22,'.png');
    filepath2=cat(2,'/Users/Beton/Documents/MATLAB/3d data/watershed/valley/',filename2);
    imwrite(M_water_valley,filepath2,'png');
    
    filename33=cat(2,'watershed',num2str(i));
    filename3=cat(2,filename33,'.png');
    filepath3=cat(2,'/Users/Beton/Documents/MATLAB/3d data/watershed/',filename3);
    
       
    %combine images
    img_comp=imadd(M_water_valley,M_water_mountain);
    img_write=imcomplement(img_comp);
    img=cast(imcomplement(img_comp),'uint8');
    M_water{i}=cast(labelmatrix(bwconncomp(img)),'double');
    
    %write combined image
    imwrite(img_write,filepath3,'png');
    
    STATS{i}=regionprops(M_water{i},'Area','Extent','EquivDiameter','MajorAxisLength','MinorAxisLength','Perimeter');
   
    %preallocate
    Area{i,1}=zeros(length(STATS{i}),1);
    Perimeter{i,1}=zeros(length(STATS{i}),1);
    Extent{i,1}=zeros(length(STATS{i}),1);
    EquivDiameter{i,1}=zeros(length(STATS{i}),1);
    MajorAxisLength{i,1}=zeros(length(STATS{i}),1);
    MinorAxisLength{i,1}=zeros(length(STATS{i}),1);
    
    %extract data
    for j=1:length(STATS{i})
        Area{i,1}(j,1)=STATS{i,1}(j,1).Area*Pixel_area;
        Perimeter{i,1}(j,1)=STATS{i,1}(j,1).Perimeter*Pixel_length;
        Extent{i,1}(j,1)=STATS{i,1}(j,1).Extent;
        EquivDiameter{i,1}(j,1)=STATS{i,1}(j,1).EquivDiameter*Pixel_length;
        MajorAxisLength{i,1}(j,1)=STATS{i,1}(j,1).MajorAxisLength*Pixel_length;
        MinorAxisLength{i,1}(j,1)=STATS{i,1}(j,1).MinorAxisLength*Pixel_length;
    end
    
       
    %ridge length is the total number of pixels minus the number of nonzero
    %pixels (which means they aren't black)
    total_ridge_length(i)=(numel(img)-nnz(img))*Pixel_length;
    
    %total ridge length divided by number of facets
%     total_ridge_length_per_facet(i)=total_ridge_length(i)/length(STATS{i});
    
    %adjacency
    adj{i}=imRAG(M_water{i});
    concatenated=cat(1,adj{i,1}(:,1),adj{i,1}(:,2));
    x=unique(concatenated);
    N=numel(x);
    Adjacency{i}=zeros(N,1);
    for k=1:N
        Adjacency{i,1}(k)=sum(concatenated==x(k));
    end
    %perimeter divided by number of ridges per facet
%     average_facet_ridge_length{i}=Perimeter{i,1}(:,1)./(Adjacency{i,1}(:,1));
%     average_ridge_length(i)=mean(average_facet_ridge_length{i,1});
%     average_adjacency(i)=mean(Adjacency{i,1});
end
save('/Users/Beton/Documents/MATLAB/3d data/variables','-v7.3');
disp('FINISHED!')
toc
