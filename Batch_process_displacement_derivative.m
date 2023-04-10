M=[]; % declare empty matrix to hold data
f = dir('*.txt'); % list all data files in current directory
figure
hold on;
for i=1:length(f),
    % echo i;
    temp=csvread(f(i).name,7,0); % read in the csv starting from row 7
    temp(:,3)=temp(:,3)-temp(1,3);
    p=polyfit(temp(:,3),temp(:,1),6);
    pder=polyder(p);
    pval=polyval(pder,temp(:,3));
    plot(temp(:,3),pval);
end
hold off;