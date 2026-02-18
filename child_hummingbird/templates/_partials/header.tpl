{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}
{$headerTopName = 'header-top'}
{$headerBottomName = 'header-bottom'}

{block name='header_banner'}
  <div class="header__banner">
    {hook h='displayBanner'}
  </div>

{/block}




{block name='header_nav'}
  <nav class="{$headerTopName}">
    <div class="container-md">
        <div class="offers-rotator">
          <button class="offers-rotator__btn" id="offersButton" type="button">
            <span id="offersText">Loading offers...</span>
          </button>
      </div>
    </div>
  </nav>
  <style>

    .header-top {
      background-color: #1960a6;
      padding: 10px 0;

    }
    .offers-rotator {
      display: flex;
      width: 100%;
      justify-content: center;

    }
    
    .offers-rotator__btn {
      color: black;
      border: none;
      padding: 10px 20px;
      border-radius: 5px;
      font-weight: bold;
      font-size: 14px;
      cursor: pointer;
      transition: all 0.3s ease;
      min-width: 150px;
    }
    
    .offers-rotator__btn:hover {
      transform: translateY(-2px);
      box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
    }
  </style>
  
  <script>
    document.addEventListener('DOMContentLoaded', function() {
      const offers = [
        'aaa for 10% off',
        'bbb for 20% off',
        'ccc for 15% off',
        'ddd for 30% off'
      ];
      
      let currentIndex = 0;
      const offersText = document.getElementById('offersText');
      
      function rotateOffers() {
        if (offersText) {
          offersText.textContent = offers[currentIndex];
          currentIndex = (currentIndex + 1) % offers.length;
        }
      }
      
      // Initial display
      rotateOffers();
      
      // Rotate every 3 seconds
      setInterval(rotateOffers, 3000);
    });
  </script>
{/block}






{block name='header_bottom'}
  <div class="{$headerBottomName}">
    <div class="container-md {$headerBottomName}__container">
      <div class="row gx-2 align-items-stretch {$headerBottomName}__row header-bottom-flex">

        {* Main Menu - Left Side with constrained width *}
        <div class="header-bottom__menu-wrapper">
          {hook h='displayTop'}
        </div>

        {* Logo - Centered *}
        <div class="d-flex align-items-center header-bottom__logo-wrapper">
          {if $shop.logo_details}
            {if $page.page_name == 'index'}<h1 class="{$headerBottomName}__h1 mb-0">{/if}
              {renderLogo}
            {if $page.page_name == 'index'}</h1>{/if}
          {/if}
        </div>

        {* Right Side Spacer - for balanced layout *}
        <div class="header-bottom__spacer-wrapper"></div>


        <div class="search__mobile d-md-none d-flex col-auto">

          <div class="header-block d-flex align-items-center">
            <a class="header-block__action-btn" href="#" role="button" data-bs-toggle="offcanvas" data-bs-target="#searchCanvas" aria-controls="searchCanvas" aria-label="{l s='Show search bar' d='Shop.Theme.Global'}">
              <span class="material-icons header-block__icon">search</span>
            </a>
          </div>


          <div class="search__offcanvas js-search-offcanvas offcanvas offcanvas-top h-auto" data-bs-backdrop="false" data-bs-scroll="true" tabindex="-1" id="searchCanvas" aria-labelledby="offcanvasTopLabel">
            <div class="offcanvas-header">
              <div id="_mobile_search" class="search__container"></div>
              <button type="button" class="btn-close text-reset ms-1" data-bs-dismiss="offcanvas" aria-label="Close">{l s='Cancel' d='Shop.Theme.Global'}</button>
            </div>
          </div>
        </div>


        <div id="_mobile_user_info" class="d-md-none d-flex col-auto">
          {* JUST PLACEHOLDER FOR RESPONSIVE COMPONENT TO LOAD REAL ONE *}
          <div class="header-block">
            <span class="header-block__action-btn">
              <i class="material-icons header-block__icon" aria-hidden="true">&#xE7FD;</i>
              <span class="d-none d-md-inline header-block__title">{l s='Sign in' d='Shop.Theme.Actions'}</span>
            </span>
          </div>
          {* JUST PLACEHOLDER FOR RESPONSIVE COMPONENT TO LOAD REAL ONE *}
        </div>


        <div id="_mobile_cart" class="d-md-none col-auto d-flex">
          {* JUST PLACEHOLDER FOR RESPONSIVE COMPONENT TO LOAD REAL ONE *}
          <div class="header-block d-flex align-items-center">
            <span class="header-block__action-btn">
              <i class="material-icons header-block__icon" aria-hidden="true">shopping_cart</i>
              <span class="header-block__badge">{$cart.products_count}</span>
            </span>
          </div>
          {* JUST PLACEHOLDER FOR RESPONSIVE COMPONENT TO LOAD REAL ONE *}
        </div>
      </div>
    </div>
  </div>

  <style>
    /* Header bottom layout - centered logo with left-aligned menu */
    .header-bottom-flex {
      display: flex !important;
      justify-content: space-between;
      align-items: stretch;
      width: 100%;
    }

    .header-bottom__menu-wrapper {
      flex: 0 0 auto;
      display: flex;
      align-items: center;
      max-width: 500px;
      overflow: hidden;
    }

    .header-bottom__menu-wrapper .main-menu {
      display: flex !important;
      flex-wrap: nowrap;
      width: auto;
      max-width: 100%;
    }

    .header-bottom__logo-wrapper {
      flex: 1 1 auto;
      display: flex !important;
      justify-content: center;
      align-items: center;
      min-width: 150px;
      padding: 0 15px;
    }

    .header-bottom__logo-wrapper .logo {
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .header-bottom__spacer-wrapper {
      flex: 0 0 auto;
      display: flex;
      align-items: center;
      max-width: 500px;
    }

    @media (max-width: 992px) {
      .header-bottom-flex {
        flex-wrap: wrap;
      }
    }
  </style>

  {hook h='displayNavFullWidth'}
{/block}

