xigma_vector=zeros(length(dB),1);
for i=1:length(dB)
%xigma_vector(i)=(1/(6*10^8))*(10^(-dB(i)/20)); 
%xigma_vector2(i)=(1/(10^(dB(i)/10)))^0.5;
xigma_vector(i)=(1/(3*10^8))*(10^(-dB(i)/20)); 
end
