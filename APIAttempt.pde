import http.requests.*;

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