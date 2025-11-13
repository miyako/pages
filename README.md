# pages
How to generate pages with rouge support

## Introduction

**GitHub Pages** is a free web hosting service provided by GitHub that allows you to publish websites directly from a GitHub repository. It is widely used for personal websites, project documentation, blogs, etc.

The website is built with **[Jekyll](https://jekyllrb.com)**. The static HTML pages are converted from markdown files with **[Kramdown](https://kramdown.gettalong.org)**. The `<pre>` elements are generated from fenced code blocks in the markdown with **[Rouge](https://rouge.jneen.net)**.

The built-in solution is stable, elegant and easy maintain.

## Problem

If you have fenced code blocks in the markdown like

> \`\`\`4d  
> ALERT("Hello!")  
> \`\`\`  

their contents are converted to `<pre>` elements in the generated HTML but **no syntax highlighting is applied** because [the 4D programming language is not recognised by Rouge](https://github.com/rouge-ruby/rouge/wiki/List-of-supported-languages-and-lexers).

## Solution - client side syntax highlight

As an alternative to Rouge, one can do the following:

1. Disable Rouge in `_config.yml`
2. Install and use [highlightjs-4d](https://github.com/highlightjs/highlightjs-4d) instead


---

## Setup GitHub Pages

Go to Settings > Pages and activate GitHub Pages.

## Rouge

1. Find a Rouge Theme in [gallery](https://spsarolkar.github.io/rouge-theme-preview/)
2. Generate `.css`

```sh
rougify style thankful_eyes > assets/css/thankful_eyes.css
```

3. Reference the stylesheet

```html
<link rel="stylesheet" href="{{ '/assets/css/thankful_eyes.css' | relative_url }}">
```
