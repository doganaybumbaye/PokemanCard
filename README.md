# PokemanCard

<p align="center">
  
  <img src="https://im4.ezgif.com/tmp/ezgif-4-d2ddaf0d65.gif">
  <img src="https://im4.ezgif.com/tmp/ezgif-4-90d2843f63.gif">

  
  
  
</p>

File Struct 

<img width="236" alt="image" src="https://user-images.githubusercontent.com/96667197/157137376-86402edb-da60-4969-80d0-43b2b0c9afc2.png">


- [x] Using UIKit
- [x] Implement MVVM
- [x] Extention to UIView added for AutoLayout
- [x] Defined a class for Networking works, API calls 
- [x] Flip animation vertical-horizontal
- [x] Launch screen added as an extra
- [x] Animation added to labels after loading as an extra

For sumarize for API calls, pokeapi have some different structs for pokemons list and entries. 
I defined two API calls, one for pokemans list, and other one for pull pokemans entries.

- First one called on viewDidLoad function, and then collecting the entry urls in an array.
- Second one called every clicked to CardView, depending on collected URLs.
- In the end of the calls, I mean when everyyhing is fine, CardViewController updates to CardView depending on pokemans attributes.

Thats what I did basicly explaintation PokemanCard API calls structure.
