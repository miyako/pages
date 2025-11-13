# pages
How to generate pages with rouge support

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
