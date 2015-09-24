#' Airway dexamethasone experiment BAM files
#'
#' RNA-Seq data originally from bioconductor. For more information, see reference from URL.
#'
#' Creates a directory "airway/" in the current directory and copies example BAM-files into this folder.
#'
#' @author Malte Thodberg
#' @source \url{http://bioconductor.org/packages/release/data/experiment/html/airway.html}
#' @export
copy_airway_bamfiles <- function(){
	# Create directory
	dir.create(path="airway",
						 showWarnings=TRUE,
						 recursive=FALSE)

	# Directory with files
	dir <- system.file("extdata", package="ABCdata", mustWork=TRUE)

	bam_files <- list.files(dir)
	bam_paths <- list.files(dir, full.names=TRUE)

	# Copy
	sapply(seq_along(bam_files), function(x) file.copy(from=bam_paths[x],
																										 to=file.path("airway/", bam_files[x])))

	message("Files copied to ./airway/")
}
