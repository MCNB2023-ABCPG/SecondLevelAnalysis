function second_level_glm(folder_path_results, file_path_scans)

% MODEL SPECIFICATION
job = [];
job{1}.spm.stats.factorial_design.dir = {folder_path_results};
job{1}.spm.stats.factorial_design.des.t1.scans = file_path_scans;
job{1}.spm.stats.factorial_design.cov = struct('c', {}, 'cname', {}, 'iCFI', {}, 'iCC', {});
job{1}.spm.stats.factorial_design.multi_cov = struct('files', {}, 'iCFI', {}, 'iCC', {});
job{1}.spm.stats.factorial_design.masking.tm.tm_none = 1;
job{1}.spm.stats.factorial_design.masking.im = 1;
job{1}.spm.stats.factorial_design.masking.em = {''};
job{1}.spm.stats.factorial_design.globalc.g_omit = 1;
job{1}.spm.stats.factorial_design.globalm.gmsca.gmsca_no = 1;
job{1}.spm.stats.factorial_design.globalm.glonorm = 1;

spm_jobman('run', job);


% ESTIMATION
job = [];
job{1}.spm.stats.fmri_est.spmmat = {fullfile(folder_path_results, 'SPM.mat')};
job{1}.spm.stats.fmri_est.write_residuals = 0;
job{1}.spm.stats.fmri_est.method.Classical = 1;

spm_jobman('run', job);

end