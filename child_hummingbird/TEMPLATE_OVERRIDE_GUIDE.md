# Template Override Guide - Child Theme

## 🎯 How Template Overriding Works

When you copy a template file from the **parent theme** to the **child theme** with the SAME path structure, PrestaShop automatically uses your child theme version instead of the parent.

### File Priority Order:
```
1. child_hummingbird/  ← PrestaShop checks HERE FIRST
2. hummingbird/        ← Falls back to parent if not found in child
3. classic/            ← Core fallback
```

---

## 📝 EXAMPLE: Header Override

### Original Parent File:
```
hummingbird/templates/_partials/header.tpl
```

### Your Override File:
```
child_hummingbird/templates/_partials/header.tpl  ✓ CREATED!
```

**Result:** PrestaShop now uses YOUR version from child_hummingbird!

---

## 🛠️ Step-by-Step Override Process

### Example 1: Override Header Top

**Step 1:** Identify the file you want to override
```
Parent: hummingbird/templates/_partials/header.tpl
```

**Step 2:** Create the SAME folder structure in child theme
```bash
child_hummingbird/
  └── templates/
      └── _partials/
          └── header.tpl  ← Create this
```

**Step 3:** Copy content from parent OR create from scratch

**Step 4:** Modify the HTML/Smarty code as needed

**Step 5:** Clear PrestaShop cache
- Admin Panel → Advanced Parameters → Performance → Clear Cache
- Or delete: /var/cache/prod/ and /var/cache/dev/

---

## ✏️ Practical Customization Examples

### Example A: Add Custom Text to Header Top

**File:** `child_hummingbird/templates/_partials/header.tpl`

**Find this block:**
```smarty
{block name='header_nav'}
  <nav class="{$headerTopName}">
    <div class="container-md">
      <div class="{$headerTopName}-desktop d-none d-md-flex row">
        <div class="{$headerTopName}__left col-md-5">
          {hook h='displayNav1'}
        </div>
```

**Change to:**
```smarty
{block name='header_nav'}
  <nav class="{$headerTopName}">
    <div class="container-md">
      <div class="{$headerTopName}-desktop d-none d-md-flex row">
        <div class="{$headerTopName}__left col-md-5">
          <span class="promo-text">🎉 Free Shipping Over $50!</span>
          {hook h='displayNav1'}
        </div>
```

---

### Example B: Add Wrapper Around Header Bottom

**Find this block:**
```smarty
{block name='header_bottom'}
  <div class="{$headerBottomName}">
    <div class="container-md {$headerBottomName}__container">
```

**Change to:**
```smarty
{block name='header_bottom'}
  <div class="my-custom-wrapper">
    <div class="{$headerBottomName}">
      <div class="container-md {$headerBottomName}__container">
```

**Don't forget to close the wrapper at the end:**
```smarty
      </div>
    </div>
  </div>  {* Close my-custom-wrapper *}
  {hook h='displayNavFullWidth'}
{/block}
```

---

### Example C: Change Column Layout in Header Top

**Original:**
```smarty
<div class="{$headerTopName}__left col-md-5">
  {hook h='displayNav1'}
</div>

<div class="{$headerTopName}__right col-md-7">
  {hook h='displayNav2'}
</div>
```

**Modified (Equal columns):**
```smarty
<div class="{$headerTopName}__left col-md-6">
  {hook h='displayNav1'}
</div>

<div class="{$headerTopName}__right col-md-6">
  {hook h='displayNav2'}
</div>
```

---

### Example D: Add Extra Container in Header Bottom

**Original:**
```smarty
<div class="row gx-2 align-items-stretch {$headerBottomName}__row">
  <div class="d-flex align-items-center col-auto logo ...">
    {* Logo *}
  </div>
  
  {hook h='displayTop'}
```

**Modified (Add contact info before menu):**
```smarty
<div class="row gx-2 align-items-stretch {$headerBottomName}__row">
  <div class="d-flex align-items-center col-auto logo ...">
    {* Logo *}
  </div>
  
  {* NEW: Custom contact section *}
  <div class="contact-info col-auto d-none d-lg-block">
    <span class="phone-number">📞 +1-800-123-4567</span>
  </div>
  
  {hook h='displayTop'}
```

---

## 📋 Common Files to Override

### Header Components
```
templates/_partials/header.tpl          ← Main header (TOP + BOTTOM)
templates/_partials/head.tpl            ← <head> section
```

### Footer Components
```
templates/_partials/footer.tpl          ← Main footer
```

### Layout Files
```
templates/layouts/layout-both-columns.tpl
templates/layouts/layout-full-width.tpl
templates/layouts/layout-left-column.tpl
```

### Home Page
```
templates/index.tpl                     ← Home page specific
```

---

## 🎨 Combining Template + CSS Changes

### 1. Add Custom CSS Class in Template

**In your override:** `templates/_partials/header.tpl`
```smarty
<div class="my-custom-header-wrapper">
  <nav class="{$headerTopName} custom-nav">
    ...
  </nav>
</div>
```

### 2. Style It in CSS

**In:** `assets/css/custom.css`
```css
.my-custom-header-wrapper {
  background: linear-gradient(to right, #667eea, #764ba2);
  padding: 10px 0;
}

.custom-nav {
  border-bottom: 2px solid gold;
}
```

---

## ⚠️ Important Notes

### DO's:
✅ Always maintain the same folder structure  
✅ Keep Smarty syntax correct (blocks, variables, hooks)  
✅ Clear cache after changes  
✅ Test on mobile and desktop  
✅ Keep parent theme updated separately  

### DON'Ts:
❌ Don't edit parent theme directly  
❌ Don't remove important hooks  
❌ Don't forget to close HTML tags  
❌ Don't break Bootstrap grid classes  
❌ Don't remove accessibility attributes  

---

## 🔍 Debugging Tips

### Cache Issues
If changes don't appear:
1. Clear PrestaShop cache
2. Clear browser cache (Ctrl + Shift + Delete)
3. Check if file path is EXACTLY the same as parent

### Syntax Errors
- Check Smarty syntax: `{if}...{/if}`, `{block}...{/block}`
- Validate HTML structure
- Check PrestaShop error logs

### Check File is Being Used
Add a comment at the top:
```smarty
{* CHILD THEME OVERRIDE ACTIVE *}
```
View page source, search for this comment.

---

## 🚀 Quick Reference

### Override Header:
```
Copy: hummingbird/templates/_partials/header.tpl
To:   child_hummingbird/templates/_partials/header.tpl ✓
```

### Clear Cache:
```
Admin → Performance → Clear Cache
```

### Current Active Override:
✅ **child_hummingbird/templates/_partials/header.tpl** (CREATED)

---

*This guide covers the basics of template overriding. Experiment with small changes first!*
