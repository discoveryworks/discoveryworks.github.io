---
layout: default
title: Brand Kit
permalink: /brand-kit/
---

<style>
  .brand-kit {
    padding: 4rem 0;
  }

  .brand-section {
    margin-bottom: 4rem;
  }

  .brand-section h2 {
    margin-bottom: 2rem;
    font-size: 2rem;
  }

  .color-palette {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
    gap: 1rem;
    margin-bottom: 2rem;
  }

  .color-swatch {
    background: var(--swatch-color);
    height: 100px;
    border-radius: 8px;
    display: flex;
    align-items: flex-end;
    padding: 1rem;
    color: var(--text-color);
    font-family: monospace;
    font-size: 0.875rem;
  }

  .logo-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 2rem;
    margin-bottom: 2rem;
  }

  .logo-item {
    background: #f5f5f5;
    padding: 2rem;
    border-radius: 8px;
    text-align: center;
  }

  .logo-item img {
    max-width: 100%;
    height: auto;
    margin-bottom: 1rem;
  }

  .logo-item h4 {
    margin-bottom: 0.5rem;
  }

  .download-button {
    display: inline-block;
    padding: 0.5rem 1rem;
    background: var(--color-primary);
    color: white;
    text-decoration: none;
    border-radius: 4px;
    font-size: 0.875rem;
  }

  .download-button:hover {
    opacity: 0.9;
  }

  .font-showcase {
    margin-bottom: 2rem;
  }

  .font-sample {
    font-family: 'DW Display', 'Futura', sans-serif;
    font-size: 3rem;
    margin-bottom: 1rem;
  }

  .design-tokens {
    background: #f5f5f5;
    padding: 2rem;
    border-radius: 8px;
    overflow-x: auto;
  }

  .design-tokens pre {
    margin: 0;
    font-size: 0.875rem;
  }

  code {
    background: #e0e0e0;
    padding: 0.125rem 0.25rem;
    border-radius: 3px;
    font-family: monospace;
  }
</style>

<div class="brand-kit container">
  <h1>Discovery Works Brand Kit</h1>
  <p class="lead">Welcome to the Discovery Works brand guidelines. This kit contains all the essential elements for maintaining brand consistency across all touchpoints.</p>

  <!-- Typography Section -->
  <section class="brand-section">
    <h2>Typography</h2>
    <div class="font-showcase">
      <div class="font-sample">Discovery Works</div>
      <h3>DW Display</h3>
      <p>Our primary typeface is DW Display, a custom font based on Futura Medium. It embodies our innovative and forward-thinking approach.</p>
      <p><strong>Fallback fonts:</strong> Futura, Helvetica, Arial, sans-serif</p>
    </div>
  </section>

  <!-- Color Palette Section -->
  <section class="brand-section">
    <h2>Color Palette</h2>
    <p>Our vibrant color palette reflects creativity, innovation, and collaboration.</p>
    
    <h3>Primary Colors</h3>
    <div class="color-palette">
      <div class="color-swatch" style="--swatch-color: #00A8E8; --text-color: white;">#00A8E8</div>
      <div class="color-swatch" style="--swatch-color: #007EA7; --text-color: white;">#007EA7</div>
      <div class="color-swatch" style="--swatch-color: #003459; --text-color: white;">#003459</div>
    </div>

    <h3>Secondary Colors</h3>
    <div class="color-palette">
      <div class="color-swatch" style="--swatch-color: #7DCE82; --text-color: black;">#7DCE82</div>
      <div class="color-swatch" style="--swatch-color: #F9D71C; --text-color: black;">#F9D71C</div>
      <div class="color-swatch" style="--swatch-color: #FF6B9D; --text-color: white;">#FF6B9D</div>
      <div class="color-swatch" style="--swatch-color: #C44569; --text-color: white;">#C44569</div>
      <div class="color-swatch" style="--swatch-color: #7B2CBF; --text-color: white;">#7B2CBF</div>
    </div>

    <h3>Neutral Colors</h3>
    <div class="color-palette">
      <div class="color-swatch" style="--swatch-color: #1A1A1A; --text-color: white;">#1A1A1A</div>
      <div class="color-swatch" style="--swatch-color: #4A4A4A; --text-color: white;">#4A4A4A</div>
      <div class="color-swatch" style="--swatch-color: #9B9B9B; --text-color: white;">#9B9B9B</div>
      <div class="color-swatch" style="--swatch-color: #E5E5E5; --text-color: black;">#E5E5E5</div>
      <div class="color-swatch" style="--swatch-color: #F8F8F8; --text-color: black;">#F8F8F8</div>
    </div>
  </section>

  <!-- Logo Section -->
  <section class="brand-section">
    <h2>Logos</h2>
    <p>Our logo system is flexible and adaptable, featuring the distinctive "DW" mark in various configurations.</p>
    
    <div class="logo-grid">
      <div class="logo-item">
        <img src="/assets/DW_logo.svg" alt="DW Logo">
        <h4>Primary Logo</h4>
        <a href="/assets/DW_logo.svg" class="download-button" download>Download SVG</a>
      </div>
      
      <div class="logo-item">
        <img src="/assets/DW_wordmark.svg" alt="Discovery Works Wordmark">
        <h4>Wordmark</h4>
        <a href="/assets/DW_wordmark.svg" class="download-button" download>Download SVG</a>
      </div>
    </div>

    <h3>Logo Usage Guidelines</h3>
    <ul>
      <li>Maintain clear space around the logo equal to the height of the "D" character</li>
      <li>Do not stretch, distort, or rotate the logo</li>
      <li>Use only approved color combinations</li>
      <li>Ensure sufficient contrast when placing on backgrounds</li>
    </ul>
  </section>

  <!-- Design Tokens Section -->
  <section class="brand-section">
    <h2>Design Tokens</h2>
    <p>Use these CSS custom properties for consistent implementation across web projects:</p>
    
    <div class="design-tokens">
      <pre><code>/* Colors */
--color-primary: #00A8E8;
--color-primary-dark: #007EA7;
--color-primary-darker: #003459;

--color-success: #7DCE82;
--color-warning: #F9D71C;
--color-accent: #FF6B9D;
--color-accent-dark: #C44569;
--color-purple: #7B2CBF;

--color-black: #1A1A1A;
--color-gray-dark: #4A4A4A;
--color-gray: #9B9B9B;
--color-gray-light: #E5E5E5;
--color-white: #F8F8F8;

/* Typography */
--font-primary: 'DW Display', 'Futura', sans-serif;
--font-body: system-ui, -apple-system, sans-serif;

/* Spacing */
--space-xs: 0.25rem;
--space-sm: 0.5rem;
--space-md: 1rem;
--space-lg: 2rem;
--space-xl: 4rem;

/* Border Radius */
--radius-sm: 4px;
--radius-md: 8px;
--radius-lg: 16px;</code></pre>
    </div>
  </section>

  <!-- Download Section -->
  <section class="brand-section">
    <h2>Download Assets</h2>
    <p>Get all brand assets in one package:</p>
    <ul>
      <li>Logo files (SVG, PNG)</li>
      <li>DW Display font files</li>
      <li>Color swatches</li>
      <li>Design token files</li>
    </ul>
    <p><em>Coming soon: Complete brand asset package</em></p>
  </section>

  <!-- Contact Section -->
  <section class="brand-section">
    <h2>Questions?</h2>
    <p>For brand-related inquiries or custom asset requests, please contact us at <a href="mailto:brand@discovery.works">brand@discovery.works</a></p>
  </section>
</div>
</code>