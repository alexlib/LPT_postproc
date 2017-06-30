%This function is used to create a scatter data of the 3D position and velocities
%of the particles from the trajectory data obtained by ptv_is_to_traj.m 
%Its required inputs are the traj data.
%Input:[traj]
%Output:[scatter_data_respect_to_time]
%Jin-Tae Kim 2014 University of Illinois at Urbana-Champaign

function [varargout] = traj2scatter_t(traj)

tmin = zeros(length(traj),1);
tmax = zeros(length(traj),1);

for i=1:length(traj)
	tmin(i) = min(traj(i).t);
	tmax(i) = max(traj(i).t);
end

t_min=min(tmin);
t_max=max(tmax);
idl=t_max-t_min+1;

if isfield(traj,'c')==0
scatter_t = repmat(struct('x',[],'y',[],'z',[],'u',[],'v',[],'w',[],...		%Reconstruct the data matrix respect to the number of frames
    'ax',[],'ay',[],'az',[],'trajid',[]),idl,1);		

for i=1:length(traj)							
	for j=1:length(traj(i).x)
		k=traj(i).t(j);
		x_new=traj(i).x(j);
		scatter_t(k-t_min+1).x=[scatter_t(k-t_min+1).x; x_new];
		y_new=traj(i).y(j);
		scatter_t(k-t_min+1).y=[scatter_t(k-t_min+1).y; y_new];
		z_new=traj(i).z(j);
		scatter_t(k-t_min+1).z=[scatter_t(k-t_min+1).z; z_new];
		u_new=traj(i).u(j);
		scatter_t(k-t_min+1).u=[scatter_t(k-t_min+1).u; u_new];
		v_new=traj(i).v(j);
		scatter_t(k-t_min+1).v=[scatter_t(k-t_min+1).v; v_new];
		w_new=traj(i).w(j);
		scatter_t(k-t_min+1).w=[scatter_t(k-t_min+1).w; w_new];
		ax_new=traj(i).ax(j);
		scatter_t(k-t_min+1).ax=[scatter_t(k-t_min+1).ax; ax_new];
		ay_new=traj(i).ay(j);
		scatter_t(k-t_min+1).ay=[scatter_t(k-t_min+1).ay; ay_new];
		az_new=traj(i).az(j);
		scatter_t(k-t_min+1).az=[scatter_t(k-t_min+1).az; az_new];
		trajid_new=traj(i).trajid(j);
		scatter_t(k-t_min+1).trajid=[scatter_t(k-t_min+1).trajid; trajid_new];
	end
end
end

%if curvuater exists
if isfield(traj,'c')==1
scatter_t = repmat(struct('x',[],'y',[],'z',[],'u',[],'v',[],'w',[],...		%Reconstruct the data matrix respect to the number of frames
    'ax',[],'ay',[],'az',[],'trajid',[],'c',[]),idl,1);		

for i=1:length(traj)							
	for j=1:length(traj(i).x);
		k=traj(i).t(j);
		x_new=traj(i).x(j);
		scatter_t(k-t_min+1).x=[scatter_t(k-t_min+1).x; x_new];
		y_new=traj(i).y(j);
		scatter_t(k-t_min+1).y=[scatter_t(k-t_min+1).y; y_new];
		z_new=traj(i).z(j);
		scatter_t(k-t_min+1).z=[scatter_t(k-t_min+1).z; z_new];
		u_new=traj(i).u(j);
		scatter_t(k-t_min+1).u=[scatter_t(k-t_min+1).u; u_new];
		v_new=traj(i).v(j);
		scatter_t(k-t_min+1).v=[scatter_t(k-t_min+1).v; v_new];
		w_new=traj(i).w(j);
		scatter_t(k-t_min+1).w=[scatter_t(k-t_min+1).w; w_new];
		ax_new=traj(i).ax(j);
		scatter_t(k-t_min+1).ax=[scatter_t(k-t_min+1).ax; ax_new];
		ay_new=traj(i).ay(j);
		scatter_t(k-t_min+1).ay=[scatter_t(k-t_min+1).ay; ay_new];
		az_new=traj(i).az(j);
		scatter_t(k-t_min+1).az=[scatter_t(k-t_min+1).az; az_new];
		trajid_new=traj(i).trajid(j);
		scatter_t(k-t_min+1).trajid=[scatter_t(k-t_min+1).trajid; trajid_new];
		c_new=traj(i).c(j);
		scatter_t(k-t_min+1).c=[scatter_t(k-t_min+1).c; c_new];
	end
end
end

varargout{1}=scatter_t;                % the outputs


end
