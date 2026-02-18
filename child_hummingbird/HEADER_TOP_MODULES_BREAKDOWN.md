# Header Top Module Breakdown

## 🎯 What You're Seeing in DevTools

When you see elements in the **header-top** (navbar-top in devtools), they come from **module templates** loaded by hooks!

---

## 📍 Hook Mapping in header.tpl

### In your `header.tpl` file:

```smarty
{block name='header_nav'}
  <nav class="header-top">                    ← This is the "navbar-top" you see
    <div class="container-md">
      <div class="header-top-desktop d-none d-md-flex row">
        
        {* LEFT SIDE *}
        <div class="header-top__left col-md-5">
          {hook h='displayNav1'}              ← MODULES LOAD HERE
        </div>

        {* RIGHT SIDE *}
        <div class="header-top__right col-md-7">
          {hook h='displayNav2'}              ← MODULES LOAD HERE
        </div>
        
      </div>
    </div>
  </nav>
{/block}
```

---

## 🔌 Modules Connected to These Hooks

### LEFT SIDE - `{hook h='displayNav1'}`

#### 1. **Contact Us** (ps_contactinfo)
- **File:** `modules/ps_contactinfo/nav.tpl`
- **Shows:** "Contact us" link or phone number
- **Override path:** `child_hummingbird/modules/ps_contactinfo/nav.tpl`

#### 2. **Language Selector** (ps_languageselector)
- **File:** `modules/ps_languageselector/ps_languageselector.tpl`
- **Shows:** "English", "French", etc. dropdown
- **Override path:** `child_hummingbird/modules/ps_languageselector/ps_languageselector.tpl`

#### 3. **Currency Selector** (ps_currencyselector)
- **File:** `modules/ps_currencyselector/ps_currencyselector.tpl`
- **Shows:** "$", "€", etc. dropdown
- **Override path:** `child_hummingbird/modules/ps_currencyselector/ps_currencyselector.tpl`

---

### RIGHT SIDE - `{hook h='displayNav2'}`

#### 4. **Sign In / User Account** (ps_customersignin)
- **File:** `modules/ps_customersignin/ps_customersignin.tpl`
- **Shows:** "Sign in" or user name dropdown when logged in
- **Override path:** `child_hummingbird/modules/ps_customersignin/ps_customersignin.tpl`

#### 5. **Shopping Cart** (ps_shoppingcart)
- **File:** `modules/ps_shoppingcart/ps_shoppingcart.tpl`
- **Shows:** Cart icon with product count
- **Override path:** `child_hummingbird/modules/ps_shoppingcart/ps_shoppingcart.tpl`

---

## 📂 How to Override Module Templates

### Same principle as header.tpl!

**Parent Location:**
```
hummingbird/modules/ps_contactinfo/nav.tpl
```

**Child Override:**
```
child_hummingbird/modules/ps_contactinfo/nav.tpl
```

### Example: Customize "Contact Us"

**Original (parent):**
```
hummingbird/modules/ps_contactinfo/nav.tpl
```

**Create override:**
```bash
child_hummingbird/
  └── modules/
      └── ps_contactinfo/
          └── nav.tpl  ← Copy here and edit
```

---

## 🛠️ Practical Examples

### Example 1: Change "Contact us" to "Get Help"

**Create:** `child_hummingbird/modules/ps_contactinfo/nav.tpl`

```smarty
<div id="_desktop_contact_link">
  <div id="contact-link" class="contact-link">
    <a href="{$urls.pages.contact}">
      <i class="fa fa-question-circle"></i> Get Help
    </a>
  </div>
</div>
```

---

### Example 2: Add Icon to Sign In

**Create:** `child_hummingbird/modules/ps_customersignin/ps_customersignin.tpl`

Then find and modify the link (around line 13):

```smarty
<a href="#" class="dropdown-toggle header-block__action-btn" ...>
  <i class="material-icons header-block__icon">&#xE7FD;</i>
  <span class="header-block__title d-lg-inline d-none">
    👤 {$customerName|truncate:22:"..":true}
  </span>
</a>
```

---

### Example 3: Customize Cart Display

**Create:** `child_hummingbird/modules/ps_shoppingcart/ps_shoppingcart.tpl`

```smarty
<div id="_desktop_cart">
  <div class="header-block d-flex align-items-center blockcart cart-preview">
    {if $cart.products_count > 0}
      <a class="header-block__action-btn" href="{$cart_url}">
        <i class="material-icons header-block__icon">shopping_cart</i>
        <span class="header-block__title">
          🛒 Cart ({$cart.products_count} items)
        </span>
      </a>
    {else}
      <span class="header-block__action-btn">
        <i class="material-icons header-block__icon">shopping_cart</i>
        <span class="header-block__title">Empty Cart</span>
      </span>
    {/if}
  </div>
</div>
```

---

## 🔍 How to Find Which Module Creates What

### Method 1: Check Hook Assignment (Admin Panel)
1. Go to: **Design → Positions**
2. Search for: "displayNav1" or "displayNav2"
3. See which modules are attached

### Method 2: View Source
1. Right-click element → Inspect
2. Look for `id` attributes like:
   - `_desktop_contact_link` → ps_contactinfo
   - `_desktop_language_selector` → ps_languageselector
   - `_desktop_user_info` → ps_customersignin
   - `_desktop_cart` → ps_shoppingcart

### Method 3: Search Module Folders
Look in: `hummingbird/modules/[module_name]/`

---

## 📋 Complete Module Template List

### displayNav1 Modules (Left Side):
```
✓ ps_contactinfo      → Contact link/phone
✓ ps_languageselector → Language dropdown (English)
✓ ps_currencyselector → Currency dropdown ($, €)
```

### displayNav2 Modules (Right Side):
```
✓ ps_customersignin   → Sign in / User account
✓ ps_shoppingcart     → Cart icon & count
```

---

## 🎨 Styling Module Elements

### Option 1: Custom CSS (Quick)
In your `custom.css`:

```css
/* Style Contact Us link */
#contact-link a {
  color: #ff6b6b;
  font-weight: bold;
}

/* Style Language Selector */
#language-selector {
  background-color: #f8f9fa;
  border-radius: 20px;
}

/* Style Sign In button */
#_desktop_user_info .header-block__action-btn {
  background: linear-gradient(45deg, #667eea, #764ba2);
  color: white;
  padding: 8px 15px;
  border-radius: 5px;
}

/* Style Cart */
#_desktop_cart .header-block__badge {
  background-color: #ff6b6b;
  font-weight: bold;
}
```

### Option 2: Override Module Template (Full Control)
Copy module template to child theme and modify HTML structure.

---

## ⚙️ Module Settings (Admin Panel)

Some modules have backend settings:

1. **ps_contactinfo**
   - **Modules → Contact information**
   - Set phone, email, address

2. **ps_languageselector / ps_currencyselector**
   - **International → Localization**
   - Enable/disable languages & currencies

3. **ps_customersignin**
   - Part of PrestaShop core
   - No specific settings

4. **ps_shoppingcart**
   - **Modules → Shopping cart**
   - Ajax cart settings

---

## 🚀 Quick Override Checklist

To customize header-top elements:

- [ ] Identify which module creates the element (use devtools `id`)
- [ ] Find parent file: `hummingbird/modules/[module]/[template].tpl`
- [ ] Create same structure in child: `child_hummingbird/modules/[module]/[template].tpl`
- [ ] Copy content and modify
- [ ] Clear cache
- [ ] Refresh and test

---

## 💡 Pro Tips

1. **Module templates are separate from theme templates** - They live in `modules/` folder
2. **Each module template can be overridden independently**
3. **Don't need to copy all module files** - Only the `.tpl` template you want to change
4. **Check module position** in admin if element doesn't appear (might be disabled)
5. **Some modules render differently mobile vs desktop** - Check responsive design

---

## 📍 Current File Structure

```
hummingbird/
  └── modules/
      ├── ps_contactinfo/
      │   └── nav.tpl                     ← "Contact us"
      ├── ps_languageselector/
      │   └── ps_languageselector.tpl     ← "English"
      ├── ps_currencyselector/
      │   └── ps_currencyselector.tpl     ← "$"
      ├── ps_customersignin/
      │   └── ps_customersignin.tpl       ← "Sign in"
      └── ps_shoppingcart/
          └── ps_shoppingcart.tpl         ← "Cart"

child_hummingbird/
  └── modules/
      └── (Copy any of above here to override)
```

---

*Now you know where EVERY element in header-top comes from!* 🎯
