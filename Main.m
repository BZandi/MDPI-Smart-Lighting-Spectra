%% Information
% This is a demo script to analyse the optimised spectra presented in the paper:
% "Melanopic limits of metamer spectral optimisation in multi-channel smart lighting systems"
% Authors: Babak Zandi, Adrian Eissfeldt, Alexander Herzog, Tran Quoc Khanh
% MDPI Energies

%% Set up graphics preferences
set(groot, 'DefaultLineLineWidth', 2);
set(groot, 'DefaultAxesLineWidth', 1);
set(groot, 'DefaultAxesFontName', 'Charter');
set(groot, 'DefaultAxesFontSize', 7);
set(groot, 'DefaultAxesFontWeight', 'normal');
set(groot, 'DefaultAxesXMinorTick', 'on');
set(groot, 'DefaultAxesXGrid', 'on');
set(groot, 'DefaultAxesYGrid', 'on');
set(groot, 'DefaultAxesGridLineStyle', ':');
set(groot, 'DefaultAxesUnits', 'normalized');
set(groot, 'DefaultAxesOuterPosition',[0, 0, 1, 1]);
set(groot, 'DefaultFigureUnits', 'inches');
set(groot, 'DefaultFigurePaperPositionMode', 'manual');
set(groot, 'DefaultFigurePosition', [0.1, 11, 8.5, 4.5]);
set(groot, 'DefaultFigurePaperUnits', 'inches');
set(groot, 'DefaultFigurePaperPosition', [0.1, 11, 8.5, 4.5]);

%% Load optimization results into matlab

% Data of 6 channel optimization
Optim_CH6_L140 = readtable("A00_Data/01_Compact_Optim Results/OptimResults_CH6_L140.csv");
Optim_CH6_L180 = readtable("A00_Data/01_Compact_Optim Results/OptimResults_CH6_L180.csv");
Optim_CH6_L220 = readtable("A00_Data/01_Compact_Optim Results/OptimResults_CH6_L220.csv");

% Data of 8 channel optimization
Optim_CH8_L140 = readtable("A00_Data/01_Compact_Optim Results/OptimResults_CH8_L140.csv");
Optim_CH8_L180 = readtable("A00_Data/01_Compact_Optim Results/OptimResults_CH8_L180.csv");
Optim_CH8_L220 = readtable("A00_Data/01_Compact_Optim Results/OptimResults_CH8_L220.csv");

% Data of 11 channel optimization
Optim_CH11_L140 = readtable("A00_Data/01_Compact_Optim Results/OptimResults_CH11_L140.csv");
Optim_CH11_L180 = readtable("A00_Data/01_Compact_Optim Results/OptimResults_CH11_L180.csv");
Optim_CH11_L220 = readtable("A00_Data/01_Compact_Optim Results/OptimResults_CH11_L220.csv");

% Load in optimisation targets
OptimisationTargets = readtable("A00_Data/01_Compact_Optim Results/Optimisation_Targets.csv");

%% Table S1 (supplementary materials) - Descriptive Values of the optimisation data
% The folowing optimisation targets were used
% CCT: 2700, 2796, 2901, 3017, 3147, 3292, 3456, 3642, 3855, 4101
%      4386, 4717, 5102, 5552, 6080, 6702, 7443

% For each CCT the following \pm Duv targets were used:
% DUV: 0, 0.003, 0.006, 0.009, 0.012, 0.015, 0.018,
%      0.021, 0.024, 0.027, 0.03, 0.033, 0.036, 0.039, 0.042,
%      0.045, 0.048

% How many optimisation targets were found ?
% Number of optimisation result for each CCT-Target and Duv-Target

format long

% 6 Channel -----------------------------------------------------------------------
[G, TargetGroups] = findgroups(categorical(Optim_CH6_L140.IndexNumber_Target));
CountResults = splitapply(@(x) max(x), Optim_CH6_L140.OptimResult_Number, G);
CH6_L140 = ['Mean spectra count each target ' num2str(mean(CountResults)) ' SD ' num2str(std(CountResults)) ' Total ' num2str(sum(CountResults))];
CountOptim_CH6_L140 = sum(CountResults);
fprintf('6-Channel Luminance 140 cd/m2: Solutions found for %d of 561 optimisation targets. Mean spectra count for each optimisation target is %.2f SD %.2f - Total: %d \n',...
    size(categories(categorical(Optim_CH6_L140.IndexNumber_Target)),1), mean(CountResults), std(CountResults), CountOptim_CH6_L140);
Table_S2_CH6_140 = table(6, 140, size(categories(categorical(Optim_CH6_L140.IndexNumber_Target)),1), mean(CountResults), std(CountResults), CountOptim_CH6_L140,...
    'VariableNames', {'Luminaire_Configuration', 'Target_Luminance', 'Solutions', 'Mean_metamer_count', 'SD_metamer_count', 'Total_optimised_spectra'});


[G, TargetGroups] = findgroups(categorical(Optim_CH6_L180.IndexNumber_Target));
CountResults = splitapply(@(x) max(x), Optim_CH6_L180.OptimResult_Number, G);
CH6_L180 = ['Mean spectra count each target ' num2str(mean(CountResults)) ' SD ' num2str(std(CountResults)) ' Total spectra ' num2str(sum(CountResults))];
CountOptim_CH6_L180 = sum(CountResults);
fprintf('6-Channel Luminance 180 cd/m2: Solutions found for %d of 561 optimisation targets. Mean spectra count for each optimisation target is %.2f SD %.2f - Total: %d \n',...
    size(categories(categorical(Optim_CH6_L180.IndexNumber_Target)),1), mean(CountResults), std(CountResults), CountOptim_CH6_L180);
Table_S2_CH6_180 = table(6, 180, size(categories(categorical(Optim_CH6_L180.IndexNumber_Target)),1), mean(CountResults), std(CountResults), CountOptim_CH6_L180,...
    'VariableNames', {'Luminaire_Configuration', 'Target_Luminance', 'Solutions', 'Mean_metamer_count', 'SD_metamer_count', 'Total_optimised_spectra'});

[G, TargetGroups] = findgroups(categorical(Optim_CH6_L220.IndexNumber_Target));
CountResults = splitapply(@(x) max(x),Optim_CH6_L220.OptimResult_Number,G);
CH6_L220 = ['Mean spectra count each target ' num2str(mean(CountResults)) ' SD ' num2str(std(CountResults)) ' Total spectra' num2str(sum(CountResults))];
CountOptim_CH6_L220 = sum(CountResults);
fprintf('6-Channel Luminance 220 cd/m2: Solutions found for %d of 561 optimisation targets. Mean spectra count for each optimisation target is %.2f SD %.2f - Total: %d \n',...
    size(categories(categorical(Optim_CH6_L220.IndexNumber_Target)),1), mean(CountResults), std(CountResults), CountOptim_CH6_L220);
Table_S2_CH6_220 = table(6, 220, size(categories(categorical(Optim_CH6_L220.IndexNumber_Target)),1), mean(CountResults), std(CountResults), CountOptim_CH6_L220,...
    'VariableNames', {'Luminaire_Configuration', 'Target_Luminance', 'Solutions', 'Mean_metamer_count', 'SD_metamer_count', 'Total_optimised_spectra'});


OptimisationCount_6Channel = table({'CH 6'}, {CH6_L140}, {CH6_L180}, {CH6_L220},...
    'VariableNames', {'Channel', 'Luminance 140 cd/m2' 'Luminance 180 cd/m2' 'Luminance 220 cd/m2'});
% ---------------------------------------------------------------------------------------

% 8 Channel -----------------------------------------------------------------------
[G, TargetGroups] = findgroups(categorical(Optim_CH8_L140.IndexNumber_Target));
CountResults = splitapply(@(x) max(x), Optim_CH8_L140.OptimResult_Number, G);
CH8_L140 = ['Mean spectra count each target ' num2str(mean(CountResults)) ' SD ' num2str(std(CountResults)) ' Total ' num2str(sum(CountResults))];
CountOptim_CH8_L140 = sum(CountResults);
fprintf('8-Channel Luminance 140 cd/m2: Solutions found for %d of 561 optimisation targets. Mean spectra count for each optimisation target is %.2f SD %.2f - Total: %d \n',...
    size(categories(categorical(Optim_CH8_L140.IndexNumber_Target)),1), mean(CountResults), std(CountResults), CountOptim_CH8_L140);
Table_S2_CH8_140 = table(8, 140, size(categories(categorical(Optim_CH8_L140.IndexNumber_Target)),1), mean(CountResults), std(CountResults), CountOptim_CH8_L140,...
    'VariableNames', {'Luminaire_Configuration', 'Target_Luminance', 'Solutions', 'Mean_metamer_count', 'SD_metamer_count', 'Total_optimised_spectra'});

[G, TargetGroups] = findgroups(categorical(Optim_CH8_L180.IndexNumber_Target));
CountResults = splitapply(@(x) max(x), Optim_CH8_L180.OptimResult_Number, G);
CH8_L180 = ['Mean spectra count each target ' num2str(mean(CountResults)) ' SD ' num2str(std(CountResults)) ' Total ' num2str(sum(CountResults))];
CountOptim_CH8_L180 = sum(CountResults);
fprintf('8-Channel Luminance 180 cd/m2: Solutions found for %d of 561 optimisation targets. Mean spectra count for each optimisation target is %.2f SD %.2f - Total: %d \n',...
    size(categories(categorical(Optim_CH8_L180.IndexNumber_Target)),1), mean(CountResults), std(CountResults), CountOptim_CH8_L180);
Table_S2_CH8_180 = table(8, 180, size(categories(categorical(Optim_CH8_L180.IndexNumber_Target)),1), mean(CountResults), std(CountResults), CountOptim_CH8_L180,...
    'VariableNames', {'Luminaire_Configuration', 'Target_Luminance', 'Solutions', 'Mean_metamer_count', 'SD_metamer_count', 'Total_optimised_spectra'});

[G, TargetGroups] = findgroups(categorical(Optim_CH8_L220.IndexNumber_Target));
CountResults = splitapply(@(x) max(x), Optim_CH8_L220.OptimResult_Number, G);
CH8_L220 = ['Mean spectra count each target ' num2str(mean(CountResults)) ' SD ' num2str(std(CountResults)) ' Total ' num2str(sum(CountResults))];
CountOptim_CH8_L220 = sum(CountResults);
fprintf('8-Channel Luminance 220 cd/m2: Solutions found for %d of 561 optimisation targets. Mean spectra count for each optimisation target is %.2f SD %.2f - Total: %d \n',...
    size(categories(categorical(Optim_CH8_L220.IndexNumber_Target)),1), mean(CountResults), std(CountResults), CountOptim_CH8_L220);
Table_S2_CH8_220 = table(8, 220, size(categories(categorical(Optim_CH8_L220.IndexNumber_Target)),1), mean(CountResults), std(CountResults), CountOptim_CH8_L220,...
    'VariableNames', {'Luminaire_Configuration', 'Target_Luminance', 'Solutions', 'Mean_metamer_count', 'SD_metamer_count', 'Total_optimised_spectra'});


OptimisationCount_6Channel = table({'CH 8'}, {CH8_L140}, {CH8_L180}, {CH8_L220},...
    'VariableNames', {'Channel', 'Luminance 140 cd/m2' 'Luminance 180 cd/m2' 'Luminance 220 cd/m2'});
% ---------------------------------------------------------------------------------------

% 11 Channel -----------------------------------------------------------------------
[G, TargetGroups] = findgroups(categorical(Optim_CH11_L140.IndexNumber_Target));
CountResults = splitapply(@(x) max(x),Optim_CH11_L140.OptimResult_Number,G);
CH11_L140 = ['Mean spectra count each target ' num2str(mean(CountResults)) ' SD ' num2str(std(CountResults)) ' Total ' num2str(sum(CountResults))];
CountOptim_CH11_L140 = sum(CountResults);
fprintf('11-Channel Luminance 140 cd/m2: Solutions found for %d of 561 optimisation targets. Mean spectra count for each optimisation target is %.2f SD %.2f - Total: %d \n',...
    size(categories(categorical(Optim_CH11_L140.IndexNumber_Target)),1), mean(CountResults), std(CountResults), CountOptim_CH11_L140);
Table_S2_CH11_140 = table(11, 140, size(categories(categorical(Optim_CH11_L140.IndexNumber_Target)),1), mean(CountResults), std(CountResults), CountOptim_CH11_L140,...
    'VariableNames', {'Luminaire_Configuration', 'Target_Luminance', 'Solutions', 'Mean_metamer_count', 'SD_metamer_count', 'Total_optimised_spectra'});

[G, TargetGroups] = findgroups(categorical(Optim_CH11_L180.IndexNumber_Target));
CountResults = splitapply(@(x) max(x),Optim_CH11_L180.OptimResult_Number,G);
CH11_L180 = ['Mean spectra count each target ' num2str(mean(CountResults)) ' SD ' num2str(std(CountResults)) ' Total ' num2str(sum(CountResults))];
CountOptim_CH11_L180 = sum(CountResults);
fprintf('11-Channel Luminance 180 cd/m2: Solutions found for %d of 561 optimisation targets. Mean spectra count for each optimisation target is %.2f SD %.2f - Total: %d \n',...
    size(categories(categorical(Optim_CH11_L180.IndexNumber_Target)),1), mean(CountResults), std(CountResults), CountOptim_CH11_L180);
Table_S2_CH11_180 = table(11, 180, size(categories(categorical(Optim_CH11_L180.IndexNumber_Target)),1), mean(CountResults), std(CountResults), CountOptim_CH11_L180,...
    'VariableNames', {'Luminaire_Configuration', 'Target_Luminance', 'Solutions', 'Mean_metamer_count', 'SD_metamer_count', 'Total_optimised_spectra'});

[G, TargetGroups] = findgroups(categorical(Optim_CH11_L220.IndexNumber_Target));
CountResults = splitapply(@(x) max(x),Optim_CH11_L220.OptimResult_Number,G);
CH11_L220 = ['Mean spectra count each target ' num2str(mean(CountResults)) ' SD ' num2str(std(CountResults)) ' Total found spectra' num2str(sum(CountResults))];
CountOptim_CH11_L220 = sum(CountResults);
fprintf('11-Channel Luminance 220 cd/m2: Solutions found for %d of 561 optimisation targets. Mean spectra count for each optimisation target is %.2f SD %.2f - Total: %d \n',...
    size(categories(categorical(Optim_CH11_L220.IndexNumber_Target)),1), mean(CountResults), std(CountResults), CountOptim_CH11_L220);

Table_S2_CH11_220 = table(11, 220, size(categories(categorical(Optim_CH11_L220.IndexNumber_Target)),1), mean(CountResults), std(CountResults), CountOptim_CH11_L220,...
    'VariableNames', {'Luminaire_Configuration', 'Target_Luminance', 'Solutions', 'Mean_metamer_count', 'SD_metamer_count', 'Total_optimised_spectra'});

OptimisationCount_11Channel = table({'CH 11'}, {CH11_L140}, {CH11_L180}, {CH11_L220},...
    'VariableNames', {'Channel', 'Luminance 140 cd/m2' 'Luminance 180 cd/m2' 'Luminance 220 cd/m2'});
% ---------------------------------------------------------------------------------------

% Total count of optimised spectra
TotalCount = CountOptim_CH6_L140 + CountOptim_CH6_L180 + CountOptim_CH6_L220 +...
    CountOptim_CH8_L140 + CountOptim_CH8_L180 + CountOptim_CH8_L220 +...
    CountOptim_CH11_L140 + CountOptim_CH11_L180 + CountOptim_CH11_L220;

fprintf('Number of total optimised spectra across all optimisation targets %d \n', TotalCount);

% For how many chromaticity targets spectra where found in average across all lumiances and channel combinations ?
fprintf('Spectra were found for %.3f SD %.3f chromaticity targets across all luminanes and channel combinations \n',...
    mean([size(categories(categorical(Optim_CH6_L140.IndexNumber_Target)),1),...
size(categories(categorical(Optim_CH6_L180.IndexNumber_Target)),1),...
size(categories(categorical(Optim_CH6_L220.IndexNumber_Target)),1),...
size(categories(categorical(Optim_CH8_L140.IndexNumber_Target)),1),...
size(categories(categorical(Optim_CH8_L180.IndexNumber_Target)),1),...
size(categories(categorical(Optim_CH8_L220.IndexNumber_Target)),1),...
size(categories(categorical(Optim_CH11_L140.IndexNumber_Target)),1),...
size(categories(categorical(Optim_CH11_L180.IndexNumber_Target)),1),...
size(categories(categorical(Optim_CH11_L220.IndexNumber_Target)),1)]),...
std([size(categories(categorical(Optim_CH6_L140.IndexNumber_Target)),1),...
size(categories(categorical(Optim_CH6_L180.IndexNumber_Target)),1),...
size(categories(categorical(Optim_CH6_L220.IndexNumber_Target)),1),...
size(categories(categorical(Optim_CH8_L140.IndexNumber_Target)),1),...
size(categories(categorical(Optim_CH8_L180.IndexNumber_Target)),1),...
size(categories(categorical(Optim_CH8_L220.IndexNumber_Target)),1),...
size(categories(categorical(Optim_CH11_L140.IndexNumber_Target)),1),...
size(categories(categorical(Optim_CH11_L180.IndexNumber_Target)),1),...
size(categories(categorical(Optim_CH11_L220.IndexNumber_Target)),1)]))


% Table S1 (supplementary materials) 
disp(" ")
disp(" ")
disp(" ")
disp("Table S1: Supplementary materials")
Table_S2 = [Table_S2_CH6_140; Table_S2_CH6_180; Table_S2_CH6_220;...
    Table_S2_CH8_140; Table_S2_CH8_180; Table_S2_CH8_220;...
    Table_S2_CH11_140;Table_S2_CH11_180; Table_S2_CH11_220];
disp(Table_S2)

%% Figure 3 from the article (CRI > 80 condition): Melanopic radiance against Duv for with color coded points for the CCT

fig = figure; t = tiledlayout(3, 3, 'Padding', "compact", "TileSpacing", "compact");
set(gcf, 'Position', [0.1, 11, 16, 7]);
JitterAmount = 0.0005;
MarkerAlpha = .4;
MarkerSize = 3;

ax(1) = nexttile(1);
Datensatz_Original_CRI = Optim_CH6_L140(Optim_CH6_L140.CRI_Actual > 80, :);
scatter(Datensatz_Original_CRI.Duv_signed, Datensatz_Original_CRI.MelanopicRadiance_Actual,...
    MarkerSize, Datensatz_Original_CRI.CCT_Target,'filled',...
    'jitter', 'on', 'jitterAmount', JitterAmount, 'MarkerFaceAlpha', MarkerAlpha);
[G, TargetGroups] = findgroups(categorical(Datensatz_Original_CRI.IndexNumber_Target));
CountResults = splitapply(@(x) max(x),Datensatz_Original_CRI.OptimResult_Number,G);
Sum_Count(1) = sum(CountResults);
title('6-channel LED luminaire', 'FontName', 'Charter', 'FontSize', 12);
subtitle(['140 cd/m^2, CRI > 80, ' num2str(sum(CountResults)) ' spectra'], 'FontName', 'Charter');

ax(2) = nexttile(2);
Datensatz_Original_CRI = Optim_CH6_L180(Optim_CH6_L180.CRI_Actual > 80, :);
scatter(Datensatz_Original_CRI.Duv_signed, Datensatz_Original_CRI.MelanopicRadiance_Actual,...
    MarkerSize, Datensatz_Original_CRI.CCT_Target,'filled',...
    'jitter', 'on', 'jitterAmount', JitterAmount, 'MarkerFaceAlpha', MarkerAlpha);
[G, TargetGroups] = findgroups(categorical(Datensatz_Original_CRI.IndexNumber_Target));
CountResults = splitapply(@(x) max(x),Datensatz_Original_CRI.OptimResult_Number,G);
Sum_Count(2) = sum(CountResults);
title('6-channel LED luminaire ', 'FontSize', 12);
subtitle(['180 cd/m^2, CRI > 80, ' num2str(sum(CountResults)) ' spectra'], 'FontName', 'Charter', 'FontSize', 12);

ax(3) = nexttile(3);
Datensatz_Original_CRI = Optim_CH6_L220(Optim_CH6_L220.CRI_Actual > 80, :);
scatter(Datensatz_Original_CRI.Duv_signed, Datensatz_Original_CRI.MelanopicRadiance_Actual,...
    MarkerSize, Datensatz_Original_CRI.CCT_Target,'filled',...
    'jitter', 'on', 'jitterAmount', JitterAmount, 'MarkerFaceAlpha', MarkerAlpha);
[G, TargetGroups] = findgroups(categorical(Datensatz_Original_CRI.IndexNumber_Target));
CountResults = splitapply(@(x) max(x),Datensatz_Original_CRI.OptimResult_Number,G);
Sum_Count(3) = sum(CountResults);
title('6-channel LED luminaire ', 'FontSize', 12);
subtitle(['220 cd/m^2, CRI > 80, ' num2str(sum(CountResults)) ' spectra'], 'FontName', 'Charter', 'FontSize', 12);

ax(4) = nexttile(4);
Datensatz_Original_CRI = Optim_CH8_L140(Optim_CH8_L140.CRI_Actual > 80, :);
scatter(Datensatz_Original_CRI.Duv_signed, Datensatz_Original_CRI.MelanopicRadiance_Actual,...
    MarkerSize, Datensatz_Original_CRI.CCT_Target,'filled',...
    'jitter', 'on', 'jitterAmount', JitterAmount, 'MarkerFaceAlpha', MarkerAlpha);
[G, TargetGroups] = findgroups(categorical(Datensatz_Original_CRI.IndexNumber_Target));
CountResults = splitapply(@(x) max(x),Datensatz_Original_CRI.OptimResult_Number,G);
Sum_Count(4) = sum(CountResults);
title('8-channel LED luminaire ', 'FontSize', 12);
subtitle(['140 cd/m^2, CRI > 80, ' num2str(sum(CountResults)) ' spectra'], 'FontName', 'Charter', 'FontSize', 12);

ax(5) = nexttile(5);
Datensatz_Original_CRI = Optim_CH8_L180(Optim_CH8_L180.CRI_Actual > 80, :);
scatter(Datensatz_Original_CRI.Duv_signed, Datensatz_Original_CRI.MelanopicRadiance_Actual,...
    MarkerSize, Datensatz_Original_CRI.CCT_Target,'filled',...
    'jitter', 'on', 'jitterAmount', JitterAmount, 'MarkerFaceAlpha', MarkerAlpha);
[G, TargetGroups] = findgroups(categorical(Datensatz_Original_CRI.IndexNumber_Target));
CountResults = splitapply(@(x) max(x),Datensatz_Original_CRI.OptimResult_Number,G);
Sum_Count(5) = sum(CountResults);
title('8-channel LED luminaire ', 'FontSize', 12);
subtitle(['180 cd/m^2, CRI > 80, ' num2str(sum(CountResults)) ' spectra'], 'FontName', 'Charter', 'FontSize', 12);

ax(6) = nexttile(6);
Datensatz_Original_CRI = Optim_CH8_L220(Optim_CH8_L220.CRI_Actual > 80, :);
scatter(Datensatz_Original_CRI.Duv_signed, Datensatz_Original_CRI.MelanopicRadiance_Actual,...
    MarkerSize, Datensatz_Original_CRI.CCT_Target,'filled',...
    'jitter', 'on', 'jitterAmount', JitterAmount, 'MarkerFaceAlpha', MarkerAlpha);
[G, TargetGroups] = findgroups(categorical(Datensatz_Original_CRI.IndexNumber_Target));
CountResults = splitapply(@(x) max(x),Datensatz_Original_CRI.OptimResult_Number,G);
Sum_Count(6) = sum(CountResults);
title('8-channel LED luminaire ', 'FontSize', 12);
subtitle(['220 cd/m^2, CRI > 80, ' num2str(sum(CountResults)) ' spectra'], 'FontName', 'Charter', 'FontSize', 12);

ax(7) = nexttile(7);
Datensatz_Original_CRI = Optim_CH11_L140(Optim_CH11_L140.CRI_Actual > 80, :);
scatter(Datensatz_Original_CRI.Duv_signed, Datensatz_Original_CRI.MelanopicRadiance_Actual,...
    MarkerSize, Datensatz_Original_CRI.CCT_Target,'filled',...
    'jitter', 'on', 'jitterAmount', JitterAmount, 'MarkerFaceAlpha', MarkerAlpha);
[G, TargetGroups] = findgroups(categorical(Datensatz_Original_CRI.IndexNumber_Target));
CountResults = splitapply(@(x) max(x),Datensatz_Original_CRI.OptimResult_Number,G);
Sum_Count(7) = sum(CountResults);
title('11-channel LED luminaire ', 'FontSize', 12);
subtitle(['140 cd/m^2, CRI > 80, ' num2str(sum(CountResults)) ' spectra'], 'FontName', 'Charter', 'FontSize', 12);

ax(8) = nexttile(8);
Datensatz_Original_CRI = Optim_CH11_L180(Optim_CH11_L180.CRI_Actual > 80, :);
scatter(Datensatz_Original_CRI.Duv_signed, Datensatz_Original_CRI.MelanopicRadiance_Actual,...
    MarkerSize, Datensatz_Original_CRI.CCT_Target,'filled',...
    'jitter', 'on', 'jitterAmount', JitterAmount, 'MarkerFaceAlpha', MarkerAlpha);
[G, TargetGroups] = findgroups(categorical(Datensatz_Original_CRI.IndexNumber_Target));
CountResults = splitapply(@(x) max(x),Datensatz_Original_CRI.OptimResult_Number,G);
Sum_Count(8) = sum(CountResults);
title('11-channel LED luminaire ', 'FontSize', 12);
subtitle(['180 cd/m^2, CRI > 80, ' num2str(sum(CountResults)) ' spectra'], 'FontName', 'Charter', 'FontSize', 12);

ax(9) = nexttile(9);
Datensatz_Original_CRI = Optim_CH11_L220(Optim_CH11_L220.CRI_Actual > 80, :);
scatter(Datensatz_Original_CRI.Duv_signed, Datensatz_Original_CRI.MelanopicRadiance_Actual,...
    MarkerSize, Datensatz_Original_CRI.CCT_Target,'filled',...
    'jitter', 'on', 'jitterAmount', JitterAmount, 'MarkerFaceAlpha', MarkerAlpha);
[G, TargetGroups] = findgroups(categorical(Datensatz_Original_CRI.IndexNumber_Target));
CountResults = splitapply(@(x) max(x),Datensatz_Original_CRI.OptimResult_Number,G);
Sum_Count(9) = sum(CountResults);
title('11-channel LED luminaire ', 'FontSize', 12);
subtitle(['220 cd/m^2, CRI > 80, ' num2str(sum(CountResults)) ' spectra'], 'FontName', 'Charter', 'FontSize', 12);

CCT_Targets = [2700, 2796, 2901, 3017, 3147, 3292, 3456, 3642,...
    3855, 4101, 4386, 4717, 5102, 5552, 6080, 6702, 7443];
colormap(flipud(parula(16)))
caxis([2700 7443])
cb = colorbar;
cb.Layout.Tile = 'east';
cb.Ticks = CCT_Targets;
cb.Ruler.Scale = 'log';
cb.Ruler.MinorTick = 'off';
cb.TickLabels = {'2700' '2796' '2901' '3017' '3147'...
    '3292' '3456' '3642' '3855' '4101' '4386' '4717' '5102' '5552' '6080' '6702' '7443'};

YLim = [0, 0.4]; YLimTick = [0:0.1:0.4];
XLim = [-0.05, 0.05]; XLimTick = [-0.05:0.02:0, 0.01:0.02:0.05];
xlabel(t, 'Duv from Planckian locus', 'FontSize', 12, 'FontName', 'Charter', 'Interpreter', 'latex');
ylabel(t, 'Melanopic-radiance in $W/m^2 sr$', 'FontSize', 12, 'FontName', 'Charter', 'Interpreter', 'latex');
set(ax(1), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(1), 'on');
set(ax(2), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(2), 'on');
set(ax(3), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(3), 'on');
set(ax(4), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(4), 'on');
set(ax(5), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(5), 'on');
set(ax(6), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(6), 'on');
set(ax(7), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(7), 'on');
set(ax(8), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(8), 'on');
set(ax(9), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(9), 'on');

fprintf('Number of total optimised spectra for CRI > 80 across all channels: %d \n', sum(Sum_Count))

%% Figure S1 (supplementary materials) for 0 < CRI < 100 condition: Melanopic radiance against Duv for with color coded points for the CCT

figure; t = tiledlayout(3,3, 'Padding', "compact", "TileSpacing", "compact");
set(gcf, 'Position', [0.1, 11, 16, 7]);
JitterAmount = 0.0005;
MarkerAlpha = .4;
MarkerSize = 3;
GridLabel = 'off';

ax(1) = nexttile(1);
Datensatz_Original_CRI = Optim_CH6_L140;
scatter(Datensatz_Original_CRI.Duv_signed, Datensatz_Original_CRI.MelanopicRadiance_Actual,...
    MarkerSize, Datensatz_Original_CRI.CCT_Target,'filled',...
    'jitter', 'on', 'jitterAmount', JitterAmount, 'MarkerFaceAlpha', MarkerAlpha);
[G, TargetGroups] = findgroups(categorical(Datensatz_Original_CRI.IndexNumber_Target));
CountResults = splitapply(@(x) max(x),Datensatz_Original_CRI.OptimResult_Number,G);
Sum_Count(1) = sum(CountResults);
title('6-channel LED luminaire', 'FontName', 'Charter', 'FontSize', 12);
subtitle(['140 cd/m^2, CRI > 80, ' num2str(sum(CountResults)) ' spectra'], 'FontName', 'Charter');

ax(2) = nexttile(2);
Datensatz_Original_CRI = Optim_CH6_L180;
scatter(Datensatz_Original_CRI.Duv_signed, Datensatz_Original_CRI.MelanopicRadiance_Actual,...
    MarkerSize, Datensatz_Original_CRI.CCT_Target,'filled',...
    'jitter', 'on', 'jitterAmount', JitterAmount, 'MarkerFaceAlpha', MarkerAlpha);
[G, TargetGroups] = findgroups(categorical(Datensatz_Original_CRI.IndexNumber_Target));
CountResults = splitapply(@(x) max(x),Datensatz_Original_CRI.OptimResult_Number,G);
Sum_Count(2) = sum(CountResults);
title('6-channel LED luminaire ', 'FontSize', 12);
subtitle(['180 cd/m^2, CRI > 80, ' num2str(sum(CountResults)) ' spectra'], 'FontName', 'Charter', 'FontSize', 12);

ax(3) = nexttile(3);
Datensatz_Original_CRI = Optim_CH6_L220;
scatter(Datensatz_Original_CRI.Duv_signed, Datensatz_Original_CRI.MelanopicRadiance_Actual,...
    MarkerSize, Datensatz_Original_CRI.CCT_Target,'filled',...
    'jitter', 'on', 'jitterAmount', JitterAmount, 'MarkerFaceAlpha', MarkerAlpha);
[G, TargetGroups] = findgroups(categorical(Datensatz_Original_CRI.IndexNumber_Target));
CountResults = splitapply(@(x) max(x),Datensatz_Original_CRI.OptimResult_Number,G);
Sum_Count(3) = sum(CountResults);
title('6-channel LED luminaire ', 'FontSize', 12);
subtitle(['220 cd/m^2, CRI > 80, ' num2str(sum(CountResults)) ' spectra'], 'FontName', 'Charter', 'FontSize', 12);

ax(4) = nexttile(4);
Datensatz_Original_CRI = Optim_CH8_L140;
scatter(Datensatz_Original_CRI.Duv_signed, Datensatz_Original_CRI.MelanopicRadiance_Actual,...
    MarkerSize, Datensatz_Original_CRI.CCT_Target,'filled',...
    'jitter', 'on', 'jitterAmount', JitterAmount, 'MarkerFaceAlpha', MarkerAlpha);
[G, TargetGroups] = findgroups(categorical(Datensatz_Original_CRI.IndexNumber_Target));
CountResults = splitapply(@(x) max(x),Datensatz_Original_CRI.OptimResult_Number,G);
Sum_Count(4) = sum(CountResults);
title('8-channel LED luminaire ', 'FontSize', 12);
subtitle(['140 cd/m^2, CRI > 80, ' num2str(sum(CountResults)) ' spectra'], 'FontName', 'Charter', 'FontSize', 12);

ax(5) = nexttile(5);
Datensatz_Original_CRI = Optim_CH8_L180;
scatter(Datensatz_Original_CRI.Duv_signed, Datensatz_Original_CRI.MelanopicRadiance_Actual,...
    MarkerSize, Datensatz_Original_CRI.CCT_Target,'filled',...
    'jitter', 'on', 'jitterAmount', JitterAmount, 'MarkerFaceAlpha', MarkerAlpha);
[G, TargetGroups] = findgroups(categorical(Datensatz_Original_CRI.IndexNumber_Target));
CountResults = splitapply(@(x) max(x),Datensatz_Original_CRI.OptimResult_Number,G);
Sum_Count(5) = sum(CountResults);
title('8-channel LED luminaire ', 'FontSize', 12);
subtitle(['180 cd/m^2, CRI > 80, ' num2str(sum(CountResults)) ' spectra'], 'FontName', 'Charter', 'FontSize', 12);

ax(6) = nexttile(6);
Datensatz_Original_CRI = Optim_CH8_L220;
scatter(Datensatz_Original_CRI.Duv_signed, Datensatz_Original_CRI.MelanopicRadiance_Actual,...
    MarkerSize, Datensatz_Original_CRI.CCT_Target,'filled',...
    'jitter', 'on', 'jitterAmount', JitterAmount, 'MarkerFaceAlpha', MarkerAlpha);
[G, TargetGroups] = findgroups(categorical(Datensatz_Original_CRI.IndexNumber_Target));
CountResults = splitapply(@(x) max(x),Datensatz_Original_CRI.OptimResult_Number,G);
Sum_Count(6) = sum(CountResults);
title('8-channel LED luminaire ', 'FontSize', 12);
subtitle(['220 cd/m^2, CRI > 80, ' num2str(sum(CountResults)) ' spectra'], 'FontName', 'Charter', 'FontSize', 12);

ax(7) = nexttile(7);
Datensatz_Original_CRI = Optim_CH11_L140;
scatter(Datensatz_Original_CRI.Duv_signed, Datensatz_Original_CRI.MelanopicRadiance_Actual,...
    MarkerSize, Datensatz_Original_CRI.CCT_Target,'filled',...
    'jitter', 'on', 'jitterAmount', JitterAmount, 'MarkerFaceAlpha', MarkerAlpha);
[G, TargetGroups] = findgroups(categorical(Datensatz_Original_CRI.IndexNumber_Target));
CountResults = splitapply(@(x) max(x),Datensatz_Original_CRI.OptimResult_Number,G);
Sum_Count(7) = sum(CountResults);
title('11-channel LED luminaire ', 'FontSize', 12);
subtitle(['140 cd/m^2, CRI > 80, ' num2str(sum(CountResults)) ' spectra'], 'FontName', 'Charter', 'FontSize', 12);

ax(8) = nexttile(8);
Datensatz_Original_CRI = Optim_CH11_L180;
scatter(Datensatz_Original_CRI.Duv_signed, Datensatz_Original_CRI.MelanopicRadiance_Actual,...
    MarkerSize, Datensatz_Original_CRI.CCT_Target,'filled',...
    'jitter', 'on', 'jitterAmount', JitterAmount, 'MarkerFaceAlpha', MarkerAlpha);
[G, TargetGroups] = findgroups(categorical(Datensatz_Original_CRI.IndexNumber_Target));
CountResults = splitapply(@(x) max(x),Datensatz_Original_CRI.OptimResult_Number,G);
Sum_Count(8) = sum(CountResults);
title('11-channel LED luminaire ', 'FontSize', 12);
subtitle(['180 cd/m^2, CRI > 80, ' num2str(sum(CountResults)) ' spectra'], 'FontName', 'Charter', 'FontSize', 12);

ax(9) = nexttile(9);
Datensatz_Original_CRI = Optim_CH11_L220;
scatter(Datensatz_Original_CRI.Duv_signed, Datensatz_Original_CRI.MelanopicRadiance_Actual,...
    MarkerSize, Datensatz_Original_CRI.CCT_Target,'filled',...
    'jitter', 'on', 'jitterAmount', JitterAmount, 'MarkerFaceAlpha', MarkerAlpha);
[G, TargetGroups] = findgroups(categorical(Datensatz_Original_CRI.IndexNumber_Target));
CountResults = splitapply(@(x) max(x),Datensatz_Original_CRI.OptimResult_Number,G);
Sum_Count(9) = sum(CountResults);
title('11-channel LED luminaire ', 'FontSize', 12);
subtitle(['220 cd/m^2, CRI > 80, ' num2str(sum(CountResults)) ' spectra'], 'FontName', 'Charter', 'FontSize', 12);


CCT_Targets = [2700, 2796, 2901, 3017, 3147, 3292, 3456, 3642,...
    3855, 4101, 4386, 4717, 5102, 5552, 6080, 6702, 7443];
colormap(flipud(parula(16)))
caxis([2700 7443])
cb = colorbar;
cb.Layout.Tile = 'east';
cb.Ticks = CCT_Targets;
cb.Ruler.Scale = 'log';
cb.Ruler.MinorTick = 'off';
cb.TickLabels = {'2700' '2796' '2901' '3017' '3147'...
    '3292' '3456' '3642' '3855' '4101' '4386' '4717' '5102' '5552' '6080' '6702' '7443'};

YLim = [0, 0.5]; YLimTick = [0:0.1:0.5];
XLim = [-0.05, 0.05]; XLimTick = [-0.05:0.02:0, 0.01:0.02:0.05];
xlabel(t, 'Duv from Planckian locus', 'FontSize', 12, 'FontName', 'Charter', 'Interpreter', 'latex');
ylabel(t, 'Melanopic-radiance in $W/m^2 sr$', 'FontSize', 12, 'FontName', 'Charter','Interpreter', 'latex');
set(ax(1), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(1), 'on');
set(ax(2), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(2), 'on');
set(ax(3), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(3), 'on');
set(ax(4), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(4), 'on');
set(ax(5), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(5), 'on');
set(ax(6), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(6), 'on');
set(ax(7), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(7), 'on');
set(ax(8), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(8), 'on');
set(ax(9), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(9), 'on');

fprintf('Number of total optimised spectra for 0 < CRI < 100 across all channels: %d \n', sum(Sum_Count))

%% Figure S2 (supplementary materials) - Maximum possible metamer contrast for each chromaticity target in (ABSOLUT)

fig = figure; t = tiledlayout(3, 3, 'Padding', "compact", "TileSpacing", "compact");
set(gcf, 'Position', [0.1, 11, 14, 6]);
JitterAmount = 0.0005;
MarkerAlpha = .6;
MarkerSize = 16;
LineWidth = 1;
GridLabel = 'off';
LineMarker = 'r-.';

ax(1) = nexttile(1);
Datensatz_Original_CRI = Optim_CH6_L140(Optim_CH6_L140.CRI_Actual > 80, :);
[G, TargetGroups] = findgroups(categorical(Datensatz_Original_CRI.IndexNumber_Target));
Tabelle_Differenzen = table(splitapply(@(x) x(1), Datensatz_Original_CRI.IndexNumber_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.CCT_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.Duv_signed, G),...
splitapply(@(x) abs(max(x) - min(x)), Datensatz_Original_CRI.MelanopicRadiance_Actual, G),...
'VariableNames', {'Indexnummer_Ziel' 'CCT' 'DUV_signed' 'MelanopsinDifferenz'});

Gruppen = findgroups(categorical(cellstr(num2str(Tabelle_Differenzen.DUV_signed))));
MaxMelanopsinTable = table(splitapply(@(x) x(1), Tabelle_Differenzen.DUV_signed, Gruppen),...
splitapply(@(x) max(x), Tabelle_Differenzen.MelanopsinDifferenz, Gruppen),...
'VariableNames', {'DUV_signed' 'MaxMelanopsinDifferenz'});
MaxMelanopsinTable = sortrows(MaxMelanopsinTable,{'DUV_signed'},{'ascend'});

scatter(Tabelle_Differenzen.DUV_signed, Tabelle_Differenzen.MelanopsinDifferenz,...
    MarkerSize, Tabelle_Differenzen.CCT,'filled',...
    'jitter', 'on', 'jitterAmount', JitterAmount, 'MarkerFaceAlpha', MarkerAlpha); hold on;
plot(MaxMelanopsinTable.DUV_signed, MaxMelanopsinTable.MaxMelanopsinDifferenz,...
    LineMarker, 'LineWidth', LineWidth);
title('6-channel LED luminaire', 'FontName', 'Charter');
subtitle(['Luminance: 140 cd/m^2, CRI > 80'], 'FontName', 'Charter');


ax(4) = nexttile(4);
Datensatz_Original_CRI = Optim_CH6_L180(Optim_CH6_L180.CRI_Actual > 80, :);
[G, TargetGroups] = findgroups(categorical(Datensatz_Original_CRI.IndexNumber_Target));
Tabelle_Differenzen = table(splitapply(@(x) x(1), Datensatz_Original_CRI.IndexNumber_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.CCT_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.Duv_signed, G),...
splitapply(@(x) abs(max(x) - min(x)), Datensatz_Original_CRI.MelanopicRadiance_Actual, G),...
'VariableNames', {'Indexnummer_Ziel' 'CCT' 'DUV_signed' 'MelanopsinDifferenz'});

Gruppen = findgroups(categorical(cellstr(num2str(Tabelle_Differenzen.DUV_signed))));
MaxMelanopsinTable = table(splitapply(@(x) x(1), Tabelle_Differenzen.DUV_signed, Gruppen),...
splitapply(@(x) max(x), Tabelle_Differenzen.MelanopsinDifferenz, Gruppen),...
'VariableNames', {'DUV_signed' 'MaxMelanopsinDifferenz'});
MaxMelanopsinTable = sortrows(MaxMelanopsinTable,{'DUV_signed'},{'ascend'});

scatter(Tabelle_Differenzen.DUV_signed, Tabelle_Differenzen.MelanopsinDifferenz,...
    MarkerSize, Tabelle_Differenzen.CCT,'filled',...
    'jitter', 'on', 'jitterAmount', JitterAmount, 'MarkerFaceAlpha', MarkerAlpha); hold on;
plot(MaxMelanopsinTable.DUV_signed, MaxMelanopsinTable.MaxMelanopsinDifferenz,...
    LineMarker, 'LineWidth', LineWidth);
title('6-channel LED luminaire', 'FontName', 'Charter');
subtitle(['Luminance: 180 cd/m^2, CRI > 80'], 'FontName', 'Charter');


ax(7) = nexttile(7);
Datensatz_Original_CRI = Optim_CH6_L220(Optim_CH6_L220.CRI_Actual > 80, :);
[G, TargetGroups] = findgroups(categorical(Datensatz_Original_CRI.IndexNumber_Target));
Tabelle_Differenzen = table(splitapply(@(x) x(1), Datensatz_Original_CRI.IndexNumber_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.CCT_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.Duv_signed, G),...
splitapply(@(x) abs(max(x) - min(x)), Datensatz_Original_CRI.MelanopicRadiance_Actual, G),...
'VariableNames', {'Indexnummer_Ziel' 'CCT' 'DUV_signed' 'MelanopsinDifferenz'});

Gruppen = findgroups(categorical(cellstr(num2str(Tabelle_Differenzen.DUV_signed))));
MaxMelanopsinTable = table(splitapply(@(x) x(1), Tabelle_Differenzen.DUV_signed, Gruppen),...
splitapply(@(x) max(x), Tabelle_Differenzen.MelanopsinDifferenz, Gruppen),...
'VariableNames', {'DUV_signed' 'MaxMelanopsinDifferenz'});
MaxMelanopsinTable = sortrows(MaxMelanopsinTable,{'DUV_signed'},{'ascend'});

scatter(Tabelle_Differenzen.DUV_signed, Tabelle_Differenzen.MelanopsinDifferenz,...
    MarkerSize, Tabelle_Differenzen.CCT,'filled',...
    'jitter', 'on', 'jitterAmount', JitterAmount, 'MarkerFaceAlpha', MarkerAlpha); hold on;
plot(MaxMelanopsinTable.DUV_signed, MaxMelanopsinTable.MaxMelanopsinDifferenz,...
    LineMarker, 'LineWidth', LineWidth);
title('6-channel LED luminaire', 'FontName', 'Charter');
subtitle(['Luminance: 220 cd/m^2, CRI > 80'], 'FontName', 'Charter');


ax(2) = nexttile(2);
Datensatz_Original_CRI = Optim_CH8_L140(Optim_CH8_L140.CRI_Actual > 80, :);
[G, TargetGroups] = findgroups(categorical(Datensatz_Original_CRI.IndexNumber_Target));
Tabelle_Differenzen = table(splitapply(@(x) x(1), Datensatz_Original_CRI.IndexNumber_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.CCT_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.Duv_signed, G),...
splitapply(@(x) abs(max(x) - min(x)), Datensatz_Original_CRI.MelanopicRadiance_Actual, G),...
'VariableNames', {'Indexnummer_Ziel' 'CCT' 'DUV_signed' 'MelanopsinDifferenz'});

Gruppen = findgroups(categorical(cellstr(num2str(Tabelle_Differenzen.DUV_signed))));
MaxMelanopsinTable = table(splitapply(@(x) x(1), Tabelle_Differenzen.DUV_signed, Gruppen),...
splitapply(@(x) max(x), Tabelle_Differenzen.MelanopsinDifferenz, Gruppen),...
'VariableNames', {'DUV_signed' 'MaxMelanopsinDifferenz'});
MaxMelanopsinTable = sortrows(MaxMelanopsinTable,{'DUV_signed'},{'ascend'});

scatter(Tabelle_Differenzen.DUV_signed, Tabelle_Differenzen.MelanopsinDifferenz,...
    MarkerSize, Tabelle_Differenzen.CCT,'filled',...
    'jitter', 'on', 'jitterAmount', JitterAmount, 'MarkerFaceAlpha', MarkerAlpha); hold on;
plot(MaxMelanopsinTable.DUV_signed, MaxMelanopsinTable.MaxMelanopsinDifferenz,...
    LineMarker, 'LineWidth', LineWidth);
title('8-channel LED luminaire', 'FontName', 'Charter');
subtitle(['Luminance: 140 cd/m^2, CRI > 80'], 'FontName', 'Charter');


ax(5) = nexttile(5);
Datensatz_Original_CRI = Optim_CH8_L180(Optim_CH8_L180.CRI_Actual > 80, :);
[G, TargetGroups] = findgroups(categorical(Datensatz_Original_CRI.IndexNumber_Target));
Tabelle_Differenzen = table(splitapply(@(x) x(1), Datensatz_Original_CRI.IndexNumber_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.CCT_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.Duv_signed, G),...
splitapply(@(x) abs(max(x) - min(x)), Datensatz_Original_CRI.MelanopicRadiance_Actual, G),...
'VariableNames', {'Indexnummer_Ziel' 'CCT' 'DUV_signed' 'MelanopsinDifferenz'});

Gruppen = findgroups(categorical(cellstr(num2str(Tabelle_Differenzen.DUV_signed))));
MaxMelanopsinTable = table(splitapply(@(x) x(1), Tabelle_Differenzen.DUV_signed, Gruppen),...
splitapply(@(x) max(x), Tabelle_Differenzen.MelanopsinDifferenz, Gruppen),...
'VariableNames', {'DUV_signed' 'MaxMelanopsinDifferenz'});
MaxMelanopsinTable = sortrows(MaxMelanopsinTable,{'DUV_signed'},{'ascend'});

scatter(Tabelle_Differenzen.DUV_signed, Tabelle_Differenzen.MelanopsinDifferenz,...
    MarkerSize, Tabelle_Differenzen.CCT,'filled',...
    'jitter', 'on', 'jitterAmount', JitterAmount, 'MarkerFaceAlpha', MarkerAlpha); hold on;
plot(MaxMelanopsinTable.DUV_signed, MaxMelanopsinTable.MaxMelanopsinDifferenz,...
    LineMarker, 'LineWidth', LineWidth);
title('8-channel LED luminaire', 'FontName', 'Charter');
subtitle(['Luminance: 180 cd/m^2, CRI > 80'], 'FontName', 'Charter');


ax(8) = nexttile(8);
Datensatz_Original_CRI = Optim_CH8_L220(Optim_CH8_L220.CRI_Actual > 80, :);
[G, TargetGroups] = findgroups(categorical(Datensatz_Original_CRI.IndexNumber_Target));
Tabelle_Differenzen = table(splitapply(@(x) x(1), Datensatz_Original_CRI.IndexNumber_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.CCT_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.Duv_signed, G),...
splitapply(@(x) abs(max(x) - min(x)), Datensatz_Original_CRI.MelanopicRadiance_Actual, G),...
'VariableNames', {'Indexnummer_Ziel' 'CCT' 'DUV_signed' 'MelanopsinDifferenz'});

Gruppen = findgroups(categorical(cellstr(num2str(Tabelle_Differenzen.DUV_signed))));
MaxMelanopsinTable = table(splitapply(@(x) x(1), Tabelle_Differenzen.DUV_signed, Gruppen),...
splitapply(@(x) max(x), Tabelle_Differenzen.MelanopsinDifferenz, Gruppen),...
'VariableNames', {'DUV_signed' 'MaxMelanopsinDifferenz'});
MaxMelanopsinTable = sortrows(MaxMelanopsinTable,{'DUV_signed'},{'ascend'});

scatter(Tabelle_Differenzen.DUV_signed, Tabelle_Differenzen.MelanopsinDifferenz,...
    MarkerSize, Tabelle_Differenzen.CCT,'filled',...
    'jitter', 'on', 'jitterAmount', JitterAmount, 'MarkerFaceAlpha', MarkerAlpha); hold on;
plot(MaxMelanopsinTable.DUV_signed, MaxMelanopsinTable.MaxMelanopsinDifferenz,...
    LineMarker, 'LineWidth', LineWidth);
title('8-channel LED luminaire', 'FontName', 'Charter');
subtitle(['Luminance: 220 cd/m^2, CRI > 80'], 'FontName', 'Charter');


ax(3) = nexttile(3);
Datensatz_Original_CRI = Optim_CH11_L140(Optim_CH11_L140.CRI_Actual > 80, :);
[G, TargetGroups] = findgroups(categorical(Datensatz_Original_CRI.IndexNumber_Target));
Tabelle_Differenzen = table(splitapply(@(x) x(1), Datensatz_Original_CRI.IndexNumber_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.CCT_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.Duv_signed, G),...
splitapply(@(x) abs(max(x) - min(x)), Datensatz_Original_CRI.MelanopicRadiance_Actual, G),...
'VariableNames', {'Indexnummer_Ziel' 'CCT' 'DUV_signed' 'MelanopsinDifferenz'});

Gruppen = findgroups(categorical(cellstr(num2str(Tabelle_Differenzen.DUV_signed))));
MaxMelanopsinTable = table(splitapply(@(x) x(1), Tabelle_Differenzen.DUV_signed, Gruppen),...
splitapply(@(x) max(x), Tabelle_Differenzen.MelanopsinDifferenz, Gruppen),...
'VariableNames', {'DUV_signed' 'MaxMelanopsinDifferenz'});
MaxMelanopsinTable = sortrows(MaxMelanopsinTable,{'DUV_signed'},{'ascend'});

scatter(Tabelle_Differenzen.DUV_signed, Tabelle_Differenzen.MelanopsinDifferenz,...
    MarkerSize, Tabelle_Differenzen.CCT,'filled',...
    'jitter', 'on', 'jitterAmount', JitterAmount, 'MarkerFaceAlpha', MarkerAlpha); hold on;
plot(MaxMelanopsinTable.DUV_signed, MaxMelanopsinTable.MaxMelanopsinDifferenz,...
    LineMarker, 'LineWidth', LineWidth);
title('11-channel LED luminaire', 'FontName', 'Charter');
subtitle(['Luminance: 140 cd/m^2, CRI > 80'], 'FontName', 'Charter');


ax(6) = nexttile(6);
Datensatz_Original_CRI = Optim_CH11_L180(Optim_CH11_L180.CRI_Actual > 80, :);
[G, TargetGroups] = findgroups(categorical(Datensatz_Original_CRI.IndexNumber_Target));
Tabelle_Differenzen = table(splitapply(@(x) x(1), Datensatz_Original_CRI.IndexNumber_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.CCT_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.Duv_signed, G),...
splitapply(@(x) abs(max(x) - min(x)), Datensatz_Original_CRI.MelanopicRadiance_Actual, G),...
'VariableNames', {'Indexnummer_Ziel' 'CCT' 'DUV_signed' 'MelanopsinDifferenz'});

Gruppen = findgroups(categorical(cellstr(num2str(Tabelle_Differenzen.DUV_signed))));
MaxMelanopsinTable = table(splitapply(@(x) x(1), Tabelle_Differenzen.DUV_signed, Gruppen),...
splitapply(@(x) max(x), Tabelle_Differenzen.MelanopsinDifferenz, Gruppen),...
'VariableNames', {'DUV_signed' 'MaxMelanopsinDifferenz'});
MaxMelanopsinTable = sortrows(MaxMelanopsinTable,{'DUV_signed'},{'ascend'});

scatter(Tabelle_Differenzen.DUV_signed, Tabelle_Differenzen.MelanopsinDifferenz,...
    MarkerSize, Tabelle_Differenzen.CCT,'filled',...
    'jitter', 'on', 'jitterAmount', JitterAmount, 'MarkerFaceAlpha', MarkerAlpha); hold on;
plot(MaxMelanopsinTable.DUV_signed, MaxMelanopsinTable.MaxMelanopsinDifferenz,...
    LineMarker, 'LineWidth', LineWidth);
title('11-channel LED luminaire', 'FontName', 'Charter');
subtitle(['Luminance: 180 cd/m^2, CRI > 80'], 'FontName', 'Charter');


ax(9) = nexttile(9);
Datensatz_Original_CRI = Optim_CH11_L220(Optim_CH11_L220.CRI_Actual > 80, :);
[G, TargetGroups] = findgroups(categorical(Datensatz_Original_CRI.IndexNumber_Target));
Tabelle_Differenzen = table(splitapply(@(x) x(1), Datensatz_Original_CRI.IndexNumber_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.CCT_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.Duv_signed, G),...
splitapply(@(x) abs(max(x) - min(x)), Datensatz_Original_CRI.MelanopicRadiance_Actual, G),...
'VariableNames', {'Indexnummer_Ziel' 'CCT' 'DUV_signed' 'MelanopsinDifferenz'});

Gruppen = findgroups(categorical(cellstr(num2str(Tabelle_Differenzen.DUV_signed))));
MaxMelanopsinTable = table(splitapply(@(x) x(1), Tabelle_Differenzen.DUV_signed, Gruppen),...
splitapply(@(x) max(x), Tabelle_Differenzen.MelanopsinDifferenz, Gruppen),...
'VariableNames', {'DUV_signed' 'MaxMelanopsinDifferenz'});
MaxMelanopsinTable = sortrows(MaxMelanopsinTable,{'DUV_signed'},{'ascend'});

scatter(Tabelle_Differenzen.DUV_signed, Tabelle_Differenzen.MelanopsinDifferenz,...
    MarkerSize, Tabelle_Differenzen.CCT,'filled',...
    'jitter', 'on', 'jitterAmount', JitterAmount, 'MarkerFaceAlpha', MarkerAlpha); hold on;
plot(MaxMelanopsinTable.DUV_signed, MaxMelanopsinTable.MaxMelanopsinDifferenz,...
    LineMarker, 'LineWidth', LineWidth);
title('11-channel LED luminaire', 'FontName', 'Charter');
subtitle(['Luminance: 220 cd/m^2, CRI > 80'], 'FontName', 'Charter');

CCT_Ziele = [2700, 2796, 2901, 3017, 3147, 3292, 3456, 3642,...
    3855, 4101, 4386, 4717, 5102, 5552, 6080, 6702, 7443];
cb = colorbar;
colormap(flipud(parula(16)))
caxis([2700 7443])
cb.Layout.Tile = 'east';
cb.Ticks = CCT_Ziele;
cb.Ruler.Scale = 'log';
cb.Ruler.MinorTick = 'off';
cb.TickLabels = {'2700' '2796' '2901' '3017' '3147'...
    '3292' '3456' '3642' '3855' '4101' '4386' '4717' '5102' '5552' '6080' '6702' '7443'};

YLim = [0, 0.12]; YLimTick = [0:0.04:0.12];
XLim = [-0.05, 0.05]; XLimTick = [-0.05:0.02:0, 0.01:0.02:0.05];
xlabel(t, 'Duv from Planckian locus', 'FontSize', 14, 'FontName', 'Charter');
ylabel(t, 'Melanopic-radiance in W/m^2 sr', 'FontSize', 14, 'FontName', 'Charter');
set(ax(1), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(1), GridLabel);
set(ax(2), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(2), GridLabel);
set(ax(3), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(3), GridLabel);
set(ax(4), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(4), GridLabel);
set(ax(5), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(5), GridLabel);
set(ax(6), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(6), GridLabel);
set(ax(7), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(7), GridLabel);
set(ax(8), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(8), GridLabel);
set(ax(9), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(9), GridLabel);


%% Figure 4 B) - Maximum possible metamer contrast for each chromaticity target in (RELATIV)

fig = figure; t = tiledlayout(3, 3, 'Padding', "normal", "TileSpacing", "normal");
set(gcf, 'Position', [0.1, 11, 14, 6]);
JitterAmount = 0.0005;
MarkerAlpha = .6;
MarkerSize = 16;
LineWidth = 1;
GridLabel = 'off';
LineMarker = 'r-.';

ax(1) = nexttile(1);
Datensatz_Original_CRI = Optim_CH6_L140(Optim_CH6_L140.CRI_Actual > 80, :);
[G, TargetGroups] = findgroups(categorical(Datensatz_Original_CRI.IndexNumber_Target));
Tabelle_Differenzen = table(splitapply(@(x) x(1), Datensatz_Original_CRI.IndexNumber_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.CCT_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.Duv_signed, G),...
splitapply(@(x) ((100*max(x))/min(x))-100, Datensatz_Original_CRI.MelanopicRadiance_Actual, G),...
'VariableNames', {'Indexnummer_Ziel' 'CCT' 'DUV_signed' 'MelanopsinDifferenz'});

Gruppen = findgroups(categorical(cellstr(num2str(Tabelle_Differenzen.DUV_signed))));
MaxMelanopsinTable = table(splitapply(@(x) x(1), Tabelle_Differenzen.DUV_signed, Gruppen),...
splitapply(@(x) max(x), Tabelle_Differenzen.MelanopsinDifferenz, Gruppen),...
'VariableNames', {'DUV_signed' 'MaxMelanopsinDifferenz'});
MaxMelanopsinTable = sortrows(MaxMelanopsinTable,{'DUV_signed'},{'ascend'});

scatter(Tabelle_Differenzen.DUV_signed, Tabelle_Differenzen.MelanopsinDifferenz,...
    MarkerSize, Tabelle_Differenzen.CCT,'filled',...
    'jitter', 'on', 'jitterAmount', JitterAmount, 'MarkerFaceAlpha', MarkerAlpha); hold on;
plot(MaxMelanopsinTable.DUV_signed, MaxMelanopsinTable.MaxMelanopsinDifferenz,...
    LineMarker, 'LineWidth', LineWidth);
title('6-channel LED luminaire', 'FontName', 'Charter');
subtitle(['140 cd/m^2, CRI > 80'], 'FontName', 'Charter');

Table_S2_CH6_140 = MaxMelanopsinTable(MaxMelanopsinTable.MaxMelanopsinDifferenz == max(MaxMelanopsinTable.MaxMelanopsinDifferenz), :);
Table_S2_CH6_140.Properties.VariableNames = {'Duv_from_Planck', 'Max_Melanopic_Metamer_Contrast'};
Table_S2_CH6_140.Luminaire_configuration = 6;
Table_S2_CH6_140.Target_Luminance = 140;
Table_S2_CH6_140.CCT = Tabelle_Differenzen(Tabelle_Differenzen.MelanopsinDifferenz == Table_S2_CH6_140.Max_Melanopic_Metamer_Contrast, :).CCT;


ax(4) = nexttile(4);
Datensatz_Original_CRI = Optim_CH6_L180(Optim_CH6_L180.CRI_Actual > 80, :);
[G, TargetGroups] = findgroups(categorical(Datensatz_Original_CRI.IndexNumber_Target));
Tabelle_Differenzen = table(splitapply(@(x) x(1), Datensatz_Original_CRI.IndexNumber_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.CCT_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.Duv_signed, G),...
splitapply(@(x) ((100*max(x))/min(x))-100, Datensatz_Original_CRI.MelanopicRadiance_Actual, G),...
'VariableNames', {'Indexnummer_Ziel' 'CCT' 'DUV_signed' 'MelanopsinDifferenz'});

Gruppen = findgroups(categorical(cellstr(num2str(Tabelle_Differenzen.DUV_signed))));
MaxMelanopsinTable = table(splitapply(@(x) x(1), Tabelle_Differenzen.DUV_signed, Gruppen),...
splitapply(@(x) max(x), Tabelle_Differenzen.MelanopsinDifferenz, Gruppen),...
'VariableNames', {'DUV_signed' 'MaxMelanopsinDifferenz'});
MaxMelanopsinTable = sortrows(MaxMelanopsinTable,{'DUV_signed'},{'ascend'});

scatter(Tabelle_Differenzen.DUV_signed, Tabelle_Differenzen.MelanopsinDifferenz,...
    MarkerSize, Tabelle_Differenzen.CCT,'filled',...
    'jitter', 'on', 'jitterAmount', JitterAmount, 'MarkerFaceAlpha', MarkerAlpha); hold on;
plot(MaxMelanopsinTable.DUV_signed, MaxMelanopsinTable.MaxMelanopsinDifferenz,...
    LineMarker, 'LineWidth', LineWidth);
title('6-channel LED luminaire', 'FontName', 'Charter');
subtitle(['180 cd/m^2, CRI > 80'], 'FontName', 'Charter');

Table_S2_CH6_180 = MaxMelanopsinTable(MaxMelanopsinTable.MaxMelanopsinDifferenz == max(MaxMelanopsinTable.MaxMelanopsinDifferenz), :);
Table_S2_CH6_180.Properties.VariableNames = {'Duv_from_Planck', 'Max_Melanopic_Metamer_Contrast'};
Table_S2_CH6_180.Luminaire_configuration = 6;
Table_S2_CH6_180.Target_Luminance = 180;
Table_S2_CH6_180.CCT = Tabelle_Differenzen(Tabelle_Differenzen.MelanopsinDifferenz == Table_S2_CH6_180.Max_Melanopic_Metamer_Contrast, :).CCT;


ax(7) = nexttile(7);
Datensatz_Original_CRI = Optim_CH6_L220(Optim_CH6_L220.CRI_Actual > 80, :);
[G, TargetGroups] = findgroups(categorical(Datensatz_Original_CRI.IndexNumber_Target));
Tabelle_Differenzen = table(splitapply(@(x) x(1), Datensatz_Original_CRI.IndexNumber_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.CCT_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.Duv_signed, G),...
splitapply(@(x) ((100*max(x))/min(x))-100, Datensatz_Original_CRI.MelanopicRadiance_Actual, G),...
'VariableNames', {'Indexnummer_Ziel' 'CCT' 'DUV_signed' 'MelanopsinDifferenz'});

Gruppen = findgroups(categorical(cellstr(num2str(Tabelle_Differenzen.DUV_signed))));
MaxMelanopsinTable = table(splitapply(@(x) x(1), Tabelle_Differenzen.DUV_signed, Gruppen),...
splitapply(@(x) max(x), Tabelle_Differenzen.MelanopsinDifferenz, Gruppen),...
'VariableNames', {'DUV_signed' 'MaxMelanopsinDifferenz'});
MaxMelanopsinTable = sortrows(MaxMelanopsinTable,{'DUV_signed'},{'ascend'});

scatter(Tabelle_Differenzen.DUV_signed, Tabelle_Differenzen.MelanopsinDifferenz,...
    MarkerSize, Tabelle_Differenzen.CCT,'filled',...
    'jitter', 'on', 'jitterAmount', JitterAmount, 'MarkerFaceAlpha', MarkerAlpha); hold on;
plot(MaxMelanopsinTable.DUV_signed, MaxMelanopsinTable.MaxMelanopsinDifferenz,...
    LineMarker, 'LineWidth', LineWidth);
title('6-channel LED luminaire', 'FontName', 'Charter');
subtitle(['220 cd/m^2, CRI > 80'], 'FontName', 'Charter');

Table_S2_CH6_220 = MaxMelanopsinTable(MaxMelanopsinTable.MaxMelanopsinDifferenz == max(MaxMelanopsinTable.MaxMelanopsinDifferenz), :);
Table_S2_CH6_220.Properties.VariableNames = {'Duv_from_Planck', 'Max_Melanopic_Metamer_Contrast'};
Table_S2_CH6_220.Luminaire_configuration = 6;
Table_S2_CH6_220.Target_Luminance = 220;
Table_S2_CH6_220.CCT = Tabelle_Differenzen(Tabelle_Differenzen.MelanopsinDifferenz == Table_S2_CH6_220.Max_Melanopic_Metamer_Contrast, :).CCT;


ax(2) = nexttile(2);
Datensatz_Original_CRI = Optim_CH8_L140(Optim_CH8_L140.CRI_Actual > 80, :);
[G, TargetGroups] = findgroups(categorical(Datensatz_Original_CRI.IndexNumber_Target));
Tabelle_Differenzen = table(splitapply(@(x) x(1), Datensatz_Original_CRI.IndexNumber_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.CCT_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.Duv_signed, G),...
splitapply(@(x) ((100*max(x))/min(x))-100, Datensatz_Original_CRI.MelanopicRadiance_Actual, G),...
'VariableNames', {'Indexnummer_Ziel' 'CCT' 'DUV_signed' 'MelanopsinDifferenz'});

Gruppen = findgroups(categorical(cellstr(num2str(Tabelle_Differenzen.DUV_signed))));
MaxMelanopsinTable = table(splitapply(@(x) x(1), Tabelle_Differenzen.DUV_signed, Gruppen),...
splitapply(@(x) max(x), Tabelle_Differenzen.MelanopsinDifferenz, Gruppen),...
'VariableNames', {'DUV_signed' 'MaxMelanopsinDifferenz'});
MaxMelanopsinTable = sortrows(MaxMelanopsinTable,{'DUV_signed'},{'ascend'});

scatter(Tabelle_Differenzen.DUV_signed, Tabelle_Differenzen.MelanopsinDifferenz,...
    MarkerSize, Tabelle_Differenzen.CCT,'filled',...
    'jitter', 'on', 'jitterAmount', JitterAmount, 'MarkerFaceAlpha', MarkerAlpha); hold on;
plot(MaxMelanopsinTable.DUV_signed, MaxMelanopsinTable.MaxMelanopsinDifferenz,...
    LineMarker, 'LineWidth', LineWidth);
title('8-channel LED luminaire', 'FontName', 'Charter');
subtitle(['140 cd/m^2, CRI > 80'], 'FontName', 'Charter');

Table_S2_CH8_140 = MaxMelanopsinTable(MaxMelanopsinTable.MaxMelanopsinDifferenz == max(MaxMelanopsinTable.MaxMelanopsinDifferenz), :);
Table_S2_CH8_140.Properties.VariableNames = {'Duv_from_Planck', 'Max_Melanopic_Metamer_Contrast'};
Table_S2_CH8_140.Luminaire_configuration = 8;
Table_S2_CH8_140.Target_Luminance = 140;
Table_S2_CH8_140.CCT = Tabelle_Differenzen(Tabelle_Differenzen.MelanopsinDifferenz == Table_S2_CH8_140.Max_Melanopic_Metamer_Contrast, :).CCT;


ax(5) = nexttile(5);
Datensatz_Original_CRI = Optim_CH8_L180(Optim_CH8_L180.CRI_Actual > 80, :);
[G, TargetGroups] = findgroups(categorical(Datensatz_Original_CRI.IndexNumber_Target));
Tabelle_Differenzen = table(splitapply(@(x) x(1), Datensatz_Original_CRI.IndexNumber_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.CCT_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.Duv_signed, G),...
splitapply(@(x) ((100*max(x))/min(x))-100, Datensatz_Original_CRI.MelanopicRadiance_Actual, G),...
'VariableNames', {'Indexnummer_Ziel' 'CCT' 'DUV_signed' 'MelanopsinDifferenz'});

Gruppen = findgroups(categorical(cellstr(num2str(Tabelle_Differenzen.DUV_signed))));
MaxMelanopsinTable = table(splitapply(@(x) x(1), Tabelle_Differenzen.DUV_signed, Gruppen),...
splitapply(@(x) max(x), Tabelle_Differenzen.MelanopsinDifferenz, Gruppen),...
'VariableNames', {'DUV_signed' 'MaxMelanopsinDifferenz'});
MaxMelanopsinTable = sortrows(MaxMelanopsinTable,{'DUV_signed'},{'ascend'});

scatter(Tabelle_Differenzen.DUV_signed, Tabelle_Differenzen.MelanopsinDifferenz,...
    MarkerSize, Tabelle_Differenzen.CCT,'filled',...
    'jitter', 'on', 'jitterAmount', JitterAmount, 'MarkerFaceAlpha', MarkerAlpha); hold on;
plot(MaxMelanopsinTable.DUV_signed, MaxMelanopsinTable.MaxMelanopsinDifferenz,...
    LineMarker, 'LineWidth', LineWidth);
title('8-channel LED luminaire', 'FontName', 'Charter');
subtitle(['180 cd/m^2, CRI > 80'], 'FontName', 'Charter');

Table_S2_CH8_180 = MaxMelanopsinTable(MaxMelanopsinTable.MaxMelanopsinDifferenz == max(MaxMelanopsinTable.MaxMelanopsinDifferenz), :);
Table_S2_CH8_180.Properties.VariableNames = {'Duv_from_Planck', 'Max_Melanopic_Metamer_Contrast'};
Table_S2_CH8_180.Luminaire_configuration = 8;
Table_S2_CH8_180.Target_Luminance = 180;
Table_S2_CH8_180.CCT = Tabelle_Differenzen(Tabelle_Differenzen.MelanopsinDifferenz == Table_S2_CH8_180.Max_Melanopic_Metamer_Contrast, :).CCT;


ax(8) = nexttile(8);
Datensatz_Original_CRI = Optim_CH8_L220(Optim_CH8_L220.CRI_Actual > 80, :);
[G, TargetGroups] = findgroups(categorical(Datensatz_Original_CRI.IndexNumber_Target));
Tabelle_Differenzen = table(splitapply(@(x) x(1), Datensatz_Original_CRI.IndexNumber_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.CCT_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.Duv_signed, G),...
splitapply(@(x) ((100*max(x))/min(x))-100, Datensatz_Original_CRI.MelanopicRadiance_Actual, G),...
'VariableNames', {'Indexnummer_Ziel' 'CCT' 'DUV_signed' 'MelanopsinDifferenz'});

Gruppen = findgroups(categorical(cellstr(num2str(Tabelle_Differenzen.DUV_signed))));
MaxMelanopsinTable = table(splitapply(@(x) x(1), Tabelle_Differenzen.DUV_signed, Gruppen),...
splitapply(@(x) max(x), Tabelle_Differenzen.MelanopsinDifferenz, Gruppen),...
'VariableNames', {'DUV_signed' 'MaxMelanopsinDifferenz'});
MaxMelanopsinTable = sortrows(MaxMelanopsinTable,{'DUV_signed'},{'ascend'});

scatter(Tabelle_Differenzen.DUV_signed, Tabelle_Differenzen.MelanopsinDifferenz,...
    MarkerSize, Tabelle_Differenzen.CCT,'filled',...
    'jitter', 'on', 'jitterAmount', JitterAmount, 'MarkerFaceAlpha', MarkerAlpha); hold on;
plot(MaxMelanopsinTable.DUV_signed, MaxMelanopsinTable.MaxMelanopsinDifferenz,...
    LineMarker, 'LineWidth', LineWidth);
title('8-channel LED luminaire', 'FontName', 'Charter');
subtitle(['220 cd/m^2, CRI > 80'], 'FontName', 'Charter');

Table_S2_CH8_220 = MaxMelanopsinTable(MaxMelanopsinTable.MaxMelanopsinDifferenz == max(MaxMelanopsinTable.MaxMelanopsinDifferenz), :);
Table_S2_CH8_220.Properties.VariableNames = {'Duv_from_Planck', 'Max_Melanopic_Metamer_Contrast'};
Table_S2_CH8_220.Luminaire_configuration = 8;
Table_S2_CH8_220.Target_Luminance = 220;
Table_S2_CH8_220.CCT = Tabelle_Differenzen(Tabelle_Differenzen.MelanopsinDifferenz == Table_S2_CH8_220.Max_Melanopic_Metamer_Contrast, :).CCT;


ax(3) = nexttile(3);
Datensatz_Original_CRI = Optim_CH11_L140(Optim_CH11_L140.CRI_Actual > 80, :);
[G, TargetGroups] = findgroups(categorical(Datensatz_Original_CRI.IndexNumber_Target));
Tabelle_Differenzen = table(splitapply(@(x) x(1), Datensatz_Original_CRI.IndexNumber_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.CCT_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.Duv_signed, G),...
splitapply(@(x) ((100*max(x))/min(x))-100, Datensatz_Original_CRI.MelanopicRadiance_Actual, G),...
'VariableNames', {'Indexnummer_Ziel' 'CCT' 'DUV_signed' 'MelanopsinDifferenz'});

Gruppen = findgroups(categorical(cellstr(num2str(Tabelle_Differenzen.DUV_signed))));
MaxMelanopsinTable = table(splitapply(@(x) x(1), Tabelle_Differenzen.DUV_signed, Gruppen),...
splitapply(@(x) max(x), Tabelle_Differenzen.MelanopsinDifferenz, Gruppen),...
'VariableNames', {'DUV_signed' 'MaxMelanopsinDifferenz'});
MaxMelanopsinTable = sortrows(MaxMelanopsinTable,{'DUV_signed'},{'ascend'});

scatter(Tabelle_Differenzen.DUV_signed, Tabelle_Differenzen.MelanopsinDifferenz,...
    MarkerSize, Tabelle_Differenzen.CCT,'filled',...
    'jitter', 'on', 'jitterAmount', JitterAmount, 'MarkerFaceAlpha', MarkerAlpha); hold on;
plot(MaxMelanopsinTable.DUV_signed, MaxMelanopsinTable.MaxMelanopsinDifferenz,...
    LineMarker, 'LineWidth', LineWidth);
title('11-channel LED luminaire', 'FontName', 'Charter');
subtitle(['140 cd/m^2, CRI > 80'], 'FontName', 'Charter');

Table_S2_CH11_140 = MaxMelanopsinTable(MaxMelanopsinTable.MaxMelanopsinDifferenz == max(MaxMelanopsinTable.MaxMelanopsinDifferenz), :);
Table_S2_CH11_140.Properties.VariableNames = {'Duv_from_Planck', 'Max_Melanopic_Metamer_Contrast'};
Table_S2_CH11_140.Luminaire_configuration = 11;
Table_S2_CH11_140.Target_Luminance = 140;
Table_S2_CH11_140.CCT = Tabelle_Differenzen(Tabelle_Differenzen.MelanopsinDifferenz == Table_S2_CH11_140.Max_Melanopic_Metamer_Contrast, :).CCT;


ax(6) = nexttile(6);
Datensatz_Original_CRI = Optim_CH11_L180(Optim_CH11_L180.CRI_Actual > 80, :);
[G, TargetGroups] = findgroups(categorical(Datensatz_Original_CRI.IndexNumber_Target));
Tabelle_Differenzen = table(splitapply(@(x) x(1), Datensatz_Original_CRI.IndexNumber_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.CCT_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.Duv_signed, G),...
splitapply(@(x) ((100*max(x))/min(x))-100, Datensatz_Original_CRI.MelanopicRadiance_Actual, G),...
'VariableNames', {'Indexnummer_Ziel' 'CCT' 'DUV_signed' 'MelanopsinDifferenz'});

Gruppen = findgroups(categorical(cellstr(num2str(Tabelle_Differenzen.DUV_signed))));
MaxMelanopsinTable = table(splitapply(@(x) x(1), Tabelle_Differenzen.DUV_signed, Gruppen),...
splitapply(@(x) max(x), Tabelle_Differenzen.MelanopsinDifferenz, Gruppen),...
'VariableNames', {'DUV_signed' 'MaxMelanopsinDifferenz'});
MaxMelanopsinTable = sortrows(MaxMelanopsinTable,{'DUV_signed'},{'ascend'});

scatter(Tabelle_Differenzen.DUV_signed, Tabelle_Differenzen.MelanopsinDifferenz,...
    MarkerSize, Tabelle_Differenzen.CCT,'filled',...
    'jitter', 'on', 'jitterAmount', JitterAmount, 'MarkerFaceAlpha', MarkerAlpha); hold on;
plot(MaxMelanopsinTable.DUV_signed, MaxMelanopsinTable.MaxMelanopsinDifferenz,...
    LineMarker, 'LineWidth', LineWidth);
title('11-channel LED luminaire', 'FontName', 'Charter');
subtitle(['180 cd/m^2, CRI > 80'], 'FontName', 'Charter');

Table_S2_CH11_180 = MaxMelanopsinTable(MaxMelanopsinTable.MaxMelanopsinDifferenz == max(MaxMelanopsinTable.MaxMelanopsinDifferenz), :);
Table_S2_CH11_180.Properties.VariableNames = {'Duv_from_Planck', 'Max_Melanopic_Metamer_Contrast'};
Table_S2_CH11_180.Luminaire_configuration = 11;
Table_S2_CH11_180.Target_Luminance = 180;
Table_S2_CH11_180.CCT = Tabelle_Differenzen(Tabelle_Differenzen.MelanopsinDifferenz == Table_S2_CH11_180.Max_Melanopic_Metamer_Contrast, :).CCT;


ax(9) = nexttile(9);
Datensatz_Original_CRI = Optim_CH11_L220(Optim_CH11_L220.CRI_Actual > 80, :);
[G, TargetGroups] = findgroups(categorical(Datensatz_Original_CRI.IndexNumber_Target));
Tabelle_Differenzen = table(splitapply(@(x) x(1), Datensatz_Original_CRI.IndexNumber_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.CCT_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.Duv_signed, G),...
splitapply(@(x) ((100*max(x))/min(x))-100, Datensatz_Original_CRI.MelanopicRadiance_Actual, G),...
'VariableNames', {'Indexnummer_Ziel' 'CCT' 'DUV_signed' 'MelanopsinDifferenz'});

Gruppen = findgroups(categorical(cellstr(num2str(Tabelle_Differenzen.DUV_signed))));
MaxMelanopsinTable = table(splitapply(@(x) x(1), Tabelle_Differenzen.DUV_signed, Gruppen),...
splitapply(@(x) max(x), Tabelle_Differenzen.MelanopsinDifferenz, Gruppen),...
'VariableNames', {'DUV_signed' 'MaxMelanopsinDifferenz'});
MaxMelanopsinTable = sortrows(MaxMelanopsinTable,{'DUV_signed'},{'ascend'});

scatter(Tabelle_Differenzen.DUV_signed, Tabelle_Differenzen.MelanopsinDifferenz,...
    MarkerSize, Tabelle_Differenzen.CCT,'filled',...
    'jitter', 'on', 'jitterAmount', JitterAmount, 'MarkerFaceAlpha', MarkerAlpha); hold on;
plot(MaxMelanopsinTable.DUV_signed, MaxMelanopsinTable.MaxMelanopsinDifferenz,...
    LineMarker, 'LineWidth', LineWidth);
title('11-channel LED luminaire', 'FontName', 'Charter');
subtitle(['220 cd/m^2, CRI > 80'], 'FontName', 'Charter');

Table_S2_CH11_220 = MaxMelanopsinTable(MaxMelanopsinTable.MaxMelanopsinDifferenz == max(MaxMelanopsinTable.MaxMelanopsinDifferenz), :);
Table_S2_CH11_220.Properties.VariableNames = {'Duv_from_Planck', 'Max_Melanopic_Metamer_Contrast'};
Table_S2_CH11_220.Luminaire_configuration = 11;
Table_S2_CH11_220.Target_Luminance = 220;
Table_S2_CH11_220.CCT = Tabelle_Differenzen(Tabelle_Differenzen.MelanopsinDifferenz == Table_S2_CH11_220.Max_Melanopic_Metamer_Contrast, :).CCT;


CCT_Targets = [2700, 2796, 2901, 3017, 3147, 3292, 3456, 3642,...
    3855, 4101, 4386, 4717, 5102, 5552, 6080, 6702, 7443];
colormap(flipud(parula(16)))
caxis([2700 7443])
cb = colorbar;
cb.Layout.Tile = 'east';
cb.Ticks = CCT_Targets;
cb.Ruler.Scale = 'log';
cb.Ruler.MinorTick = 'off';
cb.TickLabels = {'2700' '2796' '2901' '3017' '3147'...
    '3292' '3456' '3642' '3855' '4101' '4386' '4717' '5102' '5552' '6080' '6702' '7443'};

YLim = [0, 100]; YLimTick = [0:20:100];
XLim = [-0.05, 0.05]; XLimTick = [-0.05:0.02:0, 0.01:0.02:0.05];
xlabel(t, 'Duv from Planckian locus', 'FontSize', 12, 'FontName', 'Charter');
ylabel(t, 'Maximum metamer melanopsin-contrast in %', 'FontSize', 12, 'FontName', 'Charter');
set(ax(1), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(1), GridLabel);
set(ax(2), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(2), GridLabel);
set(ax(3), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(3), GridLabel);
set(ax(4), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(4), GridLabel);
set(ax(5), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(5), GridLabel);
set(ax(6), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(6), GridLabel);
set(ax(7), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(7), GridLabel);
set(ax(8), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(8), GridLabel);
set(ax(9), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(9), GridLabel);


FontName = 'Charter';
fig.Units = 'centimeters';
fig.PaperUnits = 'centimeters';
fig.Renderer = 'painters';
fig.PaperPositionMode = 'manual';
set(findall(gcf,'-property','FontSize'),'FontSize', 12)
set(findall(gcf,'-property','Linewidth'),'Linewidth',0.5)
set(findall(gcf,'-property','FontName'),'FontName', FontName)

% Table S2 (supplementary materials)
Table_S2 = [Table_S2_CH6_140; Table_S2_CH6_180; Table_S2_CH6_220;...
    Table_S2_CH8_140; Table_S2_CH8_180; Table_S2_CH8_220;...
    Table_S2_CH11_140; Table_S2_CH11_180; Table_S2_CH11_220];
disp("Table S2 from the supplementary materials")
disp(Table_S2);


%% Figure 4 A) - Maximum relative melanopic contrast between 2700 K and 7443 K for each Duv (CRI > 80)

fig = figure;
t = tiledlayout(1,3, 'Padding', "none", "TileSpacing", "compact");

set(gcf, 'Position', [0.1, 11, 16, 3]);
JitterAmount = 0.0005;
MarkerAlpha = .6;
MarkerSize = 12;
LineWidth = 1;
GridLabel = 'off';
LineMarker_1 = '-.';
LineColor_1 = '#e41a1c';
LineMarker_2 = '-';
LineColor_2 = '#377eb8';
LineMarker_3 = '--';
LineColor_3 = '#4daf4a';
TotalArray = [];

ax(1) = nexttile(1);
Datensatz_Original_CRI = Optim_CH6_L140(Optim_CH6_L140.CRI_Actual > 80, :);
[G, TargetGroups] = findgroups(categorical(cellstr(num2str(Datensatz_Original_CRI.Duv_signed))));
Tabelle_Differenzen_140 = table(splitapply(@(x) x(1), Datensatz_Original_CRI.IndexNumber_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.Duv_signed, G),...
splitapply(@(x) ((100*max(x))/min(x))-100, Datensatz_Original_CRI.MelanopicRadiance_Actual, G),...
'VariableNames', {'Indexnummer_Ziel' 'DUV_signed' 'MelanopsinDifferenz'});
Tabelle_Differenzen_140 = sortrows(Tabelle_Differenzen_140,{'DUV_signed'},{'ascend'});

Datensatz_Original_CRI = Optim_CH6_L180(Optim_CH6_L180.CRI_Actual > 80, :);
[G, TargetGroups] = findgroups(categorical(cellstr(num2str(Datensatz_Original_CRI.Duv_signed))));
Tabelle_Differenzen_180 = table(splitapply(@(x) x(1), Datensatz_Original_CRI.IndexNumber_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.Duv_signed, G),...
splitapply(@(x) ((100*max(x))/min(x))-100, Datensatz_Original_CRI.MelanopicRadiance_Actual, G),...
'VariableNames', {'Indexnummer_Ziel' 'DUV_signed' 'MelanopsinDifferenz'});
Tabelle_Differenzen_180 = sortrows(Tabelle_Differenzen_180,{'DUV_signed'},{'ascend'});

Datensatz_Original_CRI = Optim_CH6_L220(Optim_CH6_L220.CRI_Actual > 80, :);
[G, TargetGroups] = findgroups(categorical(cellstr(num2str(Datensatz_Original_CRI.Duv_signed))));
Tabelle_Differenzen_220 = table(splitapply(@(x) x(1), Datensatz_Original_CRI.IndexNumber_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.Duv_signed, G),...
splitapply(@(x) ((100*max(x))/min(x))-100, Datensatz_Original_CRI.MelanopicRadiance_Actual, G),...
'VariableNames', {'Indexnummer_Ziel' 'DUV_signed' 'MelanopsinDifferenz'});
Tabelle_Differenzen_220 = sortrows(Tabelle_Differenzen_220,{'DUV_signed'},{'ascend'});

plot(Tabelle_Differenzen_140.DUV_signed, Tabelle_Differenzen_140.MelanopsinDifferenz,...
    'LineStyle', LineMarker_1, 'Color', LineColor_1,'LineWidth', LineWidth); hold on
plot(Tabelle_Differenzen_180.DUV_signed, Tabelle_Differenzen_180.MelanopsinDifferenz,...
    'LineStyle', LineMarker_2, 'Color', LineColor_2,'LineWidth', LineWidth);
plot(Tabelle_Differenzen_220.DUV_signed, Tabelle_Differenzen_220.MelanopsinDifferenz,...
    'LineStyle', LineMarker_3, 'Color', LineColor_3, 'LineWidth', LineWidth);
legend({'140 cd/m^2' '180 cd/m^2' '220 cd/m^2'}, 'Box', 'off', 'Location','northwest')
title('6-channel LED luminaire', 'FontName', 'Charter');
subtitle(['Mel. contrast from 2700 K to 7443 K'], 'FontName', 'Charter');
% Upper_Limit_Melanopic_Contrast
Tabelle_Differenzen_140.Properties.VariableNames = {'IndexNumber_Target', 'Duv_signed', 'Upper_Limit_Melanopic_Contrast'};
Tabelle_Differenzen_140.Channel(:) = 6;
Tabelle_Differenzen_140.Luminance(:) = 140;
Tabelle_Differenzen_180.Properties.VariableNames = {'IndexNumber_Target', 'Duv_signed', 'Upper_Limit_Melanopic_Contrast'};
Tabelle_Differenzen_180.Channel(:) = 6;
Tabelle_Differenzen_180.Luminance(:) = 180;
Tabelle_Differenzen_220.Properties.VariableNames = {'IndexNumber_Target', 'Duv_signed', 'Upper_Limit_Melanopic_Contrast'};
Tabelle_Differenzen_220.Channel(:) = 6;
Tabelle_Differenzen_220.Luminance(:) = 220;

TotalArray = [TotalArray; Tabelle_Differenzen_140; Tabelle_Differenzen_180; Tabelle_Differenzen_220];


ax(2) = nexttile(2);
Datensatz_Original_CRI = Optim_CH8_L140(Optim_CH8_L140.CRI_Actual > 80, :);
[G, TargetGroups] = findgroups(categorical(cellstr(num2str(Datensatz_Original_CRI.Duv_signed))));
Tabelle_Differenzen_140 = table(splitapply(@(x) x(1), Datensatz_Original_CRI.IndexNumber_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.Duv_signed, G),...
splitapply(@(x) ((100*max(x))/min(x))-100, Datensatz_Original_CRI.MelanopicRadiance_Actual, G),...
'VariableNames', {'Indexnummer_Ziel' 'DUV_signed' 'MelanopsinDifferenz'});
Tabelle_Differenzen_140 = sortrows(Tabelle_Differenzen_140,{'DUV_signed'},{'ascend'});

Datensatz_Original_CRI = Optim_CH8_L180(Optim_CH8_L180.CRI_Actual > 80, :);
[G, TargetGroups] = findgroups(categorical(cellstr(num2str(Datensatz_Original_CRI.Duv_signed))));
Tabelle_Differenzen_180 = table(splitapply(@(x) x(1), Datensatz_Original_CRI.IndexNumber_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.Duv_signed, G),...
splitapply(@(x) ((100*max(x))/min(x))-100, Datensatz_Original_CRI.MelanopicRadiance_Actual, G),...
'VariableNames', {'Indexnummer_Ziel' 'DUV_signed' 'MelanopsinDifferenz'});
Tabelle_Differenzen_180 = sortrows(Tabelle_Differenzen_180,{'DUV_signed'},{'ascend'});

Datensatz_Original_CRI = Optim_CH8_L220(Optim_CH8_L220.CRI_Actual > 80, :);
[G, TargetGroups] = findgroups(categorical(cellstr(num2str(Datensatz_Original_CRI.Duv_signed))));
Tabelle_Differenzen_220 = table(splitapply(@(x) x(1), Datensatz_Original_CRI.IndexNumber_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.Duv_signed, G),...
splitapply(@(x) ((100*max(x))/min(x))-100, Datensatz_Original_CRI.MelanopicRadiance_Actual, G),...
'VariableNames', {'Indexnummer_Ziel' 'DUV_signed' 'MelanopsinDifferenz'});
Tabelle_Differenzen_220 = sortrows(Tabelle_Differenzen_220,{'DUV_signed'},{'ascend'});

plot(Tabelle_Differenzen_140.DUV_signed, Tabelle_Differenzen_140.MelanopsinDifferenz,...
    'LineStyle', LineMarker_1, 'Color', LineColor_1,'LineWidth', LineWidth); hold on
plot(Tabelle_Differenzen_180.DUV_signed, Tabelle_Differenzen_180.MelanopsinDifferenz,...
    'LineStyle', LineMarker_2, 'Color', LineColor_2,'LineWidth', LineWidth);
plot(Tabelle_Differenzen_220.DUV_signed, Tabelle_Differenzen_220.MelanopsinDifferenz,...
    'LineStyle', LineMarker_3, 'Color', LineColor_3, 'LineWidth', LineWidth);
%legend({'140 cd/m^2' '180 cd/m^2' '220 cd/m^2'}, 'Box', 'off')
title('8-channel LED luminaire', 'FontName', 'Charter');
subtitle(['Mel. contrast from 2700 K to 7443 K'], 'FontName', 'Charter');

Tabelle_Differenzen_140.Properties.VariableNames = {'IndexNumber_Target', 'Duv_signed', 'Upper_Limit_Melanopic_Contrast'};
Tabelle_Differenzen_140.Channel(:) = 8;
Tabelle_Differenzen_140.Luminance(:) = 140;
Tabelle_Differenzen_180.Properties.VariableNames = {'IndexNumber_Target', 'Duv_signed', 'Upper_Limit_Melanopic_Contrast'};
Tabelle_Differenzen_180.Channel(:) = 8;
Tabelle_Differenzen_180.Luminance(:) = 180;
Tabelle_Differenzen_220.Properties.VariableNames = {'IndexNumber_Target', 'Duv_signed', 'Upper_Limit_Melanopic_Contrast'};
Tabelle_Differenzen_220.Channel(:) = 8;
Tabelle_Differenzen_220.Luminance(:) = 220;

TotalArray = [TotalArray; Tabelle_Differenzen_140; Tabelle_Differenzen_180; Tabelle_Differenzen_220];


ax(3) = nexttile(3);
Datensatz_Original_CRI = Optim_CH11_L140(Optim_CH11_L140.CRI_Actual > 80, :);
[G, TargetGroups] = findgroups(categorical(cellstr(num2str(Datensatz_Original_CRI.Duv_signed))));
Tabelle_Differenzen_140 = table(splitapply(@(x) x(1), Datensatz_Original_CRI.IndexNumber_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.Duv_signed, G),...
splitapply(@(x) ((100*max(x))/min(x))-100, Datensatz_Original_CRI.MelanopicRadiance_Actual, G),...
'VariableNames', {'Indexnummer_Ziel' 'DUV_signed' 'MelanopsinDifferenz'});
Tabelle_Differenzen_140 = sortrows(Tabelle_Differenzen_140,{'DUV_signed'},{'ascend'});

Datensatz_Original_CRI = Optim_CH11_L180(Optim_CH11_L180.CRI_Actual > 80, :);
[G, TargetGroups] = findgroups(categorical(cellstr(num2str(Datensatz_Original_CRI.Duv_signed))));
Tabelle_Differenzen_180 = table(splitapply(@(x) x(1), Datensatz_Original_CRI.IndexNumber_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.Duv_signed, G),...
splitapply(@(x) ((100*max(x))/min(x))-100, Datensatz_Original_CRI.MelanopicRadiance_Actual, G),...
'VariableNames', {'Indexnummer_Ziel' 'DUV_signed' 'MelanopsinDifferenz'});
Tabelle_Differenzen_180 = sortrows(Tabelle_Differenzen_180,{'DUV_signed'},{'ascend'});

Datensatz_Original_CRI = Optim_CH11_L220(Optim_CH11_L220.CRI_Actual > 80, :);
[G, TargetGroups] = findgroups(categorical(cellstr(num2str(Datensatz_Original_CRI.Duv_signed))));
Tabelle_Differenzen_220 = table(splitapply(@(x) x(1), Datensatz_Original_CRI.IndexNumber_Target, G),...
splitapply(@(x) x(1), Datensatz_Original_CRI.Duv_signed, G),...
splitapply(@(x) ((100*max(x))/min(x))-100, Datensatz_Original_CRI.MelanopicRadiance_Actual, G),...
'VariableNames', {'Indexnummer_Ziel' 'DUV_signed' 'MelanopsinDifferenz'});
Tabelle_Differenzen_220 = sortrows(Tabelle_Differenzen_220,{'DUV_signed'},{'ascend'});

plot(Tabelle_Differenzen_140.DUV_signed, Tabelle_Differenzen_140.MelanopsinDifferenz,...
    'LineStyle', LineMarker_1, 'Color', LineColor_1,'LineWidth', LineWidth); hold on
plot(Tabelle_Differenzen_180.DUV_signed, Tabelle_Differenzen_180.MelanopsinDifferenz,...
    'LineStyle', LineMarker_2, 'Color', LineColor_2,'LineWidth', LineWidth);
plot(Tabelle_Differenzen_220.DUV_signed, Tabelle_Differenzen_220.MelanopsinDifferenz,...
    'LineStyle', LineMarker_3, 'Color', LineColor_3, 'LineWidth', LineWidth);
%legend({'140 cd/m^2' '180 cd/m^2' '220 cd/m^2'}, 'Box', 'off')
title('11-channel LED luminaire', 'FontName', 'Charter');
subtitle(['Mel. contrast from 2700 K to 7443 K'], 'FontName', 'Charter');

Tabelle_Differenzen_140.Properties.VariableNames = {'IndexNumber_Target', 'Duv_signed', 'Upper_Limit_Melanopic_Contrast'};
Tabelle_Differenzen_140.Channel(:) = 11;
Tabelle_Differenzen_140.Luminance(:) = 140;
Tabelle_Differenzen_180.Properties.VariableNames = {'IndexNumber_Target', 'Duv_signed', 'Upper_Limit_Melanopic_Contrast'};
Tabelle_Differenzen_180.Channel(:) = 11;
Tabelle_Differenzen_180.Luminance(:) = 180;
Tabelle_Differenzen_220.Properties.VariableNames = {'IndexNumber_Target', 'Duv_signed', 'Upper_Limit_Melanopic_Contrast'};
Tabelle_Differenzen_220.Channel(:) = 11;
Tabelle_Differenzen_220.Luminance(:) = 220;

TotalArray = [TotalArray; Tabelle_Differenzen_140; Tabelle_Differenzen_180; Tabelle_Differenzen_220];


YLim = [0, 250]; YLimTick = [0:50:250];
XLim = [-0.05, 0.05]; XLimTick = [-0.05:0.02:0, 0.01:0.02:0.05];
xlabel(t, 'Duv from Planckian locus', 'FontSize', 12, 'FontName', 'Charter');
ylabel(t, {'Maximum', 'melanopic-contrast in %'}, 'FontSize', 12, 'FontName', 'Charter');
set(ax(1), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(1), GridLabel);
set(ax(2), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(2), GridLabel);
set(ax(3), 'YLim', YLim, 'XLim', XLim, 'XMinorTick','off', 'XTick', XLimTick, 'YTick', YLimTick); grid(ax(3), GridLabel);

FontName = 'Charter';
fig.Units = 'centimeters';
fig.PaperUnits = 'centimeters';
fig.Renderer = 'painters';
fig.PaperPositionMode = 'manual';
set(findall(gcf,'-property','FontSize'),'FontSize',12)
set(findall(gcf,'-property','Linewidth'),'Linewidth',0.5)
set(findall(gcf,'-property','FontName'),'FontName', FontName)

% Caluclating the peak of the maximum melanopic difference for each luminance and channel combination
[G, TargetGroups] = findgroups(categorical(TotalArray.Luminance), categorical(TotalArray.Channel));
Peak_Melanopic_Contrast = sortrows(table(splitapply(@(x) max(x), TotalArray.Upper_Limit_Melanopic_Contrast, G),...
'VariableNames', {'Peak_Melanopic_Contrast'}),{'Peak_Melanopic_Contrast'},{'descend'});
Peak_Melanopic_Contrast.Peak_Melanopic_Contrast
Table_Peak_Melanopic_Contrast = sortrows(TotalArray(ismember(TotalArray.Upper_Limit_Melanopic_Contrast,Peak_Melanopic_Contrast.Peak_Melanopic_Contrast), :),...
    {'Upper_Limit_Melanopic_Contrast'},{'descend'})

% Maximum relative melanopic contrast across all luminances using 6-channel (between 2700 K and 7443 K)
fprintf('Mean value of the peak relative melanopic contrast across all luminances using 6 channel is: %.2f percent SD %.2f \n',... 
mean(Table_Peak_Melanopic_Contrast(Table_Peak_Melanopic_Contrast.Channel == 6, :).Upper_Limit_Melanopic_Contrast),...
std(Table_Peak_Melanopic_Contrast(Table_Peak_Melanopic_Contrast.Channel == 6, :).Upper_Limit_Melanopic_Contrast))

% Maximum relative melanopic contrast across all luminances using 8-channel (between 2700 K and 7443 K)
fprintf('Mean value of the peak relative melanopic contrast across all luminances using 8 channel is: %.2f percent SD %.2f \n',... 
mean(Table_Peak_Melanopic_Contrast(Table_Peak_Melanopic_Contrast.Channel == 8, :).Upper_Limit_Melanopic_Contrast),...
std(Table_Peak_Melanopic_Contrast(Table_Peak_Melanopic_Contrast.Channel == 8, :).Upper_Limit_Melanopic_Contrast))

% Maximum relative melanopic contrast across all luminances using 11-channel (between 2700 K and 7443 K)
fprintf('Mean value of the peak relative melanopic contrast across all luminances using 11 channel is: %.2f percent SD %.2f \n',... 
mean(Table_Peak_Melanopic_Contrast(Table_Peak_Melanopic_Contrast.Channel == 11, :).Upper_Limit_Melanopic_Contrast),...
std(Table_Peak_Melanopic_Contrast(Table_Peak_Melanopic_Contrast.Channel == 11, :).Upper_Limit_Melanopic_Contrast))
