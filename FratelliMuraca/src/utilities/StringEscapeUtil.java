package utilities;

public class StringEscapeUtil {

    // Metodo per eseguire l'escape di caratteri speciali in una stringa
    public static String escapeString(String input) {
        StringBuilder sb = new StringBuilder();
        for (char c : input.toCharArray()) {
            switch (c) {
                case '\'':
                    sb.append("\\'");
                    break;
                case '"':
                    sb.append("\\\"");
                    break;
                // Altri casi di escape secondo necessità
                default:
                    sb.append(c);
                    break;
            }
        }
        return sb.toString();
    }
    
    public static String newLineToBr(final String input) {
    	String clone = new String(input);
    	StringBuilder ret = new StringBuilder();
    	for (int i = 0; i < clone.length(); i++) {
    		char c = clone.charAt(i);
    		if (c == '\n') {
    			ret.append("<br>");
    		}
    		else {
    			ret.append(c);
    		}
    	}
    	return ret.toString();
    }
    
}
