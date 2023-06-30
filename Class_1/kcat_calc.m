clear
clc
load expt_kcat.dat
load TMalign.dat
load pair_seq_align.dat
load dlkcat.dat

kcat_pdt1=expt_kcat(1)*TMalign(1,:);
kcat_pdt2=expt_kcat(2)*TMalign(2,:);
kcat_pdt3=expt_kcat(3)*TMalign(3,:);


kcat_sum1=sum(kcat_pdt1);
kcat_sum2=sum(kcat_pdt2);
kcat_sum3=sum(kcat_pdt3);



sum_TMalign1=sum(TMalign(1,:));
sum_TMalign2=sum(TMalign(2,:));
sum_TMalign3=sum(TMalign(3,:));



kcatpred1=kcat_sum1/sum_TMalign1;
kcatpred2=kcat_sum2/sum_TMalign2;
kcatpred3=kcat_sum3/sum_TMalign3;


err1=mean((100-(pair_seq_align(1,:)))/100);
err2=mean((100-(pair_seq_align(2,:)))/100);
err3=mean((100-(pair_seq_align(3,:)))/100);



kcatpred=vertcat(kcatpred1, kcatpred2, kcatpred3);
err=vertcat(err1,err2,err3);
sd1= err1*kcatpred1
sd2=err2*kcatpred2
sd3= err1*kcatpred3

sd=vertcat(sd1, sd2, sd3);
class1_kcat_expt_pred_dlkcat =horzcat(expt_kcat, kcatpred,sd, dlkcat)

save class1_kcat_expt_pred_dlkcat class1_kcat_expt_pred_dlkcat -ascii


