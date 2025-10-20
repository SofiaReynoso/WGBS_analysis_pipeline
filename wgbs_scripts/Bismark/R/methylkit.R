library(methylKit)

samples_CG <- methRead(
  location = list(
    "/wgbs_data/ENCBS041AAA_bismark.deduplicated.bismark.cov",
    "/wgbs_data/ENCBS557AAA_bismark.deduplicated.bismark.cov",
    "/wgbs_data/ENCBS046AAA_bismark.deduplicated.bismark.cov", 
    "/wgbs_data/ENCBS562AAA_bismark.deduplicated.bismark.cov"),
  sample.id = list("Heart_Rep1", "Heart_Rep2", "Kidney_Rep1", "Kidney_Rep2"),
  assembly = "GRCm39",
  pipeline = "bismarkCoverage",
  context = "CpG",
  resolution = "base",
  dbdir = "/wgbs_data",
  mincov = 3,
  treatment = c(0, 0, 1, 1)            # Heart = 0, Kidney = 1
)


filtered_samples <- filterByCoverage(samples_CG, lo.count = 10, hi.perc = 99.9)

#Merging samples
meth=methylKit::unite(filtered_samples, destrand=FALSE)

##  will calculate methylation difference as the difference of
## treatment (group: 1) - control (group: 0)

#Finding differentially methylated bases or regions
myDiff=calculateDiffMeth(meth)


# get hyper methylated bases
myDiff25p.hyper=getMethylDiff(myDiff,difference=25,qvalue=0.01,type="hyper")
#
# get hypo methylated bases
myDiff25p.hypo=getMethylDiff(myDiff,difference=25,qvalue=0.01,type="hypo")
#
#
# get all differentially methylated bases
myDiff25p=getMethylDiff(myDiff,difference=25,qvalue=0.01)
