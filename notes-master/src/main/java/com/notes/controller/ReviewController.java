//package com.notes.controller;
//
//import com.baomidou.mybatisplus.core.metadata.IPage;
//import com.notes.domain.Notes;
//import com.notes.domain.Review;
//import com.notes.service.ReviewService;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.Map;
//
//@RestController
//@Slf4j
//@RequestMapping("/review")
//public class ReviewController {
//
//    @Autowired
//    ReviewService reviewService;
//
//    /**
//     * 查询复习计划（test）
//     * */
//    @PostMapping("/getReviews/{currentPage}/{pageSize}")
//    public IPage<Review> getReviews(@PathVariable long currentPage, @PathVariable long pageSize, @RequestBody Map<String,Object> map) {
//        String account = (String) map.get("account");
//        return reviewService.getReviews(currentPage,pageSize,account, (Map<String, String>) map.get("condition"));
//    }
//
//    /**
//     * 添加复习计划
//     * */
//    @PostMapping("/addReview")
//    public boolean addReview(@RequestBody Review review){
//        return reviewService.addReview(review);
//    }
//
//    /**
//     * 刷新复习计划
//     * */
//    @GetMapping("/refreshReview/{account}")
//    public boolean refreshReview(@PathVariable String account){
//        reviewService.refreshReview(account);
//        log.info("刷新复习计划成功!");
//        return true;
//    }
//
//
//    /**
//     * 查询复习计划
//     * */
//    @PostMapping("/getReview/{currentPage}/{pageSize}")
//    public IPage<Review> getReview(@PathVariable long currentPage, @PathVariable long pageSize,@RequestBody Map<String,Object> map) {
//        String account = (String) map.get("account");
//        Map<String,String> condition = (Map<String, String>) map.get("condition");
//        log.info("查询复习计划成功!");
//        return reviewService.getReviews(currentPage,pageSize,account,condition);
//    }
//
//    /**
//     * 删除复习计划
//     * */
//    @GetMapping("/deleteReview/{reviewId}")
//    public boolean deleteReview(@PathVariable Integer reviewId) {
//        return reviewService.deleteReview(reviewId);
//    }
//
//    /**
//     * 完成复习计划
//     * */
//    @GetMapping("/finishReview/{reviewId}")
//    public boolean finishReview(@PathVariable int reviewId){
//        Review review = reviewService.getReviewById(reviewId);
//        return reviewService.finishReview(review);
//    }
//
//}
