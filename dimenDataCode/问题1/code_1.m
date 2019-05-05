clear

load('124.mat');
COSMIC2 = COSMIC;

% 选取  表中  COSMIC2.lat <30  &   COSMIC2.lat > -30
COSMIC2 =   COSMIC2( COSMIC2.lat <30  &   COSMIC2.lat > -30  ,:);
save lat COSMIC2;   % 将COSMIC2  保存到lat.mat中



