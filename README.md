# pages
How to generate pages with rouge support

## Introduction

**GitHub Pages** is a free web hosting service provided by GitHub that allows you to publish websites directly from a GitHub repository. It is widely used for personal websites, project documentation, blogs, etc.

The websites is generated with **[Jekyll](https://jekyllrb.com)**. The pages are converted from markdown with **[Kramdown](https://kramdown.gettalong.org)**. The `<pre>` elements are generated from fenced code blocks with **[Rouge](https://rouge.jneen.net)**.


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
