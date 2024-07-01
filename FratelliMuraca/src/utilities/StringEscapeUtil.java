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
        StringBuilder ret = new StringBuilder();
        for (int i = 0; i < input.length(); i++) {
            char c = input.charAt(i);
            if (c == '\n') {
                ret.append("<br>");
            } else {
                ret.append(c);
            }
        }
        return ret.toString();
    }

    /*
     * Metodo per eseguire l'escaping di caratteri HTML per prevenire XSS
     */
    public static String escapeHtml(String input) {
        if (input == null) {
            return null;
        }
        
        StringBuilder escaped = new StringBuilder(input.length());
        for (char c : input.toCharArray()) {
            switch (c) {
                case '<':
                    escaped.append("&lt;");
                    break;
                case '>':
                    escaped.append("&gt;");
                    break;
                case '&':
                    escaped.append("&amp;");
                    break;
                case '"':
                    escaped.append("&quot;");
                    break;
                case '\'':
                    escaped.append("&#x27;");
                    break;
                case '/':
                    escaped.append("&#x2F;");
                    break;
                default:
                    escaped.append(c);
                    break;
            }
        }
        return escaped.toString();
    }
}
