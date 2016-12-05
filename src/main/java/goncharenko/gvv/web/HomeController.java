package goncharenko.gvv.web;

import goncharenko.gvv.repository.ImageRepository;
import goncharenko.gvv.service.news.NewsUpdater;
import goncharenko.gvv.service.news.reader.NewsReader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private ImageRepository imageRepository;

    @Autowired
    private NewsUpdater newsUpdater;

    @RequestMapping(value = {"/home", "/"}, method = RequestMethod.GET)
    public String home(Model model) {
        List<String> images = imageRepository.getImagesPath();

        model.addAttribute("images", images);
        model.addAttribute("news", newsUpdater.getNews());

        return "home";
    }

}