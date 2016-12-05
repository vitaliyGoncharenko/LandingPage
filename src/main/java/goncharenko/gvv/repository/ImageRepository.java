package goncharenko.gvv.repository;

import goncharenko.gvv.model.Image;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ImageRepository extends CrudRepository<Image, Long> {

    @Query("SELECT name FROM Image")
    List<String> getImagesPath();

    List<Image> findByName(String name);
}
