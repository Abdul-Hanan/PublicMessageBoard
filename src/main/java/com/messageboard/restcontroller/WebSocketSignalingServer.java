package com.messageboard.restcontroller;

import java.io.IOException;

import javax.websocket.CloseReason;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.json.JSONException;
import org.json.JSONObject;

import com.messageboard.util.ConnectionHolder;

@ServerEndpoint(value = "/signalingserver/{clientId}")
public class WebSocketSignalingServer {

	@OnOpen
	public void open(@PathParam("clientId") String clientId, Session session) throws IOException {
		System.out.println("Connection opened for = " + clientId);
	}

	@OnClose
	public void onClose(Session session, CloseReason reason) {
		System.out.println("Closing Websocket.... Reason[" + reason.getReasonPhrase() + "]");
		try {
			ConnectionHolder.getUserHash().remove(ConnectionHolder.usershashreverse.get(session.getId()));
			ConnectionHolder.getReverseHash().remove(session.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@OnError
	public void onError(Session session, Throwable thr) {

		try {
			ConnectionHolder.getUserHash().remove(ConnectionHolder.usershashreverse.get(session.getId()));
			ConnectionHolder.getReverseHash().remove(session.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@OnMessage
	public void message(Session session, String msg) {
		try {
			JSONObject obj = new JSONObject(msg);
			System.out.println(obj);
			if (obj.has("type")) {
				if (obj.getString("type").equals("login")) {

					if (ConnectionHolder.getUserHash().containsKey(obj.getString("name"))) {

						ConnectionHolder.getReverseHash()
								.remove(ConnectionHolder.getUserHash().get(obj.getString("name")).getId());
						ConnectionHolder.getUserHash().remove(obj.getString("name"));

						ConnectionHolder.getUserHash().put(obj.getString("name"), session);
						ConnectionHolder.getReverseHash().put(session.getId(), obj.getString("name"));

						session.getBasicRemote().sendText("{ \"type\": \"login\",\"success\": true }");

					} else {

						ConnectionHolder.getUserHash().put(obj.getString("name"), session);
						ConnectionHolder.getReverseHash().put(session.getId(), obj.getString("name"));

						session.getBasicRemote().sendText("{ \"type\": \"login\",\"success\": true }");
					}

				} else if (obj.getString("type").equals("notifyAll")) {

					ConnectionHolder.getUserHash().forEach((X, Y) -> {
						if (!X.equalsIgnoreCase(obj.getString("name"))) {
							try {
								Y.getBasicRemote().sendText(
										"{ \"type\": \"msg\",\"msg\": \"" + obj.getString("message") + "\" }");
							} catch (JSONException | IOException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						}
					});
				}
			}
		} catch (JSONException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}