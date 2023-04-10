M=[]; % declare empty matrix to hold data
f = dir('*.txt'); % list all data files in current directory
figure
hold on;
for i=1:length(f),
    % echo i;
    temp=csvread(f(i).name,7,0); % read in the csv starting from row 7
    temp(:,3)=temp(:,3)-temp(1,3);
    plot(temp(:,3),temp(:,1));
end
hold off;