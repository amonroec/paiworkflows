function showSubcategory(id) {
  var parentDiv = document.getElementById(id).parentNode
  var childDiv = parentDiv[0].childNodes
  childDiv[1].style.display = 'block'
}
