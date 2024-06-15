function second_level_contrast(folder_path_results, contrasts)

job = [];

for i = 1:numel(contrasts)
    job{1}.spm.stats.con.spmmat = {fullfile(folder_path_results, 'SPM.mat')};
    job{1}.spm.stats.con.consess{i}.tcon.name = contrasts{i}.name;
    job{1}.spm.stats.con.consess{i}.tcon.weights = contrasts{i}.weights;
    job{1}.spm.stats.con.consess{i}.tcon.sessrep = contrasts{i}.sessrep;
    job{1}.spm.stats.con.delete = 0;
end

spm_jobman('run', job);

end