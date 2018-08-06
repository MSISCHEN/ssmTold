package com.cyj.service;

import com.cyj.pojo.Noices;
import com.cyj.utils.excel.ExcelUtil;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import javax.xml.datatype.DatatypeConfigurationException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by amini on 2018/8/4.
 */
public interface NoicesService {
    //得到通知列表
    public List<Noices> selectNoicesList() throws Exception;

    //更改通知列表的状态
    public void updateNoicesStatus(Integer noicesId,Integer noicesStatus) throws Exception;

    //得到通知的公布列表
    public void getNoicesListByStatus(Integer noicesStatus) throws Exception;

    //增加通知
    public void insertNoices(Noices noices) throws Exception;

    //批量插入数据
    public void insertExcelInfo(InputStream in, MultipartFile file, int noiceStatus) throws Exception;

    //导出数据
    public XSSFWorkbook exportExcelInfo() throws Exception;
}
