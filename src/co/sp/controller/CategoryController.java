package co.sp.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.sp.beans.ShopVO;

@Controller
@RequestMapping("/category")
public class CategoryController {

  @GetMapping("/main")
  public String main(@RequestParam("category_no") int category_no, 
      Model model) {

    model.addAttribute("category_no", category_no);
    System.out.println("ī�װ� ��ȣ" + category_no);

    return "category/main";
  }
  
  // ���� ���
  @GetMapping("/write")
  public String write(@ModelAttribute("writeShopBean") ShopVO writeShopBean) {
      return "category/write";
  }
  
  // ���� ��� ó��
  @PostMapping("/write_pro")
  public String write_pro(@Valid @ModelAttribute("writeShopBean") ShopVO writeShopBean, BindingResult result) {
      if(result.hasErrors()) {
          return "category/write";
      }
      
      return "category/write_success";
  }

}
