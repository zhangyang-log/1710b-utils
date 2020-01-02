package com.zhangtao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.zhangtao.bean.Brand;
import com.zhangtao.bean.Goods;
import com.zhangtao.bean.Kind;

public interface GoodsMapper {

	List<Goods> queryAllByItem(Map<String, Object> map);

	int addGoods(Goods goods);

	Goods selectOne(int gid);

	int updGoods(Goods goods);

	int dels(@Param("gid") String gid);

	List<Kind> selectKind();

	List<Brand> selectBrand();
}
