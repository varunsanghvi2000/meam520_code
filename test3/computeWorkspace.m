% Place your code for computing the workspace of the Lynx robot here.

%qvar =[0,0,0,0,0,10];
for i = -1.2:0.1:1.2
    lynxServo(0,0,0,0,i,10);
    pause(1);
end


