clear all;
clc;

TrainPath='orl_faces';
groups=[];
T=[];


for i = 1:40
    
        tempDir=strcat('s',int2str(i));
        tempTrainPath=strcat(TrainPath,'\', tempDir);
        TrainFiles=dir(tempTrainPath);
        fileNo=1;
        for  j=1:size(TrainFiles)
            if not(strcmp(TrainFiles(j).name,'.')|strcmp(TrainFiles(j).name,'..'))
                str = int2str(fileNo);
                str = strcat(tempTrainPath,'\',str,'.pgm');
                
                
                img = imread(str);
                
                
                
    
                [irow icol] = size(img);
   
                temp = reshape(img',1,irow*icol);   % Reshaping 2D images into 1D image vectors
                T = [T; temp]; % 'T' grows after each turn      
    
                fileNo=fileNo+1;
                groups=[groups; i];
            end
        
         
        end
           
     
end


[n,p] = size(T);
data= double(T) - repmat(mean(T,1),n,1);

save faceDataBase.mat data groups