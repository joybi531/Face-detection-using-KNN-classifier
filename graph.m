%for label see Label Text Properties

dim=400;
figure
y1=cumsum(variance./sum(variance) * 100);
y2=variance./sum(variance)*100;
%y2=variance;
x=1:1:dim;
[AX,H1,H2] = plotyy(x,y2(1:dim),x,y1(1:dim),'plot');
%set(H2,'Color','k');
%set(H1,'Color','k');
set(get(AX(1),'Ylabel'),'String','Proportion of Variance Explained by Each EigenVectors') 
set(get(AX(2),'Ylabel'),'String','Cummulative Variance Explained by EigenVectors') 
set(findobj(H1),'LineStyle',':')
set(findobj(H2),'LineStyle','-')
xlabel('Principal Component or EigenVectors','FontSize',12)
legend('Proportion of Variance','Cummulative Variance',2);
axes(AX(1))
ylim([0 11])
set(gca,'YTick',[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15])
axes(AX(2))
ylim([0 110])
set(gca,'YTick',[10 20 30 40 50 60 70 80 90 100 110 120 130 140 150])



%test result
load pcaTestResultAll
plot(x, pcaTestResult*100,'-.ok')
set(gca,'XTick',[4 5 10 15 20 25 30 35 40 45 50 55 60 65])
xlabel('Number of Feature in Connection Space');
ylabel('Accuracy');


