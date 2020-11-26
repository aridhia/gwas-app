

# Introduction to GWAS

Genome-wide association study (GWAS) is a hypotheses-free method for **identifying associations between genetic regions and traits** (incl. diseases). GWAS typically **searches for small variations**, known as single-nucleotide polymorphisms (**SNPs**), that occur more frequently in people with a particular disease than those without the disease.

Researchers use **two groups of participants**: people with the disease being studied **(case group)** and similar people without the disease **(control group)**. Strategically selected SNPs are then compared between groups. If certain variations are found to be significantly more frequent in people with the disease compared to people without the disease, the **variations are said to be associated with the disease**.

Results are typically displayed in a **Manhattan plot** with -log10(p-value) plotted against the position in the genome. Two lines are added to indicate the genome-wide **significance threshold** (p=5.0×10−8) and the cut-off level for selecting SNPs for replication study (p=1.0×10−5). 

# About GWAS App

The app has five tabs:
1. **An interactive Manhattan plot**

2. **Circular Manhattan plot** 

3. **Quantile-quantile (QQ) plot**

4. **SNP density plot**

5. **Help**


# Checkout and run

You can clone this repository by using the command:

```
git clone https://github.com/aridhia/gwas-app
```

From R studio or an R console, you can run the app:
```
runApp()
```

# Workspace deployment

1. Create a new mini-app in the workspace called "gwas-app" and delete the folder created for it
3. Zip all the files in this GitHub repo or download the repo as a zip file 
4. Upload the zip file to the workspace and unzip inside a folder called "gwas-app"