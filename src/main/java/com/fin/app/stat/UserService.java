package com.fin.app.stat;

import java.util.Map;

public interface UserService {
	public Map<String, Object> serializeNode(String spec);
	public String documentWriter(String spec);
}
