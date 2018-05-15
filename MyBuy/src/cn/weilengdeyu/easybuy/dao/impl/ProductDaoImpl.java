package cn.weilengdeyu.easybuy.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import cn.weilengdeyu.easybuy.dao.BaseDao;
import cn.weilengdeyu.easybuy.dao.ProductDao;
import cn.weilengdeyu.easybuy.entity.Cart;
import cn.weilengdeyu.easybuy.entity.Product;


public class ProductDaoImpl extends BaseDao implements ProductDao {

	@Override
	public List<Product> getAllProducts(int currentPage, int pageSize) {
		String sql="select top "+pageSize+" * from EASYBUY_PRODUCT where EP_ID not in(select top "+(currentPage-1)*pageSize+" EP_ID from EASYBUY_PRODUCT)";
		List<Product> list=new ArrayList<Product>();
		try{
			rs=executeSelect(sql);
			while(rs.next()){
				Product pro=new Product();
				pro.setId(Long.valueOf(rs.getInt("EP_ID")));
				pro.setName(rs.getString("EP_NAME"));
				pro.setDescription(rs.getString("EP_DESCRIPTION"));
				pro.setPrice(rs.getFloat("EP_PRICE"));
				pro.setStock(rs.getLong("EP_STOCK"));
				pro.setCategoryId(rs.getLong("EPC_ID"));
				pro.setChildCategoryId(rs.getLong("EPC_CHILD_ID"));
//				private String fileName;//图片名称
				pro.setFileName(rs.getString("EP_FILE_NAME"));
				list.add(pro);
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			closeAll();
		}
		return list;
	}

	@Override
    public int getRowsCount() {
		return getRowsCountById(0);	
	}

	@Override
	public Product getProductById(int id) {
		String sql="select * from EASYBUY_PRODUCT where EP_ID=?";
		Product pro=new Product();
		try {
			rs=executeSelect(sql, id);
			if(rs!=null){
				if(rs.next()){
					
					pro.setId(Long.valueOf(rs.getInt("EP_ID")));
					pro.setName(rs.getString("EP_NAME"));
					pro.setDescription(rs.getString("EP_DESCRIPTION"));
					pro.setPrice(rs.getFloat("EP_PRICE"));
					pro.setStock(rs.getLong("EP_STOCK"));
					pro.setCategoryId(rs.getLong("EPC_ID"));
					pro.setChildCategoryId(rs.getLong("EPC_CHILD_ID"));
//					private String fileName;//图片名称
					pro.setFileName(rs.getString("EP_FILE_NAME"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pro;
	}

	@Override
	public List<Product> getProductsByCateId(int id,int currentPage, int pageSize) {
		String sql=null;
		if(id==1){
			sql="select top "+pageSize+ "* from EASYBUY_PRODUCT where EP_ID not in(select top "+(currentPage-1)*pageSize+" EP_ID from EASYBUY_PRODUCT)";
		}else{
			sql="select top "+pageSize+ "* from EASYBUY_PRODUCT"
					+" where EP_ID not in(select top "+(currentPage-1)*pageSize
					+" EP_ID from EASYBUY_PRODUCT where EPC_CHILD_ID="+id+") and EPC_CHILD_ID="+id;
		}
		System.out.println(sql);
		List<Product> list=null;
		ResultSet rs = executeSelect(sql);
		if (rs!=null) {
			try {
				list=new ArrayList<Product>();
				while(rs.next()){
					Product pro=new Product();
					pro.setId(Long.valueOf(rs.getInt("EP_ID")));
					pro.setName(rs.getString("EP_NAME"));
					pro.setDescription(rs.getString("EP_DESCRIPTION"));
					pro.setPrice(rs.getFloat("EP_PRICE"));
					pro.setStock(rs.getLong("EP_STOCK"));
					pro.setCategoryId(rs.getLong("EPC_ID"));
					pro.setChildCategoryId(rs.getLong("EPC_CHILD_ID"));
//					private String fileName;//图片名称
					pro.setFileName(rs.getString("EP_FILE_NAME"));
					
					list.add(pro);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	@Override
	public int getRowsCountById(int id) {
		String sql=null;
		if(id==0){
			sql="select count(*) from EASYBUY_PRODUCT ";
		}else{
		 sql="select count(*) from EASYBUY_PRODUCT where EPC_CHILD_ID="+id;}
		int count=0;
        try {
    		rs=executeSelect(sql);
    		if(rs.next()){
				count=rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public void buyPro(String proid, Cart cart) {
		Product pro=getProductById(Integer.parseInt(proid));
		cart.Add(pro);
		
	}

	

}
