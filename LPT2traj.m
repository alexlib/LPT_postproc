function [traj] = LPT2traj(File)
% comment 
fid = fopen(File);
counter = 0;
idl=dlmread(File,' ',[0 0 0 0]);

traj = repmat(struct('x',[],'y',[],'z',[],'u',[],'v',[],'w',[],...
    'ax',[],'ay',[],'az',[],'t',[],'trajid',[]),idl,1);


while ~feof(fid)
    currentLine = fgetl(fid);
   
    if isempty(currentLine)
        counter=counter+1;
        continue;
    end
    
     % Skip the header part until we come across the first piece of data
    data=sscanf(currentLine,'%f');

     if length(data)==1
         continue;
     end

   % Check if new piece of data encountered.
    if isempty(currentLine)
        % Get ready to read the data.
    else
        % This is a true data line, read it.
        traj(counter).x=[traj(counter).x; data(2)]; %mm
        traj(counter).y=[traj(counter).y; data(3)]; %mm
        traj(counter).z=[traj(counter).z;data(4)];  %mm
       traj(counter).u=[traj(counter).u; data(5)]; %mm/s
       traj(counter).v=[traj(counter).v; data(6)]; %mm/s
       traj(counter).w=[traj(counter).w;data(7)];  %mm/s  
       traj(counter).ax=[traj(counter).ax; data(8)];   %mm/s^2
       traj(counter).ay=[traj(counter).ay; data(9)];   %mm/s^2
       traj(counter).az=[traj(counter).az;data(10)];   %mm/s^2        
        traj(counter).t=[traj(counter).t; data(1)]; %s
        traj(counter).trajid=[traj(counter).trajid; counter];
    end
end

fclose(fid); 
end 
