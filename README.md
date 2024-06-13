

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

This R Shiny mini-app reads the files allocated in the `data` folder, you can add your own data and use it in the app. The app expects a csv derived from the PLINK .map file, this file should contain the following columns:

1. CHR - chromosome number (`integer`)
2. BP - genomic base-pair position (`integer`)
3. P - p-value (`integer`)
4. SNP - snp identifier (`character`)
5. ZSCORE - z-score (`numeric`)
6. EFFECTSIZE - effect size (`numeric`)
7. GENE - nearest gene to SNP (`character`)
8. DISTANCE - distance between the SNP and GENE (`integer`)

The example data is the R example dataset HapMap, from the `manhattanly` packages.

# Checkout and run

You can clone this repository by using the command:

```
git clone https://github.com/aridhia/gwas-app
```

Open the .Rproj file in RStudio, source the script `dependencies.R` to install all the packages required by the app, and run `runApp()` to start the app.

### Deploying to the workspace

1. Download this GitHub repo as a .zip file.
2. Create a new blank Shiny app in your workspace called "gwas-app".
3. Navigate to the `gwas-app` folder under "files".
4. Delete the `app.R` file from the `gwas-app` folder. Make sure you keep the `.version` file!
5. Upload the .zip file to the `gwas-app` folder.
6. Extract the .zip file. Make sure "Folder name" is blank and "Remove compressed file after extracting" is ticked.
7. Navigate into the unzipped folder.
8. Select all content of the unzipped folder, and move it to the `gwas-app` folder (so, one level up).
9. Delete the now empty unzipped folder.
10. Start the R console and run the `dependencies.R` script to install all R packages that the app requires.
11. Run the app in your workspace.

For more information visit https://knowledgebase.aridhia.io/article/how-to-upload-your-mini-app/
