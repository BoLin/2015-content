function[f,X,i]= Steepest_DescentHW3(option)
%Steepsest Descent Method
% option 1-> analytical sensitivity
% option 2-> finite difference sensitivity
% Output f-> function value vector for all iterations
% Output X -> design variables vector for all iterations
% iteration number when the solution converged
e=1; %initialization:
i=0;
X(:,1)=[0;0];
g=@(x) 100*(x(2)-x(1)^2)^2+100*(1-x(1))^2;
while e>1e-2
    i=i+1; %counter
    x1=X(1,i);
    x2=X(2,i);
    f(i)=g(X(:,i));
    if option == 1
        df_dx1=200*(x2-x1^2)*(-2*x1)-200*(1-x1);
        df_dx2=200*(x2-x1^2);
    else
        if (x1==0) && (x2~=0)
            df_dx1 = (g([0.001;x2])-f(i))/(0.001); 
            df_dx2 = (g([x1;1.001*x2])-f(i))/(0.001*x2);
        else
            df_dx1 = (g([1.001*x1;x2])-f(i))/(0.001*x1);
            df_dx2 = (g([x1;1.001*x2])-f(i))/(0.001*x2);
        end
        if (x2==0) && (x1~=0)
            df_dx1 = (g([1.001*x1;x2])-f(i))/(0.001*x1);
            df_dx2 = (g([x1;0.001])-f(i))/(0.001);
        else
            df_dx1 = (g([1.001*x1;x2])-f(i))/(0.001*x1);
            df_dx2 = (g([x1;1.001*x2])-f(i))/(0.001*x2);
        end
        if (x2==0) && (x1==0)
            df_dx1 = (g([0.001;x2])-f(i))/(0.001);
            df_dx2 = (g([x1;0.001])-f(i))/(0.001);
        else
            df_dx1 = (g([1.001*x1;x2])-f(i))/(0.001*x1);
            df_dx2 = (g([x1;1.001*x2])-f(i))/(0.001*x2);
        end
     
    end
    S=-1*[df_dx1;df_dx2];
    e=norm(S);
    S=S/norm(S);
    [Bracket]=Bracketing_2D_HW3(X(:,i),S);
    X(:,i+1)=Golden_Section_2D_HW3(Bracket,X(:,i),S);
  
    if i==1500
        break;
    end
    
end
%%% plotting:
disp(i);
[x1,x2]=meshgrid([-0.5:0.001:2]);
F=100*(x2-x1.^2).^2+100*(1-x1).^2;
figure1 = figure('Color',[1 1 1]);
axes1 = axes('Parent',figure1,'Layer','top','FontWeight','bold',...
    'FontSize',12,...
    'FontName','Times New Roman');
box(axes1,'on');
hold(axes1,'all');

[C,h]=contour(x1,x2,F,80,'LineColor',[0 0 0],'Fill','on','Parent',axes1);
%clabel(C,h);
xlabel('X_1','FontWeight','bold','FontSize',12,'FontName','Times New Roman');
ylabel('X_2','FontWeight','bold','FontSize',12,'FontName','Times New Roman');
colorbar('peer',axes1);
hold on
plot(X(1,:),X(2,:),'Parent',axes1,'MarkerFaceColor',[1 1 1],'Marker','o',...
    'LineWidth',2,...
    'LineStyle','--',...
    'Color',[0 0 0]);
grid on
axis([-0.1,1.1,-0.1,1.1])