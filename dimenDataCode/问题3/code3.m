clear
format long g
load('lat.mat');        % 导入第一个表 维度 30到-30 的

goalData = zeros(72,8);
data = table2array(COSMIC2(2:end,2:end)) ;

for i = 2007:2012
   
    yearData = data(data(:,1)==i,:);  %  特定年的数据
    goalData((i-2006-1)*12+1:(i-2006)*12,1) = i;  % 年份填入
    
    for j = 1:12
        quarterData = yearData(yearData(:,2) == j ,: )   % 该年份下特定月的数据
        
        goalData((i-2006-1)*12+j, 2) = j;                % 填入月份
        
        meanAll = mean(quarterData,1);                   % 所有列的平均数
        stdALL = std(quarterData,0,1);                   % 所有数据的列标准差
        stdALL = stdALL.^2;                              % 所有数据的方差
        goalData((i-2006-1)*12+j, 3) = meanAll(1,9);     % 平均高度
        goalData((i-2006-1)*12+j, 4) = stdALL(1,9);      % 高度方差
        goalData((i-2006-1)*12+j, 5) = meanAll(1,10);    % 平均温度
        goalData((i-2006-1)*12+j, 6) = stdALL(1,10);     % 温度方差 
        goalData((i-2006-1)*12+j, 7) = meanAll(1,11);    % 平均压强
        goalData((i-2006-1)*12+j, 8) = stdALL(1,11);     % 压强方差
    
    end
    
end


xlswrite('question3.xls',goalData,1,'A2')
