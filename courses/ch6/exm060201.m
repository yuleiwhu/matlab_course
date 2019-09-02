function [S,L]=exm060201(N,R,str)   %���������У��ز����٣��ű��ļ�û��
% exm060201.m    The area and perimeter of a regular polygon         H1�� 
% 	N 	The number of sides     H1�м���֮�������ע���й����������߰����ı���
%                                                  �����������������͵��ø�ʽ��
% 	R 		                           The circum radius
% 	str 		 		              A line specification to determine line type/color
% 	S 				              The area of the regular polygon
% 	L 				              The perimeter of the regular polygon
% exm060201      			����ʵ�߻��뾶Ϊ 1 ��Բ
% exm060201(N)   			����ʵ�߻���Ӱ뾶Ϊ 1 ���� N ����
% exm060201(N,R)  		����ʵ�߻���Ӱ뾶Ϊ R ���� N ����
% exm060201(N,R,str)       �� str ָ�����߻���Ӱ뾶Ϊ R ���� N ����
% S=exm060201(...)            ������������ S ,������Ӧ���������ɫͼ
% [S,L]=exm060201(...)      ������������ S ���ܳ�L,������Ӧ���������ɫͼ

%  Zhang Zhiyong �޸��� 2017-3-6
%  ��д���޸ļ�¼����������������������߰����ı������һ������

switch nargin                %  �����壬�ز����١�Ϊ�����������ǰ���ע�����һ������
    case 0
        N=100;R=1;str='-b';          %  ��100���� ������ΪԲ
    case 1
        R=1;str='-b';
    case 2
        str='-b';
    case 3
        ;					     %�������κα���������ֱ������switch-case���ƽṹ
    otherwise
        error('������̫�ࡣ');       % error(msg) ����������ʾ������Ϣ
end;
t=0:2*pi/N:2*pi;
x=R*sin(t);y=R*cos(t); 
if nargout==0
   plot(x,y,str);
elseif nargout>2
   error('�����̫�ࡣ');        
else
   S=N*R*R*sin(2*pi/N)/2;	              % ��������
   L=2*N*R*sin(pi/N);		              %  ������ܳ�
   fill(x,y,str)                                        %  ��ɫ
end
axis image                                           %  ʹͼ�α߽�ִ������᷶Χ
set(gcf,'Color','white')	       		   %  ��ͼ�δ�����ɫ����Ϊ��
box on
shg   
end