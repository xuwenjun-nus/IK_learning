% re-plot figures 5 9 13
close all
clear all

figure 
load knnr
xkl_o=x1;
ykl_o=y1;
xkl_p=x2;
ykl_p=y2;
xkr_o=x3;
ykr_o=y3;
xkr_p=x4;
ykr_p=y4;
subplot(2,1,1)
plot(xkl_o,ykl_o,'b','LineWidth',4)
hold on
plot(xkl_p,ykl_p,'g+','MarkerSize', 12)
legend('Original Data','Predicted Data')
xlabel('Number of Samples','FontSize',12)
ylabel({'Normalized DC';' Servo Motormovements'},'FontSize',12)
axis([0 100 -1 1])

subplot(2,1,2)
plot(xkr_o,ykr_o,'r','LineWidth',4)
hold on
plot(xkr_p,ykr_p,'g+','MarkerSize', 12)
legend('Original Data','Predicted Data')
xlabel('Number of Samples','FontSize',12)
ylabel({'Normalized DC';' Servo Motormovements'},'FontSize',12)
axis([0 100 -1 1])

figure
load gmr
xgl_o=x1;
ygl_o=y1;
xgl_p=x2;
ygl_p=y2;
% right motor 
xgr_o=x3;
ygr_o=y3;
xgr_p=x4;
ygr_p=y4;

subplot(2,1,1)
plot(xgl_o,ygl_o,'b','LineWidth',4)
hold on
plot(xgl_p,ygl_p,'g+','MarkerSize', 12)
legend('Original Data','Predicted Data')
xlabel('Number of Samples','FontSize',12)
ylabel({'Normalized DC';' Servo Motormovements'},'FontSize',12)
axis([0 100 -1 1])

subplot(2,1,2)
plot(xgr_o,ygr_o,'r','LineWidth',4)
hold on
plot(xgr_p,ygr_p,'g+','MarkerSize', 12)
legend('Original Data','Predicted Data')
xlabel('Number of Samples','FontSize',12)
ylabel({'Normalized DC';' Servo Motormovements'},'FontSize',12)
axis([0 100 -1 1])

figure
load elm
n=fix(linspace(96,403,101));
xel_o=1:101;
%xel_o=x1(:,96:403);
yel_o=y1(:,n)*5/2;
%yel_o=y1(:,96:403)*5/2;
xel_p=1:101;
%xel_p=x2(:,96:403);
yel_p=y2(:,n)*5/2;
%yel_p=y2(:,96:403)*5/2;

xer_o=1:101;
%xer_o=x3(:,96:403);
yer_o=y3(:,n)*5/2;
%yer_o=y3(:,96:403)*5/2;
xer_p=1:101;
%xer_p=x4(:,96:403);
yer_p=y4(:,n)*5/2;
%yer_p=y4(:,96:403)*5/2;

subplot(2,1,1)
plot(xel_o,yel_o,'b','LineWidth',4)
hold on
plot(xel_p,yel_p,'g+','MarkerSize', 12)
legend('Original Data','Predicted Data')
xlabel('Number of Samples','FontSize',12)
ylabel({'Normalized DC';' Servo Motormovements'},'FontSize',12)
axis([0 100 -1 1])

subplot(2,1,2)
plot(xer_o,yer_o,'r','LineWidth',4)
hold on
plot(xer_p,yer_p,'g+','MarkerSize', 12)
legend('Original Data','Predicted Data')
xlabel('Number of Samples','FontSize',12)
ylabel({'Normalized DC';' Servo Motormovements'},'FontSize',12)
axis([0 100 -1 1])