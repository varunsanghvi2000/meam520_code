% Place your code for computing the workspace of the Lynx robot here.

def_q1_values=-1.4:0.2:1.4;
def_q2_values=-1.4:0.2:1.2;
def_q3_values=-1.7:0.2:1.7;
def_q4_values=-1.7:0.2:1.7;
def_q5_values=-1.5:0.2:1.5;

X_1=zeros(1,(15.^2)*(18.^2)*16);
Y_1=zeros(1,(15.^2)*(18.^2)*16);
Z_1=zeros(1,(15.^2)*(18.^2)*16);

count_in = 1;

for q1_values=def_q1_values
    for q2_values=def_q2_values
        for q3_values=def_q3_values
            for q4_values=def_q4_values
                for q5_values=def_q5_values
                    q=[q1_values,q2_values,q3_values,q4_values,q5_values,10];
                    [X, T] = updateQ(q);
                    X_1(1,count_in)=X(6,1);
                    Y_1(1,count_in)=X(6,2);
                    Z_1(1,count_in)=X(6,3);
                    count_in=count_in+1;
                end
            end
        end
    end
end    

% calculate the distance of the longest points the arm can reach from plot
% of points to determine work space
sort_r=[sqrt(X_1.^2+Y_1.^2+Z_1.^2);X_1;Y_1;Z_1];
%sort according to max values
B = sortrows(sort_r','descend');
% eleminate values lower than max value
B(B(:,1) < 400, :) = [];
%plot the values
scatter3(B(:,2),B(:,3),B(:,4),1,'filled')



