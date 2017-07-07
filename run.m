clear
clc

traj = LPT2traj('D:\DFB_results\case_4_6-10.txt');
traj = smoothTraj(traj, 1.0/120);
scatter_t = traj2scatter_t(traj);
[xg,yg,zg,ug,vg,wg,axg,ayg,azg,u_avg,v_avg,w_avg,ax_avg,ay_avg,az_avg] = scatter_t2grid(scatter_t,-1016,100,1016,584,50,1854,-635,50,635);

% figure
% quiver3(xg,yg,zg,u_avg,v_avg,w_avg);