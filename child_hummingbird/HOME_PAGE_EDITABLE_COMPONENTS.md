# Home Page Editable Components - Child Hummingbird Theme

This document lists all the components you can customize from the parent Hummingbird theme for the **HOME PAGE**.

## 📁 File Override Structure
To customize any file, copy it from `hummingbird/` to `child_hummingbird/` maintaining the same directory structure.

---

## 🏠 HOME PAGE MAIN FILES

### 1. Main Template
- **File:** `templates/index.tpl`
- **Purpose:** Home page main template
- **Key Blocks:**
  - `breadcrumb` (empty by default)
  - `left_column` (empty by default)
  - `content_wrapper`
  - `page_content` → Contains `{$HOOK_HOME nofilter}`

### 2. Layout Template
- **File:** `templates/layouts/layout-both-columns.tpl` (or the layout assigned to home)
- **Purpose:** Base structure with header, footer, columns
- **Key Blocks:**
  - `head`
  - `header`
  - `breadcrumb`
  - `notifications`
  - `content_columns`
  - `left_column`
  - `content_wrapper`
  - `right_column`
  - `footer`
  - `javascript_bottom`

---

## 📑 HEADER COMPONENTS

### Header Main
- **File:** `templates/_partials/header.tpl`
- **Contains:**
  - Banner section: `{hook h='displayBanner'}`
  - Header Top (navigation): Lines 14-28
    - `{hook h='displayNav1'}` (left side)
    - `{hook h='displayNav2'}` (right side)
  - **Header Bottom: Lines 31-89** ← YOUR TARGET
    - Logo section
    - Mobile search
    - `{hook h='displayTop'}`
    - Mobile user info
    - Mobile cart
  - `{hook h='displayNavFullWidth'}`

### Header Partials
- **File:** `templates/_partials/head.tpl`
- **Purpose:** Meta tags, CSS, preload scripts

---

## 🎨 STYLING FILES (SCSS/CSS)

### Core Layout Styles
**Location:** `src/scss/core/layout/`

1. **`_header.scss`** - General header styles
2. **`_header-top.scss`** - Top navigation bar
3. **`_header-bottom.scss`** - Main header with logo/menu
4. **`_footer.scss`** - Footer styles
5. **`_left-column.scss`** - Left sidebar

### Component Styles
**Location:** `src/scss/core/components/`

1. `_breadcrumb.scss`
2. `_search.scss`
3. `_mobile-menu.scss`
4. `_buttons.scss`
5. `_slider.scss`
6. `_alert.scss`
7. `_pagination.scss`

### Main SCSS Files
- **`src/scss/theme.scss`** - Main stylesheet (imports all components)
- **`src/scss/theme_rtl.scss`** - RTL version
- **`src/scss/custom/`** - Custom styles directory

### Compiled CSS (output)
- **`assets/css/theme.css`** - Compiled main stylesheet
- **`assets/css/theme_rtl.css`** - Compiled RTL stylesheet

---

## 🔧 JAVASCRIPT FILES

### Main JS
- **File:** `assets/js/theme.js`
- **Purpose:** Compiled theme JavaScript bundle

### Source Files
- **Location:** `src/js/` (if exists, check webpack config)

---

## 🧩 HOME PAGE MODULES

These modules typically appear on the home page via `{$HOOK_HOME}`:

### Featured/Popular Products
1. **`modules/ps_featuredproducts/`**
   - Template: `views/templates/hook/ps_featuredproducts.tpl`
   
2. **`modules/ps_bestsellers/`**
   - Template: `views/templates/hook/ps_bestsellers.tpl`

3. **`modules/ps_newproducts/`**
   - Template: `views/templates/hook/ps_newproducts.tpl`

4. **`modules/ps_specials/`**
   - Template: `views/templates/hook/ps_specials.tpl`

### Banners & Sliders
5. **`modules/ps_imageslider/`**
   - Template: `views/templates/hook/slider.tpl`

6. **`modules/ps_banner/`**
   - Template: `views/templates/hook/ps_banner.tpl`

### Other Common Modules
7. **`modules/ps_categoryproducts/`**
8. **`modules/blockreassurance/`**
9. **`modules/ps_customtext/`**
10. **`modules/ps_emailsubscription/`**
11. **`modules/ps_brandlist/`**
12. **`modules/ps_supplierlist/`**

---

## 🦶 FOOTER COMPONENTS

### Footer Main
- **File:** `templates/_partials/footer.tpl`
- **Contains:**
  - Footer blocks
  - Social links
  - Copyright
  - `{hook h='displayFooter'}`

---

## ⚙️ CONFIGURATION FILES

### Theme Configuration
- **File:** `config/theme.yml`
- **Contains:**
  - Theme metadata
  - Available layouts
  - Assets configuration
  - Parent theme reference

---

## 🎯 HOOKS USED ON HOME PAGE

### Main Content Hooks
- `displayBanner` - Top banner area
- `displayNav1` - Header top left
- `displayNav2` - Header top right
- `displayTop` - Header bottom area
- `displayNavFullWidth` - Below header
- `displayWrapperTop` - Before content
- `displayContentWrapperTop` - Inside content wrapper
- **`displayHome`** - Main home content area (displays home modules)
- `displayContentWrapperBottom` - After content
- `displayWrapperBottom` - After main wrapper
- `displayFooter` - Footer area

### Side Column Hooks
- `displayLeftColumn` - Left sidebar
- `displayRightColumn` - Right sidebar

---

## 📋 COMMON CUSTOMIZATION SCENARIOS

### Change Header Bottom Structure
1. Copy `templates/_partials/header.tpl` to child theme
2. Edit the `{block name='header_bottom'}` section (lines 31-89)

### Add Custom CSS
1. Create/edit `assets/css/custom.css` ✓ (Already exists!)
2. Or work with SCSS: create `src/scss/custom/_custom.scss`

### Customize Module Display
1. Copy module folder from `hummingbird/modules/[module_name]/`
2. Paste to `child_hummingbird/modules/[module_name]/`
3. Edit templates inside

### Change Home Page Layout
1. Copy `templates/index.tpl` to child theme
2. Modify blocks or add custom content

### Edit Footer
1. Copy `templates/_partials/footer.tpl` to child theme
2. Modify structure

---

## 🚀 QUICK START CHECKLIST

To customize your home page header-bottom (as mentioned):

- [x] You already have: `child_hummingbird/assets/css/custom.css`
- [ ] Copy if needed: `templates/_partials/header.tpl`
- [ ] Copy if needed: `templates/index.tpl`
- [ ] Copy if needed: `templates/layouts/layout-both-columns.tpl`

---

## 📝 NOTES

1. **Always copy complete folder structure** when overriding files
2. **Don't edit parent theme directly** - use child theme
3. **After template changes**, clear PrestaShop cache (admin panel)
4. **After CSS changes**, may need to regenerate assets or clear cache
5. **Check theme.yml** in child theme to ensure parent is referenced correctly

---

## 🔍 FILE PRIORITY

PrestaShop loads files in this order:
1. `child_hummingbird/` (your customizations)
2. `hummingbird/` (parent fallback)
3. `classic/` (core fallback)

---

*Generated: February 8, 2026*
*Theme: child_hummingbird extends hummingbird*
*Page: HOME PAGE ONLY*
