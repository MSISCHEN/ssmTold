package com.cyj.dao;

import com.cyj.pojo.Noices;
import com.cyj.pojo.NoicesExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public interface NoicesMapper {
    //得到通知列表
    public List<Noices> selectNoicesList() throws Exception;

    //更改通知列表的状态
    public void updateNoicesStatus(@Param("noicesId") Integer noicesId,@Param("noicesStatus") Integer noicesStatus) throws Exception;

    //得到通知的公布列表
    public void getNoicesListByStatus(@Param("noicesStatus") Integer noicesStatus) throws Exception;

    //批量插入
    public void insertInfoBatch(List<Noices> noices) throws Exception;

    //导出数据
    public XSSFWorkbook exportExcelInfo() throws Exception;


    long countByExample(NoicesExample example);

    int deleteByExample(NoicesExample example);

    int deleteByPrimaryKey(Integer noiceId);

    int insert(Noices record);

    int insertSelective(Noices record);

    List<Noices> selectByExampleWithBLOBs(NoicesExample example);

    List<Noices> selectByExample(NoicesExample example);

    Noices selectByPrimaryKey(Integer noiceId);

    int updateByExampleSelective(@Param("record") Noices record, @Param("example") NoicesExample example);

    int updateByExampleWithBLOBs(@Param("record") Noices record, @Param("example") NoicesExample example);

    int updateByExample(@Param("record") Noices record, @Param("example") NoicesExample example);

    int updateByPrimaryKeySelective(Noices record);

    int updateByPrimaryKeyWithBLOBs(Noices record);

    int updateByPrimaryKey(Noices record);
}