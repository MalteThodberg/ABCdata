library(magrittr)
library(dplyr)

### Airways bam files
dir <- system.file("extdata", package="airway", mustWork=TRUE)
csv.file <- file.path(dir, "sample_table.csv")
sample.table <- read.csv(csv.file, row.names=1)
bam.files <- file.path(dir, paste0(sample.table$Run, "_subset.bam"))
gtf.file <- file.path(dir, "Homo_sapiens.GRCh37.75_subset.gtf")

bam_files <- list.files(dir) %>% grep(x=., pattern=".bam", value=TRUE)
bam_paths <- list.files(dir, full.names=TRUE) %>% grep(x=., pattern=".bam", value=TRUE)


sapply(seq_along(bam_files), function(x) file.copy(from=bam_paths[x],
																									 to=file.path("inst/extdata/", bam_files[x])))
