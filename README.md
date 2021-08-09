# Introduction to R

### Files needed to be (in main folder) for Binder:
[Manual](https://github.com/alan-turing-institute/the-turing-way/blob/master/workshops/boost-research-reproducibility-binder/workshop-presentations/zero-to-binder-r.md)
- runtime.txt (with r-YYYY-MM-DD on the first line, where YYYY-MM-DD is the release date of the version you want to use)
- install.R (install packages when the binder environment initialized)
- .gitlab-ci.yml:
``` 
  pages:
    stage: deploy
    script:
    - mkdir .public
    - cp -r * .public
    - mv .public public
    artifacts:
      paths:
      - public
    only:
    - master
```


## Welcome to GitHub Pages

You can use the [editor on GitHub](https://github.com/SimonRess/Introduction-to-R/edit/main/README.md) to maintain and preview the content for your website in Markdown files.

Whenever you commit to this repository, GitHub Pages will run [Jekyll](https://jekyllrb.com/) to rebuild the pages in your site, from the content in your Markdown files.

### Markdown

Markdown is a lightweight and easy-to-use syntax for styling your writing. It includes conventions for

```markdown
Syntax highlighted code block

# Header 1
## Header 2
### Header 3

- Bulleted
- List

1. Numbered
2. List

**Bold** and _Italic_ and `Code` text

[Link](url) and ![Image](src)
```

For more details see [GitHub Flavored Markdown](https://guides.github.com/features/mastering-markdown/).

### Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/SimonRess/Introduction-to-R/settings). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

### Support or Contact

Having trouble with Pages? Check out our [documentation](https://docs.github.com/categories/github-pages-basics/) or [contact support](https://github.com/contact) and we’ll help you sort it out.
