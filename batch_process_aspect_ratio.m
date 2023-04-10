fbs=input('final ball size?');
M=[]; % declare empty matrix to hold data
f = dir('*.txt'); % list all data files in current directory
hold on;
for i=1:length(f),
    % echo i;
    temp=csvread(f(i).name,7,0); % read in the csv starting from row 7
    temp(:,3)=(-1*temp(:,3)+temp(length(temp),3)+fbs)/(-1*temp(1,3)+temp(length(temp),3)+fbs);
    plot(temp(:,3),temp(:,1));
    axis([0, 1, -100, 800])
end
hold off;
%really need crosshead!