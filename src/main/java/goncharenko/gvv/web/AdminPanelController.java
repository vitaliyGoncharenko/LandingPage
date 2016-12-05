package goncharenko.gvv.web;

import goncharenko.gvv.model.Image;
import goncharenko.gvv.repository.ImageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.List;

@Controller
public class AdminPanelController {

    @Autowired
    private ImageRepository imageRepository;

    @RequestMapping(value = "/home/admin", method = RequestMethod.GET)
    public String admin(Model model) {
        List<String> images = imageRepository.getImagesPath();

        model.addAttribute("images", images);
        return "admin";
    }

    @RequestMapping(value = "/home/admin/image/remove", method = RequestMethod.GET)
    @ResponseBody
    public Boolean removeImage(@RequestParam("img_name") String name) {

        List<Image> images = imageRepository.findByName(name);
        for (Image image : images) {
            imageRepository.delete(images.get(0));
        }

        String rootPath = "src/main/webapp" + name;
        File file = new File(rootPath);

        return file.delete();
    }


    @RequestMapping(value = "/home/admin/uploadFile", method = RequestMethod.POST)
    @ResponseBody
    public void uploadFile(@RequestParam("file") MultipartFile file) {

        try {
            byte[] bytes = file.getBytes();

            String name = file.getOriginalFilename();

            String rootPath = "src/main/webapp/resources/uploaded/";
            File dir = new File(rootPath);

            if (!dir.exists()) {
                dir.mkdirs();
            }

            File uploadedFile = new File(dir.getAbsolutePath() + File.separator + name);

            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(uploadedFile));
            stream.write(bytes);
            stream.flush();
            stream.close();

            Image image = new Image();
            image.setName("/resources/uploaded/" + name);
            imageRepository.save(image);

        } catch (Exception e) {
        }
    }

}