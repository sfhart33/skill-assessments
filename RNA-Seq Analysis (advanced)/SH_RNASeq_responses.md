# Review of RNA-Seq analysis by Sam Hart

Commit reviewed: [bc369159d2516e42269cbb95ab185b5262ede51f](https://github.com/sfhart33/skill-assessments/tree/bc369159d2516e42269cbb95ab185b5262ede51f)

## Notebook

Overall, this is a good start. However, it seems like you may have not followed the prompt closely:

>You should pretend that you are making a report that you want to show to a biomedical collaborator who does not know bioinformatics. You should have an introduction in which you outline the research question, a results section in which you present your results, and a discussion section in which you interpret the results. It should be formatted in an aesthetic way that is easy to follow.

This notebook reads more like a homework assignment than a report to a collaborator. Please try again and pretend like you are in a lab, performing an analysis for a collaborator who isn't a bioinformatics expert, and this report is how you convey the results and their importance to them. Make sure you explain why you chose the dataset you chose, what the biological questions / goals of the analysis were, what analysis methods you used & why you used them, the results you found, and what their significance is for addressing the goals of your analysis & larger biological questions. 


**I have reformatted to include the intro, results and conclusions sections, and rather than the homework format of answering question-by-question and formatted it like I was informing and expaining to the results to a collaborator, including what each analysis shows and what we can biologically conclude about the data set.**

Other critiques:

1. Show gene symbols, not gene IDs when you provide a table in a report like this -- no one knows what the gene IDs are, but they will recognize the gene symbols.

**I translated the gene IDs that came with the data set to their cooresponding gene symbols so that the gene lists are more recognizable and interpretable without having to search each individual code.**

2. Plot quality is very poor in all cases. Please make sure plots are (a) easy to read and understand, (b) parsimoniously convey the key information, (c) use appropriate statistical transformations, and (d) have the appropriate labels & titles. For example, your PCA plot looks squished -- your volcano plot has no colors and doesn't highlight any genes (see [EnhancedVolcano](https://bioconductor.org/packages/devel/bioc/vignettes/EnhancedVolcano/inst/doc/EnhancedVolcano.html) for inspiration) -- your heatmap doesn't include row clustering or scaling or row names, so it's not possible to interpret the results meaninfully -- and your GSEA plots don't have readable titles.

**I re-visited each plot to improve them - my previous version had just been however I was first able to plot the data without making it prettier or more interpretable - again thinking of it more as a homework assignment than a official report. The PCA plot is now a proper sizing and theme, the volcano plot is changed to the the EnhancedVolcano format with colors and top gene labels, the heatmap now has gene names, row clustering and scaling, and the GSEA plot format is altered to focus in on the enrichment result and have a readable title**

3. Notebook text size / style is inconsistent. For example, the level-one headers should be much shorter -- they look very awkward in the table of contents.

**I re-organized the header scheme to incluse major titles (intro, results, conclusions), minor titles (each plotting section) and answers/descriptions, with smaller level-one headers for the TOC**

Instead of this:

```markdown
# Lorem ipsum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam a ex nisi. Proin nec dolor gravida elit vulputate lobortis. Sed vel odio odio. Mauris maximus, neque tincidunt accumsan tincidunt, orci lacus molestie nunc, vestibulum bibendum quam urna ut leo. Phasellus erat turpis, hendrerit sed tristique nec, varius eu dui. Curabitur sit amet nunc vel nisl dictum malesuada. Cras vestibulum aliquam magna. Morbi eu tortor ligula. Nullam auctor ligula urna, at consequat neque ullamcorper eu. 
```

Do this:

```md
# Lorem ipsum

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam a ex nisi. Proin nec dolor gravida elit vulputate lobortis. Sed vel odio odio. Mauris maximus, neque tincidunt accumsan tincidunt, orci lacus molestie nunc, vestibulum bibendum quam urna ut leo. 

## Phasellus erat

Phasellus erat turpis, hendrerit sed tristique nec, varius eu dui. Curabitur sit amet nunc vel nisl dictum malesuada. Cras vestibulum aliquam magna. Morbi eu tortor ligula. Nullam auctor ligula urna, at consequat neque ullamcorper eu. 

```

Basically, you want somethng that will be easy to read and friendly for a non-bioinformatician to consume.


## Code

The code style is alright, just make sure to rewrite the notebook so that there are no `for` loops. 

**I replaced the for loop with a lapply command and function**

