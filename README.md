

# Introduction to GWAS

Genome-wide association study (GWAS) is a hypotheses-free method for **identifying associations between genetic regions and traits** (incl. diseases). GWAS typically **searches for small variations**, known as single-nucleotide polymorphisms (**SNPs**), that occur more frequently in people with a particular disease than in people without the disease. GWAS already has seen success at identifying SNPs related to conditions such as diabetes, Parkinson's and Crohn's disease.

# General Approach to GWAS

Researchers use **two groups of participants**: people with the disease being studied **(case group)** and similar people without the disease **(control group)**. **DNA is obtained from each participant** by scanning their blood sample/cell on automated laboratory machines. The machines survey each participant’s genome for strategically selected **markers of genetic variation (SNPs)**. If certain variations are found to be significantly more frequent in people with the disease compared to people without the disease, the **variations are said to be associated with the disease**.

The SNPs associated with the disease are **identified by testing for statistical significance between cases and controls**. Results are typically displayed in a **Manhattan plot** with -log10(p-value) plotted against the position in the genome. Two lines are added to indicate the genome-wide **significance threshold** (p=5.0×10−8) and the cut-off level for selecting single-nucleotide polymorphisms for replication study (p=1.0×10−5). An example Manhattan plot is illustrated below.


# Visualizing Results

A Shiny app was created for visualizing the GWAS results. 

The app can be run from the R console:
```
library(shiny)
runApp("app.R")
```

The app has four tabs:
1. **An interactive Manhattan plot** showing the the negative logarithm of the p-value plotted against the position in the genome. The red line represents a genome-wide significance threshold, thus SNPs above it will be associated with the Late Onset Alzheimer's Disease. You can hover your mouse over the SNPs to display the variant information. 

2. **Circular and Rectangular Manhattan plots**: not interactive, more controls for changing the plot parameters as well as functionality for zooming into a single chromosome. 
3. **Quantile-quantile (QQ) plots**, showing the observed vs expected p value. 

4. **SNP density plots**. 