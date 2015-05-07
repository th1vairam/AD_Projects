tmp <- read.csv('./adni.mem_ranked_1.5T_3Yr_takeda_4_6_15.csv')
tmp1 <- read.csv('./label_names_conversion.csv')

sig.sets <- filter(tmp,a.ks.pvals <= 0.05 & a.cor.pvals <= 0.05)
filter(tmp1, Label %in% unique(sapply(str_split(sig.sets$var.nms,'\\.'),function(x){x[[length(x)]]})))

# significant volume changes
sig.volume <- filter(sig.sets,var.nms %in% grep('Volume',sig.sets$var.nms,value=T))
filter(tmp1, Label %in% unique(sapply(str_split(sig.volume$var.nms,'\\.'),function(x){x[[length(x)]]})))

ctx-lh-inferiortemporal  1009
ctx-lh-middletemporal  1015
ctx-lh-superiortemporal  1030 syn3191103
ctx-rh-caudalanteriorcingulate  2002