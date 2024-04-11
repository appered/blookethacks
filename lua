// Function to add "api-backend.info" message to the top, other right side, and bottom of the screen
function addApiBackendInfo() {
    // Create div elements for each position
    const topElement = document.createElement('div');
    const otherRightElement = document.createElement('div');
    const bottomElement = document.createElement('div');

    // Set text content and styles for each element
    const message = 'api-backend.info';
    [topElement, otherRightElement, bottomElement].forEach((element) => {
        element.textContent = message;
        element.style.position = 'fixed';
        element.style.zIndex = '9999';
        element.style.fontFamily = 'Arial, sans-serif'; // Adjust font family as needed
        element.style.fontSize = '24px'; // Adjust font size as needed
        element.style.fontWeight = 'bold'; // Adjust font weight as needed
        element.style.color = '#ff00ff'; // Adjust text color as needed
        element.style.textTransform = 'uppercase'; // Convert text to uppercase
        element.style.letterSpacing = '2px'; // Adjust letter spacing as needed
        element.style.textShadow = '2px 2px 2px rgba(0, 0, 0, 0.5)'; // Add text shadow
    });

    // Position top element
    topElement.style.left = '50%';
    topElement.style.top = '10px';
    topElement.style.transform = 'translateX(-50%)';

    // Position other right element
    otherRightElement.style.right = '10px';
    otherRightElement.style.top = '50%';
    otherRightElement.style.transform = 'translateY(-50%)';

    // Position bottom element
    bottomElement.style.left = '50%';
    bottomElement.style.bottom = '10px';
    bottomElement.style.transform = 'translateX(-50%)';

    // Append elements to the body
    document.body.appendChild(topElement);
    document.body.appendChild(otherRightElement);
    document.body.appendChild(bottomElement);
}

// Call the function to add "api-backend.info" message with visually appealing text
addApiBackendInfo();

(async () => {
    let n = document.createElement('iframe');
    document.body.append(n);
    window.alert = n.contentWindow.alert.bind(window);
    window.prompt = n.contentWindow.prompt.bind(window);
    window.confirm = n.contentWindow.confirm.bind(window);
    n.remove();

    function reactHandler() {
        return Object.values(document.querySelector('#app > div > div'))[1].children[1]._owner;
    };

    if (window.location.pathname != '/play/fishing') {
        alert('You must be in a fishing frenzy game!');
    } else {
        let lure = Number(parseFloat(prompt('What do you want to set your lure to? (1 - 5)'))) - 1;
        reactHandler().stateNode.setState({ lure: lure < 0 ? 0 : lure > 4 ? 4 : lure });
        alert(`Lure set to ${lure + 1}!`);
    }
})();

function footer() {
    let element = document.createElement('div');
    document.body.appendChild(element);

    var pos1 = 0,
        pos2 = 0,
        pos3 = 0,
        pos4 = 0;
    element.onmousedown = (e = window.event) => {
        e.preventDefault();
        pos3 = e.clientX;
        pos4 = e.clientY;
        document.onmouseup = () => {
            document.onmouseup = null;
            document.onmousemove = null;
        };
        document.onmousemove = (e) => {
            e = e || window.event;
            e.preventDefault();
            pos1 = pos3 - e.clientX;
            pos2 = pos4 - e.clientY;
            pos3 = e.clientX;
            pos4 = e.clientY;
            let top = element.offsetTop - pos2 > 0 ? element.offsetTop - pos2 : 0;
            let left = element.offsetLeft - pos1 > 0 ? element.offsetLeft - pos1 : 0;
            element.style.top = top + 'px';
            element.style.left = left + 'px';
        };
    };
}

footer();
