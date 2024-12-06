%% Figure 4 - FTIR
%
%
% Davidson, B.; Batista, K.; Samrah, S.; Rios Mendoza, L. M.; Pujara, N.
% Microplastic Contamination of Sediments across and within
%       Three Beaches in Western Lake Superior.
% Journal of Great Lakes Research 2022, 48 (6), 1563–1572.
% https://doi.org/10.1016/j.jglr.2022.09.011.

clear; close all; clc;
load figure4_data.mat

fig = figure;
hold on

% Plot PET
subplot(2,1,1)
    plot(wavenumber,transmission_sample_PET,'LineWidth',2)
    ylim([38 100])
    xlim([650 4000])
    hold on
    plot(wavenumber,transmission_standard_PET,'-','LineWidth',1)
    set(gca,'xdir','reverse')
    set(gca,'FontSize',15)
    legend({'sample particle','standard'},'Position',[0.6902 0.4673 0.2384 0.0869])
    title('PET')
    set(gca,'XTick',[]);

% Plot Rayon
subplot(2,1,2)
    plot(wavenumber,transmission_sample_Rayon,'LineWidth',2)
    ylim([54 102])
    xlim([650 4000])
    hold on
    plot(wavenumber,transmission_standard_Rayon,'-','LineWidth',1)
    set(gca,'xdir','reverse')
    set(gca,'FontSize',15)
    title('Rayon')

% Axis Titles
han = axes(fig,'visible','off');
han.Title.Visible = 'on';
han.XLabel.Visible = 'on';
han.YLabel.Visible = 'on';
ylabel(han,'% Transmittance');
xlabel(han,'Wavenumbers (cm^{-1})');
set(gca,'FontSize',20)
