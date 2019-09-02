function [S,L]=exm060201(N,R,str)   %函数声明行，必不可少，脚本文件没有
% exm060201.m    The area and perimeter of a regular polygon         H1行 
% 	N 	The number of sides     H1行及其之后的所有注释行构成整个在线帮助文本区
%                                                  包含输入输出量含义和调用格式等
% 	R 		                           The circum radius
% 	str 		 		              A line specification to determine line type/color
% 	S 				              The area of the regular polygon
% 	L 				              The perimeter of the regular polygon
% exm060201      			用蓝实线画半径为 1 的圆
% exm060201(N)   			用蓝实线画外接半径为 1 的正 N 边形
% exm060201(N,R)  		用蓝实线画外接半径为 R 的正 N 边形
% exm060201(N,R,str)       用 str 指定的线画外接半径为 R 的正 N 边形
% S=exm060201(...)            给出多边形面积 S ,并画相应正多边形填色图
% [S,L]=exm060201(...)      给出多边形面积 S 和周长L,并画相应正多边形填色图

%  Zhang Zhiyong 修改于 2017-3-6
%  编写和修改记录，用于软件档案管理。与在线帮助文本区相隔一个空行

switch nargin                %  函数体，必不可少。为清晰起见，与前面的注释相隔一个空行
    case 0
        N=100;R=1;str='-b';          %  正100边形 ，近似为圆
    case 1
        R=1;str='-b';
    case 2
        str='-b';
    case 3
        ;					     %不进行任何变量操作，直接跳出switch-case控制结构
    otherwise
        error('输入量太多。');       % error(msg) 引发错误并显示错误消息
end;
t=0:2*pi/N:2*pi;
x=R*sin(t);y=R*cos(t); 
if nargout==0
   plot(x,y,str);
elseif nargout>2
   error('输出量太多。');        
else
   S=N*R*R*sin(2*pi/N)/2;	              % 多边形面积
   L=2*N*R*sin(pi/N);		              %  多边形周长
   fill(x,y,str)                                        %  填色
end
axis image                                           %  使图形边界抵达坐标轴范围
set(gcf,'Color','white')	       		   %  把图形窗背景色设置为白
box on
shg   
end