function f=anim_zzy1(K,ki)
% anim_zzy1.m       演示红色小球沿一条封闭螺线运动的实时动画
% 仅演示实时动画的调用格式为                        anim_zzy1(K)           
% 既演示实时动画又拍摄照片的调用格式为     f=anim_zzy1(K,ki)         
% K                 红球运动的循环数（不小于1）
% ki                指定拍摄照片的瞬间，取 1 到 1034 间的任意整数。
% f                           存储拍摄的照片数据，可用image(f.cdata)观察照片。
 
% 产生封闭的运动轨迹
t1=(0:1000)/1000*10*pi;x1=cos(t1);y1=sin(t1);z1=-t1;
t2=(0:10)/10;x2=x1(end)*(1-t2);y2=y1(end)*(1-t2);z2=z1(end)*ones(size(x2));
t3=t2;z3=(1-t3)*z1(end);x3=zeros(size(z3));y3=x3;
t4=t2;x4=t4;y4=zeros(size(x4));z4=y4;
x=[x1 x2 x3 x4];
n=length(x);
if nargin<2                                                   
    ki=fix(n/2);
end
y=[y1 y2 y3 y4];z=[z1 z2 z3 z4];
shg
plot3(x,y,z,'Color',[1,0.6,0.4],'LineWidth',2.5)      % 绘制运动轨迹
axis off
%定义活动对象的颜色、点型、大小和擦除方式
h=line('xdata',x(1),'ydata',y(1),'zdata',z(1),'Color',[1 0 0],'Marker', '.', 'MarkerSize',40,'EraseMode','xor');
KK=K*n;
text(-1,-0.85,-36,'倒计数')               
KK=KK-1;
htext=text(-1,-1,-40,int2str(KK));
% 使小球运动
i=2;j=1;
while 1                                                        
set(h,'xdata',x(i),'ydata',y(i),'zdata',z(i));         
   drawnow;                                                          %       <23>
   pause(0.0005)                                                        %                 <24>
   i=i+1;
   KK=KK-1;
   set(htext,'string',int2str(KK))                         %  <27>
   if nargin==2 && nargout==1 % 
       if(i==ki&&j==1);f=getframe(gcf);end             %       <29>
   end
   if i>n 
      i=1;j=j+1;
      if j>K;break;end
   end
end 
end

