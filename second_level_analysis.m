function second_level_analysis(folder_path_root, folder_path_code)

% Specify
folder_path_root = '/Users/pschm/icloud_link/University/mcnb/2_semester/NMDA-II/SecondLevelAnalysis';
spm_path = '/Users/pschm/spm12_dev_main';

% Setup
addpath(fullfile(folder_path_root, 'jobs'));
addpath(spm_path)
spm('defaults', 'fmri') 
spm_jobman('initcfg')

% Run GLM
file_path_scans = cellstr(spm_select('ExtFPListRec',folder_path_root,'^con.*09\.img$'));
folder_path_results = fullfile(folder_path_root, 'RFX1');
second_level_glm(folder_path_results, file_path_scans);

% Add contrast
contrasts{1}.name = 'group_first_beta';
contrasts{1}.weights = [1];
contrasts{1}.sessrep = 'non';
second_level_contrast(folder_path_results, contrasts);



% Cleanup
rmpath(fullfile(folder_path_root, 'jobs'));
rmpath(spm_path)


end