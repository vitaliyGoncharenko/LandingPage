package goncharenko.gvv.service.news;


import goncharenko.gvv.service.news.reader.NewsReader;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;

@Service
@Scope("singleton")
public class NewsUpdater {

    private static final Logger LOGGER = LoggerFactory.getLogger(NewsUpdater.class);

    private String news;

    @Autowired
    private NewsReader newsReader;

    @PostConstruct
    public void init() {
        start();
    }

    private void start() {

        new Thread(new Runnable() {
            @Override
            public void run() {
                while (true) {
                    news = newsReader.readContent();
                    try {
                        Thread.sleep(600000);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            }
        }).start();
    }

    public String getNews() {
        return news;
    }
}
