package com.messageboard.util;

import java.util.HashMap;

import javax.websocket.Session;

public class ConnectionHolder {

	public static HashMap<String, Session> usershash = new HashMap<>();
	public static HashMap<String, String> usershashreverse = new HashMap<>();

	public static synchronized HashMap<String, Session> getUserHash() {
		return usershash;
	}

	public static synchronized HashMap<String, String> getReverseHash() {
		return usershashreverse;
	}
}
