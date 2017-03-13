% Script to extract info about eeg data from rat 

%save tst.txt data -ascii

load('bontetinfo.mat');
ca1list = [];
ca3_tets = [];
ca1_tets = [];

for d = 1:length(tetinfo)

    for e  = 1:length(tetinfo{d})

        for t = 1:length(tetinfo{d}{e})

            for c = 1:length(tetinfo{d}{e}{t})
                if isfield(tetinfo{d}{e}{t}, 'area') == 1
                    %if tetinfo{d}{e}{t}.numcells > 0
                        if strcmp(tetinfo{d}{e}{t}.area, 'CA3')
                            %adjust for the 01
                            if t < 10
                                t = strcat('0',num2str(t));
                            end
                            eeg = load(['EEG/boneeg0' num2str(d) '-' num2str(e) '-' num2str(t) '.mat']);
                            %convert it back
                            if isstr(t)
                               t = str2num(t); 
                            end
                            %convert and save to .txt
                            %save tst.txt data -ascii
                            data = eeg.eeg{d}{e}{t}.data;
                            copyfile( data, 'C:\Users\Sorted_GE_SE_Images\SE_images')
                        
                        elseif strcmp(tetinfo{d}{e}{t}.area, 'CA1')
                            if t < 10
                                t = strcat('0',num2str(t));
                            end
                            ex_ca1_eeg = load(['EEG/boneeg0' num2str(d) '-' num2str(e) '-' num2str(t) '.mat']);
                            if isstr(t)
                               t = str2num(t); 
                            end
                            ca1_ts = ex_ca1_eeg.eeg{d}{e}{t}.data;
                        
                        else
                            disp('Unknown site found')
                        end
                     %end
                end
                end

            end

      end

end




