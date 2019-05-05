clear
format long g
load('lat.mat');        % �����һ���� ά�� 30��-30 ��

goalData = zeros(72,8);
data = table2array(COSMIC2(2:end,2:end)) ;

for i = 2007:2012
   
    yearData = data(data(:,1)==i,:);  %  �ض��������
    goalData((i-2006-1)*12+1:(i-2006)*12,1) = i;  % �������
    
    for j = 1:12
        quarterData = yearData(yearData(:,2) == j ,: )   % ��������ض��µ�����
        
        goalData((i-2006-1)*12+j, 2) = j;                % �����·�
        
        meanAll = mean(quarterData,1);                   % �����е�ƽ����
        stdALL = std(quarterData,0,1);                   % �������ݵ��б�׼��
        stdALL = stdALL.^2;                              % �������ݵķ���
        goalData((i-2006-1)*12+j, 3) = meanAll(1,9);     % ƽ���߶�
        goalData((i-2006-1)*12+j, 4) = stdALL(1,9);      % �߶ȷ���
        goalData((i-2006-1)*12+j, 5) = meanAll(1,10);    % ƽ���¶�
        goalData((i-2006-1)*12+j, 6) = stdALL(1,10);     % �¶ȷ��� 
        goalData((i-2006-1)*12+j, 7) = meanAll(1,11);    % ƽ��ѹǿ
        goalData((i-2006-1)*12+j, 8) = stdALL(1,11);     % ѹǿ����
    
    end
    
end


xlswrite('question3.xls',goalData,1,'A2')
