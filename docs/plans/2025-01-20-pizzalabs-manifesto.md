# Pizza Labs Manifesto Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Build a dynamic artist statement page that randomly presents one of four tonal versions with user controls to switch between moods.

**Architecture:** Static Jekyll page with vanilla JavaScript for mood switching, CSS for mood-specific styling, and localStorage for optional persistence.

**Tech Stack:** Jekyll, HTML5, CSS3, Vanilla JavaScript, GitHub Pages

---

## Task 1: Create Directory Structure and Basic HTML

**Files:**
- Create: `pizzalabs/manifesto/index.html`

**Step 1: Create the pizzalabs/manifesto directory**

```bash
mkdir -p pizzalabs/manifesto
```

**Step 2: Create the basic HTML structure**

Create `pizzalabs/manifesto/index.html`:

```html
---
layout: default
title: Pizza Labs Manifesto
---

<div class="manifesto-container">
  <header class="manifesto-header">
    <h1 id="manifesto-title" class="manifesto-title">Artist Statement</h1>
  </header>

  <article id="manifesto-content" class="manifesto-content">
    <!-- Statement content will be inserted here by JavaScript -->
  </article>

  <nav class="mood-selector">
    <button id="lucky-btn" class="mood-btn mood-btn-lucky" aria-label="Random mood">
      <span class="pizza-icon">🍕</span> I'm Feeling Lucky
    </button>
    <button id="academic-btn" class="mood-btn" data-mood="academic">Academic</button>
    <button id="pretentious-btn" class="mood-btn" data-mood="pretentious">Pretentious</button>
    <button id="sincere-btn" class="mood-btn" data-mood="sincere">Sincere</button>
    <button id="manifesto-btn" class="mood-btn" data-mood="manifesto">Manifesto</button>
  </nav>
</div>

<style>
  /* Inline styles will be added in next task */
</style>

<script>
  /* JavaScript will be added in Task 3 */
</script>
```

**Step 3: Verify file creation**

```bash
ls -la pizzalabs/manifesto/
cat pizzalabs/manifesto/index.html | head -20
```

Expected: File exists with HTML structure

**Step 4: Commit**

```bash
git add pizzalabs/manifesto/index.html
git commit -m "feat: add basic HTML structure for Pizza Labs manifesto page"
```

---

## Task 2: Add CSS Styling for All Moods

**Files:**
- Modify: `pizzalabs/manifesto/index.html`

**Step 1: Add the base CSS styles**

Add inside the `<style>` tag in `pizzalabs/manifesto/index.html`:

```css
/* Base styles */
.manifesto-container {
  max-width: 800px;
  margin: 2rem auto;
  padding: 2rem;
  min-height: 70vh;
}

.manifesto-header {
  text-align: center;
  margin-bottom: 3rem;
}

.manifesto-title {
  font-size: 2.5rem;
  transition: all 0.3s ease;
}

.manifesto-content {
  line-height: 1.6;
  margin-bottom: 3rem;
  opacity: 1;
  transition: opacity 0.3s ease;
}

.manifesto-content.switching {
  opacity: 0;
}

/* Mood-specific typography */
.mood-academic .manifesto-content {
  font-family: Georgia, 'Times New Roman', serif;
  text-align: justify;
  font-size: 1.1rem;
  color: #2c3e50;
}

.mood-pretentious .manifesto-content {
  font-family: 'Playfair Display', Georgia, serif;
  font-size: 1.2rem;
  line-height: 1.8;
  color: #34495e;
}

.mood-pretentious .manifesto-content em {
  font-style: italic;
  color: #8e44ad;
}

.mood-sincere .manifesto-content {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Helvetica, sans-serif;
  font-size: 1.1rem;
  line-height: 1.7;
  color: #333;
}

.mood-manifesto .manifesto-content {
  font-family: 'Helvetica Neue', Arial, sans-serif;
  font-weight: 600;
  color: #000;
}

.mood-manifesto .manifesto-content strong {
  font-weight: 900;
  text-transform: uppercase;
  letter-spacing: 0.05em;
}

/* Mood selector */
.mood-selector {
  display: flex;
  justify-content: center;
  gap: 1rem;
  flex-wrap: wrap;
  padding-top: 2rem;
  border-top: 2px solid #e0e0e0;
}

.mood-btn {
  padding: 0.75rem 1.5rem;
  border: 2px solid #333;
  background: white;
  cursor: pointer;
  font-size: 1rem;
  transition: all 0.2s ease;
  border-radius: 4px;
}

.mood-btn:hover {
  background: #f8f8f8;
  transform: translateY(-2px);
}

.mood-btn.active {
  background: #333;
  color: white;
}

.mood-btn-lucky {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  border: none;
}

.mood-btn-lucky:hover {
  transform: translateY(-2px) scale(1.05);
}

.pizza-icon {
  display: inline-block;
  animation: none;
}

.pizza-icon.spinning {
  animation: pizzaSpin 0.5s ease-in-out;
}

@keyframes pizzaSpin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

/* Mobile responsive */
@media (max-width: 768px) {
  .manifesto-container {
    padding: 1rem;
  }

  .manifesto-title {
    font-size: 2rem;
  }

  .mood-selector {
    flex-direction: column;
    align-items: center;
  }

  .mood-btn {
    width: 100%;
    max-width: 300px;
  }
}
</style>
```

**Step 2: Test the styling**

Open the page in browser (even without JS, should see styled structure):

```bash
open pizzalabs/manifesto/index.html
```

**Step 3: Commit**

```bash
git add pizzalabs/manifesto/index.html
git commit -m "feat: add CSS styling for all mood variations"
```

---

## Task 3: Add JavaScript for Statement Content

**Files:**
- Modify: `pizzalabs/manifesto/index.html`

**Step 1: Add the statement content data**

Add inside the `<script>` tag in `pizzalabs/manifesto/index.html`:

```javascript
// Statement content for each mood
const statements = {
  academic: {
    title: "Pizza Labs: An Artist Statement",
    content: `
      <p>Pizza Labs operates at the intersection of ludological tradition and contemporary symbolic systems. Our practice centers on the strategic deployment of the pizza emoji (🍕) as a transformative agent within established gaming paradigms.</p>

      <p>Through rigorous application of minimalist intervention methodology, we examine how singular symbolic substitutions reconfigure meaning within interactive digital spaces. The pizza—simultaneously foodstuff, geometric form, and cultural signifier—serves as our primary artistic material. When inserted into canonical gaming structures (Pong, 1972; Asteroids, 1979), this triangular Unicode glyph reveals the arbitrary nature of ludic representation while maintaining functional gameplay integrity.</p>

      <p>Our constraint-based practice embraces the pizza as both limitation and liberation. This self-imposed restriction generates what Stravinsky might recognize as "freedom through discipline"—each project must incorporate pizza imagery while preserving the essential mechanics of its source material. The resulting works exist in a liminal space between homage and transformation, between the nostalgic and the contemporary.</p>

      <p>The emoji, as the vernacular pictographic language of our era, democratizes artistic expression. Pizza Labs recognizes emoji not as decoration but as legitimate artistic medium—a visual esperanto that transcends linguistic boundaries. Our work is produced through contemporary development methodologies, utilizing whatever tools and collaborations the current technological moment provides.</p>

      <p>Pizza Labs: Where the triangle meets the circle, where the classic meets the contemporary, where fun requires no justification.</p>
    `
  },
  pretentious: {
    title: "Pizza Labs: A Treatise on Triangular Transcendence",
    content: `
      <p><em>[Adjusts monocle, sips espresso]</em></p>

      <p>Dearest patron of the digital arts, allow us to elucidate the profound philosophical underpinnings of what might appear—to the untrained eye—as merely "putting pizza emojis in old games."</p>

      <p>Pizza Labs emerged from a singular moment of enlightenment: What if Pong, that ur-text of interactive entertainment, featured not a banal square "ball" but rather a pizza? Yes, a PIZZA! <em>[dramatic pause]</em> This seemingly trivial substitution contains multitudes. It is Duchamp's urinal for the emoji generation. It is Warhol's soup can for the App Store epoch.</p>

      <p>Consider the sublime geometry: The pizza slice, that perfect isosceles triangle, mirrors precisely the spacecraft of Asteroids. This is not coincidence—this is DESTINY. When we replace polygon with pizza, we are not merely swapping sprites; we are engaging in a radical act of semiotic terrorism, liberating games from their original signifiers while lovingly preserving their mechanical souls.</p>

      <p>Our artistic constraints—every project MUST feature pizza—create what we call "The Mozzarella Mandate." Like the Dogme 95 movement in cinema, we embrace limitation as liberation. The pizza is our vow of chastity, our handheld camera, our natural light.</p>

      <p>And yes, we code these masterworks using AI assistants, because <em>of course</em> we do. Just as Warhol had his Factory, we have our algorithms. The act of creation in 2025 is inherently collaborative between human and machine—to pretend otherwise would be positively <em>gauche</em>.</p>

      <p>Remember: When you play Pizza Pong, you're not just batting a food emoji around a screen. You're participating in a radical reimagining of digital nostalgia. You're complicit in our delicious subversion.</p>

      <p><strong><em>Have fun. Don't overthink it.</em></strong> ™️</p>
    `
  },
  sincere: {
    title: "Pizza Labs Artist Statement",
    content: `
      <p>Pizza Labs began with the stupidest possible question: "What if Pong, but pizza?"</p>

      <p>This ridiculous premise became our north star. By changing just one element—replacing the ball with a pizza emoji—we discovered something unexpectedly delightful. Classic games, when given the smallest twist, become fresh again. Familiar yet different. Nostalgic yet new.</p>

      <p>Our philosophy is simple: minimal modification, maximum joy. We take games you know by heart and add just enough pizza to make you smile. The pizza slice in Asteroids isn't just funny because it's food in space—it's geometrically perfect, a triangle defending against triangular threats. These happy accidents of form and function drive our work.</p>

      <p>Working within constraints sparks creativity. "Must include pizza" sounds limiting, but it's liberating. Every Pizza Labs game starts from this single requirement and builds from there. It's our version of "write what you know," except what we know is that pizza makes everything better.</p>

      <p>The emoji is our paint, the App Store our gallery. We're part of a generation that communicates in pictographs, so why shouldn't our art? A pizza emoji carries cultural weight—comfort food, shared meals, guilty pleasures, geometric satisfaction. When you see 🍕 flying across your screen, you're not just seeing pixels. You're seeing a symbol that means something.</p>

      <p>We build these games the way everyone builds things now—with whatever tools work best, including AI collaboration. There's nothing exceptional about coding with AI assistants anymore. It's just how software gets made, like using an IDE instead of notepad. The magic isn't in the tools; it's in knowing what to build.</p>

      <p>At Pizza Labs, we believe in the profound power of not taking ourselves too seriously. Have fun. Don't overthink it. But also: think about it just enough to realize how perfect a pizza slice looks shooting asteroids in space.</p>
    `
  },
  manifesto: {
    title: "THE PIZZA LABS MANIFESTO",
    content: `
      <p><strong>WE DECLARE:</strong></p>

      <p><strong>1. The Age of Pizza has begun!</strong> No longer shall games languish in pizza-less mediocrity!</p>

      <p><strong>2. One Element Changed Changes Everything!</strong> We reject bloated remakes! We reject endless sequels! We champion the SINGLE MODIFICATION that transforms meaning!</p>

      <p><strong>3. The Pizza Is the Message!</strong> 🍕 is not decoration—it is COMMUNICATION! Every pizza placed is a statement: JOY IS NECESSARY!</p>

      <p><strong>4. Emoji Are the People's Art!</strong> We reject gatekeeping! We reject inaccessible symbology! We embrace the universal language of food icons!</p>

      <p><strong>5. Constraint Is Freedom!</strong> Every Pizza Labs creation MUST feature pizza! This limitation is our STRENGTH! Our IDENTITY! Our DELICIOUS BURDEN!</p>

      <p><strong>6. Nostalgia Demands Remixing!</strong> We honor the classics by CHANGING them! Pong is eternal—but eternity needs pizza!</p>

      <p><strong>7. The Triangle Contains Multitudes!</strong> Observe: 🍕 = 🔺 = spaceship = pyramid = fundamental form of the universe! This is not coincidence! This is GEOMETRIC TRUTH!</p>

      <p><strong>8. Tools Are Tools!</strong> We code with humans! We code with machines! We code with whatever gets pizza on screen! The method is irrelevant—THE PIZZA IS ALL!</p>

      <p><strong>9. Pretension Is the Enemy of Fun!</strong> We refuse to apologize for joy! We refuse to justify delight! We refuse to explain why pizza!</p>

      <p><strong>10. Have Fun! Don't Overthink It!</strong> But also: overthink it exactly the right amount to appreciate the sublime absurdity of pizza-based gaming!</p>

      <p><strong>JOIN US!</strong> Download Pizza Pong! Play Pizzaroids! Experience the future of the past with extra cheese!</p>

      <p><strong>PIZZA LABS</strong><br>
      <em>Where every game is improved by precisely one ingredient</em></p>
    `
  }
};
```

**Step 2: Test the data structure**

Open browser console and verify:

```javascript
console.log(statements);
```

**Step 3: Commit**

```bash
git add pizzalabs/manifesto/index.html
git commit -m "feat: add statement content for all four moods"
```

---

## Task 4: Add Mood Switching JavaScript

**Files:**
- Modify: `pizzalabs/manifesto/index.html`

**Step 1: Add the mood switching logic**

Continue in the `<script>` tag after the statements object:

```javascript
// State management
let currentMood = null;
const moods = ['academic', 'pretentious', 'sincere', 'manifesto'];

// DOM elements
const container = document.querySelector('.manifesto-container');
const titleEl = document.getElementById('manifesto-title');
const contentEl = document.getElementById('manifesto-content');
const luckyBtn = document.getElementById('lucky-btn');
const pizzaIcon = luckyBtn.querySelector('.pizza-icon');

// Initialize on page load
document.addEventListener('DOMContentLoaded', () => {
  // Check URL params for specific mood
  const urlParams = new URLSearchParams(window.location.search);
  const requestedMood = urlParams.get('mood');

  if (requestedMood && statements[requestedMood]) {
    setMood(requestedMood);
  } else {
    // Load random mood on first visit
    setMood(getRandomMood());
  }

  // Set up event listeners
  setupEventListeners();
});

// Get random mood
function getRandomMood() {
  return moods[Math.floor(Math.random() * moods.length)];
}

// Set active mood
function setMood(mood) {
  if (!statements[mood]) return;

  // Add transition class
  contentEl.classList.add('switching');

  setTimeout(() => {
    // Update content
    currentMood = mood;
    titleEl.textContent = statements[mood].title;
    contentEl.innerHTML = statements[mood].content;

    // Update container class for styling
    container.className = 'manifesto-container mood-' + mood;

    // Update active button
    updateActiveButton(mood);

    // Update URL without reload
    const url = new URL(window.location);
    url.searchParams.set('mood', mood);
    window.history.replaceState({}, '', url);

    // Remove transition class
    contentEl.classList.remove('switching');
  }, 300);
}

// Update active button state
function updateActiveButton(mood) {
  document.querySelectorAll('.mood-btn').forEach(btn => {
    if (btn.dataset.mood === mood) {
      btn.classList.add('active');
    } else {
      btn.classList.remove('active');
    }
  });
}

// Setup event listeners
function setupEventListeners() {
  // Lucky button
  luckyBtn.addEventListener('click', () => {
    pizzaIcon.classList.add('spinning');
    setTimeout(() => {
      pizzaIcon.classList.remove('spinning');
      setMood(getRandomMood());
    }, 500);
  });

  // Mood buttons
  document.querySelectorAll('.mood-btn[data-mood]').forEach(btn => {
    btn.addEventListener('click', () => {
      setMood(btn.dataset.mood);
    });
  });
}
```

**Step 2: Test the functionality**

Open in browser and verify:
- Page loads with random mood
- Clicking mood buttons switches content
- "I'm Feeling Lucky" spins and randomizes
- URL updates with mood parameter

**Step 3: Commit**

```bash
git add pizzalabs/manifesto/index.html
git commit -m "feat: add JavaScript mood switching functionality"
```

---

## Task 5: Add localStorage Persistence (Optional)

**Files:**
- Modify: `pizzalabs/manifesto/index.html`

**Step 1: Add localStorage support**

Modify the initialization in the `<script>` tag:

```javascript
// Replace the existing DOMContentLoaded listener with:
document.addEventListener('DOMContentLoaded', () => {
  // Check URL params first
  const urlParams = new URLSearchParams(window.location.search);
  const requestedMood = urlParams.get('mood');

  if (requestedMood && statements[requestedMood]) {
    setMood(requestedMood);
  } else {
    // Check localStorage for last viewed mood
    const savedMood = localStorage.getItem('pizzaLabsMood');
    if (savedMood && statements[savedMood]) {
      setMood(savedMood);
    } else {
      // Load random mood on first visit
      setMood(getRandomMood());
    }
  }

  // Set up event listeners
  setupEventListeners();
});

// Update the setMood function to save to localStorage:
function setMood(mood) {
  if (!statements[mood]) return;

  // Add transition class
  contentEl.classList.add('switching');

  setTimeout(() => {
    // Update content
    currentMood = mood;
    titleEl.textContent = statements[mood].title;
    contentEl.innerHTML = statements[mood].content;

    // Update container class for styling
    container.className = 'manifesto-container mood-' + mood;

    // Update active button
    updateActiveButton(mood);

    // Update URL without reload
    const url = new URL(window.location);
    url.searchParams.set('mood', mood);
    window.history.replaceState({}, '', url);

    // Save to localStorage
    localStorage.setItem('pizzaLabsMood', mood);

    // Remove transition class
    contentEl.classList.remove('switching');
  }, 300);
}
```

**Step 2: Test localStorage persistence**

1. Load page, select a mood
2. Refresh page - should remember mood
3. Navigate with ?mood=academic - should override saved mood

**Step 3: Commit**

```bash
git add pizzalabs/manifesto/index.html
git commit -m "feat: add localStorage persistence for last viewed mood"
```

---

## Task 6: Add Link from Main Pizza Labs Section

**Files:**
- Read: `index.html`
- Modify: `index.html` (add link to manifesto)

**Step 1: Find the Pizza Labs section in main page**

```bash
grep -n "Pizza Labs" index.html
```

**Step 2: Add manifesto link**

Locate the Pizza Labs project cards and add a new link/card for the manifesto. The exact location depends on the current structure, but it should be added near the Pizza Pong and Pizzaroids entries.

Example addition:
```html
<div class="project-card">
  <h3>Artist Statement</h3>
  <p>Why pizza? Read our manifesto.</p>
  <a href="/pizzalabs/manifesto/" class="project-link">View Manifesto</a>
</div>
```

**Step 3: Test the link**

```bash
jekyll serve
# Open http://localhost:4000 and verify link works
```

**Step 4: Commit**

```bash
git add index.html
git commit -m "feat: add manifesto link to main Pizza Labs section"
```

---

## Task 7: Final Testing and Polish

**Step 1: Test all moods**

Open the page and verify each mood:
- Academic - formal serif typography
- Pretentious - dramatic italics
- Sincere - clean sans-serif
- Manifesto - bold statements

**Step 2: Test responsiveness**

Check on mobile viewport:
- Text readable
- Buttons stack vertically
- No horizontal scroll

**Step 3: Test direct linking**

Verify these URLs work:
- `/pizzalabs/manifesto/`
- `/pizzalabs/manifesto/?mood=academic`
- `/pizzalabs/manifesto/?mood=pretentious`
- `/pizzalabs/manifesto/?mood=sincere`
- `/pizzalabs/manifesto/?mood=manifesto`

**Step 4: Final commit**

```bash
git add -A
git commit -m "feat: complete Pizza Labs manifesto page with mood selector"
```

---

## Deployment

**Step 1: Push branch**

```bash
git push -u origin feature/pizzalabs-manifesto
```

**Step 2: Create Pull Request**

```bash
gh pr create --title "Add Pizza Labs Manifesto Page" \
  --body "Adds dynamic artist statement with four mood variations.

Features:
- Random mood on load
- User-selectable moods (Academic, Pretentious, Sincere, Manifesto)
- 'I'm Feeling Lucky' with pizza spin animation
- Direct linking via URL parameters
- localStorage persistence
- Mobile responsive

Test at: /pizzalabs/manifesto/"
```

**Step 3: Merge and Deploy**

After PR approval, merge to main and GitHub Pages will auto-deploy.

---

## Validation Checklist

- [ ] All four moods display correctly
- [ ] Mood selector buttons work
- [ ] "I'm Feeling Lucky" animates and randomizes
- [ ] URL parameters work for direct linking
- [ ] localStorage remembers last mood
- [ ] Mobile responsive design works
- [ ] Link from main page works
- [ ] No console errors
- [ ] Smooth transitions between moods
- [ ] Accessible (keyboard navigation, ARIA labels)

---

**Plan complete!** Execute with @superpowers:executing-plans or @superpowers:subagent-driven-development.