function plotPower()
%
%Power method for computing eigenvalues
%
C = [4 1;1 3]
z = [1;1]
for x = 0:20
    plot(x,z(1),'b*')
    hold on;
    plot(x,z(2),'r*')
    y=C*z;
    n=norm(z);
    z=y/n
end