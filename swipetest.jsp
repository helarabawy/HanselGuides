<script src="https://hammerjs.github.io/dist/hammer.js"></script>

<div id="myElement"></div>

<style>

#myElement {
  background: silver;
  height: 300px;
  text-align: center;
  font: 30px/300px Helvetica, Arial, sans-serif;
}

</style>

<script>

var myElement = document.getElementById('myElement');

//create a simple instance
//by default, it only adds horizontal recognizers
var mc = new Hammer(myElement);

//let the pan gesture support all directions.
//this will block the vertical scrolling on a touch-device while on the element
mc.get('pan').set({ direction: Hammer.DIRECTION_ALL });

//listen to events...
mc.on("panup pandown", function(ev) {
 myElement.textContent = ev.type +" gesture detected.";
});

</script>