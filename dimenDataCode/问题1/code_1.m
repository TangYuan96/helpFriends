clear

load('124.mat');
COSMIC2 = COSMIC;

% ѡȡ  ����  COSMIC2.lat <30  &   COSMIC2.lat > -30
COSMIC2 =   COSMIC2( COSMIC2.lat <30  &   COSMIC2.lat > -30  ,:);
save lat COSMIC2;   % ��COSMIC2  ���浽lat.mat��



