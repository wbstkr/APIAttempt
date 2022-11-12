import http.requests.*;

/*
APIs to try:
- https://github.com/public-apis/public-apis
- http://colormind.io/api/
- - http://colormind.io/api-access/
- http://www.colourlovers.com/api/palettes/random?format=json
- - http://www.colourlovers.com/api
- https://cat-fact.herokuapp.com/facts/random
- - https://alexwohlbruck.github.io/cat-facts/
- https://colorhunt.co/
- - https://stackoverflow.com/questions/50855199/get-color-palettes-from-colorhunt-co-in-python
*/


JSONObject json;

public void setup() {
    windowResizable(true);
    windowRatio(400, 400);
    size(400, 400);
    
    PostRequest post = new PostRequest("http://colormind.io/api/");
    post.addData("{\"model\": \"default\"}");
    post.send();
    json = parseJSONObject(post.getContent());
    
    JSONArray colours = json.getJSONArray("result");
    
    for (int i = 0; i < colours.size(); i++) {
        int[] rgb = colours.getJSONArray(i).getIntArray();
        noStroke();
        fill(rgb[0], rgb[1], rgb[2]);
        rect(i * width / 5, 0, width / 5, height);
    }
    
    noLoop();
}