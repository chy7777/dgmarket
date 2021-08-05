
--used product 관련 데이터 밀어버리기!!!!!
set sql_safe_updates = 0;
delete from used_tag;
delete from used_product_img;
delete from used_favorites;
delete from used_product;

--중고샵 메인관련=================================================================
--상품의 메인에서 상품과 찜 여부 등을 조회하는 쿼리문(UsedProductExtend.selectAll)
select p.member_id, storename, p.used_product_id as used_product_id, p.used_product_name as used_product_name, 
p.used_product_price as used_product_price, used_img,
(select member_id from used_favorites f 
where p.used_product_id=f.used_product_id and f.member_id=#{member_id}) as favorites_member, (select used_favorites_id from used_favorites f 
where p.used_product_id=f.used_product_id and f.member_id=#{member_id}) as used_favorites_id
from used_product p, used_product_img i, member m
where p.used_product_id=i.used_product_id and i.used_img_index=0 and p.member_id=m.member_id
order by p.used_product_id desc;

--중고 개인 상점 관련================================================================
--스토어에서 찜상품 미리보기 이미지 조회(UsedProductImg.favoritesPre)
select f.used_product_id as used_product_id, used_img 
from used_product_img i, used_favorites f 
where i.used_product_id=f.used_product_id and f.member_id=#{member_id} and i.used_img_index=0;

--스토어에서 내 등록 상품 미리보기 이미지 조회(UsedProductImg.productPre)
select p.used_product_id as used_product_id, used_img 
from used_product_img i, used_product p 
where i.used_product_id=p.used_product_id and p.member_id=#{member_id} and i.used_img_index=0;

--상품 상세보기 관련===============================================================
--상품정보+고객정보 가져오기
select p.used_product_id as used_product_id, p.member_id as member_id
, used_product_name, used_product_detail, used_product_price, storename, 
(select used_favorites_id from used_favorites 
where member_id=#{member_id} and used_product_id=#{product_id}) as favorites_id
from used_product p, member m
where p.member_id=m.member_id and p.used_product_id=#{product_id};

--favorites count 가져오기
=======
--used product 관련 데이터 밀어버리기!!!!!
set sql_safe_updates = 0;
delete from used_tag;
delete from used_product_img;
delete from used_favorites;
delete from used_product;

--중고샵 메인관련=================================================================
--상품의 메인에서 상품과 찜 여부 등을 조회하는 쿼리문(UsedProductExtend.selectAll)
select p.member_id, storename, p.used_product_id as used_product_id, p.used_product_name as used_product_name, 
p.used_product_price as used_product_price, used_img,
(select member_id from used_favorites f 
where p.used_product_id=f.used_product_id and f.member_id=#{member_id}) as favorites_member, (select used_favorites_id from used_favorites f 
where p.used_product_id=f.used_product_id and f.member_id=#{member_id}) as used_favorites_id
from used_product p, used_product_img i, member m
where p.used_product_id=i.used_product_id and i.used_img_index=0 and p.member_id=m.member_id
order by p.used_product_id desc;

--중고 개인 상점 관련================================================================
--스토어에서 찜상품 미리보기 이미지 조회(UsedProductImg.favoritesPre)
select f.used_product_id as used_product_id, used_img 
from used_product_img i, used_favorites f 
where i.used_product_id=f.used_product_id and f.member_id=#{member_id} and i.used_img_index=0;

--스토어에서 내 등록 상품 미리보기 이미지 조회(UsedProductImg.productPre)
select p.used_product_id as used_product_id, used_img 
from used_product_img i, used_product p 
where i.used_product_id=p.used_product_id and p.member_id=#{member_id} and i.used_img_index=0;

--상품 상세보기 관련===============================================================
--상품정보+고객정보 가져오기
select p.used_product_id as used_product_id, p.member_id as member_id
, used_product_name, used_product_detail, used_product_price, storename, 
(select used_favorites_id from used_favorites 
where member_id=#{member_id} and used_product_id=#{product_id}) as favorites_id
from used_product p, member m
where p.member_id=m.member_id and p.used_product_id=#{product_id};

--favorites count 가져오기
select count(*) as count from used_favorites where used_product_id=#{used_product_id} group by used_favorites_id;