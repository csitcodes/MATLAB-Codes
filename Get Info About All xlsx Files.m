rootdir = 'C:\path\to\your\folder';
% get info about all xlsx files in directories directly under 
% rootdir (this matches the description of your situation):
filelist = dir(fullfile(rootdir,'*\*.xlsx'));
% do this instead if you want get info about all xlsx files in all 
% sub-directories within rootdir (including rootdir itself),
% i.e., search the entire directory tree of rootdir:
% filelist = dir(fullfile(rootdir,'**\*.xlsx'));
for ii = 1:numel(filelist)
    % read each file, store the results:
    filelist(ii).data = readcell(fullfile(filelist(ii).folder,filelist(ii).name));
    % keep only columns B, C, D, H:
    filelist(ii).data = filelist(ii).data(:,[2 3 4 8]);
end
% combine all the data, one after the other, vertically:
all_data = vertcat(filelist.data);
% it is a good idea to write the resulting combined dataset to a directory
% outside of where you searched for the data in the first place, so that 
% next time you run this, the combined dataset won't be found as one of 
% the xlsx files to be read and combined.
outputdir = 'C:\path\to\some\output\folder';
writecell(all_data,fullfile(outputdir,'all_data.xlsx'));