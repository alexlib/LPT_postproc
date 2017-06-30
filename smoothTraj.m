function [ traj ] = smoothTraj( traj, dt )
%smoothTraj Smoothe trajectories and take derivatives using cubic spline
%   Detailed explanation goes here

for i = 1:length(traj)
    
    [~, traj(i).u, traj(i).ax] = smoothspline(traj(i).t*dt, traj(i).x);
    [~, traj(i).v, traj(i).ay] = smoothspline(traj(i).t*dt, traj(i).y);
    [~, traj(i).w, traj(i).az] = smoothspline(traj(i).t*dt, traj(i).z);
    
end

function [ys,df,ddf] = smoothspline(x,y)

l = min(21,floor(length(x)/5));
x = x - x(1);
sp = spap2(l,4,x,y);
ys = fnval(sp,x);
df = fnval(fnder(sp),x);
ddf = fnval(fnder(sp,2),x);