close all;
clear;
clc;
%% Load the data
load('traj_n.mat');
load('lm_n.mat');
load('rm_n.mat');
% load('corrected_circle.mat');
N = max(size(traj));
K = 9;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tic;
% 选定训练集和测试集
train_traj = [traj(1:5000,:);traj(5201:N,:)];
% 相应的训练集的标签也要分离出来
train_lm = [lm(1:5000,:);lm(5201:N,:)];
train_rm = [rm(1:5000,:);rm(5201:N,:)];

% 选定测试集和测试集
test_traj = [traj(5001:5200,:)];
% 相应的测试集的标签也要分离出来
test_lm = [lm(5001:5200,:)];
test_rm = [rm(5001:5200,:)];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Train the model
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
feature_train = train_traj';
% train_label = train_lm';
train_label = (1:max(size(train_traj)))';
feature_test = test_traj';
% Get the predicted test labels by KNN
% knn function: knn(test set, train set, train label, K)
% You can change K to change the number of nearest neighbors
test_label = knn(feature_test,feature_train,train_label,K);
test_label = test_label';
toc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculate the error for right motor
for i=1:max(size(test_traj))
    sum_rm = 0;
    for j=1:K
        sum_rm = sum_rm+train_rm(test_label(i,j));
    end
    test_label_rm(i) = sum_rm/K;
    relative_error_rm(i) = abs((test_label_rm(i)-test_rm(i))/test_rm(i));
end
error_rm = sum(relative_error_rm)/max(size(test_traj));
figure(1);
plot(test_rm,'r-');hold on;
plot(test_label_rm,'b*'); 

% Calculate the error for left motor
for i=1:max(size(test_traj))
    sum_lm = 0;
    for j=1:K
        sum_lm = sum_lm+train_lm(test_label(i,j));
    end
    test_label_lm(i) = sum_lm/K;
    relative_error_lm(i) = abs((test_label_lm(i)-test_lm(i))/test_lm(i));
end
error_lm = sum(relative_error_lm)/max(size(test_traj));
figure(2);
plot(test_lm,'r-');hold on;
plot(test_label_lm,'b*'); 

%% Calculate the motor commands with respect to a reference circle
t = 0:0.01*2*pi:2*pi;
ref_y = -0.5*sin(t);
ref_z = 0.5*cos(t);
% ref_y = Corrected(:,2)';
% ref_z = Corrected(:,3)';
ref_feature_test = [ref_y;ref_z];
ref_test_label = knn(ref_feature_test,feature_train,train_label,K);
ref_test_label = ref_test_label';

for i=1:length(ref_y)
    sum_lm = 0;
    sum_rm = 0;
    for j=1:K
        sum_lm = sum_lm+train_lm(ref_test_label(i,j));
        sum_rm = sum_rm+train_rm(ref_test_label(i,j));
    end
    ref_lm(i) = sum_lm/K;
    ref_rm(i) = sum_rm/K;
end
% ref_lm = smooth(ref_lm,7);
% ref_rm = smooth(ref_rm,7);
