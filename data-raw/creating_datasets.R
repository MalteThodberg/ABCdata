library(GenomicRanges)
library(magrittr)
library(dplyr)

### Fission yeast data
library(fission)
data(fission)

YeastTimeSeriesExpression <- assay(fission)
YeastTimeSeriesDesign <- as.data.frame(colData(fission))
YeastTimeSeriesAnnotation <- as.data.frame(rowRanges(fission))

save(YeastTimeSeriesDesign,
		 YeastTimeSeriesAnnotation,
		 YeastTimeSeriesExpression,
		 file="./data/YeastTimeSeries.rda")

### Parathyroidea
library(parathyroidSE)
data(parathyroidGenesSE)

ParathyroidTumorsDesign <- as.data.frame(colData(parathyroidGenesSE)) %>%
	subset(select=c(sample, patient, treatment, time)) %>%
	set_rownames(parathyroidGenesSE$run)

ParathyroidTumorsExpression <- assay(parathyroidGenesSE) %>%
	set_colnames(parathyroidGenesSE$run)

ParathyroidTumorsAnnotation <- as.data.frame(rowRanges(parathyroidGenesSE)) %>%
	group_by(group_name) %>%
	summarise(seqnames=unique(seqnames),
						start=min(start),
						end=max(end),
						strand=unique(strand)) %>%
	ungroup() %>%
	mutate(width=end-start) %>%
	select(seqnames, start, end, width, strand, group_name) %>%
	set_colnames(c("seqnames", "start", "end", "width", "strand", "id")) %>%
	as.data.frame %>%
	set_rownames(rownames(ParathyroidTumorsExpression))

save(ParathyroidTumorsDesign,
		 ParathyroidTumorsAnnotation,
		 ParathyroidTumorsExpression,
		 file="./data/ParathyroidTumors.rda")

### Parathyroidea
library(zebrafishRNASeq)
data(zfGenes)

ZebrafishDesign <- data.frame(gallein=factor(x=c("control", "control", "control",
																								 "treated", "treated", "treated"),
																						 levels=c("control", "treated")),
																						 row.names=colnames(zfGenes))
ZebrafishAnnotation <- data.frame(id=rownames(zfGenes),
																	row.names=rownames(zfGenes))

ZebrafishExpression <- zfGenes

save(ZebrafishDesign,
		 ZebrafishAnnotation,
		 ZebrafishExpression,
		 file="./data/Zebrafish.rda")
