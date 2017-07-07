%This function is used to create a Eulieran data of the 3D position and velocities
%of the particles from the scatter data obtained by traj2scatter_t.m 
%Its required inputs are the scatter data and the grid paramters for the positions. 
%The optional variable, q, can be
%used to specify the number of data files used. This function will output
%the 3D position and velocity grid (xg, yg, zg, ug, vg, wg) and the average
%velocities (u_avg, v_avg, w_avg). 
%Input:[scatter_t,x_i,x_interval,x_f,y_i,y_interval,y_f,z_i,z_interval,z_f,number_of_files(optional)]
%Output:[xg,yg,zg,ug,vg,wg,u_avg,v_avg,w_avg]
%Jin-Tae Kim 2014 University of Illinois at Urbana-Champaign

function [varargout] = scatter_t2grid(scatter_t, x1, x2, x3, y1, y2, y3, z1, z2, z3)

                           % this is the function with the absence of the optional variable
    
    [xg,yg,zg] = ndgrid(x1:x2:x3,y1:y2:y3,z1:z2:z3);    % creates a grid with the specified variables 

    parfor i=1:length(scatter_t)                    % uses every data file in the specified directory and tracks how fast the program is running

        x = scatter_t(i).x;                          % to avoid the interpolation around zero
        y = scatter_t(i).y;
        z = scatter_t(i).z;
        u = scatter_t(i).u;
        v = scatter_t(i).v;
        w = scatter_t(i).w;
        ax = scatter_t(i).ax;
        ay = scatter_t(i).ay;
        az = scatter_t(i).az;        

        ind = (find(abs(u) > 10e-5 & abs(v) > 10e-5 & abs(w) > 10e-5)); % for outliers
        if length(ind)>=10
             ug(:,:,:,i) = griddata(x,y,z,u,xg,yg,zg,'natural');         % interpolates scattered data and creates grid for the velocities
             vg(:,:,:,i) = griddata(x,y,z,v,xg,yg,zg,'natural');
             wg(:,:,:,i) = griddata(x,y,z,w,xg,yg,zg,'natural');
             axg(:,:,:,i) = griddata(x,y,z,ax,xg,yg,zg,'natural');         % interpolates scattered data and creates grid for the velocities
             ayg(:,:,:,i) = griddata(x,y,z,ay,xg,yg,zg,'natural');
             azg(:,:,:,i) = griddata(x,y,z,az,xg,yg,zg,'natural');
        end
        % i 
        %ind
            % the above two lines can be used or commented out to track how fast the program is running (i) and what the outliers are (ind) 
    end


%cd('/media/1e6ef2c6-2777-4bdf-a552-95485b913066/home/jimmy/PTV_testing_myself/JetPTV_Circular_550_25/Matlab_testing');

u_avg = nanmean(ug,4);          % calculates the mean velocity with respect to time
v_avg = nanmean(vg,4);
w_avg = nanmean(wg,4);
ax_avg = nanmean(axg,4);          % calculates the mean velocity with respect to time
ay_avg = nanmean(ayg,4);
az_avg = nanmean(azg,4); 

% save u_avg.mat u_avg
% save v_avg.mat v_avg
% save w_avg.mat w_avg
% save ug.mat ug -v7.3
% save vg.mat vg -v7.3
% save wg.mat wg -v7.3
% save xyz.mat xg yg zg   

varargout{1}=xg;                % the outputs
varargout{2}=yg;
varargout{3}=zg;
varargout{4}=ug;
varargout{5}=vg;
varargout{6}=wg;
varargout{7}=axg;
varargout{8}=ayg;
varargout{9}=azg;
varargout{10}=u_avg;
varargout{11}=v_avg;
varargout{12}=w_avg;
varargout{13}=ax_avg;
varargout{14}=ay_avg;
varargout{15}=az_avg;
 
end
