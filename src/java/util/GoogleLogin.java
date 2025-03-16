/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import constant.GoogleInfo;
import java.io.IOException;
import model.Google;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

/**
 *
 * @author macbookpro
 */
public class GoogleLogin {
    public static String getToken(String code) throws ClientProtocolException, IOException {

        String response = Request.Post(GoogleInfo.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(
                        Form.form()
                                .add("client_id", GoogleInfo.GOOGLE_CLIENT_ID)
                                .add("client_secret", GoogleInfo.GOOGLE_CLIENT_SECRET)
                                .add("redirect_uri", GoogleInfo.GOOGLE_REDIRECT_URI)
                                .add("code", code)
                                .add("grant_type", GoogleInfo.GOOGLE_GRANT_TYPE)
                                .build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);

        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");

        return accessToken;

    }

    public static Google getUserInfo(final String accessToken) throws ClientProtocolException, IOException {

        String link = GoogleInfo.GOOGLE_LINK_GET_USER_INFO + accessToken;

        String response = Request.Get(link).execute().returnContent().asString();

        Google googlePojo = new Gson().fromJson(response, Google.class);

        return googlePojo;

    }
}
