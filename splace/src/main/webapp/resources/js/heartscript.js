(function(){
  let isActive = true;
  const sparkles = [
    { cx: "5" , cy: "22", class: "s-1"},
    { cx: "20", cy: "10", class: "s-2"},
    { cx: "35", cy: "5" , class: "s-3"},
    { cx: "50", cy: "10", class: "s-4"},
    { cx: "63", cy: "22", class: "s-5"}
  ];
  const heartAnimationIn = [
    { transformOrigin: '50% 50%', transform: 'scale(1) rotate3d(0, 0, 1, 0deg) translate(0, 0)', fill: 'grey' }, 
    { transformOrigin: '50% 50%', transform: 'scale(.9) rotate3d(0, 0, 1, 0deg) translate(0, 0)', fill: 'indianRed' },
    { transformOrigin: '50% 50%', transform: 'scale(.8) rotate3d(0, 0, 1, 0deg) translate(0, 0)', fill: 'indianRed' },
    { transformOrigin: '50% 50%', transform: 'scale(1.05) rotate3d(0, 0, 1, -8deg) translate(0, -4px)', fill: 'indianRed' },
    { transformOrigin: '50% 50%', transform: 'scale(1.1) rotate3d(0, 0, 1, 8deg) translate(0, -8px)', fill: 'indianRed' }, 
    { transformOrigin: '50% 50%', transform: 'scale(1.1) rotate3d(0, 0, 1, 8deg) translate(0, -6px)', fill: 'red' }, 
    { transformOrigin: '50% 50%', transform: 'scale(1.05) rotate3d(0, 0, 1, -8deg) translate(0, -4px)', fill: 'red' },
    { transformOrigin: '50% 50%', transform: 'scale(1) rotate3d(0, 0, 1, 8deg) translate(0, -4px)', fill: 'red' },
    { transformOrigin: '50% 50%', transform: 'scale(1) rotate3d(0, 0, 1, 0deg) translate(0, -2px)', fill: 'red' }
  ];
  const heartAnimationOut = [
    { transformOrigin: '50% 50%', transform: 'scale(1) rotate3d(0, 0, 1, 0deg) translate(0, -2px)',fill: "red"},
    { transformOrigin: '50% 50%', transform: 'scale(1) rotate3d(0, 0, 1, 0deg) translate(0, 0)',fill: "grey"}
  ];
  const sparkleAnimation = [
    { transformOrigin: '50% 50%', transform: 'scale(1) translate(0, 0)', opacity: '1', fill: 'white'},
    { transformOrigin: '50% 50%', transform: 'scale(1.1) translate(0, -4px)', opacity: '1', fill: 'white'},
    { transformOrigin: '50% 50%', transform: 'scale(1.2) translate(0, -5px)', opacity: '1', fill: 'gold'},
    { transformOrigin: '50% 50%', transform: 'scale(1.1) translate(0, 0px)', opacity: '1', fill: 'gold'},
    { transformOrigin: '50% 50%', transform: 'scale(1.2) translate(0, 3px)', opacity: '1', fill: 'red'},
    { transformOrigin: '50% 50%', transform: 'scale(1) translate(0, 8px)', opacity: '0', fill: 'red'}
  ];
  const sparkleGroupAnimation = [
    { transformOrigin: '50% 50%', transform: 'scale(0)'},
    { transformOrigin: '50% 50%', transform: 'scale(0)'},
    { transformOrigin: '50% 50%', transform: 'scale(0)'},
    { transformOrigin: '50% 50%', transform: 'scale(.5)'},
    { transformOrigin: '50% 50%', transform: 'scale(.5)'},
    { transformOrigin: '50% 50%', transform: 'scale(1)'}
  ];
  const heartAnimationTiming = {duration: 500, iterations: 1, fill: "forwards" };
  const sparkleAnimationTiming = {duration: 600, iterations: 1, fill: "forwards" };
  const sparkleGroupAnimationTiming = {duration: 400, iterations: 1, fill: "forwards" };
  const heartbtn = document.querySelector(".heartbtn");
  const svg = document.querySelector("#svg-container");
  const sparkleGroup = document.createElementNS("http://www.w3.org/2000/svg", "g");
  sparkleGroup.setAttributeNS(null, "id", "sparkle-group");
  const heart = document.createElementNS("http://www.w3.org/2000/svg", "path");
  heart.setAttributeNS(null, "d", "M50.4,27.3c-4.5-4.5-11.8-4.5-16.3,0c-4.5-4.5-11.8-4.5-16.3,0s-4.5,11.8,0,16.3l15,15c0.7,0.7,1.9,0.7,2.6,0 l15-15C54.9,39.1,54.9,31.8,50.4,27.3z");
  heart.setAttributeNS(null, "fill", "grey");
  svg.appendChild(sparkleGroup);
  svg.appendChild(heart);
  
  const animateHeart = (isAnimated) => {
    if (isAnimated) {
      heart.animate(heartAnimationIn, heartAnimationTiming);
      animateSparkles();
    } else {
      heart.animate(heartAnimationOut, heartAnimationTiming);
    }
  }
  const toggleLike = (target) => {
    if (target.classList.contains("active")) {
      target.classList.remove("active");
     /* target.textContent = "Like";*/
      isActive = true;
      animateHeart(isActive);
    } else {
      target.classList.add("active");
    /*  target.textContent = "Unlike";*/
      isActive = false;
      animateHeart(isActive);
    }
    return isActive;
  }
  setTimeout( () => toggleLike(heartbtn), 100);
  
  heartbtn.addEventListener("click", (e) => toggleLike(e.target), true);
  
  const addSparkles = (svgArray) => {
    svgArray.forEach(x => {
      let sparkle = document.createElementNS("http://www.w3.org/2000/svg", "circle");
      sparkle.setAttributeNS(null, "r", "1");
      sparkle.setAttributeNS(null, "cx", x.cx);
      sparkle.setAttributeNS(null, "cy", x.cy);
      sparkle.setAttributeNS(null, "class", x.class);
      sparkleGroup.appendChild(sparkle);
    })
  }
  addSparkles(sparkles);
  const animateSparkles = () => {
    sparkleGroup.animate(sparkleGroupAnimation, sparkleGroupAnimationTiming)
    const sp1 = document.querySelector('.s-1');
    const sp2 = document.querySelector('.s-2');
    const sp3 = document.querySelector('.s-3');
    const sp4 = document.querySelector('.s-4');
    const sp5 = document.querySelector('.s-5');
    setTimeout( () => sp1.animate(sparkleAnimation, sparkleAnimationTiming), 100);
    setTimeout( () => sp2.animate(sparkleAnimation, sparkleAnimationTiming), 200);
    setTimeout( () => sp3.animate(sparkleAnimation, sparkleAnimationTiming), 300);
    setTimeout( () => sp4.animate(sparkleAnimation, sparkleAnimationTiming), 400);
    setTimeout( () => sp5.animate(sparkleAnimation, sparkleAnimationTiming), 500);
  }
})();