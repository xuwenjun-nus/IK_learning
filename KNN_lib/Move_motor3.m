function [ Pos ] = Move_motor3( rm,lm,Xr )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here 
% move motor for reaching a target
global s;
global s1;
global s2;
Opt=0;
rm=rm*5000;  % ani-normalization
lm=lm*5000;
y0=0.18*25.4;
z0=-8.78*25.4;
x0=3.81*25.4;
limit=5000;
k=-80;
ZB=k*(Xr-x0);
ZB_old=ZB;
if(ZB<1000)
            fwrite(s,strcat('BP0',num2str(ZB)));
        else
            fwrite(s,strcat('BP',num2str(ZB)));
end
pause(0.1)
    OCR4A=round(rm);
    OCR4B=round(lm);
    if((abs(OCR4A)<=limit) &&(abs(OCR4B<=limit)))
        fprintf(s2,strcat('M',num2str(OCR4A))); % com9
        pause(0.1);
        fprintf(s1,strcat('M',num2str(OCR4B)));  % com8
        pause(0.1);
    end
 
    for i=1:2
        P=ReadEMT(Opt); % read current position
        Pos(1)=P(1,2);  % x
        Pos(2)=P(2,2);  % y
        Pos(3)=P(3,2);   % z
        deltax=Xr-Pos(1);
        ZB=k*deltax+ZB_old;
        pause(0.1);
        if(ZB<1000)
            fwrite(s,strcat('BP0',num2str(ZB)));
        else
            fwrite(s,strcat('BP',num2str(ZB)));
        end
        pause(0.5);
        P2=ReadEMT(Opt);
        Pos(1)=P2(1,2);  % x
        Pos(2)=P2(2,2);  % y
        Pos(3)=P2(3,2);   % z
        ZB_old=ZB;
    end
   pause(0.1);

end

