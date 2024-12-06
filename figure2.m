%% Figure 2 - Sediemnt Distribution
%
%
% Davidson, B.; Batista, K.; Samrah, S.; Rios Mendoza, L. M.; Pujara, N.
% Microplastic Contamination of Sediments across and within
%       Three Beaches in Western Lake Superior.
% Journal of Great Lakes Research 2022, 48 (6), 1563–1572.
% https://doi.org/10.1016/j.jglr.2022.09.011.

clear; close all; clc;

load figure2_data.mat

%Calculate CDF
cumulative = zeros(1,27);
sediment_cdf = nan(length(Diameter_mm),length(cumulative));
for i = 1:size(percent_mass,1)
    add = percent_mass(end-(i-1),:);
    cumulative = cumulative + add;
    sediment_cdf(end-(i-1),:) = [cumulative];
end

%Plot settings
ticks = flip(Diameter_mm);
ticks(9:10) = [];
set(gcf,'Position',[235 296 1112 426])

%Plot WIP
subplot(1,3,1)
hold on
for i = 1:9
    plot(Diameter_mm,sediment_cdf(:,i),'-','Color',[0 0.4470 0.7410])
end
hold on
yline(50,'--')
xlim([0 2])
ylim([0 100])
set(gca,'XScale','log')
xticks(ticks)
ylabel('CDF (%)')
title('WIP')
set(gca,'FontSize',22)

%Plot MNP
subplot(1,3,2)
hold on
for i = 10:18
    plot(Diameter_mm,sediment_cdf(:,i),'-','Color',[0 0.4470 0.7410])
end
yline(50,'--')
xlim([0 2])
ylim([0 100])
set(gca,'XScale','log')
xticks(ticks)
xlabel('Diameter (mm)')
title('MNP')
set(gca,'FontSize',22)

%Plot THMN
subplot(1,3,3)
hold on
for i = 19:27
    plot(Diameter_mm,sediment_cdf(:,i),'-','Color',[0 0.4470 0.7410])
end
yline(50,'--')
xlim([0 19])
ylim([0 100])
set(gca,'XScale','log')
xticks(ticks)
title('THMN')
set(gca,'FontSize',22)