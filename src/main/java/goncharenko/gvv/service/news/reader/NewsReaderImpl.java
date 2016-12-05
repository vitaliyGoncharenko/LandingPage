package goncharenko.gvv.service.news.reader;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

@Service
public class NewsReaderImpl implements NewsReader {

    private final static String URL = "https://itbukva.com/";

    private static final Logger LOGGER = LoggerFactory.getLogger(NewsReaderImpl.class);

    public String readContent() {
        StringBuffer result = new StringBuffer("");

        try {
            URL url = new URL(URL);
            URLConnection urlConnection = url.openConnection();
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));

            String line;
            boolean stopRead = false;
            boolean save = false;

            while ((line = bufferedReader.readLine()) != null && !stopRead) {
                if (line.contains("<div class=\"items-leading\">")) {
                    save = true;
                }
                if (line.contains("<div class=\"pagination clearfix\">")) {
                    save = false;
                    stopRead = true;
                }
                if (save) {
                    if (line.contains("<p class=\"readmore\">")) {
                        result.append("<p class=\"readmore\" style=\"display: none\">");
                    } else if (line.contains("Подробности")) {
                        result.append("<p class=\"readmore\" style=\"display: none\">");
                    } else {
                        {
                            result.append(line);
                        }
                    }
                }
            }
            bufferedReader.close();
            LOGGER.info(result.toString());

        } catch (IOException e) {
            LOGGER.warn("Cannot read data from url");
            return result.toString();
        }
        return result.toString();
    }

}
