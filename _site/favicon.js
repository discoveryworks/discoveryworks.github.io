// Function to get a random element from an array
function getRandomElement(array) {
  return array[Math.floor(Math.random() * array.length)];
}

// Function to generate random colors for favicon
function randomizeFaviconColors() {
  // Core colors
  const colors = {
    pink: '#DC6DA5',
    yellow: '#FBE14B',
    blue: '#52A7DC',
    green: '#A4C88E'
  };
  
  // Get array of color keys
  const colorKeys = Object.keys(colors);
  
  // Shuffle colors
  const shuffledColors = [...colorKeys].sort(() => 0.5 - Math.random());
  
  // Get the favicon SVG element
  const faviconNode = document.querySelector('link[rel="icon"]');
  
  if (faviconNode) {
    // Fetch the SVG content
    fetch(faviconNode.href)
      .then(response => response.text())
      .then(svgText => {
        // Create temporary DOM element to manipulate the SVG
        const parser = new DOMParser();
        const svgDoc = parser.parseFromString(svgText, 'image/svg+xml');
        
        // Set random colors for each logo part
        const bluePath = svgDoc.querySelector('.logo-blue');
        const pinkPath = svgDoc.querySelector('.logo-pink');
        const yellowPath = svgDoc.querySelector('.logo-yellow');
        
        if (bluePath) bluePath.setAttribute('fill', colors[shuffledColors[0]]);
        if (pinkPath) pinkPath.setAttribute('fill', colors[shuffledColors[1]]);
        if (yellowPath) yellowPath.setAttribute('fill', colors[shuffledColors[2]]);
        
        // Convert back to text
        const serializer = new XMLSerializer();
        const newSvgText = serializer.serializeToString(svgDoc);
        
        // Create a Blob and URL from the SVG
        const blob = new Blob([newSvgText], {type: 'image/svg+xml'});
        const url = URL.createObjectURL(blob);
        
        // Update the favicon
        faviconNode.href = url;
      })
      .catch(error => console.error('Error updating favicon: ', error));
  }
}

// Initialize the random favicon colors on page load
document.addEventListener('DOMContentLoaded', function() {
  randomizeFaviconColors();
});