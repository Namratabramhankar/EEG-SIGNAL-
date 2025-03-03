load('final_svm.mat');

dataset = load('C:\Users\Saurabh\Desktop\Shreya\graz_data\dataset_BCIcomp1')
j = 1;
for i = 1:140
    data(:,:,i) = dataset.x_test(385:1152,:,i);
    
end
%  j = 1;
% for i =1:140
%     for  k =1:768
%         op_mat(j,1) =dataset.y_train(i,1);
%         j = j+1;
%     end
% end
for k = 1:140
 for i = 1:3
    x =  data(:,i,k);    
    [c,l] = wavedec(x,5,'db4');
    [cd1, cd2, cd3, cd4,cd5] = detcoef(c,l,[1,2,3,4,5]);
    A = appcoef(c,l,'db4',5);
    psd_cd2 = pwelch(cd2);
    psd_cd3 = pwelch(cd3);
    psd_cd4 = pwelch(cd4);
    psd_cd5 = pwelch(cd5);
    psd_a5 = pwelch(A);
    
    c_vector= [ psd_cd2',psd_cd3',psd_cd4',psd_cd5',psd_a5'];
 
    y(i,:) = c_vector;
    

 end
y_new =[ y(1,:),y(2,:),y(3,:)];
 ip(k,:) = y_new;
end

yfit = final_svm.predictFcn(ip);
