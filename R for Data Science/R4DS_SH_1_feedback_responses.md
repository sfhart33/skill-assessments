# Review of R4DS Sam Hart

Commit reviewed: [bc369159d2516e42269cbb95ab185b5262ede51f](https://github.com/sfhart33/skill-assessments/tree/bc369159d2516e42269cbb95ab185b5262ede51f)

## Notebook

The notebook is very good overall. However, there are places where the style and readability could be greatly improved.

1. No raw chunk output text should be visible in the notebook. For example, package loading messages. You can silence raw chunk output by using [these chunk options](https://bookdown.org/yihui/rmarkdown-cookbook/hide-one.html)

**I have silenced the raw outputs**

2. Plots should be designed for readability. Plot text in the notebook is often too small. Plot axes are Euclidean, even when data distribution is logarithmic (e.g., first plot) -- this makes plots harder to interpret. No plot titles are included. Also, consider changing the plot [theme](https://ggplot2-book.org/polishing.html) (not required).

**I enlarged the plot text from the defaults, changed relevant axes to log scale (plots of GDP vs CO2), added descriptive plot titles, and changed plots to the classic theme**

3. The last two plots are unreadable. Keep in mind that a plot is not always the most parsimonious way to represent data. Consider using tables, such as those from the [DT](https://rstudio.github.io/DT/) package.

**I changed these plots to sorted tables**

4. You had the correct answers for every question. However, you provided no statistical reasoning to support your answers. For every question which required statistical analysis, please briefly explain your approach and why it is valid. For example, why did you use Pearson correlation for section 3 and 4? Did your data meet the assumptions of Pearson correlation?

**I elaborated the reasoning for my statistical approaches**

## Code

The code is very well-written overall. 

1. My main critique is your use of `for()` loops -- as these are inefficient & unnecessary in tidyverse R. To pass this assessment, you will need to rewrite the code so that it uses no `for` loops. 

For example, you could rewrite [lines 71-83](https://github.com/sfhart33/skill-assessments/blob/main/R%20for%20Data%20Science/R_data_sci_assessment_styled.Rmd#L71-L83) using one tidy pipe with the `group_by() %>% summarise()` pattern.

Similar example:

```R
gears <- mtcars$gear %>% unique()
coors <- c()
for (g in gears) {
  mtcargear <- mtcars %>% filter(gear == g)
  mt_cor <- cor.test(mtcargear$mpg, mtcargear$wt) %>% 
    .$estimate %>% round(3)
  coors <- c(coors, mt_cor)
}
max_gear <- gears[coors == max(coors)]
```

Can be rewritten as:

```R
mtcars %>% 
  group_by(gear) %>% 
  summarise(coors = cor.test(mpg, wt)$estimate) %>% 
  slice_max(coors) %>%
  pull(gear) %>%
  round(3) -> max_gear
```

**I have replaced my loops with tidyverse functions**

2. [Line 164](https://github.com/sfhart33/skill-assessments/blob/main/R%20for%20Data%20Science/R_data_sci_assessment_styled.Rmd#L164): The use of `summarise_at()` is superceded -- please rewrite using the `summarise(across())` pattern instead -- see examples [here](https://dplyr.tidyverse.org/reference/across.html).

**I have re-written these commands**

