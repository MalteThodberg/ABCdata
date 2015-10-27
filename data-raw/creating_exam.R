library(limma)

### Rat data

# Get data
con <- url("http://bowtie-bio.sourceforge.net/recount/ExpressionSets/hammer_eset.RData")
load(file=con)
close(con)
bot = hammer.eset

RatNeurons <- list(Design=pData(bot),
									Annotation=fData(bot),
									Expression=as.matrix(exprs(bot)))

names(RatNeurons$Expression) <- NULL

save(RatNeurons, file="./data/RatNeurons.rda")

### Human Tissues

# Get data
con <- url("http://bowtie-bio.sourceforge.net/recount/ExpressionSets/wang_eset.RData")
load(file=con)
close(con)
bot = wang.eset

WangTissues <- list(Design=pData(bot),
										Annotation=fData(bot),
										Expression=as.matrix(exprs(bot)))

names(WangTissues$Expression) <- NULL

save(WangTissues, file="./data/WangTissues.rda")

# Get data
con <- url("http://bowtie-bio.sourceforge.net/recount/ExpressionSets/bodymap_eset.RData")
load(file=con)
close(con)
bot = bodymap.eset

AsmannTissues <- list(Design=pData(bot),
											Annotation=fData(bot),
											Expression=as.matrix(exprs(bot)))

names(AsmannTissues$Expression) <- NULL

save(AsmannTissues, file="./data/AsmannTissues.rda")




# con =url("http://bowtie-bio.sourceforge.net/recount/ExpressionSets/bottomly_eset.RData")
# load(file=con)
# close(con)
#
# # Extract data as in statisitcal genomics
# bot = bottomly.eset
# pdata=pData(bot)
# edata=as.matrix(exprs(bot))
# fdata = fData(bot)
#
# con=url("http://bowtie-bio.sourceforge.net/recount/ExpressionSets/hammer_eset.RData")
# load(file=con)
# close(con)
#
# # Extract data as in statisitcal genomics
# bot = hammer.eset
# pdata=pData(bot)
# edata=as.matrix(exprs(bot))
# fdata = fData(bot)
#
#
# # Replace
# LabStrainDesign <- data.frame(gallein=factor(x=c("control", "control", "control",
# 																								 "treated", "treated", "treated"),
# 																						 levels=c("control", "treated")),
# 															row.names=colnames(zfGenes))
# LabStrainAnnotation <- data.frame(id=rownames(zfGenes),
# 																	row.names=rownames(zfGenes))
#
# LabStrainExpression <- zfGenes
#
# LabStrain <- list(Expression=LabStrainExpression,
# 									Design=LabStrainDesign,
# 									Annotation=LabStrainAnnotation)
#
# save(LabStrain, file="./data/LabStrain.rda")
#
# # HumanTissues
# HumanTissuesDesign <- read.table("http://bowtie-bio.sourceforge.net/recount/phenotypeTables/wang_phenodata.txt", header=TRUE)
# HumanTissuesExpression <- read.table("http://bowtie-bio.sourceforge.net/recount/countTables/wang_count_table.txt", header=TRUE)
# HumanTissuesAnnotation <- HumanTissuesExpression$gene
# HumanTissuesExpression <- HumanTissuesExpression[,-1]
#
#
#
# HumanTissues <- list(Expression=HumanTissuesExpression,
# 									Design=HumanTissuesDesign,
# 									Annotation=HumanTissuesAnnotation)
#
# save(HumanTissues, file="./data/HumanTissues.rda")
