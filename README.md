# PokemanCard

<p align="center">
 
![phone](https://user-images.githubusercontent.com/96667197/157189233-99a7f41c-23a8-4abf-965f-051ff5ab771c.gif)
![tablet](https://user-images.githubusercontent.com/96667197/157189135-62851f24-c494-4b65-b66c-2d8bd92c64b8.gif)


  
</p>

File Struct 

<img width="273" alt="image" src="https://user-images.githubusercontent.com/96667197/157189658-f8cf2de0-75c8-4bd4-aa0f-739d47e272d3.png">


- [x] Using UIKit
- [x] Implement MVC
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
