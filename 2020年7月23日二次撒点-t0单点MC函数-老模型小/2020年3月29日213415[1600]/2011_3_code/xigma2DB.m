xigma=[5/3*10^-9:-0.5/3*10^-9:5/3*10^-10]'
DB=zeros(length(xigma),1);
for i=1:length(xigma)
    DB(i)=-20*log10(6*10^8*xigma(i));
end
DB