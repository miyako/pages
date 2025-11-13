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

c.f. https://miyako.github.io/4d-tips-github-pages/

## Alternative Solution - server side syntax highlight

You custom GitHub actions to inplement custom Rouge rules.

1. Go to Settings > Pages > Build and deployment
2. Change Source from "Deply from a branch" to "GitHub Actions"
3. Select GitHub Pages Jekyll By GitHub Actions
4. Click "Configure"
5. Edit [`jekyll-gh-pages.yml`](https://github.com/miyako/pages/blob/main/.github/workflows/jekyll-gh-pages.yml)
> [!NOTE]
> To add custom language in Rouge you must execute Jekyll with plugins. GitHub Pages uses standard [Kramdown and Jekyll](https://github.com/github/pages-gem) which does not include the 4D programming language. The build runs in safe mode which only allows white-listed plugins. The above action enables custom plugins by not running in safe mode.
6. Download Jekyll them for GitHub Pages e.g. [pages-themes/minimal](https://github.com/pages-themes/minimal)
7. Copy the following assset to repository
   * `_includes/`
   * `_layouts/`
   * `_sass/`
   * `assets/`
6. Add [`_config.yml`](https://github.com/miyako/pages/blob/main/_config.yml)
7. Add [`_plugins/rouge_4d.rb`](https://github.com/miyako/pages/blob/main/_plugins/rouge_4d.rb)
8. Add [`Gemfile`](https://github.com/miyako/pages/blob/main/Gemfile)
> [!CAUTION]
> `Gemfile` refers to the theme. Edit it if you use a theme other than `jekyll-theme-minimal`  
9. Add [`assets/css/code.css`](https://github.com/miyako/pages/blob/main/assets/css/code.css)
10. Add [`assets/css/copy.css`](https://github.com/miyako/pages/blob/main/assets/css/copy.css)
11. Add [`_includes/head-custom.html`](https://github.com/miyako/pages/blob/main/_includes/head-custom.html)
> [!NOTE]
> `head-custom.html` is included in the HTML because `_layouts/default.html` contains the line 
> `{% include head-custom.html %}`
12. Remove any code in imported theme that conflicts with the addes stylesheets.
e.g. 
```css
// _sass/jekyll-theme-minimal.scss
// @import "rouge-github";
```
```css
///_sass/jekyll-theme-minimal.scss
code, pre {
  font-family:Monaco, Bitstream Vera Sans Mono, Lucida Console, Terminal, Consolas, Liberation Mono, DejaVu Sans Mono, Courier New, monospace;
  /*color:#333;*/
}
```
13. Add `{% include footer.html %}` right before the closing `</body>` tag in [`_layouts/default.html`](https://github.com/miyako/pages/blob/main/_layouts/default.html)
14. Add [`_includes
/footer.html`](https://github.com/miyako/pages/blob/main/_includes/footer.html)
> [!NOTE]
> The above adds a "copy code" button to each `<pre>` element.
